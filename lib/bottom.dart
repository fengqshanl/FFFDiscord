import 'package:chat/pages/friend.dart';
import 'package:chat/pages/notice.dart';
import 'package:chat/pages/search.dart';
import 'package:chat/pages/set.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class BottomMenuSheet extends StatefulWidget {
  final GlobalKey bottomMenuKey;
  final int active;
  const BottomMenuSheet({
    Key? key,
    required this.bottomMenuKey,
    this.active = 0
  }) : super(key: key);

  @override
  State<BottomMenuSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomMenuSheet> {
  Map<IconData, Widget> menuList = {
    Icons.pivot_table_chart_sharp: const MyHomePage(),
    Icons.perm_identity_outlined: const Friend(),
    Icons.search: const Notice(),
    Icons.healing: const Notice(),
    Icons.face_unlock_rounded: const Setting(),
  };
  List<Widget> _menuRender (){
    int index = 0;
    List<Widget> menu = [];
    menuList.forEach((key, value) {
      menu.add(routeLink(
        routeName: value,
        linkIcon: key,
        active: widget.active == index,
        tag: key == Icons.search
      ));
      index += 1;
    });
    return menu;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.bottomMenuKey,
      width: MediaQuery.of(context).size.width ,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _menuRender()
      ),
    );
  }
}
