import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';


Widget buildArticleItem(article ,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,


          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(child:
      Container(
        height: 120,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text('${article['title']}' ,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Text('${article['publishedAt']}',
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],),
      ),
      ),

    ],
  ),
);

Widget myDivider () => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],

  ),
);

Widget  articleBuilder(list ,context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics() ,
    itemBuilder: (context, index) => buildArticleItem(list[index] , context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: 10,
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);