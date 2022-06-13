import 'package:auto_route/annotations.dart';
import 'package:umuzi/ui/discover/discover_screen.dart';
import 'package:umuzi/ui/search/search_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: DiscoverScreen, initial: true),
  AutoRoute(page: SearchScreen)
])
class $UmuziAppRouter {}
