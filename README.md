# Country Picker Plus!

[![pub package](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/1.png)](https://pub.dev/packages/country_picker_plus)

A flutter package to display list of Countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

[![GitHub watchers](https://img.shields.io/github/watchers/Yalantis/uCrop.svg?style=social&label=Watch&maxAge=2592000)](https://GitHub.com/Yalantis/uCrop/watchers/)  [![GitHub stars](https://img.shields.io/github/stars/Yalantis/uCrop.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/Yalantis/uCrop/stargazers/)  [![GitHub forks](https://img.shields.io/github/forks/Yalantis/uCrop.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/Yalantis/uCrop/network/) [![](https://jitpack.io/v/Yalantis/uCrop.svg)](https://jitpack.io/#Yalantis/uCrop) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

 
|Sample 1|Sample 2|Sample 3|
|--|--|--|
|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/1.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/2.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/3.png)
 


### Initialization

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
