import 'package:flutter/material.dart';
import 'package:tappeddev_interview_project/book.dart';

class SearchExpandableBody extends StatelessWidget {
  final String query;
  final void Function() clear;
  const SearchExpandableBody({
    Key? key,
    required this.query,
    required this.clear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final books = filterBooks(query);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: books
          .asMap()
          .map(
            (i, item) => MapEntry(
              i,
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: clear,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Image.asset(item.image, width: 54),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.author,
                                    style: textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (i < books.length - 1) const Divider(thickness: 1),
                ],
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
