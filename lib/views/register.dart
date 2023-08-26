import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/views/login.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/positioned_animated.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int activeIndex = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) {
          activeIndex = 0;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 350,
                child: Stack(children: [
                  AnimatedOne(activeIndex: activeIndex),
                  AnimatedTwo(activeIndex: activeIndex),
                  AnimatedThree(activeIndex: activeIndex),
                  AnimatedFour(activeIndex: activeIndex),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextFieldFullName(),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFieldEmail(),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFieldPassword(
                isSecured: true,
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                height: 45,
                color: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
