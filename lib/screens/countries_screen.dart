import 'package:covidstats_app/models/RapidResponse.dart';
import 'package:covidstats_app/models/Response.dart';
import 'package:covidstats_app/models/Stats.dart';
import 'package:covidstats_app/models/data_helper.dart';
import 'package:covidstats_app/utilities/Constants.dart';
import 'package:covidstats_app/widgets/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'data_screen.dart';

class CountriesScreen extends StatefulWidget {
  final Stats covidData;
  CountriesScreen({this.covidData});

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  //all the following procedure may be refactored using a provider
  bool _querying = false;
  void getCountryData(String country) async {
    setState(() {
      _querying = true;
    });
    String url = '$kBaseURL$kHistorySearch?country=${country}';
    //String url = '$kBaseURL$kHistorySearch';
    var response = await DataHelper().getData(url);
    RapidResponse covidData = RapidResponse.fromJson(response);
    setState(() {
      _querying = false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DataScreen(
        dataList: covidData.response,
        countryName: country,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    List<CountryItemCard> itemCardList = [];
    List<Response> data = widget.covidData.response;
    for (Response country in data) {
      CountryItemCard countryCard = CountryItemCard(
        country: country.country,
        continent: country.continent,
        newCases: country.cases.news == null ? '0' : country.cases.news,
        onSelectCallback: (String s) {
          getCountryData(s);
        },
      );
      if (countryCard.continent == "Europe") {
        itemCardList.add(countryCard);
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        leading: Container(
          child: Image(
            image: AssetImage('images/covid_19.png'),
          ),
        ),
        title: Text('Countries stats'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _querying,
        //opacity: 0.8,
        //color: Colors.white,
        progressIndicator: CircularProgressIndicator(
          strokeWidth: 6,
        ),
        child: SafeArea(
          child: ListView.builder(
            itemCount: itemCardList.length,
            itemBuilder: (BuildContext context, int index) {
              return itemCardList[index];
            },
          ),
        ),
      ),
    );
  }
}
