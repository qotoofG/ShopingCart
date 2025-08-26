import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainTextField extends StatelessWidget {
  void Function(String)? onChanged;
  bool? obscure;
  bool? autofocus;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  int? maxLines;
  String? hintText;
  String?labelText;
  Color? borderColor;
  final double curve;
   MainTextField({
    super.key,
    this.onChanged,
    this.obscure,
    this.validator,
    this.controller,
    this.autofocus,
    this.maxLines,
    this.hintText,
    this.borderColor,
    required this.curve,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.labelText,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscure ?? false,
      validator: validator,
      controller: controller,
      autofocus: autofocus ?? false,
      maxLines:maxLines ?? 1,
      keyboardType: keyboardType,
      decoration:  InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
        focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 176, 87, 85),),
                        borderRadius:  BorderRadius.all(
                          Radius.circular(curve),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 176, 87, 85),),
                        borderRadius:  BorderRadius.all(
                          Radius.circular(curve),
                        ),
                      ),
      ),
    );
  }
}