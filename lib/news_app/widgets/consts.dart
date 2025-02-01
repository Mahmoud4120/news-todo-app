import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/news_app/widgets/webView/webVIew__screen.dart';
import 'package:flutter/material.dart';


Widget buildArticleItem({required article, required BuildContext context}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${article['urlToImage']}'))),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
Widget articleBuilder(
        {list, required BuildContext context, bool isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(
                article: list[index],
                context: context,
              ),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: .5,
                  color: Colors.grey,
                ),
              ),
          itemCount: list.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
