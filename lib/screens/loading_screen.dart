import 'package:flutter/material.dart';
import '../services/network.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await getCityWeather("Dhaka");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  //method to get Dhaka weather
  Future<dynamic> getCityWeather(String latitude,String longitude) async {
    final String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=lat=$latitude&lon=$longitude&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";

    //"https://api.openweathermap.org/data/2.5/weather?q= '+cityName.value+'&appid=7db53c3796884c55930041eb7586413a";
       // "https://api.openweathermap.org/data/2.5/weather?q=lat=88&lon=88&appid=d2557a2773efd72561078cef5a330152&units=metric";
     // "https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=d2557a2773efd72561078cef5a330152&units=metric";
    // "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
    // "https://api.openweathermap.org/data/2.5/weather?lat=88&lon=88&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";


    NetworkHelper networkHelper = NetworkHelper('$weatherUrl');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.09),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
Future<dynamic> getCityWeather(String latitude,String longitude) async {
  final String weatherUrl =
  //"https://api.openweathermap.org/data/2.5/weather?q= '+cityName.value+'&appid=7db53c3796884c55930041eb7586413a";
  // "https://api.openweathermap.org/data/2.5/weather?q=lat=88&lon=88&appid=d2557a2773efd72561078cef5a330152&units=metric";
  // "https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=d2557a2773efd72561078cef5a330152&units=metric";
      "https://api.openweathermap.org/data/2.5/weather?q=lat=$latitude&lon=$longitude&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
  // "https://api.openweathermap.org/data/2.5/weather?lat=88&lon=88&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";


  NetworkHelper networkHelper = NetworkHelper('$weatherUrl');

  var weatherData = await networkHelper.getData();
  return weatherData;
}