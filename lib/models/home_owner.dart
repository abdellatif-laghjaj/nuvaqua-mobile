class HomeOwner {
  int? id;
  String? firstName;
  String? lastName;
  String? cin;
  String? phone;
  String? email;

  HomeOwner({
    this.id,
    this.firstName,
    this.lastName,
    this.cin,
    this.phone,
    this.email,
  });

  factory HomeOwner.fromJson(Map<String, dynamic> json) {
    return HomeOwner(
      id: json['id'] as int?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      cin: json['cin'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'cin': cin ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
    };
  }
}
