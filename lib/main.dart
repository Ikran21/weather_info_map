import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  // Controller to get text input from the user
  final TextEditingController _cityController = TextEditingController();

  // Placeholders for weather data
  String _displayedCity = 'City Name';
  String _temperature = 'Temperature';
  String _condition = 'Weather Condition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField for inputting the city name
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Button to fetch weather
            ElevatedButton(
              onPressed: () {
                // This will be updated in Step 3
              },
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 32.0),
            // Placeholders for displaying weather data
            Text('City: $_displayedCity', style: TextStyle(fontSize: 18)),
            Text('Temperature: $_temperature', style: TextStyle(fontSize: 18)),
            Text('Condition: $_condition', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
