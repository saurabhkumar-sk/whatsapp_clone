import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/menu_popup.dart';
import 'package:whatsapp_clone/tabbar/calls_tab.dart';
import 'package:whatsapp_clone/tabbar/chat_tab.dart';
import 'package:whatsapp_clone/tabbar/community_tab.dart';
import 'package:whatsapp_clone/tabbar/status_tab.dart';

class WhatsAppLandingScreen extends StatefulWidget {
  static const double listItemHeight = 50;
  static const int listItemCount = 15;

  const WhatsAppLandingScreen({super.key});

  @override
  State<WhatsAppLandingScreen> createState() => _WhatsAppLandingScreenState();
}

class _WhatsAppLandingScreenState extends State<WhatsAppLandingScreen> {
  late int floatingAppBarIndex;
  late ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // backgroundColor: Colors.red,
            title: Title(
              color: Colors.white,
              child: const Text(
                'WhatsApp',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            actions: const [
              Icon(
                Icons.camera_alt_outlined,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.search),
              ),
              PopUpMenu(),
            ],
          ),
          const SliverAppBar(
            expandedHeight: 30,
            collapsedHeight: kToolbarHeight,
            toolbarHeight: 0,
            primary: false,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromARGB(255, 214, 214, 214),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                tabs: [
                  Icon(
                    Icons.groups,
                  ),
                  Tab(
                    text: "Chats",
                  ),
                  Tab(
                    text: "Status",
                  ),
                  Tab(
                    text: "Calls",
                  ),
                ],
              ),
            ),
          ),
          const SliverFillRemaining(
            child: TabBarView(
              children: [
                CommunityTabBar(),
                ChatTabBarScreen(),
                StatusTabBar(),
                CallsTabBar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
