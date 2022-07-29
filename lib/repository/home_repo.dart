
import 'dart:convert';

import 'package:flutter_estudo_avancado_api/repository/base_repo.dart';
import 'package:http/http.dart' as http;

import '../model/home_model.dart';

class HomeRepo {
  List<HomeModel> coutryList = [];
  
  bool get kDebugMode => false;

  Future<HomeModel?> getCounbtryData() async{
    try {
      var request = http.Request('GET', Uri.parse(BaseRepo().baseUrl.toString()));
      http.StreamedResponse resposnse = await request.send();
      
      if(resposnse.statusCode == 200){
        var data = await resposnse.stream.bytesToString();
        var map = json.decode(data);
        var model = HomeModel.fromJson(map);
        return model;
      } else{
        if (kDebugMode) {
          print(resposnse.reasonPhrase);
        }
      }

    } catch (e) {
      throw (e);
    }
    return null;
  }



}