import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  List<Widget> server = [const Icon(Icons.yard_rounded)];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width - 60,
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            height: MediaQuery.of(context).size.height,
            width: 50.sp,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child:const Icon(Icons.chat_bubble_outlined, color: Colors.white) ,
                ),
                const Divider(color: Colors.white),
                ...server.map((e){
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: e,
                  );
                }).toList(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child:const Icon(Icons.add, color: Colors.greenAccent),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child:const Icon(Icons.account_tree, color: Colors.greenAccent),
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(width: 2 , color: Colors.red)
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Row(
                  children: const [
                    Icon(Icons.tag, color: Colors.white, size: 10),
                    Text("Yew", style: TextStyle(color: Colors.white, fontSize: 16)),
                    Expanded(child:SizedBox()),
                    Icon(Icons.more_horiz),
                  ],
                ),
                Row(children: [
                  Container(
                    margin:  const EdgeInsets.all(12),
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.language_outlined),
                        Text("公开", style: TextStyle(color: Colors.white, fontSize: 12))
                      ],
                    ),
                  )
                ]),
                 Container(
                     margin:  const EdgeInsets.all(12),
                     padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                      height: 25.sp,
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                        ),
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.manage_accounts, color: Colors.white,),
                              Text("邀请", style: TextStyle(color: Colors.white, fontSize: 14),)
                            ],
                          ),
                        ),
                const SizedBox(height: 14,),
                Row(
                  children: const [
                    Icon(Icons.library_books_outlined, color: Colors.white,),
                    Text("rules", style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
                const SizedBox(height: 14,),

              ],
            ),
          )
          ),
        ],
      ),
    );
  }
}
