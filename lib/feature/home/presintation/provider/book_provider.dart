import 'package:first_project/feature/home/data/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:first_project/feature/home/data/model/books_model.dart';

class BookProvider extends ChangeNotifier {
  final BookService _service = BookService();

  List<Items> allBooks = [];
  List<Items> books = [];
  bool isLoading = true;
  String? error;

final List<Items> savedBooks = [];

  bool isSaved(Items book) {
    for (final b in savedBooks) {
      if (b.id == book.id) {
        return true;
      }
    }
    return false;
  }

  void toggleSaved(Items book) {
    if (isSaved(book)) {
      savedBooks.removeWhere((b) => b.id == book.id);
    } else {
      savedBooks.add(book);
    }
    notifyListeners();
  }

  Future<void> loadBooks() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      allBooks = await _service.fetchBooks();
      books = allBooks;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> searchBooks(String val) async {
    isLoading = true;
    error = null;
    notifyListeners();
    final text = val.trim().toLowerCase();

    if (text.isEmpty) {
      books = allBooks;
    } else {
      try {
        books = await _service.fetchBooks(query: val);
      } catch (e) {
        error = e.toString();
      }
    }
    isLoading = false;
    error = null;
    notifyListeners();
  }
}
