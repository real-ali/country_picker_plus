import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/countries_cubit.dart';
import '../../models/bottom_sheet_decoration.dart';
import '../../models/enums/label_position.dart';
import '../../models/field_decoreation.dart';
import '../../models/search_field_decoration.dart';

class FieldWidget extends StatefulWidget {
  final bool? isRequired;
  final String? initialValue;
  final String? hintText;
  final String label;

  final void Function(String? value)? onSaved;

  final void Function()? onTap;
  final CPPFDecoration decoration;
  final CPPBSHDecoration bottomSheetDecoration;
  final CPPSFDecoration searchDecoration;

  const FieldWidget({
    super.key,
    this.isRequired,
    this.onSaved,
    this.decoration = const CPPFDecoration(),
    this.bottomSheetDecoration = const CPPBSHDecoration(),
    this.searchDecoration = const CPPSFDecoration(),
    required this.initialValue,
    this.onTap,
    this.hintText,
    this.label = '',
  });

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  bool _hasError = false;

  String? _validator(String? value) {
    if (widget.isRequired == true && (value == null || value == '')) {
      setState(() {
        _hasError = true;
      });
      return widget.decoration.requiredErrorMessage ??
          'This field is required!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = widget.label.isEmpty
        ? const SizedBox()
        : Text(
            widget.label,
            style: widget.decoration.labelStyle?.copyWith(
                  color: _hasError ? theme.colorScheme.error : null,
                ) ??
                theme.textTheme.labelMedium?.copyWith(
                  color: _hasError ? theme.colorScheme.error : null,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          );
    final labelAction =
        widget.decoration.labelPosition == LabelPosition.defaultPosition
            ? label
            : null;
    final labelAction2 =
        widget.decoration.labelPosition != LabelPosition.defaultPosition
            ? label
            : const SizedBox();
    final space = widget.decoration.labelPosition != LabelPosition.top ||
            widget.label.isEmpty
        ? const SizedBox()
        : const SizedBox(height: 10);

    final inputDecoration = InputDecoration(
      focusedBorder: widget.decoration.focusedBorder,
      errorBorder: widget.decoration.errorBorder,
      fillColor: widget.decoration.innerColor,
      enabledBorder: widget.decoration.border,
      filled: widget.decoration.filled,
      contentPadding: widget.decoration.padding,
      hintStyle: widget.decoration.hintStyle,
      hintText: widget.hintText,
      isDense: true,
      suffixIcon: Icon(
        widget.decoration.suffixIcon ?? Icons.arrow_forward,
        size: 20,
      ),
      suffixIconColor: widget.decoration.suffixColor,
      label: labelAction,
    );

    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: (context, state) {
        var textEditingController =
            TextEditingController(text: widget.initialValue);
        return Container(
          width: widget.decoration.width,
          margin: widget.decoration.margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelAction2,
              space,
              SizedBox(
                height: widget.decoration.height,
                child: TextFormField(
                  controller: textEditingController,
                  cursorColor: widget.decoration.curserColor,
                  validator: _validator,
                  onSaved: widget.onSaved,
                  style:
                      widget.decoration.textStyle ?? theme.textTheme.bodyMedium,
                  readOnly: true,
                  onTap: widget.onTap,
                  decoration: inputDecoration,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
