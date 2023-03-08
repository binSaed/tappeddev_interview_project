import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tappeddev_interview_project/book.dart';
import 'package:intl/intl.dart';

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

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        dividerColor: const Color(0xffE1EBE8),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          suffixIconColor: Color(0xff9AABA6),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        dividerColor: const Color(0xffE1EBE8),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          suffixIconColor: Color(0xff9AABA6),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.black,
        ),
      ),
      home: const Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(child: FloatingSearchAppBarExample()),
          buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.radar),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hail),
          label: 'Commute',
        ),
      ],
    );
  }
}

class FloatingSearchAppBarExample extends StatelessWidget {
  const FloatingSearchAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAppBar(
      searchResult: (BuildContext context, String query, Function clear) {
        return buildExpandableBody(query, clear);
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            continueSection(context),
            newSection(context),
          ],
        ),
      ),
    );
  }
}

Widget continueSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xff5B5EA6),
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 168.0,
          child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final book = books[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          height: 102,
                          width: 102,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(book.image),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    ),
  );
}

Widget newSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xff5B5EA6),
                fontWeight: FontWeight.bold,
              ),
        ),
        ListView.separated(
          itemCount: books.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final book = books[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(book.image, height: 100),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        book.author,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/calendar_icon.svg'),
                          const SizedBox(width: 8),
                          Text(
                            book.publishedDate.toDate(),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: const Color(0xff263D36),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffD9E5E2),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/notification_tab_icon.svg',
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(thickness: 1),
        ),
      ],
    ),
  );
}

Widget buildExpandableBody(String query, Function clear) {
  return Builder(
    builder: (context) {
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
                    InkWell(
                      onTap: () => clear(),
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
                    if (i < books.length - 1) const Divider(thickness: 1),
                  ],
                ),
              ),
            )
            .values
            .toList(),
      );
    },
  );
}

class SearchAppBar extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, String query, Function clear)
      searchResult;

  const SearchAppBar({
    Key? key,
    required this.child,
    required this.searchResult,
  }) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final queryNotifier = ValueNotifier<String>('');

  final textController = TextEditingController();

  void onSearchChanged() => queryNotifier.value = textController.text;

  bool get showSearchResult => queryNotifier.value.isNotEmpty;

  @override
  void initState() {
    textController.addListener(onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    textController.removeListener(onSearchChanged);
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Search for something',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          body: Stack(
            children: [
              GestureDetector(
                onTap: textController.clear,
                onTapDown: (_) => textController.clear(),
                child: widget.child,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2C885C).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ValueListenableBuilder<String>(
                  valueListenable: queryNotifier,
                  child: const SizedBox(width: double.infinity),
                  builder: (context, query, child) {
                    return AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                      child: showSearchResult
                          ? widget.searchResult(
                              context,
                              query,
                              textController.clear,
                            )
                          : child,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
