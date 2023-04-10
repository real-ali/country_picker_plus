import 'package:flutter/material.dart';

import '../../models/bottom_sheet_decoration.dart';
import '../../models/enums/close_icon.dart';
import 'search_field_widget.dart';

class CPPBottomSheetWidget extends StatelessWidget {
  final Widget items;

  final SearchFieldWidget searchFieldWidget;

  final CPPBSHDecoration decoration;

  const CPPBottomSheetWidget({
    super.key,
    this.decoration = const CPPBSHDecoration(),
    required this.items,
    required this.searchFieldWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height / 2 + 80;

    final iconClose = Positioned(
      top: decoration.closeIcon == CloseIcon.outside ? -45 : 0,
      right: 8,
      child: IconButton(
        icon: const Icon(
          Icons.close,
          size: 25,
        ),
        color: decoration.closeColor ?? theme.colorScheme.secondary,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        decoration.closeIcon == CloseIcon.idle ? const SizedBox() : iconClose,
        Container(
          height: decoration.height ?? height,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 5,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    searchFieldWidget,
                    Expanded(
                      child: items,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
