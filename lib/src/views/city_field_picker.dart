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

class CityFieldPicker extends StatelessWidget {
  final String country;
  final String state;
  final String? searchHintText;
  final String? hintText;
  final String? label;
  final String? initialValue;
  final CPPSFDecoration searchDecoration;
  final CPPBSHDecoration bottomSheetDecoration;
  final CPPFDecoration decoration;
  final bool isRequired;

  final void Function(String value)? onSelected;
  final void Function(String? value)? onSaved;

  const CityFieldPicker({
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
    required this.country,
    this.initialValue,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: _build,
    );
  }

  Widget _build(BuildContext context, CountriesState state) {
    return FieldWidget(
      onTap: () => _cityOnTapHandler(context),
      label: label ?? '',
      hintText: hintText,
      initialValue: state.city.name.isEmpty ? initialValue : state.city.name,
      onSaved: onSaved,
      isRequired: isRequired,
      decoration: decoration,
      searchDecoration: searchDecoration,
      bottomSheetDecoration: bottomSheetDecoration,
    );
  }

  void _cityOnTapHandler(BuildContext context) {
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
    final children =
        context.read<CountriesBloc>().getCities(country, state)?.map(
      (item) {
        return ItemBox(
          value: item.name,
          decoration: bottomSheetDecoration,
          onTab: () {
            context.read<CountriesBloc>().setQuery('');
            context.read<CountriesBloc>().setCity(item);
            onSelected!(item.name);
            Navigator.of(context).pop();
          },
        );
      },
    );
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: children?.toList() ?? [],
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
