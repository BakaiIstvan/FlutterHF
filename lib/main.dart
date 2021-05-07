import 'package:flutter/material.dart';
import 'package:nba_app/di/di_utils.dart';
import 'package:nba_app/ui/teams/team_list.dart';
import 'package:nba_app/ui/details/team_details.dart';

void main() {
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NbaApp());
}

const DETAIL_PAGE = "/details";

class NbaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Flutter NBA App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: TeamListPage(),
            onGenerateRoute: (settings) {
              final name = settings.name ?? "";
              if (name.startsWith(DETAIL_PAGE)) {
                return MaterialPageRoute(
                  builder: (context) {
                    return TeamDetails(settings.arguments as int);
                  },
                );
              }
              return null;
            },
          );
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
