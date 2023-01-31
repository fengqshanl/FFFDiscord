import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bottom.dart';

class Friend extends StatefulWidget {
  const Friend({Key? key}) : super(key: key);

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  bool list = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomMenuSheet(bottomMenuKey: GlobalKey(), active: 1,) ,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12,
        title: const Text("好友", style: TextStyle(color: Colors.white),),
        actions: const [
          Icon(Icons.add_to_photos),
          SizedBox(width: 10,),
          Icon(Icons.person_add_alt_1),
          SizedBox(width: 10,),
          Icon(Icons.phonelink_ring_rounded),
        ],
      ) ,
      body: list ? const Text("friend list", style: TextStyle(color: Colors.white),) :
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.picture_as_pdf, color: Colors.white,),
                const SizedBox(height: 10),
                const Text("您的好友都还没来", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                const Text("发现已在 Discord 上的好友并开始对话。", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.phone_android),
                      Expanded(
                          child: Text("data", style: TextStyle(color: Colors.white))
                      ),
                      Icon(Icons.chevron_right_rounded)
                    ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}

