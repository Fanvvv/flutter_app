import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/unknown/unknownPage.dart';
import '../pages/Index.dart';
import '../pages/study/Study.dart';
import '../pages/mine/Mine.dart';
import '../pages/user/Login.dart';

/// 空页面
var unknownHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return unKnownPage();
  }
);

/// 首页
var indexHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Index();
  }
);

// 学习中心
var studyHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Study();
  }
);

/// 个人中心
var mineHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Mine();
  }
);

/// 登录页
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return Login();
    }
);
