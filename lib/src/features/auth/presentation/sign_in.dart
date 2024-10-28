import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wtfeua/src/features/auth/function/auth_function.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, const Color.fromARGB(255, 245, 150, 6)],
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/wtflogo.png',
                      height: 200,
                      width: 200,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Revolutionizing the way You',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Interact with Food',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'WhatTheFood',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    // Sign-In Box
                    Container(
                      padding: EdgeInsets.all(20),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFE3D5), Color(0xFFFFF5F0)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text(
                                'Continue',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                final phoneNumber =
                                    _phoneController.text.trim();
                                if (phoneNumber.isNotEmpty) {
                                  signInWithOtp('+91' + phoneNumber, context);
                                  Navigator.pushNamed(
                                    context,
                                    '/otpScreen',
                                    arguments: phoneNumber,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Please enter a valid phone number.')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                child: Divider(),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('or'),
                              ),
                              SizedBox(
                                width: 60,
                                child: Divider(),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/logoGoogle.png',
                                    height: 20,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Sign-in with Google',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                User? user = await signInWithGoogle();
                                if (user != null) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                  print(
                                      'Sign-In successful! Welcome, ${user.displayName}');
                                } else {
                                  print('Sign-In failed.');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/logoApple.png',
                                    height: 20,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Sign-in with Apple',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
