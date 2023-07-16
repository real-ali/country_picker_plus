import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_picker_plus.dart';
import 'src/controller/cubit/countries_cubit.dart';
import 'src/country_picker_plus.init.dart';
import 'src/views/city_field_picker.dart';
import 'src/views/country_field_picker.dart';
import 'src/views/state_field_picker.dart';

export 'src/models/bottom_sheet_decoration.dart';
export 'src/models/enums/close_icon.dart';

export 'src/models/enums/label_position.dart';
export 'src/models/enums/pop_up_type.dart';
export 'src/models/enums/search_icon.dart';
export 'src/models/field_decoreation.dart';
export 'src/models/search_field_decoration.dart';

///A flutter package to display list of Countries, States and Cities depends on Selected,
///also you can search country, state, and city all around the world.
///

///### How to use
///The package has two methods that you can use according to your needs
///
///1. By using the main package, all three fields, which are the country, State, and City, are created by default, and you can design them as you wish.
///
///Sample code for this section:
///
/// ```dart
/// CountryPickerPlus(
///    isRequired: true,
///    countryLabel: "Country",
///    countrySearchHintText: "Search Country",
///    countryHintText: "Tap to Select Country",
///    stateLabel: "State",
///    stateHintText: "Tap to Select State",
///    cityLabel: "City",
///    cityHintText: "Tap to Select City",
///    bottomSheetDecoration: bottomSheetDecoration,
///    decoration: fieldDecoration,
///    searchDecoration: searchDecoration,
///    onCountrySaved: (value) {},
///    onCountrySelected: (value) {},
///    onStateSelected: (value) {},
///    onCitySelected: (value) {},
/// ),
/// ```
/// **Note:** You can hide each field as you wish
///
/// For Instance:
///
///
/// In the main package class. Use the following property
///
///
///    ```dart
///    hideFields: const [CPPInputType.city,...],
///    ```
///
/// 2. Or use each of the fields individually [`country`,`state`,`city`]
///
/// Sample code for this section:
/// ```dart
/// CountryPickerPlus.country(...);
/// ```
/// ```dart
/// CountryPickerPlus.state(country:'COUNTRY_NAME',...);
/// ```
/// ```dart
/// CountryPickerPlus.city(country:'COUNTRY_NAME',state:'STATE_NAME',...);
/// ```
///
/// And and and other features that you can play with using code... :)
///
///
///
/// ## Additional information
///
/// A Package Developed by Ali Hosseini
///
/// Please, report the bugs through the Github repository:
///
/// https://github.com/real-ali/country_picker_plus/issues
///
///
class CountryPickerPlus extends StatelessWidget {
  /// set Label for Country Field
  /// ```
  /// countryLabel:"Country";
  /// ```
  final String? countryLabel;

  /// set Label for state Field
  /// ```
  /// stateLabel:"State":
  /// ```
  final String? stateLabel;

  /// set Label for City Field
  /// ```
  /// cityLabel:"city";
  /// ```
  final String? cityLabel;

  /// set Hint Text for Country Field
  /// ```
  /// countryHintText:"Tap to Select Country";
  /// ```
  final String? countryHintText;

  /// set Hint Tex for State Field
  /// ```
  /// stateHintText:"Tap to Select State";
  /// ```
  final String? stateHintText;

  /// set Hint Tex for City Field
  /// ```
  /// cityHintText:"Tap to Select City";
  /// ```
  final String? cityHintText;

  /// Inialize defualt Value to Country Field
  /// ```
  /// countryInitialValue: "Afghanistan";
  /// ```
  final String? countryInitialValue;

  /// Inialize defualt Value to State Field
  /// ```
  /// stateInitialValue: "...";
  /// ```
  final String? stateInitialValue;

  /// Inialize defualt Value to City Field
  /// ```
  /// cityInitialValue: "...";
  /// ```
  final String? cityInitialValue;

  /// set Hint Tex for Country Search Field
  /// ```
  /// countrySearchHintText: "Search Countries";
  /// ```
  final String? countrySearchHintText;

