import 'package:flutter/material.dart';

import '../../global/network/api_client.dart';
import '../model/news_model.dart';
import 'package:intl/intl.dart';

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
  bool isPopularNewsLoading = false;
  List<NewsModel>? newsModel;
  List<NewsModel>? popularNews;

  void setSelectedNewsCategoryIndex(int index) {
    selectedNewsCategoryIndex = index;
    notifyListeners();
  }

  Future<bool> fetchHeadLine(String country, String category) async {
    try {
      isLoading = true;
      notifyListeners();
      var resp = await await ApiClient.get(
          "top-headlines?country=$country&category=$category");
      List<dynamic> list = resp['articles'];
      newsModel = list.map((e) => NewsModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      error = e.toString();
      notifyListeners();
      return false;
    }
  }

  void fetchEveryThing(String category) async {
    try {
      isPopularNewsLoading = true;
      notifyListeners();
      DateTime now = DateTime.now();
      DateTime oneMonthAgo = now.subtract(const Duration(days: 30));

      String formattedFrom =
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(oneMonthAgo);
      String formattedTo = DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);

      var resp = await ApiClient.get(
          "everything?q=$category&from=$formattedFrom&to=$formattedTo&sortBy=popularity&pageSize=${20}");
      List<dynamic> list = resp['articles'];
      popularNews = list.map((e) => NewsModel.fromJson(e)).toList();
      isPopularNewsLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
