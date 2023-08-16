import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackContainer(),
          const _BackTopContainer(),
          _BottomButtons(purpleColor: UnitColors().purpleColor)
        ],
      ),
    );
  }
}

class CenterPageDemo2 extends StatefulWidget {
  const CenterPageDemo2({
    super.key,
    required this.purpleColor,
    required this.data1,
    this.index = 1,
  });

  final Color purpleColor;
  final String data1;
  final int index;

  @override
  State<CenterPageDemo2> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPageDemo2> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 170),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldForm(
                          data: UnitStrings().nameString,
                          title: UnitStrings().nameString),
                      TextFieldForm(
                          data: UnitStrings().lastNameString,
                          title: UnitStrings().lastNameString),
                      TextFieldForm(
                          data: UnitStrings().exampleMailString,
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

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({
    super.key,
    required this.purpleColor,
  });

  final Color purpleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenterPageDemo2(
            purpleColor: purpleColor, data1: UnitStrings().rememberMeString),
        const Spacer(),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              ContainerButton(
                  onTapFunction: () {},
                  purpleColor: purpleColor,
                  data: UnitStrings().signUpString),
              ContainerButton(
                  onTapFunction: () {
                    Navigator.of(context).pop();
                  },
                  purpleColor: Colors.transparent,
                  color: purpleColor,
                  data: UnitStrings().signInString),
            ],
          ),
        )
      ],
    );
  }
}

class _BackTopContainer extends StatelessWidget {
  const _BackTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
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
                      color: const Color.fromARGB(255, 144, 39, 162),
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    UnitStrings().welcomeString,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
