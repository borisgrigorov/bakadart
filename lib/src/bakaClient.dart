import 'dart:convert';

import 'package:bakadart/src/bakaException.dart';
import 'package:bakadart/src/models/absence.dart';
import 'package:bakadart/src/models/apiInfo.dart';
import 'package:bakadart/src/models/loginData.dart';
import 'package:bakadart/src/models/marks.dart';
import 'package:bakadart/src/models/subjects.dart';
import 'package:bakadart/src/models/timetable.dart';
import 'package:bakadart/src/models/userInfo.dart';
import 'package:bakadart/src/schoolList.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, put, delete }

class BakaClient {
  BakaClient(this.baseUrl, {this.loginData});

  SchoolList schoolList = SchoolList();

  LoginData? loginData;
  String baseUrl;

  Future<LoginData> login(String username, String password) async {
    http.Response response = await http.post(
        Uri(
          scheme: "https",
          host: baseUrl,
          path: "/api/login",
        ),
        body: {
          "client_id": "ANDR",
          "grant_type": "password",
          "username": username,
          "password": password,
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      loginData = LoginData.fromJson(json);

      print("Logged in successfully.");
      return loginData!;
    } else {
      print(response.body);
      throw BakaException("Failed to login.", "login-failed");
    }
  }

  Future<ApiInfo> getApiInfo() async {
    http.Response response =
        await authorizedRequest("/api/3", RequestType.get, auth: false);
    if (response.statusCode == 200) {
      return ApiInfo.fromJson(json.decode(response.body));
    } else {
      throw BakaException("Failed to contact server.", "fetch-failed");
    }
  }

  Future<List<SubjectInfo>> getSubjectsInfo() async {
    http.Response response =
        await authorizedRequest("/api/3/subjects", RequestType.get);
    if (response.statusCode == 200) {
      List<SubjectInfo> subjectInfo = [];
      for (Map<String, dynamic> json
          in json.decode(response.body)["Subjects"]) {
        subjectInfo.add(SubjectInfo.fromJson(json));
      }
      print(json.decode(response.body));
      return subjectInfo;
    } else {
      throw BakaException("Failed to fetch subjects info.", "fetch-failed");
    }
  }

  Future<Timetable> getTimetable() async {
    // Now date YYYY-MM-DD
    String now = DateTime.now().toString().split(" ")[0];
    http.Response response = await authorizedRequest(
        "/api/3/timetable/actual", RequestType.get,
        auth: true, queryParameters: {"date": now});
    Timetable timetable = Timetable.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      return timetable;
    } else {
      throw BakaException("Failed to fetch timetable.", "fetch-failed");
    }
  }

  Future<AbsenceData> getAbsence() async {
    http.Response response =
        await authorizedRequest("/api/3/absence/student", RequestType.get);
    AbsenceData absenceData = AbsenceData.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      return absenceData;
    } else {
      throw BakaException("Failed to fetch absence.", "fetch-failed");
    }
  }

  Future<MarksData> getMarks() async {
    http.Response response =
        await authorizedRequest("/api/3/marks", RequestType.get);
    MarksData marksData = MarksData.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      return marksData;
    } else {
      throw BakaException("Failed to fetch marks.", "fetch-failed");
    }
  }

  Future<UserInfo> getUserInfo() async {
    http.Response response =
        await authorizedRequest("/api/3/user", RequestType.get);
    UserInfo userInfo = UserInfo.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      return userInfo;
    } else {
      throw BakaException("Failed to fetch user info.", "fetch-failed");
    }
  }

  Future<http.Response> authorizedRequest(
    String path,
    RequestType type, {
    bool auth = true,
    Map<String, String>? queryParameters,
  }) async {
    http.Response response;
    Uri url = Uri(
        scheme: "https",
        host: baseUrl,
        path: path,
        query: queryParameters?.entries
            .map((e) => "${e.key}=${e.value}")
            .join("&"));
    Map<String, String> headers = auth
        ? {
            "Authorization": "Bearer ${loginData?.accessToken}",
            "Content-Type": "application/x-www-form-urlencoded"
            // "Accept": "application/json",
          }
        : {
            // "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          };
    switch (type) {
      case RequestType.get:
        response = await http.get(url, headers: headers);
        break;
      case RequestType.post:
        response = await http.post(url, headers: headers);
        break;
      case RequestType.put:
        response = await http.put(url, headers: headers);
        break;
      case RequestType.delete:
        response = await http.delete(url, headers: headers);
        break;
    }
    return response;
  }
}
