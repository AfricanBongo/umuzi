import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umuzi/bloc/search/place_search_cubit.dart';
import 'package:umuzi/data/repository/search_repository.dart';
import 'package:umuzi/ui/components/search_bar.dart';
import 'package:umuzi/ui/components/text.dart';
import 'package:umuzi/ui/discover/discover_screen.dart';
import 'package:umuzi/ui/search/search_result_list.dart';

class SearchScreen extends StatelessWidget {
  /// The search query that is inserted into the search bar initially,
  /// this is passes from the search bar in the [DiscoverScreen].
  final String initialSearchQuery;
  const SearchScreen(this.initialSearchQuery, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PlaceSearchCubit(SearchRepository())
          ..fetchPlaces(initialSearchQuery),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: CustomScrollView(
            slivers: <Widget>[
              BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
                builder: (context, state) {
                  return searchAppBar(context);
                },
              ),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                    child: HeadlineText(
                      'Results',
                      headlineStyleNumber: 4,
                      textColor: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                  sliver: SearchResultList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            child: SearchBar(
                padding: EdgeInsets.zero,
                height: 64,
                primaryColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                text: initialSearchQuery,
                searchPlaceholder: "I am looking for...",
                onSearchIconPressed: (query) {
                  context.read<PlaceSearchCubit>().fetchPlaces(query);
                  if (kDebugMode) print("Search for $query");
                }),
          )),
      expandedHeight: 112,
      collapsedHeight: 72,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return const FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 32, left: 16),
                child: HeadlineText('Search', headlineStyleNumber: 1),
              ),
            ),
          );
        },
      ),
    );
  }
}
