# Country Picker Plus

A flutter package to display list of Countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

 
|Sample 1|Sample 2|Sample 3|
|--|--|--|
|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/1.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/2.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/3.png)
 


### Flutter Initialization

- ### Installation
  ```
  flutter pub add country_picker_plus
  ```
- ### Declaration
##### top of Your dart file
```
import 'package:country_picker_plus/country_picker_plus.dart';
```
- ### initialize code 
```dart
CountryPickerPlus(
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
    )
```


### Maintainer Inforamtion
###### Ali Hosseini : - s.alisinahussaini313@gmail.com
##### [More Info About Maintainer](https://real-ali.github.io)
