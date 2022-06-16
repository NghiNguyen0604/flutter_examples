import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_shopping_app/auth/login_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        key: _formKey,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 30,
            ),
            child: SizedBox(
              width: 250,
              height: 150,
              child: Image(
                image: AssetImage('asset/manchester-united.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Rnited Coffee',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 8,
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 80, right: 80),
            child: Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await ref.read(authProvider).logIn(
                          Account(
                              email: email.text.trim(),
                              password: password.text.trim()),
                          context);
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: const Text('Đăng nhập'),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: const Size(20, 60)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Consumer(builder: ((context, ref, child) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'quên mật khẩu',
                    style: TextStyle(color: Colors.black),
                  ));
            })),
          )
        ],
      ),
    );
  }

  Future logIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());
      } catch (e) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(const SnackBar(
              content: Text('Email hoặc mật khẩu không chính xác')));
      }
    }
  }
}
