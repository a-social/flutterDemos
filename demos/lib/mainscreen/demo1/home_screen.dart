import 'dart:math';
import 'package:flutter/material.dart';

import 'demo1_SıgnInpage.dart';

class WelcomePagedemo extends StatefulWidget {
  const WelcomePagedemo({super.key});

  @override
  State<WelcomePagedemo> createState() => _WelcomePagedemoState();
}

class _WelcomePagedemoState extends State<WelcomePagedemo> {
  bool checkBoxValue = true;
  bool newValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackContainer(),
          const BackTopContainer(),
          BottomButtons(purpleColor: UnitColors().purpleColor),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.purpleColor,
  });

  final Color purpleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenterPage(
            purpleColor: purpleColor, data1: UnitStrings().rememberMeString),
        const Spacer(),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              ContainerButton(
                  onTapFunction: () {},
                  purpleColor: purpleColor,
                  data: UnitStrings().signInString),
              ContainerButton(
                  onTapFunction: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInPage()));
                  },
                  purpleColor: Colors.transparent,
                  color: purpleColor,
                  data: UnitStrings().signUpString),
            ],
          ),
        )
      ],
    );
  }
}

class ContainerButton extends StatelessWidget {
  const ContainerButton(
      {super.key,
      required this.purpleColor,
      this.color = Colors.white,
      required this.data,
      required this.onTapFunction});
  final Color color;
  final Color purpleColor;
  final String data;
  final void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
            color: purpleColor, borderRadius: BorderRadius.circular(100)),
        child: TextButton(
            onPressed: onTapFunction,
            child: Text2(
              data: data,
              color: color,
            )));
  }
}

class Text2 extends StatelessWidget {
  const Text2({super.key, required this.data, required this.color});
  final String data;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: color, fontSize: 18),
    );
  }
}

class CenterPage extends StatefulWidget {
  const CenterPage({
    super.key,
    required this.purpleColor,
    required this.data1,
    this.index = 1,
  });

  final Color purpleColor;
  final String data1;
  final int index;

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 330),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldForm(
                          data: UnitStrings().exampleMailString,
                          icon: UnitIcons().mailIcon,
                          title: UnitStrings().mailString),
                      TextFieldForm(
                        data: UnitStrings().examplePasswordString,
                        icon: UnitIcons().visibilityIcon,
                        title: UnitStrings().passwordString,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Row(
                          children: [
                            Radio(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  return widget.purpleColor;
                                }),
                                value: widget.index,
                                groupValue: groupValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    groupValue = widget.index;
                                  });
                                }),
                            Text1(
                              data: widget.data1,
                            )
                          ],
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: UnitColors().purpleColor,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    );
  }
}

class TextFieldForm extends StatelessWidget {
  const TextFieldForm(
      {super.key, required this.data, this.icon, required this.title});
  final String data;
  final Icon? icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
            width: 300,
            child: TextFormField(
              style: TextStyle(color: UnitColors().purpleColor),
              decoration: InputDecoration(
                label: Text2(data: title, color: UnitColors().purpleColor),
                suffixIcon: icon ?? const Icon(Icons.arrow_back),
                suffixIconColor: UnitColors().purpleColor,
                hintText: data,
                hintStyle: TextStyle(color: UnitColors().exampleColor),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: UnitColors().exampleColor, width: 1.0),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(40.0)), // Bu satırı ekledik
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
              ),
            )));
  }
}

class BackTopContainer extends StatelessWidget {
  const BackTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.only(right: 0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 93, 21, 106),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 70,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400))),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 126, 49, 139),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 70,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(500))),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.only(right: 0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 144, 39, 162),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 70,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(500),
                          bottomRight: Radius.circular(30))),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image.asset(
                    "assets/logo.png",
                    color: UnitColors().logoColor,
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  UnitStrings().welcomeString,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BackContainer extends StatelessWidget {
  const BackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple,
              width: 10),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.pink),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.orange),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.blue,
              bottomMargin: 20),
          CircleContainer(
              leftMargin: randomMargin(50.0),
              topMargin: randomMargin(10),
              color1: Colors.orange),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.blue),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.yellow),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple,
              width: 10),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.pink),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.orange),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.blue,
              bottomMargin: 20),
          CircleContainer(
              leftMargin: randomMargin(50.0),
              topMargin: randomMargin(10),
              color1: Colors.orange),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.blue),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.yellow),
          CircleContainer(
              leftMargin: randomMargin(500),
              topMargin: randomMargin(10),
              color1: Colors.purple,
              width: 10),
        ],
      ),
    );
  }

  double randomMargin(double maxValue) {
    final randomValue = Random().nextDouble() * maxValue;
    return randomValue;
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.width = 20,
    required this.topMargin,
    required this.leftMargin,
    required this.color1,
    this.color2 = Colors.orange,
    this.bottomMargin = 0,
  });
  final double width;
  final double topMargin;
  final double leftMargin;
  final double bottomMargin;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.only(
          top: topMargin, left: leftMargin, bottom: bottomMargin),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color1.withOpacity(0.5), color2.withOpacity(0.0)],
          stops: const [0.6, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 10.0, // Bulanıklık
            spreadRadius: 5.0, // Işık hüzmelerinin yayılma miktarı
          ),
        ],
      ),
    );
  }
}

class UnitColors {
  final Color purpleColor = const Color(0xff6c2cff);
  final Color exampleColor = Colors.grey;
  final Color? logoColor = const Color.fromARGB(255, 210, 182, 215);
}

class UnitStrings {
  final String signInString = "Log In!";
  final String rememberMeString = "Remember Me!";
  final String signUpString = "Sign Up!";
  final String mailString = "Mail";
  final String passwordString = "Password";
  final String exampleMailString = "example@example.com";
  final String examplePasswordString = "123456";
  final String welcomeString = "welcome";
  final String nameString = "First Name";
  final String lastNameString = "Last Name";
}

class UnitIcons {
  final Icon mailIcon = const Icon(Icons.mail);
  final Icon visibilityIcon = const Icon(Icons.visibility);
}
