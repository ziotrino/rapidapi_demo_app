import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidstats_app/models/Response.dart';
import 'package:covidstats_app/utilities/utils.dart';
import 'package:covidstats_app/widgets/chart_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GraphScreen extends StatelessWidget {
  final List<Response> dataList;
  final String countryName;
  bool _isLoadingData = false;
  GraphScreen(this.dataList, {this.countryName});

  @override
  Widget build(BuildContext context) {
    List<charts.Series> caseSeries;
    List<charts.Series> testSeries;
    List<charts.Series> deathSeries;

    List<TimeSeries> dataCases = [];
    List<TimeSeries> dataTests = [];
    List<TimeSeries> dataDeaths = [];
    //lists are on a per week basis. Only une day per week is kept to build the time series
    //numbers are divided by 1k
    int dayToKeep = 0;
    for (Response dataItem in dataList) {
      if (dayToKeep == 6) {
        if (dataItem.cases.total != null &&
            dataItem.tests.total != null &&
            dataItem.deaths.total != null) {
          dayToKeep = 0;
          TimeSeries t = TimeSeries(DateTime.parse(dataItem.day),
              (dataItem.cases.total / 1000).round());
          dataCases.add(t);
          t = TimeSeries(DateTime.parse(dataItem.day),
              (dataItem.tests.total / 1000).round());
          dataTests.add(t);
          t = TimeSeries(DateTime.parse(dataItem.day),
              (dataItem.deaths.total / 1000).round());
          dataDeaths.add(t);
        } else {
          //if there are null values, the loop gets a bonus for another carousel ride
          dayToKeep--;
        }
      }
      dayToKeep++;
    }

    dataCases = List.from(dataCases.reversed);
    dataTests = List.from(dataTests.reversed);
    dataDeaths = List.from(dataDeaths.reversed);

    List<charts.Series<TimeSeries, DateTime>> casesChart = [
      charts.Series<TimeSeries, DateTime>(
        id: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeries cases, _) => cases.time,
        measureFn: (TimeSeries cases, _) => cases.value,
        data: dataCases,
      ),
    ];

    List<charts.Series<TimeSeries, DateTime>> testsChart = [
      charts.Series<TimeSeries, DateTime>(
        id: 'Tests',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (TimeSeries cases, _) => cases.time,
        measureFn: (TimeSeries cases, _) => cases.value,
        data: dataTests,
      )
    ];

    List<charts.Series<TimeSeries, DateTime>> deathsChart = [
      charts.Series<TimeSeries, DateTime>(
        id: 'Deaths',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeries cases, _) => cases.time,
        measureFn: (TimeSeries cases, _) => cases.value,
        data: dataDeaths,
      )
    ];

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
              child: getFlagIcon(countryName),
            ),
          ],
        ),
        title: Text(countryName),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoadingData,
        child: Container(
          child: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableChart(casesChart, true, 'Cases (1k)'),
                ),
                Expanded(
                  child: ReusableChart(testsChart, true, 'Tests (1k)'),
                ),
                Expanded(
                  child: ReusableChart(deathsChart, true, 'Deaths (1k)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSeries {
  final DateTime time;
  final int value;

  TimeSeries(this.time, this.value);
}
