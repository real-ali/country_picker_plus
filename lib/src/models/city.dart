class City {
  final String name;

  const City({
    required this.name,
  });
  const City.init({
    this.name = '',
  });

  City copyWith(
    String? name,
  ) {
    return City(
      name: name ?? this.name,
    );
  }
}
