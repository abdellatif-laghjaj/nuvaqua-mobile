import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/water_consumption.dart';

enum ChartType { daily, weekly, monthly }

class WaterConsumptionChart extends StatelessWidget {
  final WaterConsumption waterConsumption;
  final ChartType chartType;

  const WaterConsumptionChart({super.key,
    required this.waterConsumption,
    required this.chartType,
  });

  @override
  Widget build(BuildContext context) {
    List<double> data;
    String xAxisLabel;

    switch (chartType) {
      case ChartType.daily:
        data = waterConsumption.dailyConsumption;
        xAxisLabel = 'Day';
        break;
      case ChartType.weekly:
        data = waterConsumption.weeklyConsumption;
        xAxisLabel = 'Week';
        break;
      case ChartType.monthly:
        data = waterConsumption.monthlyConsumption;
        xAxisLabel = 'Month';
        break;
    }

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: xAxisLabel),
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Water Consumption (m³)'),
      ),
      series: <ChartSeries<double, String>>[
        LineSeries<double, String>(
          dataSource: data.asMap().entries.map((entry) => entry.value).toList(),
          xValueMapper: (_, index) => index.toString(),
          yValueMapper: (value, _) => value,
        ),
      ],
    );
  }
}
