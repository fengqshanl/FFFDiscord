import 'dart:ui';

import 'package:chat/bottom.dart';
import 'package:chat/pages/search.dart';
import 'package:chat/right.dart';
import 'package:chat/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'left.dart';

  void main() async {
    await ScreenUtil.ensureScreenSize();
    runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          routes: routes,
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
              headline2: TextStyle(
                  fontSize: 32.0, fontWeight: FontWeight.w400, color: Colors.white),
              headline3: TextStyle(
                  fontSize: 28.0, fontWeight: FontWeight.w400, color: Colors.white),
              headline4: TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.white),
              headline6: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w200, color: Colors.white),
              bodyText1: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          home: child,
        );
      },
      child: const Gesture(),
    );
  }
}

enum DrawerType {
  left,
  right,
  middle
}

class Gesture extends StatefulWidget {
  const Gesture({Key? key}) : super(key: key);

  @override
  State<Gesture> createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  Offset offset = const Offset(0.0,0.0);
  Offset bottomMenu = const Offset(0.0, -80.0);
  DrawerType currentDrawer = DrawerType.middle;
  final GlobalKey _bottomMenuKey = GlobalKey();
  Widget bottomRender(){
    if(currentDrawer == DrawerType.left){
      return const Positioned(
          left: 0, right: 60,
          child: LeftDrawer()
      );
    }else if(currentDrawer == DrawerType.right){
      return const Positioned(
          left: 60,right: 0,
          child: RightDrawer()
      );
    }
    return const Text("");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (detail){
        setState(() {
          if((offset.dx + detail.delta.dx) > 0){
            currentDrawer = DrawerType.left;
          }else if((offset.dx + detail.delta.dx) < 0){
            currentDrawer = DrawerType.right;
          }
          if(detail.delta.dx > 0){
            if(bottomMenu.dy < 0){
              bottomMenu = Offset(0.0, bottomMenu.dy + detail.delta.dx);
            }else{
              bottomMenu = const Offset(0.0, 0);
            }
          }else if(detail.delta.dx < 0){
            if(bottomMenu.dy > -50){
              bottomMenu = Offset(0.0, bottomMenu.dy + detail.delta.dx);
            }else{
              bottomMenu = const Offset(0.0, -50);
            }
          }

          offset = Offset(offset.dx + detail.delta.dx, 0);
        });
      },
      onHorizontalDragEnd: (detail){
          var current = offset.dx;

          if(current >= (MediaQuery.of(context).size.width / 2)){
            setState((){
              offset = Offset(MediaQuery.of(context).size.width - 50, 0);
            });
          }else if(((MediaQuery.of(context).size.width / 2) + current) <= 0){
            setState((){
              offset = Offset(50 - MediaQuery.of(context).size.width, 0);
            });
          }else{
            setState(() {
              offset = const Offset(0, 0);
            });
          }
        },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
        fit: StackFit.expand,
        children: [
          bottomRender(),
          Positioned(
            left: offset.dx,
            child:const MyHomePage() ,
          ),
          Positioned(
              bottom: bottomMenu.dy,
              child: BottomMenuSheet(bottomMenuKey: _bottomMenuKey,)
          ),
        ],
      ),
      )
    );
  }
}



class routeLink extends StatefulWidget {
  final IconData linkIcon;
  final Widget routeName;
  final bool active;
  final bool tag;
  const routeLink({
    Key? key,
    required this.linkIcon,
    required this.routeName,
    this.tag = false,
    this.active = false
  }) : super(key: key);

  @override
  State<routeLink> createState() => _routeLinkState();
}

class _routeLinkState extends State<routeLink> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        child: Icon(
            widget.linkIcon,
            color: widget.active ? Colors.white : Colors.white38,
        ),
        onTap: (){
          if(!widget.tag){
            Navigator.push(context,
              PageRouteBuilder(pageBuilder: (_, __, ___) =>
                widget.routeName,
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          }else{
            search(context);
          }
          // Navigator.pushNamed(context, widget.routeName);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; // ???????????????????????????????????????
  @override
  void initState() {
    super.initState();
    // ???????????????????????????????????????
    _controller.addListener(() {
      print(_controller.offset); //??????????????????
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, String>> enquiry = [{
    "tag": 'yew',
    "user_name": 'johannes',
    "time_to_now": '17?????????',
    "title": 'Component library best pratices?',
    "content": 'I want to create a component library using yew and amd quite new to yew an asdasdssssssssssssssssssssssssssssssssasdasdadasdasd',
    "chat_number": '2',
    "img": '',
    "special": ''
  }];

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black12,
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.search)
                ),
                IconButton(
                  icon: const Icon(Icons.people_alt),
                  onPressed: () {

                  },
                ),
              ],
              title: Row(
                children: const [
                  Icon(Icons.menu),
                  SizedBox(width: 15,),
                  Icon(Icons.chat_bubble_outline, size: 16),
                  SizedBox(width: 4),
                  Text("help",style: TextStyle(fontSize: 14),)
                ],
              )
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.sp),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                height: 40.sp,
                decoration: const BoxDecoration(
                    color: Colors.black45
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.thumbs_up_down, color: Colors.white, size: 14,),
                          SizedBox(width: 6,),
                          Text("?????? & ??????", style: TextStyle(
                              color: Colors.white
                          )),
                          SizedBox(width: 2,),
                          Icon(Icons.arrow_drop_down, color: Colors.white, size: 14,)
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("??????", style: TextStyle(
                              color: Colors.white
                          )),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_drop_down, color: Colors.white, size: 14,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex:1,
                  child:ListView.builder(
                      itemCount: enquiry.length,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        var value = enquiry[0];
                        return Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:  Container(
                                    padding: EdgeInsets.all(8.sp),
                                    margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    decoration: const BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    color: Colors.black54
                                                ),
                                                child: Text(
                                                    value["tag"]!,
                                                    style: const TextStyle(color: Colors.white, fontSize: 12)
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(value['user_name']!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              const SizedBox(width: 8),
                                              Text(value["time_to_now"]!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                          Text(
                                              value["title"]!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              )
                                          ),
                                          Text(
                                            value["content"]!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(Icons.chat_outlined, color: Colors.white, size: 14),
                                              Text(value["chat_number"]!, style: const TextStyle(color: Colors.white)),
                                              const Expanded(flex: 1, child: Text("")),
                                              const Text("data", style: TextStyle(color: Colors.white))
                                            ],
                                          )
                                        ]
                                    ),
                                  )
                              ),
                            ]
                        );
                      }
                  )
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}