import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/Home.dart';
import 'study/Study.dart';
import 'mine/Mine.dart';
import '../providers/CurrentIndexProvider.dart';
import '../providers/UserProvider.dart';
import '../utils/Global.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: '学习'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
  ];

  final pages = [
    {
      "appBar": AppBar(
        title: Text('首页'),
        elevation: 0.0,
        centerTitle: true,
      ),
      "page": Home()
    },
    {
      "appBar": AppBar(
        title: Text('学习中心'),
        elevation: 0.0,
        centerTitle: true,
      ),
      "page": Study()
    },
    {
      "appBar": AppBar(
        title: Text('个人中心'),
        elevation: 0.0,
        centerTitle: true,
      ),
      "page": Mine()
    },
  ];

  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<CurrentIndexProvider>().currentIndex;
    UserProvider userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: pages[currentIndex]['appBar'],
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          if (index == 1 || index == 2) {
            if (userProvider.isLogin == false) {
              print('跳转到登录页面');
              G.router.navigateTo(context, '/login');
              return;
            } else {
              print('用户已登录，可以访问页面');
            }
          }
          context.read<CurrentIndexProvider>().changeIndex(index);
        },
      ),
      body: pages[currentIndex]['page'],
    );
  }
}
