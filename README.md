## Country Picker Plus
 A flutter package to display list of Countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

 <div style="text-align:center">
<table>
<tr>
<td><img src="https://github.com/real-ali/country_picker_plus/blob/main/assets/images/1.png" alt="image 1" width="240"/></td>
<td><img src="https://github.com/real-ali/country_picker_plus/blob/main/assets/images/2.png.png"  alt="image 2" width="240"/></td>
<td><img src="https://github.com/real-ali/country_picker_plus/blob/main/assets/images/3.png"  alt="image 2" width="240"/></td>

### Sample Example to describe this Package

```dart
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

```

</tr>
</table>
</div>

## Maintainers
* Ali Hosseini
