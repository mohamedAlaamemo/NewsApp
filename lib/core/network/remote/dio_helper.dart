
import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   "Content-Type": "application/json;charset=UTF-8",
        //   "Accept": "*/*",
        // },
      ),
    );
  }


  static Future<Response>getData({
    required String url,
    Map<String,dynamic>?query,
    String lang='en',
    String? token,
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url, required dynamic data}) async {
    return await dio.post(
      url,
      data: data,
    );
  }


  static Future<Response>patchData({required String url, required dynamic data})
  async{
    return await dio.patch(
      url,
      data: data,
    );
  }
  
  
  static Future<Response>deleteData({required String url})async{
    return await dio.delete(url);
  }
  
}