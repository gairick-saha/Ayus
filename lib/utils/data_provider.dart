import 'dart:convert';

import 'package:ayus/models/appointment_model.dart';
import 'package:ayus/utils/api.dart';
import 'package:flutter/foundation.dart';

class DataProvider {
  static Future<dynamic> fetchAppointmentHistory() async {
    try {
      final response = await Api(url: 'appointment/getHistory/1').get();
      return appointmentModelFromJson(jsonEncode(response));
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<dynamic> fetchUpcomingAppointments() async {
    try {
      final response = await Api(url: 'appointment/doctor/1').get();
      return appointmentModelFromJson(jsonEncode(response));
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