  /// set Hint Tex for State Search Field
  ///  ```
  /// stateSearchHintText: "Search States";
  /// ```
  final String? stateSearchHintText;

  /// set Hint Tex for City search Field
  ///  ```
  /// citySearchHintText: "Search Cities";
  /// ```
  final String? citySearchHintText;

  
  ///Specify whether to show fields before
  ///selecting the previous field or not.
  ///
  ///If it is ‍‍‍‍‍```false```, all fields will be displayed.
  ///
  ///```‍‍
  ///hideFields: false; or hideFields: true;
  ///```
  final bool hideFields;

  ///Specify whether the field is **isRequired** or not.
  ///```
  ///isRequired: false; or isRequired: true;
  ///```
  final bool isRequired;

  ///### Country Picker Plus Fields Decoration
  /// #### Attributes
  ///
  /// ```
  ///  final double? height;
  ///  final bool showFlag;
  ///  final double? width;
  ///  final String? requiredErrorMessage;
  ///
  ///  final IconData? suffixIcon;
  ///  final TextStyle? labelStyle;
  ///  final TextStyle? hintStyle;
  ///
  ///  /// By default value take from Theme Data `bodyMedium`
  ///  final TextStyle? textStyle;
  ///
  ///  final EdgeInsetsGeometry? padding;
  ///  final EdgeInsetsGeometry? margin;
  ///  final InputBorder? border;
  ///  final PopUpType popUpType;
  ///
  ///  final bool? isDisable;
  ///  final Color? innerColor;
  ///  final Color? curserColor;
  ///  final LabelPosition labelPosition;
  ///  final Color? suffixColor;
  ///  final InputBorder? focusedBorder;
  ///  final InputBorder? errorBorder;
  ///  final bool? filled;
  ///
  /// ```
  final CPPFDecoration decoration;

  /// ### Country Picker Plus bottom Sheet Decoration
  /// #### Attributes
  /// ```
  /// final TextStyle? itemTextStyle;
  /// final EdgeInsetsGeometry? itemsPadding;
  /// final CloseIcon closeIcon;
  /// final BoxDecoration? itemDecoration;
  /// final ShapeBorder? shape;
  /// final double? height;
  /// final EdgeInsetsGeometry? itemsSpace;
  /// final Color? closeColor;
  /// final Color? islandColor;
  /// final double? islandWidth;
  /// ```
  final CPPBSHDecoration bottomSheetDecoration;

  /// ### Country Picker Plus Search Decoration
  /// #### Attributes
  /// ```
  /// final SearchIcon searchIconType;
  /// final IconData? searchIcon;
  ///
  /// final Color? searchIconColor;
  /// final double? height;
  /// final TextStyle? hintStyle;
  ///
  /// /// By default value take from Theme Data `bodyMedium`
  /// final TextStyle? textStyle;
  /// final Color? curserColor;
  /// final EdgeInsetsGeometry? padding;
  /// final EdgeInsetsGeometry? margin;
  /// final InputBorder? border;
  /// final Color? innerColor;
  /// final InputBorder? focusedBorder;
  /// final bool? filled;

  /// ```
  final CPPSFDecoration searchDecoration;

  /// Control what to do when value comes on Item Select in Countries List
  /// ```
  /// onCountrySelected: (value) => print(value)
  /// ```
  final void Function(String value)? onCountrySelected;

  /// Control what to do when value comes on Item Select in States List
  /// ```
  /// onStateSelected: (value) => print(value)
  /// ```
  final void Function(String value)? onStateSelected;

  /// Control what to do when value comes on Item Select in Cities List
  /// ```
  /// onCitySelected: (value) => print(value)
  /// ```
  final void Function(String value)? onCitySelected;

  /// Control what to do when value comes when Form Submitted  in Country Field
  /// ```
  /// onCountrySaved: (value) => print(value)
  /// ```
  final void Function(String? value)? onCountrySaved;

  /// Control what to do when value comes when Form Submitted  in State Field
  /// ```
  /// onStateSaved: (value) => print(value)
  /// ```
  final void Function(String? value)? onStateSaved;

