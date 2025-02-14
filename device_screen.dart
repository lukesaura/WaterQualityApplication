/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'graph_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  Map<String, dynamic>? latestData;
  List<dynamic> historicalData = [];
  String waterQualityMessage = 'Loading...';
  Color waterQualityColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  Future<void> fetchSensorData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://chmo78tyl6.execute-api.ap-south-1.amazonaws.com/dev/SensorData'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          historicalData = responseData['data'];
          latestData = historicalData.isNotEmpty ? historicalData.last : null;
          waterQualityMessage = isSafeToDrink()
              ? 'Water is Safe to Drink'
              : 'Water is Not Safe to Drink';
          waterQualityColor = isSafeToDrink() ? Colors.blue : Colors.red;
        });
      } else {
        setState(() {
          waterQualityMessage = 'Failed to load sensor data.';
        });
      }
    } catch (e) {
      setState(() {
        waterQualityMessage = 'An error occurred. Please try again later.';
      });
    }
  }

  bool isSafeToDrink() {
    if (latestData == null) return false;

    double? pH = latestData!['pH'];
    double? turbidity = latestData!['turbidity'];
    double? salinity = latestData!['salinity'];

    return pH != null &&
        turbidity != null &&
        salinity != null &&
        pH >= 6.5 &&
        pH <= 8.5 &&
        turbidity <= 5.0 &&
        salinity <= 1.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Details')),
      body: latestData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Latest Sensor Data',
                      style: TextStyle(fontSize: 20)),
                  Text('pH Level: ${latestData!['pH']}'),
                  Text('Turbidity: ${latestData!['turbidity']}'),
                  Text('Salinity: ${latestData!['salinity']}'),
                  const SizedBox(height: 20),
                  Text(waterQualityMessage,
                      style: TextStyle(color: waterQualityColor, fontSize: 18)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GraphScreen(historicalData)),
                      );
                    },
                    child: const Text('View Historical Data'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back to Dashboard'),
                  ),
                ],
              ),
            ),
    );
  }
}*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'graph_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  Map<String, dynamic>? latestData;
  List<dynamic> historicalData = [];
  String waterQualityMessage = 'Loading...';
  Color waterQualityColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  Future<void> fetchSensorData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://chmo78tyl6.execute-api.ap-south-1.amazonaws.com/dev/SensorData'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          historicalData = responseData['data'] ?? [];
          latestData = historicalData.isNotEmpty ? historicalData.last : null;

          waterQualityMessage = isSafeToDrink()
              ? 'Water is Safe to Drink'
              : 'Water is Not Safe to Drink';

          waterQualityColor = isSafeToDrink() ? Colors.blue : Colors.red;
        });
      } else {
        setState(() {
          waterQualityMessage = 'Failed to load sensor data.';
        });
      }
    } catch (e) {
      setState(() {
        waterQualityMessage = 'An error occurred. Please try again later.';
      });
    }
  }

  bool isSafeToDrink() {
    if (latestData == null) return false;

    // Use correct field names based on your API response
    double? pH = latestData!['pH']?.toDouble();
    double? turbidity = latestData!['Turbidity']?.toDouble();
    double? tds = latestData!['TDS']?.toDouble();

    return pH != null &&
        turbidity != null &&
        tds != null &&
        pH >= 6.5 &&
        pH <= 8.5 &&
        turbidity <= 5.0 &&
        tds <= 1000; // Adjust thresholds as per requirements
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Details')),
      body: latestData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Latest Sensor Data',
                      style: TextStyle(fontSize: 20)),
                  Text(
                      'pH Level ( 6.5 < safe level < 8.5 ): ${latestData!['pH']?.toStringAsFixed(2) ?? 'N/A'}'),
                  Text(
                      'Turbidity ( safe level < 5 NTU ): ${latestData!['Turbidity']?.toStringAsFixed(2) ?? 'N/A'}'),
                  Text(
                      'TDS ( safe level < 500 ppm ): ${latestData!['TDS']?.toStringAsFixed(2) ?? 'N/A'}'),
                  const SizedBox(height: 20),
                  Text(waterQualityMessage,
                      style: TextStyle(color: waterQualityColor, fontSize: 18)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GraphScreen(historicalData)),
                      );
                    },
                    child: const Text('View Historical Data'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back to Dashboard'),
                  ),
                ],
              ),
            ),
    );
  }
}
