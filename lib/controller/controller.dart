import 'dart:convert';

import 'package:animated_pr_ui/Model/Model.dart';
import 'package:animated_pr_ui/utils/golbal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';




class HomeController extends ChangeNotifier {


  HomeController() {
    getData();
    getShareData();
  }



  List<PlanetsModel> planetsList = [];

  List<PlanetsModel> favoritePlanetsList = [];

  Future<void> getData() async {
    String jsonData = await rootBundle.loadString('assets/Json/plantes.json');
    List json = jsonDecode(jsonData);
    planetsList = json
        .map(
          (e) => PlanetsModel.fromJson(e),
    )
        .toList();
    notifyListeners();
    print(planetsList);
  }
  void selectData(int index)
  {
    selectedIndex=index;
    print(selectedIndex);
    notifyListeners();

  }
  void addFavoritePlanets() {
    planetsList[selectedIndex].like = !planetsList[selectedIndex].like;
    notifyListeners();
    if (planetsList[selectedIndex].like) {
      favoritePlanetsList.add(planetsList[selectedIndex]);
      notifyListeners();
    } else {
      favoritePlanetsList.remove(planetsList[selectedIndex]);
      notifyListeners();
    }
    setShareData();
    print(favoritePlanetsList.length);
    notifyListeners();
  }

  void removeFavoritePlanets(int index)
  {
    for (int i = 0; i < 9; i++) {
      if(favoritePlanetsList[index].name==planetsList[i].name)
      {
        planetsList[i].like = !planetsList[i].like;
        favoritePlanetsList.removeAt(index);
        notifyListeners();
      }
    }
    setShareData();
    notifyListeners();
  }

  Future<void> setShareData() async {
    SharedPreferences preferencesLike = await SharedPreferences.getInstance();
    for (int i = 0; i < 9; i++) {
      preferencesLike.setBool('like$i', planetsList[i].like);
      notifyListeners();
    }
    // favoritePlanetsList.clear();
    notifyListeners();
  }

  Future<void> getShareData() async {
    SharedPreferences preferencesLike = await SharedPreferences.getInstance();
    for (int i = 0; i < 9; i++) {
      planetsList[i].like = preferencesLike.getBool('like$i') ?? false;
      notifyListeners();
      if (planetsList[i].like) {
        favoritePlanetsList.add(planetsList[i]);
        notifyListeners();
      }
    }
    setShareData();
    print(favoritePlanetsList.length);
    notifyListeners();
  }

}