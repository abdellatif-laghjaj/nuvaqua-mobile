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
}
