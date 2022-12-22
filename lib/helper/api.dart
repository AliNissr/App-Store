import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getapi({required String uri, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(uri), headers: headers);
    /*
   * 1- هذه (response.statusCode) توجد في الكوكل شرح عليه وهي على خمس حالات
   * 2- الذي يهمنا هو ثلاث حالات منعا
   * 3- نلاحض ان هذا الخاطيه نوع انتجر اي تائتي بقيمة رقمية
   * 4- الحالات التي نهتم بها هي اذا اتات بقيمه 200 الى 299 يعني ان الكو سليم
   * اما اذا القيمة 300 الى 399 يعني هناك خطاء في الكود بسببي
   * اما اذا القيمة 500 الى 599 يعني يوجد خطاء في الخادم اي خطاء ليس بسببي*/
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return throw Exception(
          'there is problem with status code ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> postapi(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
   Map<String , String> headers = {};
   /*headers.addAll({'Accept' : 'application/json',
     'Content-Type' : 'application/json; charset=utf-8',});*/

   if(token != null){
     headers.addAll({'Authorization' : 'Bearer $token'});
   }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers
    );
   if (response.statusCode == 200){
     Map<String , dynamic> data = jsonDecode(response.body);
     return data;
   }else{
     throw Exception('there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
   }
  }
///////////////////////////////////////////////////////////////////////
  Future<dynamic> putapi(
      {required String uri,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headres = {};
    // headres.addAll({
    //   'Content-Type' : 'application/x-www-form-urlencoded',});
    if (token != null) {
      headres.addAll({'Authorization': 'Bearer $token'});
    }
    print ('uri = $uri  body = $body  token = $token');
    http.Response response =
        await http.put(Uri.parse(uri), body: body, headers: headres);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print (data);
      return data;
    } else {
      throw Exception(
          'there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}


