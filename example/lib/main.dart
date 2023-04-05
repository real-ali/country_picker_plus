import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Picker plus',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CountryPickerPlusPage(
        title: 'Country Picker plus',
      ),
    );
  }
}

class CountryPickerPlusPage extends StatefulWidget {
  final String title;

  const CountryPickerPlusPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _CountryPickerPlusPageState();
}

class _CountryPickerPlusPageState extends State<CountryPickerPlusPage> {
  String? _countryValue = "";
  String? _stateValue = "";
  String? _cityValue = "";
  String? _address = "";

  void _onCountryChangeHandler(String value) {
    setState(() {
      ///store value in country variable
      _countryValue = value;
    });
  }

  void _onStateChangeHandler(String? value) {
    setState(() {
      _stateValue = value;
    });
  }

  void _onCityChangeHandler(String? value) {
    setState(() {
      _cityValue = value;
    });
  }

  void _onPrintHandler() {
    setState(() {
      _address = "$_cityValue, $_stateValue, $_countryValue";
    });
  }

  @override
  Widget build(BuildContext context) {
    const listItemStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
    );
    const searchFiedlDecoration = InputDecoration(
      prefixIconColor: Colors.orange,
    );
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
    var bottomSheetStyle = BottomSheetStyle(
      shape: outlineInputBorder,
    );
    const selectedItemStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
    );
    final disabledDropdownDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade300,
        border: Border.all(color: Colors.grey.shade300, width: 1));
    final dropdownDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1));
    final countryPickerPlus = CountryPickerPlus(
      showStates: true,
      showCities: false,
      flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
      dropdownDecoration: dropdownDecoration,
      disabledDropdownDecoration: disabledDropdownDecoration,
      countryDropdownLabel: "Country",
      stateDropdownLabel: "State",
      cityDropdownLabel: "City",
      selectedItemStyle: selectedItemStyle,
      bottomSheetStyle: bottomSheetStyle,
      searchFiedlDecoration: searchFiedlDecoration,
      listItemStyle: listItemStyle,
      dropdownDialogRadius: 10.0,
      searchBarRadius: 10.0,
      onCountryChanged: _onCountryChangeHandler,
      onStateChanged: _onStateChangeHandler,
      onCityChanged: _onCityChangeHandler,
    );
    final printButton = TextButton(
      onPressed: _onPrintHandler,
      child: const Text("Print Data"),
    );
    final address = Text(_address ?? '');

    final body = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 600,
      child: Column(
        children: [
          countryPickerPlus,
          printButton,
          address,
        ],
      ),
    );
    final appBar = AppBar(
      title: Text(widget.title),
    );
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
