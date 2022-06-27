import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];


Future<void> getNews() async{
  String url = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7e011c1d28b44c91ab4c99aa9fccdc30';


  // http.Response response = await http.get(Uri.parse(url));
  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);


  if(jsonData["status"] == "ok"){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"] != null && element["description"] != null){
        ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title : element['title'],
            description : element['description'],
            url : element['url'],
            urlToImage : element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['content']
        );
        news.add(articleModel);
      }
    });
  }

}




}