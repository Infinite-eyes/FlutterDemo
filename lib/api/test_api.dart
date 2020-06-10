import 'dart:convert';
import 'dart:io';

_getHttpData() async{

  var httpClient = new HttpClient();

//  httpClient.findProxy = (url) {
//    return HttpClient.findProxyFromEnvironment(url, environment: {"http_proxy": 'http://192.168.124.94:8888',});
//  };

  Map<String, String> queryParameters = {'format': '2', 'key': '939e592487c33b12c509f757500888b5', 'lon': '116.39277', 'lat': '39.933748'};

  var uri = Uri.http('v.juhe.cn', '/weather/geo',queryParameters);

  var request = await httpClient.getUrl(uri);

  var response = await request.close();

  if(response.statusCode == 200){
    print('请求成功');
    var responseBody = await response.transform(utf8.decoder).join();
    print('responseBOdy = $responseBody');

  }else{
    print('请求失败');
  }




}