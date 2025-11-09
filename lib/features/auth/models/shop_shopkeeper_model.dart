class ShopShopkeeperModel {
  final String message;
  final String token;
  final Shopkeeper shopkeeper;

  ShopShopkeeperModel({
    required this.message,
    required this.token,
    required this.shopkeeper,
  });

  factory ShopShopkeeperModel.fromJson(Map<String, dynamic> json) {
    return ShopShopkeeperModel(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      shopkeeper: Shopkeeper.fromJson(json['shopkeeper']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'shopkeeper': shopkeeper.toJson(),
    };
  }
}

class Shopkeeper {
  final ShopDetails shopDetails;
  final SocialMedia socialMedia;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String profileImage;
  final String logoImage;
  final String logoText;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int v;
  final List<ShopMember> shopMembers;

  Shopkeeper({
    required this.shopDetails,
    required this.socialMedia,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.logoImage,
    required this.logoText,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.shopMembers,
  });

  factory Shopkeeper.fromJson(Map<String, dynamic> json) {
    return Shopkeeper(
      shopDetails: ShopDetails.fromJson(json['shopDetails']),
      socialMedia: SocialMedia.fromJson(json['socialMedia']),
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
      logoImage: json['logoImage'] ?? '',
      logoText: json['logoText'] ?? '',
      isActive: json['isActive'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      shopMembers: (json['shopMembers'] as List<dynamic>)
          .map((e) => ShopMember.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopDetails': shopDetails.toJson(),
      'socialMedia': socialMedia.toJson(),
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'logoImage': logoImage,
      'logoText': logoText,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'shopMembers': shopMembers.map((e) => e.toJson()).toList(),
    };
  }
}

class ShopDetails {
  final ShopAddress shopAddress;
  final String shopName;
  final String gstNumber;
  final String licenseNumber;
  final String helplineNumber;

  ShopDetails({
    required this.shopAddress,
    required this.shopName,
    required this.gstNumber,
    required this.licenseNumber,
    required this.helplineNumber,
  });

  factory ShopDetails.fromJson(Map<String, dynamic> json) {
    return ShopDetails(
      shopAddress: ShopAddress.fromJson(json['shopAddress']),
      shopName: json['shopName'] ?? '',
      gstNumber: json['gstNumber'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      helplineNumber: json['helplineNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopAddress': shopAddress.toJson(),
      'shopName': shopName,
      'gstNumber': gstNumber,
      'licenseNumber': licenseNumber,
      'helplineNumber': helplineNumber,
    };
  }
}

class ShopAddress {
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  ShopAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory ShopAddress.fromJson(Map<String, dynamic> json) {
    return ShopAddress(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
    };
  }
}

class SocialMedia {
  final String facebook;
  final String twitter;
  final String instagram;
  final String linkedin;

  SocialMedia({
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.linkedin,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      facebook: json['facebook'] ?? '',
      twitter: json['twitter'] ?? '',
      instagram: json['instagram'] ?? '',
      linkedin: json['linkedin'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facebook': facebook,
      'twitter': twitter,
      'instagram': instagram,
      'linkedin': linkedin,
    };
  }
}

class ShopMember {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isActive;
  final String id;

  ShopMember({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isActive,
    required this.id,
  });

  factory ShopMember.fromJson(Map<String, dynamic> json) {
    return ShopMember(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      isActive: json['isActive'] ?? false,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'isActive': isActive,
      '_id': id,
    };
  }
}
