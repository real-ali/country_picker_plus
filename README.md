## Country Picker Plus

A flutter package to display list of Countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

 
|Sample 1|Sample 2|Sample 3|Sample 4|
|--|--|--|--|
|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/1.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/2.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/3.png)|![image](https://github.com/real-ali/country_picker_plus/blob/main/assets/images/4.png)

## Getting Started
**STEP ONE:** Please, add `country_picker_plus` to your package dependencies:
```code
flutter pub add country_picker_plus
```
**STEP TWO:** Import the relevant package in the file you want to use: 
```dart 
import 'package:country_picker_plus/country_picker_plus.dart';
```

### How to use
The package has two methods that you can use according to your needs

1. By using the main package, all three fields, which are the country, State, and City, are created by default, and you can design them as you wish.

Sample code for this section:

```dart
CountryPickerPlus(
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
   onCountrySaved: (value) {},
   onCountrySelected: (value) {},
   onStateSelected: (value) {},
   onCitySelected: (value) {},
),
```
**Note:** You can hide each field as you wish

For Instance: 

In the main package class. Use the following property
```dart
hideFields: const [CPPInputType.city,...],
```

2. Or use each of the fields individually [`country`,`state`,`city`]

Sample code for this section:

```dart
CountryPickerPlus.country(...);
```
```dart
CountryPickerPlus.state(country:'COUNTRY_NAME',....);
```
```dart
CountryPickerPlus.city(country:'COUNTRY_NAME',state:'STATE_NAME',...);
```

And and and other features that you can play with using code... :) 

## Additional information

A Package Developed by Ali Hosseini

Please, report the bugs through the Github repository:
https://github.com/real-ali/country_picker_plus/issues