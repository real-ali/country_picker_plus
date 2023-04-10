part of 'countries_cubit.dart';

class CountriesState {
  final List<Country> countries;
  final Country country;
  final CountryState countryState;
  final City city;
  final String? query;

  final bool isLoading;
  final bool isIdle;
  final bool hasError;
  final String error;
  final bool isLoad;

  CountriesState({
    required this.countries,
    this.isLoading = false,
    this.isIdle = false,
    this.query,
    this.hasError = false,
    this.error = '',
    this.isLoad = false,
    this.country = const Country.init(),
    this.countryState = const CountryState.init(),
    this.city = const City.init(),
  });
  const CountriesState.init({
    this.countries = const [],
    this.isLoading = false,
    this.isIdle = false,
    this.query,
    this.hasError = false,
    this.error = '',
    this.isLoad = false,
    this.country = const Country.init(),
    this.countryState = const CountryState.init(),
    this.city = const City.init(),
  });

  CountriesState copyWith({
    List<Country>? countries,
    Country? country,
    bool? isLoading,
    bool? isIdle,
    String? query,
    bool? hasError,
    String? error,
    bool? isLoad,
    CountryState? state,
    City? city,
  }) {
    return CountriesState(
      countries: countries ?? this.countries,
      country: country ?? this.country,
      isIdle: isIdle ?? this.isIdle,
      isLoad: isLoad ?? this.isLoad,
      query: query ?? this.query,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      countryState: state ?? countryState,
      city: city ?? this.city,
    );
  }

  CountriesState loadingState() {
    return CountriesState(countries: countries).copyWith(
      isLoading: true,
    );
  }

  CountriesState loadState(List<Country>? countries) {
    return CountriesState(countries: countries ?? this.countries).copyWith(
      isLoad: true,
    );
  }

  CountriesState errorState(String? error) {
    return CountriesState(countries: countries, error: error ?? this.error)
        .copyWith(
      hasError: true,
    );
  }
}
