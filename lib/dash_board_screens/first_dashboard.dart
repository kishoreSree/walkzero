import 'package:flutter/material.dart';
import 'package:walkzero/dash_board_screens/camera_recognition/face_recognition_camera/camera_page.dart';
import 'package:walkzero/dash_board_screens/clients.dart';
import 'package:walkzero/dash_board_screens/employees.dart';
import 'package:walkzero/dash_board_screens/projects.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';

class DashBoard1 extends StatefulWidget {
  const DashBoard1({super.key});

  @override
  State<DashBoard1> createState() => _DashBoard1State();
}

class _DashBoard1State extends State<DashBoard1> {
  // PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  bool isExpended = true;
  static final List<Widget> _Pages = [
    Employees(),
    Projects(),
    ClientsPage(),
    CameraPage(),
    ClientsPage(),
  ];

  bottomNavigationBaritems(IconData icons, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icons,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(70),
          ),
          child: Card(
            elevation: 6,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: primaryColor,
              items: <BottomNavigationBarItem>[
                bottomNavigationBaritems(Icons.widgets, 'Home'),
                bottomNavigationBaritems(
                    Icons.emoji_people_outlined, 'Employees'),
                bottomNavigationBaritems(Icons.people, 'Vendors'),
                bottomNavigationBaritems(Icons.cases_outlined, 'Clients'),
                bottomNavigationBaritems(Icons.more, 'More'),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                // if (index == 4) {
                //   setState(() {
                //     more = true;
                //   });
                // }
              },
              selectedItemColor: secondaryColor,
              unselectedItemColor: Colors.white,
              selectedFontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
