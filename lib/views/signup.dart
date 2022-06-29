import 'package:flutter/material.dart';
import 'package:reel_downloader/constants/color-constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var maxHeight;
  var maxWidth;
  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _designPattern(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: _textFields(),
            ),
            _socialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _designPattern() {
    return Container(
      height: maxHeight * .5,
      width: maxWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/pattern.png"))),
      child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Welcome",
            style: TextStyle(color: whiteTextColor, fontSize: 25),
          )),
    );
  }

  Widget _textFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: gradient1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:  BorderSide(color: gradient1),
            ),
            hintText: "Phone",
            suffix: GestureDetector(
                onTap: (){

                },
                child: const Text("Send Otp",style:  TextStyle(color: gradient1),)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: gradient1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gradient1),
            ),
            hintText: "Otp",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: maxWidth,
          height: maxHeight * .05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  gradient1,
                  gradient2,
                ],
              )),
          child: const Center(
              child: Text(
            "Signup",
            style: TextStyle(color: whiteTextColor),
          )),
        )
      ],
    );
  }

  Widget _socialLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: gradient1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                  height: maxHeight * .03,
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: gradient1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png",
                  height: maxHeight * .03,
                ),
              )),
        ],
      ),
    );
  }


  /*
  *
  * Method
  *
  * Method
  *
  * Method
  *
  * */


  void sendOtp(){

  }
}
