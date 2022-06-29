import 'package:flutter/material.dart';
import 'package:reel_downloader/constants/color-constants.dart';
import 'package:reel_downloader/constants/constants.dart';
import 'package:reel_downloader/views/download.dart';

import 'library.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLabel,style: const TextStyle(color: whiteTextColor),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradient1,
                gradient2
              ],
            ),
          ),
        ),
        bottom: TabBar(

          controller: _tabController,
          indicatorColor: whiteColor,
          tabs: const [
            Tab(child: Text("Download")),
            Tab(child: Text("Library")),
            Tab(child: Text("Settings")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DownloadReel(),
          Library(),
          Settings(),
        ],
      )
    );
  }
}
