import 'package:flutter_get_x/articles/models/models.dart';
import 'package:flutter_get_x/articles/providers/articles_provider.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController {
  final businessArticles = <Article>[];
  final articlesProvider = Get.find<ArticlesProvider>();

  ArticlesController() {
    getArticlesByCategory('business');
  }

  Future getArticlesByCategory(String category) async {
    final articles = await articlesProvider.getArticlesByCategory(category);
    businessArticles.addAll(articles);
    update();
  }
}
