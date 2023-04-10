import 'package:flutter/material.dart';

import '../../models/enums/search_icon.dart';
import '../../models/search_field_decoration.dart';

class SearchFieldWidget extends StatelessWidget {
  final String? hintText;

  final CPPSFDecoration decoration;
  final void Function(String value)? onChanged;

  const SearchFieldWidget({
    super.key,
    this.decoration = const CPPSFDecoration(),
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSearch = Icon(
      decoration.searchIcon ?? Icons.search_rounded,
      color: decoration.searchIconColor,
      size: 20,
    );
    var outlineInputBorder2 = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.orangeAccent,
      ),
    );
    final inputDecoration = InputDecoration(
      contentPadding: decoration.padding,
      hintStyle: decoration.hintStyle,
      hintText: hintText,
      focusedBorder: decoration.focusedBorder ?? outlineInputBorder2,
      isDense: true,
      filled: decoration.filled,
      enabledBorder: decoration.border,
      fillColor: decoration.innerColor,
      suffixIcon:
          decoration.searchIconType == SearchIcon.end ? iconSearch : null,
      prefixIcon:
          decoration.searchIconType == SearchIcon.start ? iconSearch : null,
    );
    return Container(
      margin: decoration.margin,
      height: decoration.height,
      child: TextField(
        textInputAction: TextInputAction.search,
        style: decoration.textStyle ?? theme.textTheme.bodyMedium,
        decoration: inputDecoration,
        cursorColor: decoration.curserColor,
        onChanged: onChanged,
      ),
    );
  }
}
