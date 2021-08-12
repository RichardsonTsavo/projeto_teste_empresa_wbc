import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  Function(String)? onChanged;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  TextInputType? keyboardType;

  CustomTextFormField(
      {this.onChanged,
      this.controller,
      this.labelText,
      this.inputFormatters,
      this.validator,
      this.keyboardType});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          labelText: widget.labelText, border: OutlineInputBorder()),
    );
  }
}
