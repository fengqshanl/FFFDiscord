import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void search(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 700,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const CupertinoSearchTextField(
                  placeholder: '想要去哪里？',
                ),
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Icon(Icons.people_alt, color: Colors.white, size: 44,),
                      Text("data", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  const Divider(),
                  Column(
                    children: [
                      const Text("未读的频道"),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            const Icon(Icons.star),
                            Expanded(child:Column(
                              children: const [
                                Text("announcements"),
                                Text("GENERAL")
                              ],
                            ) ),
                            const Text("Yew")
                          ],
                        ) ,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }
  );
}