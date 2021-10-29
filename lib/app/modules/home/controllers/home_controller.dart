// ignore_for_file: invalid_use_of_protected_member
import 'package:ayus/models/appointment_model.dart';
import 'package:ayus/utils/data_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool availability = false.obs;

  final RxBool isDataLoaded = false.obs;

  final RxList<AppointmentModel> upComingAppointmentList =
      <AppointmentModel>[].obs;

  final RxList<AppointmentModel> appointmentHistoryList =
      <AppointmentModel>[].obs;

  @override
  void onInit() {
    isDataLoaded(true);
    _loadData();
    super.onInit();
  }

  void _loadData() async {
    await DataProvider.fetchAppointmentHistory().then(
      (_response) {
        if (_response != null) {
          // print(_response.runtimeType);

          if (_response.runtimeType ==
              appointmentHistoryList.value.runtimeType) {
            appointmentHistoryList(_response);
          }
        }
      },
    );

    await DataProvider.fetchUpcomingAppointments().then(
      (_response) {
        if (_response != null) {
          // print(_response.runtimeType);
          if (_response.runtimeType ==
              appointmentHistoryList.value.runtimeType) {
            upComingAppointmentList(_response);
          }
        }
      },
    );

    if (appointmentHistoryList.isNotEmpty &&
        upComingAppointmentList.isNotEmpty) {
      isDataLoaded(false);
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
