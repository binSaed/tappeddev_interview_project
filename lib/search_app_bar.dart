import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final Widget child;
  final Widget Function(
    BuildContext context,
    String query,
    void Function() clear,
  ) searchResult;

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

  void clear() {
    textController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            onTap: clear,
            onTapDown: (_) => clear(),
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
                          clear,
                        )
                      : child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
