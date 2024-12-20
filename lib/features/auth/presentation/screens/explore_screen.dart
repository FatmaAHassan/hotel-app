import 'package:flutter/material.dart';
import 'package:hotel/features/tabs/explore.dart';
import 'package:hotel/features/tabs/favorite.dart';
import 'package:hotel/features/tabs/messages.dart';
import 'package:hotel/features/tabs/profile.dart';
import 'package:hotel/features/tabs/trips.dart';

class ExpolreScreen extends StatefulWidget {
  static const String routeName = "explore";

  const ExpolreScreen({super.key});

  @override
  State<ExpolreScreen> createState() => _ExpolreScreenState();
}

class _ExpolreScreenState extends State<ExpolreScreen> {
  int index = 0;
  List<Widget> tabs = [

    ExploreTab(),
    TripsTab(),
    MessagesTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
