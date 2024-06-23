import 'package:flutter/material.dart';
import 'package:pingolearn/core/common/res/colours.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = false;

  @override
  void initState() {
    _isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(16.0);

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () => setState(() {
                  _isObscure = !_isObscure;
                }),
                icon: _isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: ColourPallette.secondaryColour,
          fontWeight: FontWeight.w500,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: borderRadius, // Set the border radius here
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius, // Set the border radius here
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius, // Set the border radius here
          // borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius, // Set the border radius here
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, // Set the border radius here
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      obscureText: _isObscure,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
