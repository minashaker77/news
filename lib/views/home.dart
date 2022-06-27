import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CategoryTile
                Expanded(
                  child: Container(
                    height: 80,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      },
                    ),
                  ),
                ),
                // BlogTile
                Expanded(
                    flex: 5,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                            author: articles[index].author,
                            publishedAt: articles[index].publishedAt,
                            content: articles[index].content,
                          );
                        },
                      ),
                    ))
              ],
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({this.categoryName, this.imageUrl});

  final imageUrl, categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              )),
          Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.author,
      required this.publishedAt,
      required this.content});

  final String imageUrl, title, description, author, publishedAt, content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(description),
          Text(content),
          Text(publishedAt),
          Text(author),
        ],
      ),
    );
  }
}
