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

class CountryFieldPicker extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: _build,
    );
  }

  Widget _build(BuildContext context, CountriesState state) {
    return FieldWidget(
      onTap: () => _countryOnTapHandler(context),
      label: label ?? '',
      hintText: hintText,
      initialValue:
          state.country.name.isEmpty ? initialValue : state.country.name,
      onSaved: onSaved,
      isRequired: isRequired,
      decoration: decoration,
      searchDecoration: searchDecoration,
      bottomSheetDecoration: bottomSheetDecoration,
    );
  }

  void _countryOnTapHandler(BuildContext context) {
    showModalBottomSheet(
      shape: bottomSheetDecoration.shape,
      isScrollControlled: true,
      // useRootNavigator: true,
      context: context,
      builder: (_) {
        final cppBottomSheetWidget = CPPBottomSheetWidget(
          decoration: bottomSheetDecoration,
          items: _items(context),
          searchFieldWidget: _searchFieldWidget(context),
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
  }

  _items(BuildContext context) {
    final children = context.read<CountriesBloc>().getCountries().map(
      (item) {
        return ItemBox(
          value: '${decoration.showFlag ? '${item.flag}  ' : ''}${item.name}',
          decoration: bottomSheetDecoration,
          onTab: () {
            context.read<CountriesBloc>().setQuery('');
            context.read<CountriesBloc>().setCountry(item);
            onSelected!(item.name);
            Navigator.of(context).pop();
          },
        );
      },
    );
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: children.toList(),
    );
  }

  _searchFieldWidget(BuildContext context) {
    return SearchFieldWidget(
      hintText: searchHintText,
      decoration: searchDecoration,
      onChanged: context.read<CountriesBloc>().setQuery,
    );
  }
}
