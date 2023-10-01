import "dart:convert";
import "package:bakadart/src/bakaException.dart";
import "package:bakadart/src/models/city.dart";
import "package:bakadart/src/models/schools.dart";
import "package:http/http.dart" as http;

class SchoolList {
  Future<List<City>> getCities() async {
    http.Response response = await http.get(
        Uri.parse("https://sluzby.bakalari.cz/api/v1/municipality"),
        headers: {
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      List<City> cities = [];
      for (var city in json.decode(response.body)) {
        cities.add(City.fromJson(city));
      }
      return cities;
    } else {
      throw BakaException("Failed to fetch cities.", "fetch-failed");
    }
  }

  Future getSchools(String city) async {
    http.Response response = await http.get(
        Uri.parse("https://sluzby.bakalari.cz/api/v1/municipality/$city"),
        headers: {
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      List<School> schools = [];
      for (var school in json.decode(response.body)["schools"]) {
        schools.add(School.fromJson(school));
      }
      return schools;
    } else {
      throw BakaException("Failed to fetch school.", "fetch-failed");
    }
  }
}
