import 'package:covidstats_app/models/Response.dart';
import 'package:covidstats_app/utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDataItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DataItemCard extends StatelessWidget {
  final Response response;
  //deltas
  final int deltaActive;
  final int deltaCritical;
  final int deltaRecovered;
  final int deltaTests;
  final double ratio;
  DataItemCard({
    this.response,
    this.deltaTests,
    this.deltaCritical,
    this.deltaActive,
    this.deltaRecovered,
    this.ratio,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 6.0), //const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Date/time:${response.time}', //${response.day}
                    style: kMediumLabelTextStyle,
                  ),
                ],
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24))),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          'tests',
                          style: kDataTextStyle,
                        ),
                        Text(
                          'cases',
                          style: kDataTextStyle,
                        ),
                        Text(
                          'C/T %',
                          style: kDataTextStyle,
                        ),
                        Text(
                          'Critical',
                          style: kDataTextStyle,
                        ),
                        Text(
                          'Deaths',
                          style: kDataTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$deltaTests',
                          style: kHypeTextStyle,
                        ),
                        Text(
                          '${response.cases.news}', // cases/tests:${(int.tryParse(response.cases.news) / deltaTests).toStringAsFixed(3)}',
                          style: kHypeTextStyle,
                        ),
                        Text(
                          '${ratio.toStringAsFixed(2)}', // cases/tests:${(int.tryParse(response.cases.news) / deltaTests).toStringAsFixed(3)}',
                          style: kHypeTextStyle,
                        ),
                        Text(
                          '${deltaCritical.isNegative ? '-' : '+'}$deltaCritical',
                          style: kHypeTextStyle,
                        ),
                        Text(
                          '${response.deaths.news}',
                          style: kHypeTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24))),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '${response.tests.total}',
                          style: kDataTextStyle,
                        ),
                        Text(
                          '${response.cases.total}',
                          style: kDataTextStyle,
                        ),
                        Text(
                          ' ', //placeholder for ratio
                          style: kDataTextStyle,
                        ),
                        Text(
                          '${response.cases.critical}',
                          style: kDataTextStyle,
                        ),
                        Text(
                          '${response.deaths.total}',
                          style: kDataTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
