import 'package:ayus/app/modules/home/views/widgets/home_appbar.dart';
import 'package:ayus/app/themes/app_theme.dart';
import 'package:ayus/app/widgets/scaffold_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Obx(
        () => controller.isDataLoaded.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (_notification) {
                  _notification.disallowGlow();
                  return true;
                },
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    const HomeAppBar(),
                    _buildContent(),
                    _buildPastHistoryList(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildUserBanner(),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'My Availability',
                    textScaleFactor: 1,
                    style: GoogleFonts.openSans().copyWith(
                      color: AppTheme.warm_grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  FlutterSwitch(
                    value: controller.availability.value,
                    onToggle: (value) {
                      controller.availability.toggle();
                      // debugPrint(value);
                    },
                    height: 25,
                    width: 50,
                    activeColor: AppTheme.kelly_green_20,
                    inactiveColor: AppTheme.kelly_green_20,
                    activeToggleColor: AppTheme.kelly_green,
                    inactiveToggleColor: AppTheme.kelly_green,
                  ),
                ],
              ),
            ),
            Divider(
              height: Get.height * 0.05,
            ),
            _buildListBanner(
              title: 'Upcoming Appointments',
            ),
            const Divider(),
            _buildUpcomingAppoitnmentList(),
            Divider(
              height: Get.height * 0.05,
            ),
            _buildListBanner(
              title: 'Past History',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserBanner() {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppTheme.white_two,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      shadowColor: AppTheme.pinkish_grey,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.02,
          right: Get.width * 0.02,
          top: Get.height * 0.01,
          bottom: Get.height * 0.01,
          // vertical:
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                debugPrint('Open Notification');
              },
              icon: SizedBox.square(
                dimension: Get.width * 0.07,
                child: Image.asset('assets/images/bell.png'),
              ),
            ),
            Text(
              'Hi, Dr. Singh',
              textScaleFactor: 1,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
              ).copyWith(
                color: AppTheme.mid_blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/images/demo_user.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListBanner({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textScaleFactor: 1,
            style: GoogleFonts.openSans().copyWith(
              color: AppTheme.greyish_brown,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint('viewAll');
            },
            child: Text(
              'View All',
              textScaleFactor: 1,
              style: GoogleFonts.openSans().copyWith(
                color: AppTheme.dodger_blue,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppoitnmentList() {
    final DateFormat _dateFormatter = DateFormat('dd-MM-yyyy');
    final DateFormat _timeFormatter = DateFormat('HH:mm');
    return SizedBox(
      height: Get.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        itemCount: controller.upComingAppointmentList.length,
        separatorBuilder: (_, __) => SizedBox(
          width: Get.width * 0.02,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Theme.of(context).primaryColor,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: Get.width * 0.50,
              height: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05,
                  vertical: Get.height * 0.03,
                ),
                child: _buildUpcomingAppoitnmentListCardChild(
                  name:
                      "${controller.upComingAppointmentList[index].patientDetails?.firstName ?? ''} ${controller.upComingAppointmentList[index].patientDetails?.lastName ?? ''}",
                  gender: controller.upComingAppointmentList[index]
                          .patientDetails?.gender ??
                      "",
                  age: controller.upComingAppointmentList[index].patientDetails
                              ?.dateOfBirth ==
                          null
                      ? 0
                      : controller.calculateAge(
                          controller.upComingAppointmentList[index]
                              .patientDetails!.dateOfBirth!,
                        ),
                  date: controller.upComingAppointmentList[index].date == null
                      ? ""
                      : _dateFormatter.format(
                          controller.upComingAppointmentList[index].date!,
                        ),
                  time: controller.upComingAppointmentList[index].date == null
                      ? ""
                      : _timeFormatter.format(
                          controller.upComingAppointmentList[index].date!,
                        ),
                  callButtonhint: "Start Call",
                  profileButtonHint: "Profile",
                  onCallButtonPressed: () {
                    debugPrint('startCall');
                  },
                  onProfileButtonPressed: () {
                    debugPrint('open Profile');
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpcomingAppoitnmentListCardChild({
    required String name,
    required String gender,
    required int age,
    required String date,
    required String time,
    required String callButtonhint,
    required String profileButtonHint,
    required VoidCallback onCallButtonPressed,
    required VoidCallback onProfileButtonPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              textScaleFactor: 1,
              style: GoogleFonts.roboto().copyWith(
                color: AppTheme.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.5,
              ),
            ),
            Divider(
              height: Get.height * 0.005,
            ),
            Text(
              '$gender, $age Years',
              textScaleFactor: 1,
              style: GoogleFonts.openSans().copyWith(
                color: AppTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        // const Divider(),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildUpcomingAppoitnmentListCardButton(
                text: date,
                hintText: callButtonhint,
                onButtonPressed: onCallButtonPressed,
                buttonIcon: 'assets/images/video_call.png',
              ),
            ),
            SizedBox.square(
              dimension: Get.width * 0.1,
            ),
            Expanded(
              flex: 1,
              child: _buildUpcomingAppoitnmentListCardButton(
                text: time,
                hintText: profileButtonHint,
                onButtonPressed: onProfileButtonPressed,
                buttonIcon: 'assets/images/contact.png',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUpcomingAppoitnmentListCardButton({
    required String text,
    required String hintText,
    required VoidCallback onButtonPressed,
    required String buttonIcon,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          textScaleFactor: 1,
          style: GoogleFonts.openSans().copyWith(
            color: AppTheme.white,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        MaterialButton(
          onPressed: onButtonPressed,
          color: AppTheme.mid_blue,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          child: SizedBox.square(
            dimension: 18,
            child: Image.asset(
              buttonIcon,
              scale: 1,
            ),
          ),
        ),
        Text(
          hintText,
          textScaleFactor: 1,
          style: GoogleFonts.openSans().copyWith(
            color: AppTheme.white,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildPastHistoryList() {
    final DateFormat _formatter = DateFormat('dd MMM yyyy');
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).primaryColor,
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: double.maxFinite,
                // height: Get.height * 0.13,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.05,
                    vertical: Get.height * 0.03,
                  ),
                  child: _buildPastHistoryListCardChild(
                    name:
                        "${controller.appointmentHistoryList[index].patientDetails?.firstName ?? ''} ${controller.appointmentHistoryList[index].patientDetails?.lastName ?? ''}",
                    gender: controller.appointmentHistoryList[index]
                            .patientDetails?.gender ??
                        "",
                    age: controller.appointmentHistoryList[index].patientDetails
                                ?.dateOfBirth ==
                            null
                        ? 0
                        : controller.calculateAge(
                            controller.appointmentHistoryList[index]
                                .patientDetails!.dateOfBirth!,
                          ),
                    date: controller.appointmentHistoryList[index].date == null
                        ? ""
                        : _formatter.format(
                            controller.appointmentHistoryList[index].date!,
                          ),
                  ),
                ),
              ),
            );
          },
          childCount: controller.appointmentHistoryList.length,
        ),
      ),
    );
  }

  Widget _buildPastHistoryListCardChild({
    required String name,
    required String gender,
    required int age,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          textScaleFactor: 1,
          style: GoogleFonts.roboto().copyWith(
            color: AppTheme.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.5,
          ),
        ),
        Divider(
          height: Get.height * 0.005,
        ),
        Text(
          '$gender, $age Years',
          textScaleFactor: 1,
          style: GoogleFonts.openSans().copyWith(
            color: AppTheme.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date of Last Consultation:',
              textScaleFactor: 1,
              style: GoogleFonts.roboto().copyWith(
                color: AppTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              date,
              textScaleFactor: 1,
              style: GoogleFonts.roboto().copyWith(
                color: AppTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
