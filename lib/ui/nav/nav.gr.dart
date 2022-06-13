// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../discover/discover_screen.dart' as _i1;
import '../search/search_screen.dart' as _i2;

class UmuziAppRouter extends _i3.RootStackRouter {
  UmuziAppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DiscoverScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DiscoverScreen());
    },
    SearchScreen.name: (routeData) {
      final args = routeData.argsAs<SearchScreenArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SearchScreen(args.initialSearchQuery, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DiscoverScreen.name, path: '/'),
        _i3.RouteConfig(SearchScreen.name, path: '/search-screen')
      ];
}

/// generated route for
/// [_i1.DiscoverScreen]
class DiscoverScreen extends _i3.PageRouteInfo<void> {
  const DiscoverScreen() : super(DiscoverScreen.name, path: '/');

  static const String name = 'DiscoverScreen';
}

/// generated route for
/// [_i2.SearchScreen]
class SearchScreen extends _i3.PageRouteInfo<SearchScreenArgs> {
  SearchScreen({required String initialSearchQuery, _i4.Key? key})
      : super(SearchScreen.name,
            path: '/search-screen',
            args: SearchScreenArgs(
                initialSearchQuery: initialSearchQuery, key: key));

  static const String name = 'SearchScreen';
}

class SearchScreenArgs {
  const SearchScreenArgs({required this.initialSearchQuery, this.key});

  final String initialSearchQuery;

  final _i4.Key? key;

  @override
  String toString() {
    return 'SearchScreenArgs{initialSearchQuery: $initialSearchQuery, key: $key}';
  }
}
