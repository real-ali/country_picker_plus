import 'state.dart';

class Country {
  final String name;
  final String? flag;
  final List states;

  const Country({
    required this.name,
    this.flag,
    this.states = const [],
  });
  const Country.init({
    this.name = '',
    this.flag,
    this.states = const [],
  });

  Country copyWith({
    String? name,
    String? flag,
    List<CountryState>? states,
  }) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      states: states ?? this.states,
    );
  }
}
