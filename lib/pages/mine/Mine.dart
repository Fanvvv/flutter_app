import 'package:flutter/material.dart';
import '../../utils/Global.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('跳转到登录页'),
        onPressed: () {
          G.router.navigateTo(context, '/login');
        },
      )
    );
  }
}
