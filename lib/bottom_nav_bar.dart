import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<BottomNavigationBarItem> items;

  const BottomNavBar({
    Key? key,
    this.selectedIndex = 0,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final additionalBottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final bottomNavigationBarTheme = Theme.of(context).bottomNavigationBarTheme;
    return Material(
      child: Container(
        constraints: BoxConstraints(
          minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
        ),
        color: bottomNavigationBarTheme.backgroundColor,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .asMap()
              .map(
                (i, item) => MapEntry(
                  i,
                  (i == selectedIndex)
                      ? Container(
                          width: 96,
                          height: 40,
                          decoration: BoxDecoration(
                            color: bottomNavigationBarTheme.selectedItemColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                item.icon,
                                Text(
                                  item.label!,
                                  style: bottomNavigationBarTheme
                                      .selectedLabelStyle,
                                )
                              ],
                            ),
                          ),
                        )
                      : item.icon,
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
