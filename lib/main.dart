import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();

  // Variables for current weather
  String _displayedCity = 'City Name';
  String _temperature = 'Temperature';
  String _condition = 'Weather Condition';

  // List to store 7-day forecast data
  List<Map<String, String>> _forecast = [];

  // Function to simulate fetching current weather data
  void _simulateWeatherData() {
    String city = _cityController.text;
    int temperature = 15 + Random().nextInt(16);
    List<String> conditions = ['sunny', 'cloudy', 'rainy'];
    String condition = conditions[Random().nextInt(conditions.length)];

    setState(() {
      _displayedCity = city;
      _temperature = '$temperature°C';
      _condition = condition;
    });
  }

  // Function to simulate fetching a 7-day weather forecast
  void _simulate7DayForecast() {
    List<Map<String, String>> forecast = [];
    List<String> conditions = ['sunny', 'cloudy', 'rainy'];
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (int i = 0; i < 7; i++) {
      int temperature = 15 + Random().nextInt(16);
      String condition = conditions[Random().nextInt(conditions.length)];
      forecast.add({
        'day': days[i],
        'temp': '$temperature°C',
        'condition': condition,
      });
    }

    setState(() {
      _forecast = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input field for city name.
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Button to fetch current weather.
              ElevatedButton(
                onPressed: _simulateWeatherData,
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 16.0),
              // Button to fetch 7-day forecast.
              ElevatedButton(
                onPressed: _simulate7DayForecast,
                child: Text('7-Day Forecast'),
              ),
              SizedBox(height: 32.0),
              // Display current weather.
              Text('City: $_displayedCity', style: TextStyle(fontSize: 18)),
              Text('Temperature: $_temperature',
                  style: TextStyle(fontSize: 18)),
              Text('Condition: $_condition', style: TextStyle(fontSize: 18)),
              SizedBox(height: 32.0),
              // Display 7-day forecast.
              Text('7-Day Forecast:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              // Use a ListView.builder inside a fixed height Container for simplicity.
              Container(
                height: 250,
                child: ListView.builder(
                  itemCount: _forecast.length,
                  itemBuilder: (context, index) {
                    var dayForecast = _forecast[index];
                    return Card(
                      child: ListTile(
                        title: Text('${dayForecast['day']}'),
                        subtitle: Text(
                            'Temp: ${dayForecast['temp']} | ${dayForecast['condition']}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
