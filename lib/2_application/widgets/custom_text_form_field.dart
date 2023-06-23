import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/theme_config.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController controller;
  final String hintText;
  final bool isObscured;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;

  late OutlineInputBorder defaultBorderStyle;
  late ThemeData theme;
  late BorderRadius borderRadius;

  CustomTextFormField({
    super.key,
    required this.context,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.isObscured = false,
    this.prefixIcon,
  }) {
    borderRadius = const BorderRadius.all(Radius.circular(7));

    defaultBorderStyle = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(
        width: 2,
        color: ThemeConfig.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: ThemeConfig.mutedColor),
        prefixIcon: prefixIcon,
        enabledBorder: defaultBorderStyle,
        border: defaultBorderStyle,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 3,
            color: ThemeConfig.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          // Theme.of(context).primaryColor
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 2,
            color: ThemeConfig.errorColor,
          ),
        ),
      ),
    );
  }
}
