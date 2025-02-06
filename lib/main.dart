import 'dart:math'; // Needed for random number generation.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// The main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      home: WeatherHomePage(),
    );
  }
}

// The homepage which displays the UI and handles user input.
class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  // Controller for the TextField to capture user input (city name).
  final TextEditingController _cityController = TextEditingController();

  // Variables to store the displayed weather data.
  String _displayedCity = 'City Name';
  String _temperature = 'Temperature';
  String _condition = 'Weather Condition';

  // Function that simulates fetching weather data.
  void _simulateWeatherData() {
    // 1. Take the entered city name.
    String city = _cityController.text;

    // 2. Generate a random temperature between 15°C and 30°C.
    int temperature = 15 + Random().nextInt(16); // Random number from 15 to 30.

    // 3. Randomly select a weather condition.
    List<String> conditions = ['sunny', 'cloudy', 'rainy'];
    String condition = conditions[Random().nextInt(conditions.length)];

    // Update the state with the new weather data.
    setState(() {
      _displayedCity = city;
      _temperature = '$temperature°C';
      _condition = condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field for the city name.
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Button to fetch weather data.
            ElevatedButton(
              onPressed: _simulateWeatherData,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 32.0),
            // Placeholders for displaying the weather data.
            Text('City: $_displayedCity', style: TextStyle(fontSize: 18)),
            Text('Temperature: $_temperature', style: TextStyle(fontSize: 18)),
            Text('Condition: $_condition', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
