import 'dart:convert';
import 'package:first_project/core/secrets.dart';
import 'package:first_project/feature/home/data/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Items>> fetchBooks({String query = 'harry potter'}) async {
    final url = 'https://www.googleapis.com/books/v1/volumes'
        '?q=${Uri.encodeQueryComponent(query)}'
        '&key=${Secrets.booksApiKey}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final books = Books.fromJson(jsonDecode(response.body));
      return books.items ?? [];
    } else {
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('BODY: ${response.body}');
      throw Exception(' failed to get data : ${response.statusCode}');
    }
  }
}