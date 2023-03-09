import 'dart:math';

import 'package:intl/intl.dart';

class Book {
  final String title;
  final String author;
  final String image;
  final DateTime publishedDate;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.publishedDate,
  });
}

DateTime get randomDate => DateTime.now().subtract(
      Duration(days: Random().nextInt(365 * 6)),
    );

extension DateTimeX on DateTime {
  String toDate() => DateFormat("dd MMM yyyy").format(this);
}

final books = <Book>[
  Book(
    title: 'More Than Words',
    author: 'John Sullivan',
    image: 'assets/images/book_cover_1.png',
    publishedDate: randomDate,
  ),
  Book(
    title: 'Crazy 8’s',
    author: 'Jake Knapp',
    image: 'assets/images/book_cover_2.png',
    publishedDate: randomDate,
  ),
  Book(
    title: 'The Tiny Dragon',
    author: 'Rupert Carter',
    image: 'assets/images/book_cover_3.png',
    publishedDate: randomDate,
  ),
  Book(
    title: 'My Book Cover',
    author: 'A lot of authors',
    image: 'assets/images/book_cover_1.png',
    publishedDate: randomDate,
  ),
];
List<Book> filterBooks(String query) =>
    books.where((e) => e.title.contains(query)).toList();
