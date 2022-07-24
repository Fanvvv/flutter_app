import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'RoutesHandler.dart';

class Routers {
  static void configureRoutes(FluroRouter router) {
    router.define('/', handler: indexHandler);
    router.define('/study', handler: studyHandler);
    router.define('/mine', handler: mineHandler);
    router.define('/login', handler: loginHandler);
    router.notFoundHandler = unknownHandler; // 404 页面
  }
}