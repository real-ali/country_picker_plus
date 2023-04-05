///Country Class
class Country {
  int? id;
  String? name;
  String? emoji;
  String? emojiU;
  String? iso2;
  String? iso3;
  String? frenchname;
  int? countrycode;
  List<Region>? state;

  ///Country Class Constractor
  Country(
      {this.id,
      this.name,
      this.emoji,
      this.emojiU,
      this.state,
      this.iso2,
      this.iso3,
      this.frenchname,
      this.countrycode});

  ///Country Class adaptar [map to json]
  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    countrycode = json['countrycode'];
    frenchname = json['frenchname'];
    if (json['state'] != null) {
      state = [];
      json['state'].forEach((v) {
        state!.add(Region.fromJson(v));
      });
    }
  }

  ///Country Class adaptar [json to map]
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['emoji'] = emoji;
    data['emojiU'] = emojiU;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['countrycode'] = countrycode;
    data['frenchname'] = frenchname;
    if (state != null) {
      data['state'] = state!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///Region Class
class Region {
  int? id;
  String? name;
  int? countryId;
  List<City>? city;

  ///Region Class constractor
  Region({this.id, this.name, this.countryId, this.city});

  ///Region Class adapter [map to json]
  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    if (json['city'] != null) {
      city = [];
      json['city'].forEach((v) {
        city!.add(City.fromJson(v));
      });
    }
  }

  ///Region Class adapter [json to map]
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    if (city != null) {
      data['city'] = city!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///city class
class City {
  int? id;
  String? name;
  int? stateId;

  ///city class constractor
  City({this.id, this.name, this.stateId});

  ///city class adapter [map to json]
  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
  }

  ///city class adapter [json to map]
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    return data;
  }
}
