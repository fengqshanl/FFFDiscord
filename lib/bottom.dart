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
  Map<String, IconData> menuList = {
    "home":Icons.pivot_table_chart_sharp,
    "friend":Icons.perm_identity_outlined,
    "search":Icons.search,
    "notice":Icons.healing,
    "set":Icons.face_unlock_rounded,
  };
  List<Widget> _menuRender (){
    int index = 0;
    List<Widget> menu = [];
    menuList.forEach((key, value) {
      menu.add(routeLink(
        routeName: key,
        linkIcon: value ,
        active: widget.active == index,
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
