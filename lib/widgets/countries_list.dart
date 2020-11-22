import 'package:covidstats_app/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryItemCard extends StatelessWidget {
  final String country;
  final String continent;
  final String newCases;
  final Function onSelectCallback;

  CountryItemCard(
      {this.country, this.continent, this.newCases, this.onSelectCallback});

  Color getStatusColor(int newCases) {
    if (newCases < 500) return Colors.green;
    if (newCases < 1000) return Colors.yellowAccent;
    if (newCases < 3000) return Colors.orange;
    if (newCases < 5000) return Colors.deepOrangeAccent;
    if (newCases < 10000) return Colors.pink;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.white24))),
              child:
                  getFlagIcon(country) //Icon(Icons.map, color: Colors.white),
              ),
          title: Text(
            country,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale,
                  color: getStatusColor(int.parse(newCases))),
              SizedBox(
                width: 10,
              ),
              Text(newCases, style: TextStyle(color: Colors.white))
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: InkWell(
              onTap: () => onSelectCallback(country),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
