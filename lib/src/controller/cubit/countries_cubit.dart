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

  void setCountry(Country country) {
    emit(state.copyWith(country: country));
  }

  void setState(CountryState countryState) {
    emit(state.copyWith(state: countryState));
  }

  void setCity(City city) {
    emit(state.copyWith(city: city));
  }

  void setQuery(String value) {
    emit(state.copyWith(query: value));
  }

  List<Country> getCountries() {
    try {
      final res = state.countries.where((element) => element.name
          .toLowerCase()
          .contains(state.query?.toLowerCase() ?? ''));
      return res.toList();
    } catch (e) {
      return [];
    }
  }

  List<CountryState>? getStates(String country) {
    try {
      final statesData = state.countries
          .firstWhere((element) => element.name == country)
          .states;
      final states = statesData
          .map((e) => CountryState(name: e['name'], cities: e['city']));
      final res = states.where((element) => element.name
          .toLowerCase()
          .contains(state.query?.toLowerCase() ?? ''));
      return res.toList();
    } catch (e) {
      return null;
    }
  }

  List<City>? getCities(String country, String countryState) {
    try {
      final stateData = getStates(country) ?? [];
      List cityData =
          stateData.firstWhere((e) => e.name == countryState).cities;
      final cities = cityData.map((e) => City(name: e['name']));
      final res = cities.where((element) {
        return element.name
            .toLowerCase()
            .contains(state.query?.toLowerCase() ?? '');
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
          .loadString('packages/country_picker_plus/assets/country.json');
      List res = await jsonDecode(req);
      if (res.isNotEmpty) {
        final countries = res.map(
          (e) => Country(
            name: e['name'],
            flag: e['emoji'],
            states: e['state'],
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
