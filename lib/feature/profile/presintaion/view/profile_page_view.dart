import 'package:first_project/core/colors.dart';
import 'package:flutter/material.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              "assets/images/book_logo.png",
              color: AppColor().primaryColor,
              width: 22,
              height: 20,
            ),
            const SizedBox(width: 10),
            const Text(
              "profile page",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lumanosimo',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/personImage.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'moaz ahmmed',
              style: TextStyle(color: AppColor().textColor, fontSize: 28),
            ),
            Text(
              'ahmed@example.com',
              style: TextStyle(color: AppColor().subtitleColor, fontSize: 16),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColor().cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor().dividerColor),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [Text('41'), Text('days')]),
                  Column(children: [Text('24'), Text('hours')]),
                  Column(children: [Text('81'), Text('books')]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}