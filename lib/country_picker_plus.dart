///Country Picker Plus Main File
library country_picker_plus;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'country_picker_plus.dart';
import 'src/dropdown_with_search.dart';
import 'src/model/select_status_model.dart';

///Countries List as Enum
export 'src/enum/countries.dart';

///Countries show type  as Enum
export 'src/enum/country_flag.dart';

///country picker plus bottom sheet style
export 'src/model/bottom_sheet_style.dart';

///Country Picker Plus class
class CountryPickerPlus extends StatefulWidget {
  ///Country Picker Plus Constructor
  const CountryPickerPlus({
    Key? key,
    this.onCountryChanged,
    this.onStateChanged,
    this.onCityChanged,
    this.selectedItemStyle,
    this.dropdownDecoration,
    this.disabledDropdownDecoration,
    this.searchBarRadius,
    this.dropdownDialogRadius,
    this.flagState = CountryFlag.ENABLE,
    this.showStates = true,
    this.showCities = true,
    this.defaultCountry,
    this.currentCountry,
    this.currentState,
    this.currentCity,
    this.disableCountry = false,
    this.countryDropdownLabel = "Country",
    this.stateDropdownLabel = "State",
    this.cityDropdownLabel = "City",
    this.countryFilter,
    this.fieldPadding,
    this.listItemStyle,
    this.fieldMargin,
    this.bottomSheetStyle,
    this.countrySearchHintText,
    this.citySearchHintText,
    this.stateSearchHintText,
    this.searchFiedlDecoration,
  }) : super(key: key);

  /// variable
  final ValueChanged<String>? onCountryChanged;

  /// variable
  final ValueChanged<String?>? onStateChanged;

  /// variable
  final ValueChanged<String?>? onCityChanged;

  /// variable
  final String? currentCountry;

  /// variable
  final String? currentState;

  /// variable
  final String? currentCity;

  /// variable
  final bool disableCountry;

  ///Parameters to change style of location Picker
  /// variable
  final EdgeInsetsGeometry? fieldPadding, fieldMargin;

  /// variable
  final String? countrySearchHintText;

  /// variable
  final String? citySearchHintText;

  /// variable
  final String? stateSearchHintText;

  /// variable
  final InputDecoration? searchFiedlDecoration;

  /// variable
  final TextStyle? selectedItemStyle, listItemStyle;

  /// variable
  final BoxDecoration? dropdownDecoration, disabledDropdownDecoration;

  /// variable
  final bool showStates, showCities;

  /// variable
  final CountryFlag flagState;

  /// variable
  final double? searchBarRadius;

  /// variable
  final double? dropdownDialogRadius;

  /// variable
  final CppCountry? defaultCountry;

  /// variable
  final BottomSheetStyle? bottomSheetStyle;

  /// variable
  final String countryDropdownLabel;

  /// variable
  final String stateDropdownLabel;

  /// variable
  final String cityDropdownLabel;

  /// variable
  final List<CppCountry>? countryFilter;

  @override
  CountryPickerPlusState createState() => CountryPickerPlusState();
}

class CountryPickerPlusState extends State<CountryPickerPlus> {
  /// variable
  final List<String?> _cities = [];

  /// variable
  final List<String?> _country = [];

  /// variable
  final List<String?> _states = [];

  /// variable
  List<CppCountry> _countryFilter = [];

  /// variable
  String _selectedCity = 'City';

  /// variable
  String? _selectedCountry;

  /// variable
  String _selectedState = 'State';

  @override
  void initState() {
    super.initState();
    setDefaults();
    if (widget.countryFilter != null) {
      _countryFilter = widget.countryFilter!;
    }
    getCountries();
    _selectedCity = widget.cityDropdownLabel;
    _selectedState = widget.stateDropdownLabel;
  }

