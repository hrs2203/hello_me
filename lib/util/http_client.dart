import 'dart:convert';

import 'package:dio/dio.dart';

class HttpAgent{

  static getReq(url) async{
    Dio dio = new Dio();
    var httpResp = (await dio.get(url)).toString();
    return jsonDecode(httpResp);
  }
}