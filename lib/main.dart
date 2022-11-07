import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_slidable_app/widget/book_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_slidable_app/data/books.dart';
import 'package:flutter_slidable_app/model/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    required this.title,
    super.key,
  });

  final String title;
  final List<Book> booksList = List.of(books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: booksList.length,
        itemBuilder: ((context, index) {
          final book = booksList[index];
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.monetization_on_outlined,
                  label: 'Order',
                  onPressed: (BuildContext context) async {
                    await launchUrl(
                      Uri.parse(book.buyUrl),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  icon: Icons.favorite_border_outlined,
                  label: 'Favorite',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_forever_outlined,
                  label: 'Delete',
                ),
              ],
            ),
            child: BookTile(book: book),
          );
        }),
      ),
    );
  }
}