  Future<void> setDefaults() async {
    if (widget.currentCountry != null) {
      setState(() => _selectedCountry = widget.currentCountry);
      await getStates();
    }

    if (widget.currentState != null) {
      setState(() => _selectedState = widget.currentState!);
      await getCities();
    }

    if (widget.currentCity != null) {
      setState(() => _selectedCity = widget.currentCity!);
    }
  }

  /// _setDefaultCountry function
  void _setDefaultCountry() {
    if (widget.defaultCountry != null) {
      _onSelectedCountry(_country[Countries[widget.defaultCountry]!]!);
    }
  }

  ///Read JSON country data from assets
  Future<dynamic> getResponse() async {
    var res = await rootBundle
        .loadString('packages/country_picker_plus/assets/country.json');
    return jsonDecode(res);
  }

  ///get countries from json response
  Future<List<String?>> getCountries() async {
    _country.clear();
    var countries = await getResponse() as List;
    if (_countryFilter.isNotEmpty) {
      for (var element in _countryFilter) {
        var result = countries[Countries[element]!];
        if (result != null) addCountryToList(result);
      }
    } else {
      for (var data in countries) {
        addCountryToList(data);
      }
    }
    _setDefaultCountry();
    return _country;
  }

  ///Add a country to country list
  void addCountryToList(data) {
    var model = Country();
    model.name = data['name'];
    model.emoji = data['emoji'];
    if (!mounted) return;
    setState(() {
      widget.flagState == CountryFlag.ENABLE ||
              widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
          ? _country.add(
              "${model.emoji!}    ${model.name!}") /* : _country.add(model.name)*/
          : _country.add(model.name);
    });
  }

  ///get states from json response
  Future<List<String?>> getStates() async {
    _states.clear();
    //print(_selectedCountry);
    var response = await getResponse();
    var takeState = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var states = takeState as List;
    for (var f in states) {
      if (!mounted) continue;
      setState(() {
        var name = f.map((item) => item.name).toList();
        for (var stateName in name) {
          //print(stateName.toString());
          _states.add(stateName.toString());
        }
      });
    }
    _states.sort((a, b) => a!.compareTo(b!));
    return _states;
  }

  ///get cities from json response
  Future<List<String?>> getCities() async {
    _cities.clear();
    var response = await getResponse();
    var takeCity = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var cities = takeCity as List;
    for (var f in cities) {
      var name = f.where((item) => item.name == _selectedState);
      var cityName = name.map((item) => item.city).toList();
      cityName.forEach((ci) {
        if (!mounted) return;
        setState(() {
          var citiesName = ci.map((item) => item.name).toList();
          for (var cityName in citiesName) {
            //print(cityName.toString());
            _cities.add(cityName.toString());
          }
        });
      });
    }
    _cities.sort((a, b) => a!.compareTo(b!));
    return _cities;
  }

  ///get methods to catch newly selected country state and city and populate state based on country, and city based on state
  void _onSelectedCountry(String value) {
    if (!mounted) return;
    setState(() {
      if (widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY) {
        try {
          widget.onCountryChanged!(value.substring(6).trim());
        } catch (e) {
          rethrow;
        }
      } else {
        widget.onCountryChanged!(value);
      }
      //code added in if condition
      if (value != _selectedCountry) {
        _states.clear();
        _cities.clear();
        _selectedState = widget.stateDropdownLabel;
        _selectedCity = widget.cityDropdownLabel;
        widget.onStateChanged!(null);
        widget.onCityChanged!(null);
        _selectedCountry = value;
        getStates();
      } else {
        widget.onStateChanged!(_selectedState);
        widget.onCityChanged!(_selectedCity);
      }
    });
  }

  /// _onSelectedState Function
  void _onSelectedState(String value) {
    if (!mounted) return;
    setState(() {
      widget.onStateChanged!(value);
      //code added in if condition
      if (value != _selectedState) {
        _cities.clear();
        _selectedCity = widget.cityDropdownLabel;
        widget.onCityChanged!(null);
        _selectedState = value;
        getCities();
      } else {
        widget.onCityChanged!(_selectedCity);
      }
    });
  }

