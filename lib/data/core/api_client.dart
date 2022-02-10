import 'dart:io';
import 'package:flutter/material.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api_constants.dart';

class APIClient {

  dynamic getResource({required String path, }) async {

    final Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      var url = APIConstants.API_BASE_URL + path ;
      Response response = await dio.get(url);
      debugPrint('url in client:\n $url');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e){
      if(e.response != null) {
        debugPrint(e.response!.data);
      } else{
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.message);
      }
    }
  }

}