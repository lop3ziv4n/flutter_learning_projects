import 'package:flutter_get_x/articles/models/models.dart';
import 'package:get/get_connect.dart';

class ArticlesProvider extends GetConnect {
  @override
  void onInit() {
    print('ArticlesProvider onInit');
  }

  Future<List<Article>> getArticlesByCategory(String category) async {
    final resp = await get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=431a2b39236d43baaafbf67530faa12d');
    final newsResponse = NewsResponse.fromMap(resp.body);

    return newsResponse.articles;
  }
}
