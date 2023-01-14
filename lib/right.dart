
import 'package:flutter/material.dart';

class RightDrawer extends StatefulWidget {
  const RightDrawer({Key? key}) : super(key: key);

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).padding.top + 20 ,),
            Row(
              children: const [
                SizedBox(width: 20,),
                Icon(Icons.chat, color: Colors.white, size: 20,),
                SizedBox(width: 8,),
                Text("help", style: TextStyle(color: Colors.white, fontSize: 20),)
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.search, color: Colors.white, size: 24,),
                      Text("搜索", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.notifications, color: Colors.white, size: 24,),
                      Text("通知", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.settings_rounded, color: Colors.white, size: 24,),
                      Text("设置", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(18, 12, 18, 12),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: const Icon(Icons.person_add_alt_1, color: Colors.white,size: 20,),),
                const Text("邀请成员", style: TextStyle(color: Colors.white, fontSize: 16),)
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}
