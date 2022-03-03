import 'package:flutter/material.dart';
import 'package:panda/ui/theme.dart';

class MyInputFormField extends StatelessWidget {
  const MyInputFormField({
    @required this.label,
    @required this.hint,
    this.textInputAction,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String label;
  final String hint;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final Function validator;
  final Function onChanged;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$label',
              style: titleStyle,
            ),
          ),
          TextFormField(
            readOnly: (prefixIcon != null || suffixIcon != null) ? true : false,
            controller: controller,
            obscureText: obscureText,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            validator: validator,
            onChanged: onChanged,
            minLines: minLines,
            maxLines: maxLines,
            textCapitalization: TextCapitalization.sentences,
            style: subTitleStyle,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              hintStyle: hintTextStyle,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 14.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: formBorder,
              enabledBorder: formBorder,
            ),
          ),
        ],
      ),
    );
  }
}
