import "package:flutter/material.dart";
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen ({Key?key, required this.countryCode, required this.number}) : super(key: key);
  final String number;
  final String countryCode;
  // final String number;
  // final String countryCode;


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Verify +${widget.countryCode} ${widget.number}",
        style:TextStyle(
          color: Colors.teal[800],
          fontSize: 18,
        ),
        ),
        actions: [IconButton(onPressed: () {},
          icon: Icon(Icons.more_vert,
          color: Colors.black,),
        )],
      ),
      body : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:Column(
          children: [
            SizedBox(
              height: 12,
            ),
            RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
                    children: [
                TextSpan(
                  text: "We have sent an SMS with a code to ",
                  style: TextStyle(
                    color: Colors.teal[800],
                     fontSize: 14.5,
                  ),
                ),
                TextSpan(
                  text: "+" + widget.countryCode + " " + widget.number + "\n",
                  style: TextStyle(
                    color: Colors.black,
                     fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Wrong number?",
                  style: TextStyle(
                    color: Colors.cyan[800],
                    fontSize: 13.5,
                  )
                )
              ]
            ),
            ),
            SizedBox(
              height: 10,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: false,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter 5-digit code",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                )
            ),
            SizedBox(
              height: 30,
            ),
            bottomButton("Resend SMS", Icons.message),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 15,
            ),
            bottomButton("Call Me", Icons.call),
          ],
        )
      )
    );
  }

  Widget bottomButton(String text, IconData icon)
  {
  return Row(
    children: [
      Icon(icon,
        color: Colors.teal,
        size: 22,),
      SizedBox(
        width: 25,
      ),
      Text(text, style: TextStyle(
        color: Colors.teal,
        fontSize: 13.5,
      ))
    ],
  );
  }
}
