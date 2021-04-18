import 'package:flutter/material.dart';
import 'package:news/Helper/News.dart';
import 'package:news/Models/AricleModel.dart';

import 'alticle_veiw.dart';

class CategoryVeiws extends StatefulWidget {
  final String category;

  CategoryVeiws({ this.category});

  @override
  _CategoryVeiwsState createState() => _CategoryVeiwsState();
}

class _CategoryVeiwsState extends State<CategoryVeiws> {
  @override
  bool _loading = true;
  List<AricleModel> articles = [];

  void iniState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TDM'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BolgTite(
                              imageUrl: articles[index].urlToImage == null
                                  ? 'https://cdn.dribbble.com/users/1554526/screenshots/3399669/no_results_found.png'
                                  : articles[index].urlToImage,
                              tite: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
          ),
    );
  }
}

class BolgTite extends StatelessWidget {
  final String imageUrl, tite, desc, url;

  const BolgTite(
      {@required this.imageUrl,
      @required this.tite,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AricleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl) == null
                  ? Image.network(
                      'https://cdn.dribbble.com/users/1554526/screenshots/3399669/no_results_found.png')
                  : Image.network(imageUrl),
            ),
            Text(
              tite,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
