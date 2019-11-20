// To parse this JSON data, do
//
//     final hotMovieData = hotMovieDataFromJson(jsonString);

// import 'dart:convert';

// HotMovieData hotMovieDataFromJson(String str) => HotMovieData.fromJson(json.decode(str));

// String hotMovieDataToJson(HotMovieData data) => json.encode(data.toJson());

class HotMovieData {
  Rating rating;
  List<String> genres;
  String title;
  List<Cast> casts;
  List<String> durations;
  int collectCount;
  DateTime mainlandPubdate;
  bool hasVideo;
  String originalTitle;
  String subtype;
  List<Cast> directors;
  List<String> pubdates;
  String year;
  Images images;
  String alt;
  String id;

  HotMovieData({
    this.rating,
    this.genres,
    this.title,
    this.casts,
    this.durations,
    this.collectCount,
    this.mainlandPubdate,
    this.hasVideo,
    this.originalTitle,
    this.subtype,
    this.directors,
    this.pubdates,
    this.year,
    this.images,
    this.alt,
    this.id,
  });

  factory HotMovieData.fromJson(Map<String, dynamic> json) => HotMovieData(
        rating: Rating.fromJson(json["rating"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        title: json["title"],
        casts: List<Cast>.from(json["casts"].map((x) => Cast.fromJson(x))),
        durations: List<String>.from(json["durations"].map((x) => x)),
        collectCount: json["collect_count"],
        mainlandPubdate: DateTime.parse(json["mainland_pubdate"]),
        hasVideo: json["has_video"],
        originalTitle: json["original_title"],
        subtype: json["subtype"],
        directors:
            List<Cast>.from(json["directors"].map((x) => Cast.fromJson(x))),
        pubdates: List<String>.from(json["pubdates"].map((x) => x)),
        year: json["year"],
        images: Images.fromJson(json["images"]),
        alt: json["alt"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "title": title,
        "casts": List<dynamic>.from(casts.map((x) => x.toJson())),
        "durations": List<dynamic>.from(durations.map((x) => x)),
        "collect_count": collectCount,
        "mainland_pubdate":
            "${mainlandPubdate.year.toString().padLeft(4, '0')}-${mainlandPubdate.month.toString().padLeft(2, '0')}-${mainlandPubdate.day.toString().padLeft(2, '0')}",
        "has_video": hasVideo,
        "original_title": originalTitle,
        "subtype": subtype,
        "directors": List<dynamic>.from(directors.map((x) => x.toJson())),
        "pubdates": List<dynamic>.from(pubdates.map((x) => x)),
        "year": year,
        "images": images.toJson(),
        "alt": alt,
        "id": id,
      };
}

class Cast {
  Images avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  Cast({
    this.avatars,
    this.nameEn,
    this.name,
    this.alt,
    this.id,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        avatars: Images.fromJson(json["avatars"]),
        nameEn: json["name_en"],
        name: json["name"],
        alt: json["alt"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "avatars": avatars.toJson(),
        "name_en": nameEn,
        "name": name,
        "alt": alt,
        "id": id,
      };
}

class Images {
  String small;
  String large;
  String medium;

  Images({
    this.small,
    this.large,
    this.medium,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
      };
}

class Rating {
  int max;
  double average;
  Map<String, double> details;
  String stars;
  int min;

  Rating({
    this.max,
    this.average,
    this.details,
    this.stars,
    this.min,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        max: json["max"],
        average: json["average"].toDouble(),
        details: Map.from(json["details"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        stars: json["stars"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "average": average,
        "details":
            Map.from(details).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "stars": stars,
        "min": min,
      };
}
