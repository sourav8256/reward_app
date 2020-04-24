import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reward_game/screens/mobile_verification/otpinput.dart';

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {

  TextEditingController _phonenumberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phonenumberController = TextEditingController();

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
                child: Text('Please enter the phone number linked to your paytm account',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
              ),
              Container(
                width: 200.0,
                child: TextFormField(
                  controller: _phonenumberController,
                  decoration: InputDecoration(labelText: 'Enter Phone Number',prefixText: "+91"),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Otpinput(phoneNumber: "+91"+_phonenumberController.text.toString())
                  ));
                },
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: const Text('Get Otp',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
