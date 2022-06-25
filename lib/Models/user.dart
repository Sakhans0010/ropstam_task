class UserModel {
  int? id;
  String? userName;
  String? email;
  String? phone;
  String? userImageUrl;
  String? address;
  String? country;
  String? state;
  String? role;
  String? locationLang;
  String? locationLat;
  String? deviceToken;
  int? gender;
  int? ratingCount;
  String? rating;

  UserModel({
    this.id,
    this.userName,
    this.address,
    this.country,
    this.deviceToken,
    this.email,
    this.gender,
    this.locationLang,
    this.locationLat,
    this.phone,
    this.rating,
    this.role,
    this.state,
    this.userImageUrl,
    this.ratingCount,
  });
//gets the data into the an object from json from
  factory UserModel.fromJson(dynamic data) {
    return UserModel(
      id: data['id'],
      userName: data['userName'],
      email: data['email'],
      phone: data['mobile'],
      userImageUrl: data['image'],
      address: data['address'],
      country: data['country'],
      state: data['state'],
      role: data['role'],
      locationLang: data['lang'],
      locationLat: data['ltd'],
      gender: data['gender'],
      deviceToken: data['device_token'],
      rating: data['rating'],
      ratingCount: data['rating_count'],
    );
  }
}
