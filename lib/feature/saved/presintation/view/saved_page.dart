import 'package:first_project/core/colors.dart';
import 'package:first_project/feature/home/presintation/provider/book_provider.dart';
import 'package:first_project/feature/home/presintation/view/home_page_card_detail.dart';
import 'package:first_project/feature/home/presintation/widget/book_card.dart';
import 'package:first_project/feature/saved/presintation/widget/saved_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
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
              "saved page",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lumanosimo',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<BookProvider>(
        builder: (context, value, child) {
          return 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: value.savedBooks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final information = value.savedBooks[index].volumeInfo;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageCardDetail(
                            volumeInfo: value.savedBooks[index].volumeInfo!,
                          ),
                        ),
                      );
                    },
                    child: SavedBookCard(
                      book: value.savedBooks[index],
                      title: information?.title ?? "",
                      author: information?.authors?.firstOrNull ?? "",
                      category: information?.categories?.firstOrNull ?? "",
                      pages: "${information?.pageCount ?? 0}",
                      rating: "${information?.averageRating ?? 0}",
                      cover: information?.imageLinks?.thumbnail ?? "",
                    ),
                  );
                },
              
                        ),
            );
        },
      ),
    );
  }
}
