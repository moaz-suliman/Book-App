import 'package:first_project/core/colors.dart';
import 'package:first_project/feature/home/presintation/provider/book_provider.dart';
import 'package:first_project/feature/home/presintation/view/home_page_card_detail.dart';
import 'package:first_project/feature/home/presintation/widget/book_card.dart';
import 'package:first_project/feature/home/presintation/widget/book_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




/*
 * ============================================================
 *  HOME PAGE FLOW (Search + Provider + API)
 * ============================================================
 *
 *  1. App start:
 *     HomePageView.initState() waits for the first frame, then calls
 *     BookProvider.loadBooks(). This sets isLoading = true, so the grid
 *     shows skeleton cards while data is being fetched.
 *
 *  2. Default data:
 *     loadBooks() calls BookService.fetchBooks() with the default query
 *     ("harry potter"). The API response (JSON) is decoded into Books,
 *     and its `items` list is stored in two places:
 *       - allBooks : the original default list (kept as a backup)
 *       - books    : the list the UI actually displays
 *
 *  3. Searching:
 *     When the user types a word and presses submit, the TextField calls
 *     BookProvider.searchBooks(val). It sets isLoading = true, then calls
 *     fetchBooks(query: val) to ask the API for the new word, and stores
 *     the result in `books` (the displayed list).
 *
 *  4. Empty search:
 *     If the text is empty, searchBooks() simply restores
 *     books = allBooks, so the default "harry potter" list appears
 *     again without sending a new request.
 *
 *  5. Updating the UI:
 *     Every state change (loading, data, error) ends with
 *     notifyListeners(). The Consumer<BookProvider> in HomePageView
 *     rebuilds, showing skeletons, an error message, or the book grid.
 *
 *  6. Opening a book:
 *     Tapping a card pushes HomePageCardDetail and passes the selected
 *     book's VolumeInfo through its constructor.
 * ============================================================
 */
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BookProvider>().loadBooks();
    });
  }

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
              "home page",
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
          if (value.error != null) {
            return Center(child: Text('error: ${value.error}'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (val) async {
                    await value.searchBooks( val);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: AppColor().textColor),
                    fillColor: AppColor().secondaryColor,
                    filled: true,
                    hintText: "search",
                    hintStyle: TextStyle(
                      color: AppColor().textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: GridView.builder(
                    itemCount:value.isLoading?6:value.books.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6,
                        ),
                    itemBuilder: (context, index) {
                      if (value.isLoading) {
                        return const BookCardSkeleton();
                      }
                      final information = value.books[index].volumeInfo;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageCardDetail(
                                volumeInfo: value.books[index].volumeInfo!,
                              ),
                            ),
                          );
                        },
                        child: BookCard(
                          book:value.books[index],
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