  /// Control what to do when value comes when Form Submitted  in City Field
  /// ```
  /// onCitySaved: (value) => print(value)
  /// ```
  final void Function(String? value)? onCitySaved;

  ///A flutter package to display list of Countries, States and Cities depends on Selected,
  ///also you can search country, state, and city all around the world.
  ///

  ///### How to use
  ///The package has two methods that you can use according to your needs
  ///
  ///1. By using the main package, all three fields, which are the country, State, and City, are created by default, and you can design them as you wish.
  ///
  ///Sample code for this section:
  ///
  /// ```dart
  /// CountryPickerPlus(
  ///    isRequired: true,
  ///    countryLabel: "Country",
  ///    countrySearchHintText: "Search Country",
  ///    countryHintText: "Tap to Select Country",
  ///    stateLabel: "State",
  ///    stateHintText: "Tap to Select State",
  ///    cityLabel: "City",
  ///    cityHintText: "Tap to Select City",
  ///    bottomSheetDecoration: bottomSheetDecoration,
  ///    decoration: fieldDecoration,
  ///    searchDecoration: searchDecoration,
  ///    onCountrySaved: (value) {},
  ///    onCountrySelected: (value) {},
  ///    onStateSelected: (value) {},
  ///    onCitySelected: (value) {},
  /// ),
  /// ```
  /// **Note:** You can hide each field as you wish
  ///
  /// For Instance:
  ///
  ///
  /// In the main package class. Use the following property
  ///
  ///
  ///    ```dart
  ///    hideFields: const [CPPInputType.city,...],
  ///    ```
  ///
  /// 2. Or use each of the fields individually [`country`,`state`,`city`]
  ///
  /// Sample code for this section:
  /// ```dart
  /// CountryPickerPlus.country(...);
  /// ```
  /// ```dart
  /// CountryPickerPlus.state(country:'COUNTRY_NAME',...);
  /// ```
  /// ```dart
  /// CountryPickerPlus.city(country:'COUNTRY_NAME',state:'STATE_NAME',...);
  /// ```
  ///
  /// And and and other features that you can play with using code... :)
  ///
  ///
  ///
  /// ## Additional information
  ///
  /// A Package Developed by Ali Hosseini
  ///
  /// Please, report the bugs through the Github repository:
  ///
  /// https://github.com/real-ali/country_picker_plus/issues
  ///
  ///
  const CountryPickerPlus({
    super.key,
    this.hideFields=false,
    this.onCountrySelected,
    this.onStateSelected,
    this.onCitySelected,
    this.onCountrySaved,
    this.onStateSaved,
    this.onCitySaved,
    this.isRequired = false,
    this.decoration = const CPPFDecoration(),
    this.bottomSheetDecoration = const CPPBSHDecoration(),
    this.searchDecoration = const CPPSFDecoration(),
    this.countryLabel,
    this.stateLabel,
    this.cityLabel,
    this.countryHintText,
    this.stateHintText,
    this.cityHintText,
    this.countrySearchHintText,
    this.stateSearchHintText,
    this.citySearchHintText,
    this.countryInitialValue,
    this.stateInitialValue,
    this.cityInitialValue,
  });

  ///### Country Field
  ///#### Attributes
  ///```
  ///  String? searchHintText,
  ///  String? hintText,
  ///  String? label,
  ///  String? initialValue,
  ///  CPPSFDecoration searchDecoration = const CPPSFDecoration(),
  ///  CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
  ///  CPPFDecoration decoration = const CPPFDecoration(),
  ///  bool isRequired = false,
  ///  void Function(String value)? onSelected,
  ///  void Function(String? value)? onSaved,
  ///```
  static Widget country({
    String? searchHintText,
    String? hintText,
    String? label,
    String? initialValue,
    CPPSFDecoration searchDecoration = const CPPSFDecoration(),
    CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
    CPPFDecoration decoration = const CPPFDecoration(),
    bool isRequired = false,
    void Function(String value)? onSelected,
    void Function(String? value)? onSaved,
  }) {
    return BlocProvider(
      create: (context) => CountriesBloc(),
      child: CountryFieldPicker(
        initialValue: initialValue,
        searchHintText: searchHintText,
        hintText: hintText,
        label: label,
        searchDecoration: searchDecoration,
        bottomSheetDecoration: bottomSheetDecoration,
        decoration: decoration,
        isRequired: isRequired,
        onSelected: onSelected,
        onSaved: onSaved,
      ),
    );
  }

