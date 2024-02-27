import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:reddit/features/auth/controller/auth_controller.dart";
import 'package:phlox_animations/phlox_animations.dart';
import "package:reddit/features/home/delegates/search_community_delegate.dart";
import "package:reddit/theme/pallete.dart";

import "../../../core/constants/constants.dart";
import "../drawers/community_list_drawer.dart";
import "../drawers/profile_drawer.dart";

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    final currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
        body: Container(
            child: PhloxAnimations(
                duration: const Duration(seconds: 2),
                fromOpacity: 0,
                fromX: 100,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Home"),
                    centerTitle: false,
                    leading: Builder(builder: (context) {
                      return IconButton(
                          onPressed: () => displayDrawer(context),
                          icon: const Icon(
                            Icons.menu,
                          ));
                    }),
                    actions: [
                      IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => showSearch(
                              context: context,
                              delegate: SearchCommunityDelegate(ref))),
                      PhloxAnimations(
                          duration: const Duration(seconds: 2),
                          fromX: -100,
                          //fromY: 100,

                          child: Builder(builder: (context) {
                            return IconButton(
                              icon: CircleAvatar(
                                backgroundImage: NetworkImage(user.profilePic),
                              ),
                              onPressed: () => displayEndDrawer(context),
                            );
                          })),
                    ],
                  ),
                  body: Constants.tabWidgets[_page],
                  drawer: const CommunityListDrawer(),
                  endDrawer: const ProfileDrawer(),
                  bottomNavigationBar: CupertinoTabBar(
                    activeColor: currentTheme.iconTheme.color,
                    backgroundColor: currentTheme.backgroundColor,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.assistant,
                        ),
                        label: '',
                      ),
                    ],
                    onTap: onPageChanged,
                    currentIndex: _page,
                  ),
                ))));
  }
}
