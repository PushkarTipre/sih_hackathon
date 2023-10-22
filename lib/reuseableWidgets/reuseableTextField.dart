import 'package:flutter/material.dart';

class reuseableTextField extends StatelessWidget {
  reuseableTextField(
      {required this.controller,
      required this.text,
      required this.icon,
      required this.isPassword,
      required this.validator,
      required this.save});
  TextEditingController controller;
  String text;
  IconData icon;
  bool isPassword;
  FormFieldValidator validator;
  final void Function(String?) save;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 0, 60, 0),
      child: SizedBox(
        height: 50.0,
        child: TextFormField(
          onSaved: save,
          validator: validator,
          controller: controller,
          obscureText: isPassword,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            labelText: text,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
          ),
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
