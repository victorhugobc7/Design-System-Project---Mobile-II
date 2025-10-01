import 'package:flutter/material.dart';
import '../../Components/Tab/tab.dart';
import '../../Components/Tab/tab_view_model.dart';

import '../../Components/TabBar/tabbar.dart';
import '../../Components/TabBar/tabbar_view_model.dart';



class TabPage extends StatelessWidget {

  const TabPage({super.key});
  static const List<String> titles = [
    'Home',
    'Messages',
    'Label 1',
    'Label 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab page Demo"),
      ),
      body: TabComponent.instantiate(
        tabViewModel: TabViewModel(
            tabs: [
            const Tab(text: 'Home',),
            const Tab(text: 'Messages',),
            const Tab(text: 'Label 1',),
            const Tab(text: 'Label 2',),
            ],
            initialIndex: 0,
        ),
      )


      /*CustomTabBar.instantiate(
        TabBarViewModel(
          tabTitles: titles,
          ),
        (p4) { },
        )*/
    );
  }
}