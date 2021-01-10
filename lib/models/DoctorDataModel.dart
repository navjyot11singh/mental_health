import 'dart:convert';


class DoctorDataModel {
    String id;
    String name;
    String type;
    double rating;
    double goodreviews;
    double totalscore;
    double satisfaction;
    bool isfavourite;
    String phoneno;
    String email;
    String location;
    String category;
    String image;
    String description;

    DoctorDataModel({
        this.id,
        this.name,
        this.type,
        this.rating,
        this.goodreviews,
        this.totalscore,
        this.satisfaction,
        this.isfavourite,
        this.phoneno,
        this.email,
        this.location,
        this.category,
        this.image,
        this.description,

    });

    DoctorDataModel copyWith({
        String id,
        String name,
        String type,
        double rating,
        double goodreviews,
        double totalscore,
        double satisfaction,
        bool isfavourite,
        String phoneno,
        String email,
        String location,
        String category,
        String image,
        String description,
    }) => 
        DoctorDataModel(
            id: id ?? this.id,
            name: name ?? this.name,
            type: type ?? this.type,
            rating: rating ?? this.rating,
            goodreviews: goodreviews ?? this.goodreviews,
            totalscore: totalscore ?? this.totalscore,
            satisfaction: satisfaction ?? this.satisfaction,
            isfavourite: isfavourite ?? this.isfavourite,
            phoneno: phoneno ?? this.phoneno,
            location: location ?? this.location,
            email: email ?? this.email,
            category: category ?? this.category,
            image: image ?? this.image,
            description: description ?? this.description,

        );

    factory DoctorDataModel.fromRawJson(String str) => DoctorDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorDataModel.fromJson(Map<String, dynamic> json) => DoctorDataModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        goodreviews: json["goodreviews"] == null ? null : json["goodreviews"].toDouble(),
        totalscore: json["totalscore"] == null ? null : json["totalscore"].toDouble(),
        satisfaction: json["satisfaction"] == null ? null : json["satisfaction"].toDouble(),
        isfavourite: json["isfavourite"] == null ? null : json["isfavourite"],
        phoneno: json["phoneno"] == null ? null : json["phoneno"],
        email: json["email"] == null ? null : json["email"],
        location: json["location"] == null ? null : json["location"],
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "rating": rating == null ? null : rating,
        "goodreviews": goodreviews == null ? null : goodreviews,
        "totalscore": totalscore == null ? null : totalscore,
        "satisfaction": satisfaction == null ? null : satisfaction,
        "isfavourite": isfavourite == null ? null : isfavourite,
        "phoneno": phoneno == null ? null : phoneno,
        "email": email == null ? null : email,
        "location": location == null ? null : location,
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
    };
}
