/*import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  final List<dynamic> historicalData;

  const GraphScreen(this.historicalData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Quality Graph')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historical Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            historicalData.isEmpty
                ? const Center(child: Text('No data available'))
                : SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < historicalData.length) {
                                  final date = DateTime.parse(
                                      historicalData[index]['timestamp']);
                                  return Text(
                                    '${date.day}/${date.month}',
                                    style: const TextStyle(fontSize: 10),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value = entry.value['pH'].toDouble();
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: const FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value = entry.value['turbidity'].toDouble();
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.green,
                            dotData: const FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value = entry.value['salinity'].toDouble();
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.red,
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  final List<dynamic> historicalData;

  const GraphScreen(this.historicalData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Quality Graph')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historical Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            historicalData.isEmpty
                ? const Center(child: Text('No data available'))
                : SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < historicalData.length) {
                                  final date = DateTime.parse(
                                      historicalData[index]['timestamp']);
                                  return Text(
                                    '${date.day}/${date.month}',
                                    style: const TextStyle(fontSize: 10),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value =
                                  entry.value['pH']?.toDouble() ?? 0.0;
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: const FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value =
                                  entry.value['Turbidity']?.toDouble() ?? 0.0;
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.green,
                            dotData: const FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: historicalData.asMap().entries.map((entry) {
                              final index = entry.key.toDouble();
                              final value =
                                  entry.value['TDS']?.toDouble() ?? 0.0;
                              return FlSpot(index, value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.red,
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
