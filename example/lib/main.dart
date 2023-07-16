import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounteyPickerPlusView(),
    ),
  );
}

class CounteyPickerPlusView extends StatelessWidget {
  CounteyPickerPlusView({super.key});

  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    var fieldDecoration = CPPFDecoration(
      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      margin: const EdgeInsets.all(10),
      suffixColor: Colors.deepOrangeAccent,
      innerColor: Colors.deepOrangeAccent.withOpacity(0.06),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.deepOrangeAccent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.deepOrangeAccent.withOpacity(0.2)),
      ),
    );
    final bottomSheetDecoration = CPPBSHDecoration(
      closeColor: Colors.deepOrangeAccent,
      itemDecoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.03),
        borderRadius: BorderRadius.circular(8),
      ),
      itemsPadding: const EdgeInsets.all(8),
      itemsSpace: const EdgeInsets.symmetric(vertical: 4),
      itemTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.withOpacity(0.1)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
    final searchDecoration = CPPSFDecoration(
      height: 45,
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      filled: true,
      margin: const EdgeInsets.symmetric(vertical: 8),
      hintStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      searchIconColor: Colors.white,
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      innerColor: Colors.deepOrangeAccent,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      persistentFooterButtons: [
        Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: _onSubmit,
              child: const Text("Submit Data")),
        )
      ],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Country Picker Plus"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CountryPickerPlus(
              // hideFields: true,
              isRequired: true,
              countryLabel: "Country",
              countrySearchHintText: "Search Country",
              countryHintText: "Tap to Select Country",
              stateLabel: "State",
              stateHintText: "Tap to Select State",
              cityLabel: "City",
              cityHintText: "Tap to Select City",
              bottomSheetDecoration: bottomSheetDecoration,
              decoration: fieldDecoration,
              searchDecoration: searchDecoration,
              onCountrySaved: (value) {
                print(value);
              },
              onCitySaved: (value) {
                print(value);
              },
              onStateSaved: (value) {
                print(value);
              },
              onCountrySelected: (value) {
                print(value);
              },
              onStateSelected: (value) {
                print(value);
              },
              onCitySelected: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
