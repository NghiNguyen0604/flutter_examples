import 'package:flutter/material.dart';
import 'package:shopping_app/config/app_colors.dart';
import 'package:shopping_app/modules/auth/login_page.dart';

import '../../config/app_const.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    top: 50,
                  ),
                  child: Text('Welcome to Rnited Shop',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 50, left: 50),
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blueGreyy,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text('get started'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
