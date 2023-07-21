import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:walkzero/ForReusable/ReusableContainer.dart';
import 'package:walkzero/ForReusable/onpressed.dart';
import 'package:walkzero/dash_board_screens/camera_recognition/face_recognition_camera/camera_page.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';

import '../ForReusable/reusable_shimmer.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  DateTime _currentTime = DateTime.now();
  bool isloading = true;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    loaddata();
  }

  void loaddata() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        isloading = false;
      });
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer.cancel();
  // }

  Widget clock() {
    String amPm = _currentTime.hour >= 12 ? 'PM' : 'AM';
    return Container(
      //margin: EdgeInsets.only(top: 600, left: 200),
      height: 80,
      width: 200,
      child: Column(
        children: [
          Reusableconrainers().reuasableText(
              "Today's Date:${_currentTime.day}:${_currentTime.month}:${_currentTime.year}",
              12,
              FontWeight.w500,
              Colors.black),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Reusableconrainers()
                  .reuasableText("Current Time:", 11, FontWeight.w500, null),
              Reusableconrainers().reuasableText(
                  "${_currentTime.hour}: ${_currentTime.minute}",
                  25,
                  FontWeight.w500,
                  null),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Reusableconrainers().reuasableText(
                    ": ${_currentTime.second}  ", 14, FontWeight.w600, null),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Reusableconrainers()
                    .reuasableText("${amPm}", 11, FontWeight.w400, null),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget timeContainer() {
    return Card(
      elevation: 6,
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 79, 92, 103),
            border: Border.all(
                width: 2, color: const Color.fromARGB(255, 98, 232, 103))),
        child: Center(
          child: Reusableconrainers().reuasableText(
              "${_currentTime.day}", 18, FontWeight.w600, Colors.amber),
        ),
      ),
    );
  }

  Widget firstDataShimmer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            ),
          ),
          Positioned(
            top: 10,
            left: 30,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[100]!,
                    child: CircleAvatar(
                      radius: 20,
                    )),
                const SizedBox(
                  height: 50,
                ),
                ShimmerContainer(width: 50, height: 30),
                const SizedBox(
                  height: 30,
                ),
                ShimmerContainer(width: 80, height: 30)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Firstdatas(
      Color color, String textTitle1, String textTitle2, String Imagelink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(height: 40, width: 50, child: Image.asset(Imagelink)),
              const SizedBox(
                height: 50,
              ),
              Reusableconrainers()
                  .reuasableText(textTitle1, 35, FontWeight.w600, Colors.white),
              Reusableconrainers()
                  .reuasableText(textTitle2, 15, FontWeight.w600, Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerListData(double height, double width, double radius) {
    return Column(
      children: [
        Card(
          elevation: 7,
          child: Container(
            height: height,
            width: width,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: radius,
                    child: Image.asset('assets/walkzero_logo.png'),
                  ),
                  title: Container(
                    height: 20,
                    width: 100,
                    child: Text("Hey"),
                  ),
                  subtitle: Container(
                    width: 200,
                    height: 20,
                    child: Text("Kishore"),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget circularAvathar(String Projectname, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Image.asset("assets/$imagePath"),
          ),
          Reusableconrainers()
              .reuasableText(Projectname, 13, FontWeight.w600, Colors.black),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: primaryColor,
            ),

            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  isloading
                      ? firstDataShimmer()
                      : Firstdatas(Color.fromARGB(255, 110, 188, 252), "650",
                          "Employees", "assets/employee.png"),
                  isloading
                      ? firstDataShimmer()
                      : Firstdatas(Color.fromARGB(255, 252, 148, 116), "35",
                          "Projects", "assets/suitcase.png"),
                  isloading
                      ? firstDataShimmer()
                      : Firstdatas(Color.fromARGB(255, 254, 91, 91), "128",
                          "New Employees", "assets/add-user.png"),
                  isloading
                      ? firstDataShimmer()
                      : Firstdatas(const Color.fromARGB(255, 251, 223, 123),
                          "20,250", "Earnings", "assets/dollarsymbol.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shortcuts",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: primaryColor),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  circularAvathar("Geofencing", "order-tracking.png"),
                  circularAvathar("TrackAttendance", "calendar (1).png"),
                  circularAvathar("Apply Leave", "leave (1).png"),
                  GestureDetector(
                      onTap: () {
                        onpressed().onpressed1(context, CameraPage());
                      },
                      child: circularAvathar(
                          "face Recognition", "electronics.png")),
                ],
              ),
            ),

            isloading
                ? ShimmerList(height: 1000, width: 400, radius: 20)
                : shimmerListData(1000, 400, 20),
            // SizedBox(
            //   width: 200.0,
            //   height: 100.0,
            //   child: Shimmer.fromColors(
            //     baseColor: Colors.red,
            //     highlightColor: Colors.yellow,
            //     child: Text(
            //       'Shimmer',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 40.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            //),
          ],
        ),
      ),
    );
  }
}
