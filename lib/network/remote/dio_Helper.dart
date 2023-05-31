import 'package:dio/dio.dart';

import '../../shared/Components/components.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:4242/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    String lang = 'ar',
    //   required Map<String, dynamic> query,
  }) async {
    dio.options.queryParameters = {};
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfc3NuIjoiMiIsInVzZXJfbmFtZSI6Imdlb3JnZSIsIm1hbnVmYWN0dXJlcl9udW1iZXIiOiIxIiwidXNlcl9lbWFpbCI6Imdlb3JnZTJAYWRtaW4uY29tIiwidXNlcl9wYXNzd29yZCI6IiQyYiQxMCRPaUF4a2dtcGpheFJhUXJ5MzJQcC5PSGRabmV4ektXQjZQMG1NQTNBZXNHcTVZMkRMZ1QuNiIsInVzZXJfYWRkcmVzcyI6ImZheW91bSIsInVzZXJfam9iIjoic3R1ZGVudCIsInVzZXJfbmF0aW9uYWxpdHkiOiJFZ3lwdGlhbiIsInVzZXJfcGhvbmUiOiIwMTAyNzgyNzY1NCIsInVzZXJfYmQiOiIzMC0xMC0yMDAxIiwidXNlcl9nb3Zlcm5vcmF0ZSI6ImZheW91bSIsImlzX2FkbWluIjoiYWRtaW4ifSwiaWF0IjoxNjc4NjYwOTYzfQ.3wTglpjxquUEjZSTW_M0Q8J64G3qBVK8HwYLkb08gvM',
      //'Authorization':
      //  'LkAlozwNUpmVJpTTPnoxkRn5Az4kQj9n496uvRFcoN2Q5o4WtGUbRhayIwpjq6CDOnPMU5',
    };
    return await dio.get(
      url,
    );
  }

  static Future<Response> postData({
    //String? url,
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,

      // 'lang' : en,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

//get the transations from api
  // Future<List<dynamic>> getAllTransactions() async {
  //   try {
  //     Response response = await dio.get('transactions');
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (error) {
  //     print(error.toString());
  //     return [];
  //   }
  // }
}
