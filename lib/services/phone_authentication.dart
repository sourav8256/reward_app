/*
*
*
*
*
*
*
*
* /*
// Inside State class.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController _smsCodeController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
String verificationId;

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Sends the code to the specified phone number.
Future<void> _sendCodeToPhoneNumber() async {
  final PhoneVerificationCompleted verificationCompleted = (FirebaseUser user) {
    setState(() {
      print('Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $user');
    });
  } as ;

  final PhoneVerificationFailed verificationFailed = (AuthException authException) {
    setState(() {
      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');}
    );
  };

  final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    this.verificationId = verificationId;
    print("code sent to " + _phoneNumberController.text);
  };

  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    this.verificationId = verificationId;
    print("time out");
  };

  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneNumberController.text,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
}




/// Sign in using an sms code as input.
void _signInWithPhoneNumber(String smsCode) async {

  final AuthCredential credential = PhoneAuthProvider.getCredential(
    verificationId: verificationId,
    smsCode: smsCode,
  );
  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print('signed in with phone number successful: user -> $user');

*/
/*
  await FirebaseAuth.instance
      .signInWithPhoneNumber(
      verificationId: verificationId,
      smsCode: smsCode)
      .then((FirebaseUser user) async {
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print('signed in with phone number successful: user -> $user');
  });
*//*


}*/




*/