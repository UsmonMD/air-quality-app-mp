class AirQualityData {
  dynamic status;
  Data? data;

  AirQualityData({this.status, this.data});

  AirQualityData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic city;
  dynamic state;
  dynamic country;
  Location? location;
  Current? current;

  Data({this.city, this.state, this.country, this.location, this.current});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Location {
  dynamic type;
  List<dynamic>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<dynamic>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Current {
  Pollution? pollution;
  Weather? weather;

  Current({this.pollution, this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    pollution = json['pollution'] != null
        ? Pollution.fromJson(json['pollution'])
        : null;
    weather =
        json['weather'] != null ? Weather.fromJson(json['weather']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pollution != null) {
      data['pollution'] = pollution!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.toJson();
    }
    return data;
  }
}

class Pollution {
  dynamic ts;
  dynamic aqius;
  dynamic mainus;
  dynamic aqicn;
  dynamic maincn;
  Pollution({this.ts, this.aqius, this.mainus, this.aqicn, this.maincn});

  Pollution.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ts'] = ts;
    data['aqius'] = aqius;
    data['mainus'] = mainus;
    data['aqicn'] = aqicn;
    data['maincn'] = maincn;
    return data;
  }
}

class Weather {
  dynamic ts;
  dynamic tp;
  dynamic pr;
  dynamic hu;
  dynamic ws;
  dynamic wd;
  dynamic ic;

  Weather({this.ts, this.tp, this.pr, this.hu, this.ws, this.wd, this.ic});

  Weather.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    tp = json['tp'];
    pr = json['pr'];
    hu = json['hu'];
    ws = json['ws'];
    wd = json['wd'];
    ic = json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ts'] = ts;
    data['tp'] = tp;
    data['pr'] = pr;
    data['hu'] = hu;
    data['ws'] = ws;
    data['wd'] = wd;
    data['ic'] = ic;
    return data;
  }
}