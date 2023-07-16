import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/countries_cubit.dart';
import 'models/bottom_sheet_decoration.dart';

import 'models/field_decoreation.dart';
import 'models/search_field_decoration.dart';
import 'views/city_field_picker.dart';
import 'views/country_field_picker.dart';
import 'views/state_field_picker.dart';

class CountryPickerPlusInit extends StatefulWidget {
  final String? countryLabel;
  final String? stateLabel;
  final String? cityLabel;
  final String? countrySearchHintText;
  final String? stateSearchHintText;
  final String? citySearchHintText;

  final String? countryHintText;
  final String? stateHintText;
  final String? cityHintText;

  final String? countryInitialValue;
  final String? stateInitialValue;
  final String? cityInitialValue;

  final bool? hideFields;

  final bool isRequired;
  final CPPFDecoration decoration;
  final CPPBSHDecoration bottomSheetDecoration;
  final CPPSFDecoration searchDecoration;
  final void Function(String value)? onCountryChanged;
  final void Function(String value)? onStateChanged;
  final void Function(String value)? onCityChanged;
  final void Function(String? value)? onCountrySaved;
  final void Function(String? value)? onStateSaved;
  final void Function(String? value)? onCitySaved;

  const CountryPickerPlusInit({
    super.key,
    required this.countryLabel,
    required this.stateLabel,
    required this.cityLabel,
    required this.countryHintText,
    required this.stateHintText,
    required this.cityHintText,
    required this.hideFields,
    required this.isRequired,
    required this.decoration,
    required this.bottomSheetDecoration,
    required this.searchDecoration,
    required this.onCountryChanged,
    required this.onStateChanged,
    required this.onCityChanged,
    required this.onCountrySaved,
    required this.onStateSaved,
    required this.onCitySaved,
    required this.countrySearchHintText,
    required this.stateSearchHintText,
    required this.citySearchHintText,
    this.countryInitialValue,
    this.stateInitialValue,
    this.cityInitialValue,
  });

  @override
  State<CountryPickerPlusInit> createState() => _CountryPickerPlusInitState();
}

class _CountryPickerPlusInitState extends State<CountryPickerPlusInit> {
  _buildCountryField(BuildContext context) {
    return CountryFieldPicker(
      initialValue: widget.countryInitialValue,
      searchHintText: widget.countrySearchHintText,
      hintText: widget.countryHintText,
      searchDecoration: widget.searchDecoration,
      bottomSheetDecoration: widget.bottomSheetDecoration,
      decoration: widget.decoration,
      label: widget.countryLabel,
      isRequired: widget.isRequired,
      onSelected: widget.onCountryChanged,
      onSaved: widget.onCountrySaved,
    );
  }

  _buildStateField(CountriesState state) {
    return StateFieldPicker(
      initialValue: widget.stateInitialValue,
      country: state.country.name,
      searchHintText: widget.stateSearchHintText,
      hintText: widget.stateHintText,
      searchDecoration: widget.searchDecoration,
      bottomSheetDecoration: widget.bottomSheetDecoration,
      decoration: widget.decoration,
      label: widget.stateLabel,
      isRequired: widget.isRequired,
      onSelected: widget.onStateChanged,
      onSaved: widget.onStateSaved,
    );
  }

  _buildCityField(CountriesState state) {
    return CityFieldPicker(
      initialValue: widget.cityInitialValue,
      country: state.country.name,
      state: state.countryState.name,
      searchHintText: widget.citySearchHintText,
      hintText: widget.cityHintText,
      searchDecoration: widget.searchDecoration,
      bottomSheetDecoration: widget.bottomSheetDecoration,
      decoration: widget.decoration,
      label: widget.cityLabel,
      isRequired: widget.isRequired,
      onSelected: widget.onCityChanged,
      onSaved: widget.onCitySaved,
    );
  }

  @override
  Widget build(BuildContext context) {
 
  
    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: (context, state) {
        final countryField =
            _buildCountryField(context);
        final stateField =
             _buildStateField(state) ;
        final cityField =
            _buildCityField(state) ;

        return Column(
          children: widget.hideFields==false?[
            countryField,stateField,cityField
          ]:[
            countryField,
            ...state.country.states.isNotEmpty ||
                    widget.stateInitialValue != null
                ? [
                    stateField ?? const SizedBox(),
                    state.countryState.cities.isNotEmpty ||
                            widget.cityInitialValue != null
                        ? cityField ?? const SizedBox()
                        : const SizedBox()
                  ]
                : [],
          ],
        );
      },
    );
  }
}
