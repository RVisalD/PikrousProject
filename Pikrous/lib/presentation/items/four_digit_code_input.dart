// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FourDigitCodeInput extends StatefulWidget {
  const FourDigitCodeInput({super.key});

  @override
  _FourDigitCodeInputState createState() => _FourDigitCodeInputState();
}

class _FourDigitCodeInputState extends State<FourDigitCodeInput> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
    _setupFocusListeners();
  }

  void _setupFocusListeners() {
    for (int i = 0; i < controllers.length - 1; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.length == 1) {
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextInputFormatter.withFunction(
                  (oldValue, newValue) {
                    final regExp = RegExp(r'^\d*\.?\d*$');
                    if (regExp.hasMatch(newValue.text)) {
                      return newValue;
                    }
                    return oldValue;
                  },
                )
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
