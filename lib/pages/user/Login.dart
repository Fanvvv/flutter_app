import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/UserProvider.dart';
import '../../utils/Global.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _phone;
  late String _password;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '手机号'
                    ),
                    validator: (value) {
                      RegExp reg = RegExp(r'^\d{11}$');
                      if (!reg.hasMatch(value!)) {
                        return '手机号不合法';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phone = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: '密码'
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return value.length < 6 ? '密码长度不够' : null;
                      }
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if ((_formKey.currentState as FormState).validate()) {
                        _formKey.currentState?.save();

                        var res = await G.api.user.login(phone: _phone, password: _password);
                        if (res != false) {
                          userProvider.doLogin(res); // 修改用户登录状态
                          G.router.pop(context);
                        } else {
                          _formKey.currentState?.reset();
                        }
                      }
                    },
                    child: const Text('登录'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    child: const Text('重置'),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
