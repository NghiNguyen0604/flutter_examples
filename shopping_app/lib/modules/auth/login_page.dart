import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/modules/auth/login_auth.dart';

import '../../config/app_colors.dart';
import '../../config/app_const.dart';
import '../../models/account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isHiddenPassword = true;
  Icon visibility = const Icon(Icons.visibility);
  void _tongglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  Widget _setIcon() {
    if (_isHiddenPassword == true) {
      setState(() {
        visibility = const Icon(Icons.visibility);
      });
    } else {
      setState(() {
        visibility = const Icon(Icons.visibility_off);
      });
    }
    return visibility;
  }

  TextEditingController email = TextEditingController();
  TextEditingController wwid = TextEditingController();

  // @override
  // void dispose() {
  //   email.dispose();
  //   wwid.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Image.asset(AppConst.logoImage))),
                const Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text('Rnited Shop',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                  child: SizedBox(
                    width: 5,
                    child: TextFormField(
                      controller: email,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 18),
                        hintText: 'tài khoản',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                      ),

                      validator: (val) => !val!.contains("@")
                          ? "Vui lòng nhập đúng định dạng email"
                          : null,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,

                      //controller: data,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: SizedBox(
                    width: 5,
                    child: TextFormField(
                      controller: wwid,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            color: Colors.black38, fontSize: 16),
                        suffixIcon: InkWell(
                          onTap: _tongglePasswordView,
                          child: _setIcon(),
                        ),
                        hintText: 'password',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? "Vui lòng nhập mật khẩu" : null,
                      keyboardType: TextInputType.text,
                      obscureText: _isHiddenPassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, left: 110, right: 110),
                  child: Consumer(builder: (context, ref, _) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.blueGreyy,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fixedSize: const Size(20, 60)),

                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await ref.read(authProvider).logIn(
                                Account(
                                    email: email.text.trim(),
                                    wwid: wwid.text.trim()),
                                context,
                              );
                        }
                      },
                      //onPressed: logIn,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Icon(Icons.login),
                            Text('Đăng nhập',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ]),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text.trim(), password: wwid.text.trim());
      } catch (e) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(const SnackBar(
              content: Text('Email hoặc mật khẩu không chính xác')));
      }
    }
  }
}
