// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

List<AppointmentModel> appointmentModelFromJson(String str) =>
    List<AppointmentModel>.from(
        json.decode(str).map((x) => AppointmentModel.fromJson(x)));

String appointmentModelToJson(List<AppointmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentModel {
  AppointmentModel({
    this.id,
    this.doctor,
    this.patientDetails,
    this.date,
    this.type,
    this.prescription,
    this.description,
    this.status,
  });

  int? id;
  dynamic doctor;
  User? patientDetails;
  DateTime? date;
  dynamic type;
  Prescription? prescription;
  String? description;
  String? status;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        id: json["id"] == null ? null : json["id"]!,
        doctor: json["doctorSelectViewModel"] == null
            ? null
            : json["doctorSelectViewModel"]!,
        patientDetails: json["patientBasicViewModel"] == null
            ? null
            : User.fromJson(json["patientBasicViewModel"]!),
        date: json["date"] == null ? null : DateTime.parse(json["date"]!),
        type: json["type"] == null ? null : json["type"]!,
        prescription: json["prescription"] == null
            ? null
            : Prescription.fromJson(json["prescription"]),
        description: json["description"] == null ? null : json["description"]!,
        status: json["status"] == null ? null : json["status"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "patientBasicViewModel":
            patientDetails == null ? null : patientDetails!.toJson(),
        "date": date == null ? null : date!.toIso8601String(),
        "prescription": prescription == null ? null : prescription!.toJson(),
        "description": description == null ? null : description!,
        "status": status == null ? null : status!,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dateOfBirth;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "firstName": firstName == null ? null : firstName!,
        "lastName": lastName == null ? null : lastName!,
        "gender": gender == null ? null : gender!,
        "dateOfBirth":
            dateOfBirth == null ? null : dateOfBirth!.toIso8601String(),
      };
}

class Prescription {
  Prescription({
    this.id,
    this.diagnosis,
    this.recommendation,
    this.comments,
    this.reportsNeeded,
    this.privateNotes,
  });

  int? id;
  String? diagnosis;
  String? recommendation;
  String? comments;
  String? reportsNeeded;
  String? privateNotes;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        diagnosis: json["diagnosis"],
        recommendation: json["recommendation"],
        comments: json["comments"],
        reportsNeeded: json["reports_needed"],
        privateNotes: json["privateNotes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "diagnosis": diagnosis == null ? null : diagnosis!,
        "recommendation": recommendation == null ? null : recommendation!,
        "comments": comments == null ? null : comments!,
        "reports_needed": reportsNeeded == null ? null : reportsNeeded!,
        "privateNotes": privateNotes == null ? null : privateNotes!,
      };
}
