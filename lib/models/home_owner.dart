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
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      cin: json['cin'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'cin': cin,
      'phone': phone,
      'email': email,
    };
  }
}
