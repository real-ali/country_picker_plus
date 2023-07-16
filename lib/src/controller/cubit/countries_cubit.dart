import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/city.dart';
import '../../models/country.dart';
import '../../models/state.dart';

part 'countries_state.dart';

class CountriesBloc extends Cubit<CountriesState> {
  CountriesBloc() : super(const CountriesState.init()) {
    fetchData();
  }

  void setCountry({Country? country,String? name}) {
    if(name!=null){
      emit(state.copyWith(country: Country(name: name)));
    }
    emit(state.copyWith(country: country));
  }

  void setState({CountryState? countryState,String? name}) {
    if(name!=null){
      emit(state.copyWith(state: CountryState(name: name)));
    }
    emit(state.copyWith(state: countryState));
  }

  void setCity({City? city,String? name}) {
    if(name!=null){
      emit(state.copyWith(city: City(name: name)));
    }
    emit(state.copyWith(city: city));
  }

  List<Country> getCountries(String value) {
    try {
      final res = state.countries.where((element) =>
          element.name.toLowerCase().contains(value.toLowerCase()));
      return res.toList();
    } catch (e) {
      return [];
    }
  }

  List<CountryState>? getStates(String country, String searchValue) {
    try {
      final statesData = state.countries
          .firstWhere((element) => element.name == country)
          .states;
      final states = statesData
          .map((e) => CountryState(name: e['name'], cities: e['cities']));
      final res = states.where((element) =>
          element.name.toLowerCase().contains(searchValue.toLowerCase()));
      return res.toList();
    } catch (e) {
      return null;
    }
  }

  List<City>? getCities(
      String country, String countryState, String searchValue) {
    try {
      final stateData = getStates(country, '') ?? [];
      List cityData =
          stateData.firstWhere((e) => e.name == countryState).cities;
      final cities = cityData.map((e) => City(name: e['name']));
      final res = cities.where((element) {
        return element.name.toLowerCase().contains(searchValue.toLowerCase());
      });
      return res.toList();
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchData() async {
    emit(state.loadingState());

    try {
      var req = await rootBundle
          .loadString('packages/country_picker_plus/assets/countries.json');
      List res = await jsonDecode(req);
      if (res.isNotEmpty) {
        final countries = res.map(
          (e) => Country(
            name: e['name'],
            flag: e['emoji'],
            states: e['states'],
          ),
        );
        emit(state.copyWith(countries: countries.toList()));
      }
    } catch (e) {
      emit(
        state.errorState(
            "Faild to Load Data! Please close Your app and re-Open it"),
      );
    }
  }
}
