class MetalMemebr {
  final String email;
  final String phone;
  final String shortBio;
  final String interest;
  final String linkedin;
  final String city;
  final String state;
  final String country;

  MetalMemebr({
    required this.email,
    this.phone = "",
    this.shortBio = "",
    this.interest = "",
    this.linkedin = "",
    this.city = "",
    this.state = "",
    this.country = "",
  });
  
  factory MetalMemebr.fromJson(Map<String, dynamic> json) {
    return MetalMemebr(
      email: json['email'],
      phone: json['phone'],
      shortBio: json['shortBio'],
      interest: json['interest'],
      linkedin: json['linkedin'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }
}