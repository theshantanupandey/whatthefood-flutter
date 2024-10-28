import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNo;
  const OtpScreen({super.key, required this.phoneNo});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  String? verificationId;
  TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    verificationId = ModalRoute.of(context)?.settings.arguments as String?;
  }

  Future<void> verifyOtp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String otp =
        otpControllers.map((controller) => controller.text).join();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      await auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print("OTP verification failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP verification failed. Please try again.')),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.text = widget.phoneNo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, const Color.fromARGB(255, 245, 150, 6)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                // Sign In Box
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFFFE3D5),
                      Color(0xFFFFF5F0),
                    ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                          ),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: otpControllers[index],
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                              onChanged: (value) {
                                // Move to next field if a number is entered
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNodes[index + 1]);
                                }
                                // Move to previous field if cleared
                                else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNodes[index - 1]);
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text('Resend OTP'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            'Sign-In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            verifyOtp();
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
    );
  }
}
