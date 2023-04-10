import 'package:flutter/material.dart';

import '../../models/bottom_sheet_decoration.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({
    super.key,
    required this.decoration,
    required this.value,
    this.onTab,
  });

  final CPPBSHDecoration decoration;
  final String value;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: decoration.itemsPadding ?? const EdgeInsets.all(8),
        margin: decoration.itemsSpace,
        decoration: decoration.itemDecoration,
        child: Text(
          value,
          style: decoration.itemTextStyle,
        ),
      ),
    );
  }
}
