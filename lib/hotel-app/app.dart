import 'package:flutter/material.dart';
import 'package:hotel/features/auth/presentation/screens/explore_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ExpolreScreen.routeName,
      // initialRoute: SplashScreen.routeName,
      routes: {
        // ExploreScreen.routeName: (context) => ExploreScreen(),

     },
      title: 'Flutter Demo',
    );
  }
}
