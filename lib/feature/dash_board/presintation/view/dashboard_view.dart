import 'package:first_project/feature/home/presintation/view/home_page_view.dart';
import 'package:first_project/feature/profile/presintaion/view/profile_page_view.dart';
import 'package:first_project/feature/saved/presintation/view/saved_page.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int pageNumber = 0;
  final List<Widget> pages = const [HomePageView(), SavedPage(),ProfilePageView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageNumber,children:pages,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageNumber,
        onTap: (value) {
          setState(() {
            pageNumber = value;
          });
          
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "Saved",
            activeIcon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
