import 'package:clima/services/location.dart';
import '../services/networking.dart';

const apiKey = '35948c037062e8ab4b6c4cc5454a69c8';
const apiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String name) async {
    var url = '$apiURL?q=$name&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = networkHelper.getWeather();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();

    // {} since $ only takes one
    NetworkHelper networkHelper = NetworkHelper('$apiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var data = await networkHelper.getWeather();

    return data;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
