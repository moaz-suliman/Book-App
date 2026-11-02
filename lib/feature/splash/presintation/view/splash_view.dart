import 'package:first_project/feature/dash_board/presintation/view/dashboard_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        
        MaterialPageRoute(builder: (context) =>const DashboardView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFBF9F6), Color(0xffFBF9F6), Color(0xffFFFFFF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromARGB(19, 78, 76, 76),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 10, color: Color(0xFFFFFFFF)),
                  ),
                  child: Image.asset(
                    'assets/images/folio.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Folio',
                style: TextStyle(fontFamily: 'Lumanosimo', fontSize: 28),
              ),
              SizedBox(height: 8),
              Text(
                'A QUIET PLACE TO READ',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 1.5,
                  color: Color(0x514537).withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
