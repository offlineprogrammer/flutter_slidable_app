import 'package:flutter/material.dart';
import 'package:flutter_slidable_app/model/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      onTap: () {},
      leading: Image.network(
        book.imageUrl,
      ),
      title: Text(
        book.title,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        book.author,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
