import 'package:covidstats_app/models/Response.dart';
import 'package:covidstats_app/utilities/Constants.dart';
import 'package:covidstats_app/utilities/utils.dart';
import 'package:covidstats_app/widgets/data_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'graph_screen.dart';

class DataScreen extends StatefulWidget {
  final List<Response> dataList;
  final String countryName;
  bool _isLoadingData = false;
  DataScreen({this.dataList, this.countryName});

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    //List<Response> data;
    //variables to hold delta with previous day
    int dayTests = 0;
    int dayCritical = 0;
    int lastActive = 0;
    int dayRecovered = 0;
    double dayRatio = 0;
    String debug;
    try {
      List<DataItemCard> itemCardList = [];
      //items are sorted by date/time in reverse order (most recent first)
      //it can contain partial day data, as every country brings them several times in a day at different hours
      //i.e. at 12.45pm you should have less tests then at 6.00pm
      //here the programs picks up only the most recent dataset of every day, discarding the others
      //therefore the time you use the app may affect the results, as they are always the last daily available
      //Not all countries release all the data types handled by the API, so for some countries some data may be missing
      List<Response> noDuplicates = [];
      String curDate = '';
      for (Response dataItem in widget.dataList) {
        if (dataItem.day != curDate) {
          curDate = dataItem.day;
          noDuplicates.add(dataItem);
        }
      }

      for (Response dataItem in noDuplicates) {
/*
        debug = dataItem.time;
        print(debug);
*/
        if (widget.dataList.indexOf(dataItem) < widget.dataList.length - 1) {
          //the next element is the day before
          if (dataItem.cases.news == null) {
            dataItem.cases.news = '0';
          }

          Response prevDayItem =
              widget.dataList.elementAt(widget.dataList.indexOf(dataItem) + 1);
          dayCritical = 0;
          if (dataItem.cases.critical != null &&
              prevDayItem.cases.critical != null) {
            dayCritical = dataItem.cases.critical - prevDayItem.cases.critical;
          }
          ;
          dayTests = 0;
          if (dataItem.tests.total != null && prevDayItem.tests.total != null) {
            dayTests = dataItem.tests.total - prevDayItem.tests.total;
          }
          dayRecovered = 0;
          if (dataItem.cases.recovered != null &&
              prevDayItem.cases.recovered != null) {
            dayRecovered =
                dataItem.cases.recovered - prevDayItem.cases.recovered;
          }
          dayRatio = 0;
          if (dayTests != 0 && int.tryParse(dataItem.cases.news) != 0) {
            try {
              dayRatio = (int.tryParse(dataItem.cases.news) * 100) / dayTests;
            } on Exception catch (e) {
              dayRatio = 0;
            }
          }
        } else {
          dayCritical = 0;
          dayTests = 0;
          dayRecovered = 0;
          dayRatio = 0;
        }
        /*       print('dayCritical $dayCritical');
        print('dayTests $dayTests');
        print('dayRecovered $dayRecovered');*/

        DataItemCard card = DataItemCard(
          response: dataItem,
          deltaActive: 0,
          deltaRecovered: dayRecovered,
          deltaCritical: dayCritical,
          deltaTests: dayTests,
          ratio: dayRatio,
        );
        itemCardList.add(card);
        if (widget.dataList.indexOf(dataItem) == kMaxFetchCount) break;
      }

      return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 20,
                child: getFlagIcon(widget.countryName),
              ),
            ],
          ),
          title: Text(widget.countryName),
          actions: [
            InkWell(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GraphScreen(
                    noDuplicates,
                    countryName: widget.countryName,
                  );
                }))
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.show_chart,
                  size: 40.0,
                ),
              ),
            ),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: widget._isLoadingData,
          child: Container(
            child: SafeArea(
              child: Container(
                child: ListView.builder(
                  itemCount: itemCardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemCardList[index];
                  },
                  //children: itemCardList,
                ),
              ),
            ),
          ),
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
      print(debug);
    }
  }
}
