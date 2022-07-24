import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCourse extends StatefulWidget {
  List courseList = [];
  HomeCourse({Key? key, required this.courseList}) : super(key: key);

  @override
  State<HomeCourse> createState() => _HomeCourseState();
}

class _HomeCourseState extends State<HomeCourse> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            var course = widget.courseList[index];
            return GestureDetector(
              onTap: () {
                print('点击$index');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          course['courseListImg'],
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Text(
                                course['courseName'],
                                style: const TextStyle(
                                  fontSize: 16
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                course['brief'],
                                style: const TextStyle(
                                  fontSize: 14
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Colors.grey[200],
                                  width: 200.w,
                                  padding: const EdgeInsets.all(5),
                                  child: Text(course['teacherDTO']['teacherName']),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  color: Colors.grey[200],
                                  width: 200.w,
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    course['teacherDTO']['description'],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    '￥'+course['discounts'].toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  child: Text(
                                    course['sales'].toString()+"人购买",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            );
          },
          childCount: widget.courseList.length
        )
    );
  }
}
