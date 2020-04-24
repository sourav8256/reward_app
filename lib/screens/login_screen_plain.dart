import 'package:flutter/material.dart';
import 'package:reward_game/screens/navigation.dart';
import 'package:reward_game/services/authentication.dart';

class LoginScreenPlain extends StatefulWidget {

  BaseAuth _baseAuth = new Auth();

  @override
  _LoginScreenPlainState createState() => _LoginScreenPlainState();
}

class _LoginScreenPlainState extends State<LoginScreenPlain> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._baseAuth.signInWithGoogle((){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>Navigation()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildSocialBtn(
              () => {
            print('Login with Google'),
            widget._baseAuth.signInWithGoogle((){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>Navigation()
              ));
            })
          },
          AssetImage(
            'assets/logos/google.jpg',
          ),
        ),
      ),
    );
  }


  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

}

