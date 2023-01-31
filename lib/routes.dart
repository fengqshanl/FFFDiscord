import 'package:chat/pages/friend.dart';
import 'package:chat/pages/notice.dart';
import 'package:chat/pages/search.dart';
import 'package:chat/pages/set.dart';
import 'package:flutter/material.dart';

import 'main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "home"  : (context) => const Gesture(),
  "friend": (context) => const Friend(),
  "notice": (context) => const Notice(),
  "set"   : (context) => const Setting()
};