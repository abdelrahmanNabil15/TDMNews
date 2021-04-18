import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:news/Helper/News.dart';
import 'package:news/Helper/data.dart';
import 'package:news/Models/AricleModel.dart';
import 'package:news/Models/CategoryModel.dart';

import 'alticle_veiw.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<CategoryModel> categories = [];
  List<AricleModel> articles = [];
  bool _loading = true;

  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
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
              physics: ClampingScrollPhysics(),
              child: Container(
                child: Column(
                  children: <Widget>[
                    //// Category Veiw slide
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CateoryTite(
                              imageUrl: categories[index].ImageUrl,
                              categoryName: categories[index].CategoryName,
                            );
                          }),
                    ),
                    //Bolgss
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

class CateoryTite extends StatelessWidget {
  @override
  final String imageUrl, categoryName;

  const CateoryTite({this.imageUrl, this.categoryName});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryVeiws(
          category: categoryName.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,

                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
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
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.black87),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54, fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',), textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
