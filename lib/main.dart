import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/Routes.dart';
import 'utils/Global.dart';
import 'providers/CurrentIndexProvider.dart';
import 'providers/UserProvider.dart';

void main() {
  FluroRouter router = FluroRouter();
  Routers.configureRoutes(router);
  G.router = router;
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CurrentIndexProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider())
    ],
    child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: (BuildContext context, child) => MaterialApp(
        title: 'Flutter学习',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: Index(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: G.router.generator,
        initialRoute: '/',
      ),
    );
  }
}

