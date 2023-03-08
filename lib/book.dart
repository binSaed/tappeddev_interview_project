import 'dart:math';

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
