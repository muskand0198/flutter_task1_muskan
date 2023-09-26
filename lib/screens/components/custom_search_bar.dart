import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget{
  final String hintText;
  final double paddingValue;
  final Function(String val) onChanged;
  final Icon leading;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.paddingValue,
    required this.onChanged,
    required this.leading,
});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: paddingValue)),
      onChanged: onChanged,
      leading: leading,
      hintText: hintText,
    );
  }
}