import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ReusableChart extends StatelessWidget {
  List<charts.Series> series;
  bool animate;
  String title;
  ReusableChart(this.series, this.animate, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.TimeSeriesChart(
        series,
        animate: true,
        behaviors: [
          charts.ChartTitle(title,
              titleStyleSpec: charts.TextStyleSpec(
                  fontSize: 18, color: charts.MaterialPalette.white),
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.start,
              // Set a larger inner padding than the default (10) to avoid
              // rendering the text too close to the top measure axis tick label.
              // The top tick label may extend upwards into the top margin region
              // if it is located at the top of the draw area.
              innerPadding: 14),
        ],
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
                fontSize: 10,
                color: charts.MaterialPalette
                    .white), //change white color as per your requirement.
          ),
        ),

        domainAxis: charts.DateTimeAxisSpec(
            //)      EndPointsTimeAxisSpec()
            renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
              fontSize: 10,
              color: charts.MaterialPalette
                  .white), //change white color as per your requirement.
        )),
        // Optionally pass in a [DateTimeFactory] used by the chart. The factory
        // should create the same type of [DateTime] as the data provided. If none
        // specified, the default creates local date time.
        //dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
