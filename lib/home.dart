import './data.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createTile(Book book) => Hero(
          tag: book.title,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Row(
              children: <Widget>[
                Text(book.title),
                SizedBox(
                  width: 5.0,
                ),
                Text(book.writer),
                SizedBox(
                  width: 5.0,
                ),
                Text(book.price),
                SizedBox(
                  width: 5.0,
                ),
                Text(book.pages.toString()),
              ],
            ),
          ),
        );

    ///create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 5,
            crossAxisCount: 1,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    final lists = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(children: books.map((book) => createTile(book)).toList(),),
      ),
    );

    return Scaffold(
      body: Container(
        color: Colors.yellowAccent,
        child: lists,
      ),
    );
  }
}
