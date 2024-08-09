class HomeOwner {
  int id;
  String firstName;
  String lastName;
  String cin;
  String phone;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<WaterMeter> waterMeters;
  List<Reclamation> reclamations;

  HomeOwner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.cin,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.waterMeters,
    required this.reclamations,
  });

  static fromJson(Map<String, dynamic> json) {
    return HomeOwner(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      cin: json['cin'],
      phone: json['phone'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'],
      waterMeters: json['waterMeters']
          .map<WaterMeter>((meter) => WaterMeter(
                id: meter['id'],
                meterNumber: meter['meterNumber'],
                ownerId: meter['ownerId'],
                consumptionTypeId: meter['consumptionTypeId'],
                locationId: meter['locationId'],
                installationDate: DateTime.parse(meter['installationDate']),
                createdAt: DateTime.parse(meter['createdAt']),
                updatedAt: DateTime.parse(meter['updatedAt']),
                deletedAt: meter['deletedAt'],
              ))
          .toList(),
      reclamations: json['reclamations']
          .map<Reclamation>((reclamation) => Reclamation(
                id: reclamation['id'],
                ownerId: reclamation['ownerId'],
                subject: reclamation['subject'],
                message: reclamation['message'],
                status: reclamation['status'],
                createdAt: DateTime.parse(reclamation['createdAt']),
                updatedAt: DateTime.parse(reclamation['updatedAt']),
                deletedAt: reclamation['deletedAt'],
              ))
          .toList(),
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt,
      'waterMeters': waterMeters.map((meter) => meter.toJson()).toList(),
      'reclamations':
          reclamations.map((reclamation) => reclamation.toJson()).toList(),
    };
  }
}

class Reclamation {
  int id;
  int ownerId;
  String subject;
  String message;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Reclamation({
    required this.id,
    required this.ownerId,
    required this.subject,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'subject': subject,
      'message': message,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return Reclamation(
      id: json['id'],
      ownerId: json['ownerId'],
      subject: json['subject'],
      message: json['message'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'],
    );
  }
}

class WaterMeter {
  int id;
  int meterNumber;
  int ownerId;
  int consumptionTypeId;
  int locationId;
  DateTime installationDate;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  WaterMeter({
    required this.id,
    required this.meterNumber,
    required this.ownerId,
    required this.consumptionTypeId,
    required this.locationId,
    required this.installationDate,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meterNumber': meterNumber,
      'ownerId': ownerId,
      'consumptionTypeId': consumptionTypeId,
      'locationId': locationId,
      'installationDate': installationDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return WaterMeter(
      id: json['id'],
      meterNumber: json['meterNumber'],
      ownerId: json['ownerId'],
      consumptionTypeId: json['consumptionTypeId'],
      locationId: json['locationId'],
      installationDate: DateTime.parse(json['installationDate']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'],
    );
  }
}
