import 'city.dart';

class CountryState {
  final String name;
  final List cities;

  const CountryState({
    required this.name,
    this.cities = const [],
  });
  const CountryState.init({
    this.name = '',
    this.cities = const [],
  });

  CountryState copyWith(
    String? name,
    List<City>? cities,
  ) {
    return CountryState(
      name: name ?? this.name,
      cities: cities ?? this.cities,
    );
  }
}