  ///### State Field
  ///#### Attributes
  ///```
  /// required String country,
  /// String? searchHintText,
  /// String? hintText,
  /// String? initialValue,
  /// String? label,
  /// CPPSFDecoration searchDecoration = const CPPSFDecoration(),
  /// CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
  /// CPPFDecoration decoration = const CPPFDecoration(),
  /// bool isRequired = false,
  /// void Function(String value)? onSelected,
  /// void Function(String? value)? onSaved,
  ///```
  static Widget state({
    required String country,
    String? searchHintText,
    String? hintText,
    String? initialValue,
    String? label,
    CPPSFDecoration searchDecoration = const CPPSFDecoration(),
    CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
    CPPFDecoration decoration = const CPPFDecoration(),
    bool isRequired = false,
    void Function(String value)? onSelected,
    void Function(String? value)? onSaved,
  }) {
    return BlocProvider(
      create: (context) => CountriesBloc(),
      child: StateFieldPicker(
        initialValue: initialValue,
        country: country,
        searchHintText: searchHintText,
        hintText: hintText,
        label: label,
        searchDecoration: searchDecoration,
        bottomSheetDecoration: bottomSheetDecoration,
        decoration: decoration,
        isRequired: isRequired,
        onSelected: onSelected,
        onSaved: onSaved,
      ),
    );
  }

  ///### State Field
  ///#### Attributes
  ///```
  /// required String country,
  /// required String state,
  /// String? initialValue,
  /// String? searchHintText,
  /// String? hintText,
  /// String? label,
  /// CPPSFDecoration searchDecoration = const CPPSFDecoration(),
  /// CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
  /// CPPFDecoration decoration = const CPPFDecoration(),
  /// bool isRequired = false,
  /// void Function(String value)? onSelected,
  /// void Function(String? value)? onSaved,
  ///```
  static Widget city({
    required String country,
    required String state,
    String? initialValue,
    String? searchHintText,
    String? hintText,
    String? label,
    CPPSFDecoration searchDecoration = const CPPSFDecoration(),
    CPPBSHDecoration bottomSheetDecoration = const CPPBSHDecoration(),
    CPPFDecoration decoration = const CPPFDecoration(),
    bool isRequired = false,
    void Function(String value)? onSelected,
    void Function(String? value)? onSaved,
  }) {
    return BlocProvider(
      create: (context) => CountriesBloc(),
      child: CityFieldPicker(
        initialValue: initialValue,
        country: country,
        state: state,
        searchHintText: searchHintText,
        hintText: hintText,
        label: label,
        searchDecoration: searchDecoration,
        bottomSheetDecoration: bottomSheetDecoration,
        decoration: decoration,
        isRequired: isRequired,
        onSelected: onSelected,
        onSaved: onSaved,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(),
      child: CountryPickerPlusInit(
        countryLabel: countryLabel,
        countryInitialValue: countryInitialValue,
        stateInitialValue: stateInitialValue,
        cityInitialValue: cityInitialValue,
        stateLabel: stateLabel,
        cityLabel: cityLabel,
        countryHintText: countryHintText,
        stateHintText: stateHintText,
        cityHintText: cityHintText,
        hideFields: hideFields,
        isRequired: isRequired,
        decoration: decoration,
        bottomSheetDecoration: bottomSheetDecoration,
        searchDecoration: searchDecoration,
        onCountryChanged: onCountrySelected,
        onStateChanged: onStateSelected,
        onCityChanged: onCitySelected,
        onCountrySaved: onCountrySaved,
        onStateSaved: onStateSaved,
        onCitySaved: onCitySaved,
        countrySearchHintText: countrySearchHintText,
        stateSearchHintText: stateSearchHintText,
        citySearchHintText: citySearchHintText,
      ),
    );
  }
}
