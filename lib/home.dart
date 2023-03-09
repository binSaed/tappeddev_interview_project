import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tappeddev_interview_project/book.dart';
import 'package:tappeddev_interview_project/bottom_nav_bar.dart';
import 'package:tappeddev_interview_project/search_app_bar.dart';
import 'package:tappeddev_interview_project/search_expandable_body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SearchAppBar(
            searchResult:
                (BuildContext context, String query, void Function() clear) {
              return SearchExpandableBody(query: query, clear: clear);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomScrollView(
                slivers: [
                  continueSection(context),
                  ...newSection(context),
                ],
              ),
            ),
          ),
        ),
        BottomNavBar(
          selectedIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home_tab_icon.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/menu_tab_icon.svg'),
              label: 'Stack',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/exploer_tab_icon.svg'),
              label: 'Compass',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/union_tab_icon.svg'),
              label: 'Union',
            ),
          ],
        ),
      ],
    );
  }
}

Widget continueSection(BuildContext context) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    sliver: SliverToBoxAdapter(
      child: Column(
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
                return InkWell(
                  onTap: () {},
                  child: Padding(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> newSection(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  final booksLength = books.length;
  return [
    SliverToBoxAdapter(
      child: Text(
        'New',
        style: theme.textTheme.titleSmall?.copyWith(
          color: const Color(0xff5B5EA6),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: booksLength,
        (BuildContext context, int index) {
          final book = books[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (index < booksLength - 1)
                      ? theme.dividerColor
                      : Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
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
                            SvgPicture.asset(
                              'assets/icons/calendar_icon.svg',
                              color: isDark ? Colors.white : null,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              book.publishedDate.toDate(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        isDark ? null : const Color(0xff263D36),
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
              ),
            ),
          );
        },
      ),
    ),
  ];
}
