import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/articlesmodel.dart';
import 'package:http/http.dart' as http;
class NewsCategoriesProvider extends ChangeNotifier {
  List<ArticlesModel>listDataModel = [];

  NewsCategoriesProvider() {
    getData();
  }

  Future getData() async {
    listDataModel = [];

    try {
      String APIKEY = "40ee926462f140f19db1b276e64e45a7";
      fetchcategoryNews(String Category)async{
        var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$Category&apiKey=$APIKEY");
        var response = await http.get(url);
        var responsebody =jsonDecode(response.body)["articles"];
        for(var i in responsebody){

          listDataModel.add(ArticlesModel(title:i["title"], description:i["description"], url:i["url"], urlToImage:i["urlToImage"]));

        }

        notifyListeners();
      }
    }
    catch (e) {
      print("e$e");
    }
    notifyListeners();
  }
}
