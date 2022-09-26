import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> generateOTP(final WidgetRef ref, final String number) async {
    String? verificationId;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91 $number',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        verificationId = verificationId;
        log("OTP Code sent successfully");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return verificationId;
  }

  Future<bool> verifyOTPAndSignIn(final WidgetRef ref,
      final String verificationId, final String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      log("OTP Verification failed");
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> getAuthToken(final WidgetRef ref) async {
    return await _auth.currentUser!.getIdToken(true);
  }
}