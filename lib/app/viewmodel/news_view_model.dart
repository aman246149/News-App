import 'package:flutter/material.dart';

import '../../global/network/api_client.dart';
import '../model/news_model.dart';

class NewsViewModel extends ChangeNotifier {
  List<String> category = [
    "BUSINESS",
    "ENTERTAINMENT",
    "GENERAL",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
    "TECHNOLOGY"
  ];
  String error = "";
  int selectedNewsCategoryIndex = 0;
  bool isLoading = false;
  List<NewsModel>? newsModel;

  void setSelectedNewsCategoryIndex(int index) {
    selectedNewsCategoryIndex = index;
    notifyListeners();
  }

  void fetchHeadLine(String country, String category) async {
    try {
      isLoading = true;
      notifyListeners();
      var resp = await await ApiClient.get(
          "top-headlines?country=$country&category=$category");
      List<dynamic> list = resp['articles'];
      newsModel = list.map((e) => NewsModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
