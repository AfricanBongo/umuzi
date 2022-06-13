import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:umuzi/ui/components/search_bar.dart';
import 'package:umuzi/ui/nav/nav.gr.dart';

import 'greeting_card.dart';

class UmuziAppBar extends StatelessWidget {
  final String? searchPlaceholder;
  const UmuziAppBar({Key? key, this.searchPlaceholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: SearchBar(
            onSearchIconPressed: (query) {
              // Open the search screen
              final router = context.router;
              router.push(SearchScreen(initialSearchQuery: query));
            },
            searchPlaceholder: searchPlaceholder,
          )),
      expandedHeight: 180,
      collapsedHeight: 72,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return const FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: GreetingCard(),
          );
        },
      ),
    );
  }
}
