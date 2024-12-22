import 'package:flutter/material.dart';
import 'package:hotel/features/auth/presentation/screens/explore_screen.dart';
import 'package:hotel/features/auth/presentation/screens/explore_tabs.dart';
import 'package:hotel/features/tabs/explore.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ExploreScreen(),
    );
  }
}

