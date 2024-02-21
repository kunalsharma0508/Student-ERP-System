import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  final String url = 'https://my-erp-api.herokuapp.com/login';

  Future getData(String username , String password) async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return (decodeData);
    } else {
      print(response.statusCode);
    }
  }
}

const dataUrl = 'https://my-erp-api.herokuapp.com/data';
const lecturesUrl = 'https://my-erp-api.herokuapp.com/lectures';
const timeTableUrl = 'https://my-erp-api.herokuapp.com/timetable';

class NetworkService {
  String urlForStudentData;
  NetworkService({required this.urlForStudentData});

  Future getData(String token) async {
    http.Response response = await http.get(
      Uri.parse(urlForStudentData),
      headers: {'Authorization': 'Bearer ' + token},
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return (decodeData);
    } else {
      print(response.statusCode);
    }
  }
}
