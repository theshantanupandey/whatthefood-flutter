import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> signInWithGoogle() async {
  try {
    // Step 1: User signs in with Google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    // Step 2: Retrieve the Google Sign-In authentication tokens
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Step 3: Create a new credential for Firebase using the Google tokens
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Step 4: Sign in to Firebase with the Google credential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  } catch (e) {
    print("Error signing in with Google: $e");
    return null;
  }
}

Future<void> signInWithOtp(String phoneNumber, BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Start the phone number verification process
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Automatically sign in the user with the credential
      await auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/home');
    },
    verificationFailed: (FirebaseAuthException e) {
      print("Verification failed: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed. Please try again.')),
      );
    },
    codeSent: (String verificationId, int? resendToken) {
      // Save the verification ID for the next screen
      Navigator.pushReplacementNamed(context, '/otpScreen',
          arguments: verificationId);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Auto-resolution timed out
      print('Timeout: $verificationId');
    },
  );
}

Future<void> signOut(context) async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
}