  /// _onSelectedCity Function
  void _onSelectedCity(String value) {
    if (!mounted) return;
    setState(() {
      //code added in if condition
      if (value != _selectedCity) {
        _selectedCity = value;
        widget.onCityChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        countryDropdown(),
        stateDropdown(),
        cityDropdown(),
      ],
    );
  }

  ///filter Country Data according to user input
  Future<List<String?>> getCountryData(filter) async {
    var filteredList = _country
        .where(
            (country) => country!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty) {
      return _country;
    } else {
      return filteredList;
    }
  }

  ///filter Sate Data according to user input
  Future<List<String?>> getStateData(filter) async {
    var filteredList = _states
        .where((state) => state!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty) {
      return _states;
    } else {
      return filteredList;
    }
  }

  ///filter City Data according to user input
  Future<List<String?>> getCityData(filter) async {
    var filteredList = _cities
        .where((city) => city!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty) {
      return _cities;
    } else {
      return filteredList;
    }
  }

  ///Country Dropdown Widget
  Widget countryDropdown() {
    return DropdownWithSearch(
      hintText: widget.countrySearchHintText ?? 'search Country',
      bottomSheetStyle: widget.bottomSheetStyle,
      listItemStyle: widget.listItemStyle,
      fieldPadding: widget.fieldPadding,
      fieldMargin: widget.fieldMargin,
      selectedItemStyle: widget.selectedItemStyle,
      searchFieldDecoration: widget.searchFiedlDecoration,

      decoration: widget.dropdownDecoration,
      disabledDecoration: widget.disabledDropdownDecoration,
      disabled: _country.isEmpty || widget.disableCountry ? true : false,

      label: widget.countryDropdownLabel,
      items: _country.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry ?? widget.countryDropdownLabel,
      //selected: _selectedCountry != null ? _selectedCountry : "Country",
      //onChanged: (value) => _onSelectedCountry(value),
      onChanged: (value) {
        if (value != null) {
          _onSelectedCountry(value);
        }
      },
    );
  }

  ///State Dropdown Widget
  Widget stateDropdown() {
    return DropdownWithSearch(
      hintText: widget.stateSearchHintText ?? 'search state',
      bottomSheetStyle: widget.bottomSheetStyle,
      fieldMargin: widget.fieldMargin,
      listItemStyle: widget.listItemStyle,
      fieldPadding: widget.fieldPadding,
      disabled: _states.isEmpty ? true : false,
      items: _states.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,

      searchFieldDecoration: widget.searchFiedlDecoration,
      decoration: widget.dropdownDecoration,

      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedState,
      label: widget.stateDropdownLabel,
      //onChanged: (value) => _onSelectedState(value),
      onChanged: (value) {
        //print("stateChanged $value $_selectedState");
        value != null
            ? _onSelectedState(value)
            : _onSelectedState(_selectedState);
      },
    );
  }

  ///City Dropdown Widget
  Widget cityDropdown() {
    return DropdownWithSearch(
      hintText: widget.citySearchHintText ?? 'search city',
      bottomSheetStyle: widget.bottomSheetStyle,
      fieldMargin: widget.fieldMargin,
      listItemStyle: widget.listItemStyle,
      fieldPadding: widget.fieldPadding,
      disabled: _cities.isEmpty ? true : false,
      items: _cities.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,

      searchFieldDecoration: widget.searchFiedlDecoration,
      decoration: widget.dropdownDecoration,

      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedCity,
      label: widget.cityDropdownLabel,
      //onChanged: (value) => _onSelectedCity(value),
      onChanged: (value) {
        //print("cityChanged $value $_selectedCity");
        value != null ? _onSelectedCity(value) : _onSelectedCity(_selectedCity);
      },
    );
  }
}
