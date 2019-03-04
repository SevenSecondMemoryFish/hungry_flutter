
import 'package:dio/dio.dart';
class NetworkService {
  factory NetworkService()=> _getInstance();

  static NetworkService get instance => _getInstance();
  static NetworkService _networkService;

  Dio _dio;

  static const String GET = "get";
  static const String POST = "post";


  NetworkService._network(){
    var option = new Options(
      baseUrl: 'http://elm.cangdu.org',
      connectTimeout: 20000,
      receiveTimeout: 20000,
    );
    _dio = new Dio(option);
  }

  static NetworkService _getInstance(){
    if(_networkService == null){
      _networkService = new NetworkService._network();
    }
    return _networkService;
  }
  get(String url,Map<String, String> params,Function callBack ,Function errorBack) async {
    _request(GET, url, params, callBack, errorBack);
  }

  post(String url,Map<String, String> params,Function callBack ,Function errorBack) async {
    _request(POST, url, params, callBack, errorBack);
  }

  _request(String method,String url,Map<String, String> params,Function callBack ,Function errorBack) async{
    int statusCode;
    try{
      Response response;
      if(params == null){
        params = new Map();
      }
      if(method == GET){
        response = await _dio.get(url,data: params);
      }else if(method == POST){
        response = await _dio.post(url,data: params);
      }
      statusCode = response.statusCode;
      if(response.statusCode == 200){
        String str = response.data.toString();
        print("请求的url"+url+"\n"+str);
        callBack(response.data);
      }else{
        _handError(errorBack, "url:"+"$url"+"错误编码为："+"$statusCode");
      }

    }catch(e){
      _handError(errorBack, e.toString());
    }
  }

  void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}

//if(params == null ){
//          StringBuffer sb = new StringBuffer("?");
//          params.forEach((key,value){
//            sb.write("$key" + "=" + "$value" + "&");
//          });
//          String paramStr = sb.toString();
//
//          paramStr = paramStr.substring(0,paramStr.length-1);
//          url += paramStr;
//}