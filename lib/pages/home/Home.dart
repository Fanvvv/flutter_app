import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/Global.dart';
import 'HomeSwiper.dart';
import 'HomeCourse.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List adList = [];
  List courseList = [];

  @override
  void initState() {
    // 轮播图数据
    G.api.ad.adList().then((res) {
      setState(() {
        adList = res.where((ad) => ad['status'] == 1).toList();
      });
    });
    // 课程列表数据
    G.api.course.courseList().then((res) {
      setState(() {
        courseList = res;
      });
      print(courseList);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 400.h,
            child: HomeSwiper(adList: adList),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: HomeCourse(courseList: courseList),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

