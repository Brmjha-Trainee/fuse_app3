import 'package:flutter/material.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/views/sign_up.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class SignOption extends StatelessWidget {
  const SignOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: DARKER_GREY,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                //double infinity make it big as parents allows
                //while mediQuery make it big as per the screen
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/logo.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        darkBtn(
                          context: context,
                          label: 'Sign Up with Email ID',
                          pageName: SignupPage(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        lightBtn(
                          label: 'Sign up with google',
                          context: context,
                          pageName: LoginScreen(),
                        ),
                      ],
                    ),
                    richText(
                      context: context,
                      label_1: 'Already have an account',
                      label_2: ' Login',
                      pageName: LoginScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
