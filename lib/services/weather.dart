import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const String apiKey = '9a0961310414844f06c5fdb1449e94a7';
const String openWeatherAppURL =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Position? getLoc;

  Future<dynamic> getCityWeather(String cityName) async {
    print(cityName);
    var url = '$openWeatherAppURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper netHel = NetworkHelper(url);
    var weather = await netHel.getData();

    return weather;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationObject = Location();
    getLoc = await locationObject.getLocation();
    NetworkHelper getCondition = NetworkHelper(
        '$openWeatherAppURL?lat=${getLoc?.latitude}&lon=${getLoc?.longitude}&appid=$apiKey&units=metric');

    var weatherData = await getCondition.getData();

    return weatherData;
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
