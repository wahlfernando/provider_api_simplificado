
import 'package:flutter/material.dart';
import 'package:flutter_estudo_avancado_api/model/home_model.dart';
import 'package:flutter_estudo_avancado_api/repository/home_repo.dart';

class HomeProvider with ChangeNotifier{

  HomeModel? model;

  bool isLoaded = false;

  Future<void> getCoutryApi() async{
    model = await HomeRepo().getCounbtryData();
    setIsLoaded(true);
    notifyListeners();
  }

  bool getIsLoaded(){
    return isLoaded;
  }

  void setIsLoaded(bool value){
    isLoaded = value;
    notifyListeners();
  }
  
}