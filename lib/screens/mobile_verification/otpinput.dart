import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class Otpinput extends StatefulWidget {

  final String phoneNumber;

  Otpinput({Key key,@required this.phoneNumber}): super(key: key);

  @override
  _OtpinputState createState() => _OtpinputState();
}

class _OtpinputState extends State<Otpinput> {

  TextEditingController _otpController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sendCodeToPhoneNumber();
    _otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50.0),
                child: Text('Please enter the otp received via SMS',
                style: TextStyle(
                  fontSize: 20.0,
                ),),
              ),
              Container(
                width: 200.0,
                child: TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(labelText: 'Enter OTP'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  _signInWithPhoneNumber(_otpController.text.toString());
                },
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: const Text('Submit',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  TextEditingController _smsCodeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sends the code to the specified phone number.
  Future<void> _sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential user) {
      setState(() {
        print('Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $user');
      });
    };

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
        phoneNumber: widget.phoneNumber,
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
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Navigation()
    ));

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
*/

  }


}
