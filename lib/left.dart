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
    return Material(
      child:Container(
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
        // width: MediaQuery.of(context).size.width - 60,
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // border: Border.all(width: 2, color: Colors.blue)
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
                  SizedBox(height:MediaQuery.of(context).padding.top ,),
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
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // border: Border.all(width: 2 , color: Colors.red)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.sp,),
                      Row(
                        children: [
                          SizedBox(width: 8.sp,),
                          const Icon(Icons.tag, color: Colors.white, size: 10),
                          const Text("Yew", style: TextStyle(color: Colors.white, fontSize: 16)),
                          const Expanded(child:SizedBox()),
                          const Icon(Icons.more_horiz, color: Colors.white,),
                          SizedBox(width: 8.sp,)
                        ],
                      ),
                      Row(children: [
                        Container(
                          margin:  const EdgeInsets.all(6),
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.language_outlined),
                              Text("公开", style: TextStyle(color: Colors.white, fontSize: 12))
                            ],
                          ),
                        )
                      ]),
                      Container(
                        margin:  const EdgeInsets.all(6),
                        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                        height: 30.sp,
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
                      SizedBox(height: 6.sp,),
                      Row(
                        children: [
                          SizedBox(width: 8.sp,),
                          const Icon(Icons.library_books_outlined, color: Colors.white,),
                          SizedBox(width: 2.sp,),
                          const Text("rules", style: TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ),
                      SizedBox(height: 6.sp,),
                      const Expanded(
                        flex: 1,
                        child: ExpansionTile(
                          title: Text("GENERAL", style: TextStyle(color: Colors.white),),
                          children: [
                            invitationItem(
                              title: "announcements",
                              img: Icons.surround_sound_rounded,
                              tag: false,
                            )
                          ],
                        ) ,
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ) ,
    );
  }
}


class invitationItem extends StatelessWidget {
  final String title;
  final bool tag;
  final IconData img;
  final int number;
  const invitationItem({
    Key? key,
    required this.title,
    this.tag = false,
    required this.img,
    this.number = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          tag ? Container(
            height: 5,
            width: 20,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: const Text(""),
          ): const SizedBox(height: 5, width: 20,),
          Icon(img, color: Colors.white,),
          Text(title, style: const TextStyle(color: Colors.white),),
          const Expanded(child: Text("")),
          number == 0 ? const Text("") : Text(number.toString())
        ],
    );
  }
}