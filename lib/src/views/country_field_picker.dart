import 'package:country_picker_plus/src/models/bottom_sheet_decoration.dart';
import 'package:country_picker_plus/src/models/field_decoreation.dart';
import 'package:country_picker_plus/src/models/search_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/countries_cubit.dart';
import 'components/bottom_sheet_widget.dart';
import 'components/field_widget.dart';
import 'components/item_box.dart';
import 'components/search_field_widget.dart';

class CountryFieldPicker extends StatefulWidget {
  final String? searchHintText;
  final String? hintText;
  final String? label;

  final CPPSFDecoration searchDecoration;
  final CPPBSHDecoration bottomSheetDecoration;
  final CPPFDecoration decoration;
  final bool isRequired;
  final String? initialValue;

  final void Function(String value)? onSelected;
  final void Function(String? value)? onSaved;

  const CountryFieldPicker({
    super.key,
    this.searchHintText,
    this.hintText,
    this.searchDecoration = const CPPSFDecoration(),
    this.bottomSheetDecoration = const CPPBSHDecoration(),
    this.decoration = const CPPFDecoration(),
    this.label,
    this.isRequired = false,
    this.onSelected,
    this.onSaved,
    this.initialValue,
  });

  @override
  State<CountryFieldPicker> createState() => _CountryFieldPickerState();
}

class _CountryFieldPickerState extends State<CountryFieldPicker> {
  String _searchValue = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: _build,
    );
  }

  Widget _build(BuildContext context, CountriesState state) {
    return FieldWidget(
      onTap: () => _countryOnTapHandler(context),
      label: widget.label ?? '',
      hintText: widget.hintText,
      initialValue:
          state.country.name.isEmpty ? widget.initialValue : state.country.name,
      onSaved: widget.onSaved,
      isRequired: widget.isRequired,
      decoration: widget.decoration,
      searchDecoration: widget.searchDecoration,
      bottomSheetDecoration: widget.bottomSheetDecoration,
    );
  }

  void _countryOnTapHandler(BuildContext context) {
    showModalBottomSheet(
      shape: widget.bottomSheetDecoration.shape,
      isScrollControlled: true,
      // useRootNavigator: true,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (_, setState) {
            final cppBottomSheetWidget = CPPBottomSheetWidget(
              decoration: widget.bottomSheetDecoration,
              items: _items(context),
              searchFieldWidget: SearchFieldWidget(
                hintText: widget.searchHintText,
                decoration: widget.searchDecoration,
                onChanged: (value) {
                  setState(() => _searchValue = value);
                },
              ),
            );
            final child = Padding(
              padding: MediaQuery.of(_).viewInsets,
              child: cppBottomSheetWidget,
            );
            return BlocProvider.value(
              value: BlocProvider.of<CountriesBloc>(context),
              child: child,
            );
          },
        );
      },
    );
  }

  _items(BuildContext context) {
    final children =
        context.read<CountriesBloc>().getCountries(_searchValue).map(
      (item) {
        return ItemBox(
          value:
              '${widget.decoration.showFlag ? '${item.flag}  ' : ''}${item.name}',
          decoration: widget.bottomSheetDecoration,
          onTab: () {
            context.read<CountriesBloc>().setCountry(country: item);
            widget.onSelected!(item.name);
            Navigator.of(context).pop();
          },
        );
      },
    );
    return ListView(
      physics: const BouncingScrollPhysics(),
    children: [...children.toList(),ItemBox(
          value:
               '${widget.decoration.showFlag ? '🌎  '  : ''}$_searchValue',
          decoration: widget.bottomSheetDecoration,
          onTab: () {
           context.read<CountriesBloc>().setCountry(name:_searchValue);
            widget.onSelected!(_searchValue);
            Navigator.of(context).pop();
          },
        ),]
    );
  }
}
