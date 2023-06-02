import 'dart:convert';

import 'package:random_api/modal/randomModal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apiHelper=ApiHelper();
  String link="https://randomuser.me/api/";
  RandomData randomData=RandomData();

  Future<RandomData> random()
  async {
    var response = await http.get(Uri.parse(link));
    var rjson=jsonDecode(response.body);
    randomData=RandomData.fromJson(rjson);
    return randomData;

  }

}