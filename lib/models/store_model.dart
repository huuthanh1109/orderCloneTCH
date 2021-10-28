class Stores {
  List<Store> items = [];

  Stores();

  Stores.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = Store.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Store {
  String? id;
  String? name;
  String? imageUrl;
  String? phone;
  double? lat;
  double? long;
  String? openTime;
  String? closeTime;

  Store({
    this.id,
    this.name,
    this.imageUrl,
    this.phone,
     this.lat,
     this.long,
    this.openTime,
    this.closeTime,
  });
  Store.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    imageUrl = json["imageUrl"];
    phone = json["phone"];
    lat = json["lat"];
    long = json["long"];
    openTime = json["openTime"];
    closeTime = json["closeTime"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "lat": lat,
        "long": long,
        "openTime": openTime,
        "closeTime": closeTime,
        "name": name,
        "imageUrl": imageUrl,
      };
}
