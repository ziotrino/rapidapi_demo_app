import 'dart:ui';

import 'package:covidstats_app/models/Stats.dart';
import 'package:covidstats_app/models/data_helper.dart';
import 'package:covidstats_app/screens/countries_screen.dart';
import 'package:covidstats_app/utilities/Constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _starting = false;

  void getData() async {
    try {
      setState(() {
        _starting = true;
      });
      //String url = '$kBaseURL$kHistorySearch?country=$kDefaultCountry';
      String url = '$kBaseURL$kStatsSearch';
      var response = await DataHelper().getData(url);
      if (response == null) {
        throw ('Connection error');
      }
      Stats covidData = Stats.fromJson(response);
      setState(() {
        _starting = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CountriesScreen(
          covidData: covidData,
        );
      }));
    } on Exception catch (e) {
      _starting = false;
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text("Sorry, there was an error retrieving data ${e.toString()}"),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    //print('calling init state');
    //getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: ModalProgressHUD(
        inAsyncCall: _starting,
        progressIndicator: CircularProgressIndicator(
          strokeWidth: 6,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Image(
                    image: AssetImage('images/covid_19.png'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextButton.icon(
                      label: Text(
                        'Enter',
                        style: kButtonTextStyle,
                      ),
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        size: 30,
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                        onSurface: Colors.grey,
                      ),
                      //disabled while loading
                      onPressed: _starting ? null : () => getData(),
                    ),
                  ),
                ),
                Text(
                  "COVID-19 Europe stats",
                  style: kSplashTextStyle,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "powered by RapidAPI COVID-19 API statistics",
                    style: kSplashInfoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
