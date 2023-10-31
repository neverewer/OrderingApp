import 'package:meta/meta.dart';

@immutable
final class User implements Comparable<User> {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String address;
  final String postcode;

  const User({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.postcode,
  });

  User copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? country,
    String? city,
    String? address,
    String? postcode,
  }) {
    return User(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      postcode: postcode ?? this.postcode,
    );
  }

  String getFullAddress() => '$country, $city, $address, $postcode';

  @override
  int compareTo(User other) => compareTo(other);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! User) {
      return false;
    }
    if (other.fullName != fullName ||
        other.email != email ||
        other.phoneNumber != phoneNumber ||
        other.country != country ||
        other.city != city ||
        other.address != address ||
        other.postcode != postcode) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode =>
      fullName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      country.hashCode ^
      city.hashCode ^
      address.hashCode ^
      postcode.hashCode;
}
