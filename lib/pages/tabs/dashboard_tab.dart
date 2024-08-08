import 'package:flutter/material.dart';
import 'package:nuvaqua_mobile/models/water_consumption.dart';
import 'package:nuvaqua_mobile/widgets/water_consumption_chart.dart';

class DashboardTab extends StatefulWidget {
  @override
  _DashboardTabState createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  int _selectedIndex = 0;
  WaterConsumption? _waterConsumption;

  @override
  void initState() {
    super.initState();
    _fetchWaterConsumptionData();
  }

  void _fetchWaterConsumptionData() {
    // Fetch water consumption data from the backend
    // and update the _waterConsumption variable
    _waterConsumption = WaterConsumption(
      currentMonthConsumption: 25.3,
      dailyConsumption: [10.0, 12.5, 8.7, 11.2, 9.8, 13.4, 15.1],
      weeklyConsumption: [45.0, 52.0, 40.0, 49.0, 43.0, 58.0, 66.0],
      monthlyConsumption: [150.0, 180.0, 160.0, 175.0, 155.0, 195.0, 210.0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_waterConsumption != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'This month\'s water consumption: ${_waterConsumption!.currentMonthConsumption} m³',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          const SizedBox(height: 16.0),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: const [
                      Tab(text: 'Today'),
                      Tab(text: 'Weekly'),
                      Tab(text: 'Monthly'),
                    ],
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        WaterConsumptionChart(
                          waterConsumption: _waterConsumption!,
                          chartType: ChartType.daily,
                        ),
                        WaterConsumptionChart(
                          waterConsumption: _waterConsumption!,
                          chartType: ChartType.weekly,
                        ),
                        WaterConsumptionChart(
                          waterConsumption: _waterConsumption!,
                          chartType: ChartType.monthly,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}