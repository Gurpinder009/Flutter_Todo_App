import 'package:go_router/go_router.dart';
import "package:todo_list/components/utility_widgets/with_fade_transition.dart";
import 'package:todo_list/components/page_widgets/about_widget.dart';
import 'package:todo_list/components/page_widgets/home_widget.dart';

var router = GoRouter(routes: [
  GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return withFadeTransition(child: const HomeWidget());
      }),
  GoRoute(
      path: "/about",
      pageBuilder: (context, state) {
        return withFadeTransition(child: const AboutWidget());
      })
], debugLogDiagnostics: true);
