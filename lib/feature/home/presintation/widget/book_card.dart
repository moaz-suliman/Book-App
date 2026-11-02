import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/core/colors.dart';
import 'package:first_project/feature/home/data/model/books_model.dart';
import 'package:first_project/feature/home/presintation/provider/book_provider.dart';
import 'package:first_project/feature/home/presintation/widget/book_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  final Items book;
  final String title;
  final String author;
  final String category;
  final String pages;
  final String rating;
  final String cover;

  const BookCard({
    super.key,
    required this.book,
    required this.author,
    required this.category,
    required this.pages,
    required this.rating,
    required this.title,
    required this.cover,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool on_pressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor().secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  child: widget.cover.isEmpty
                      ? const Icon(Icons.menu_book_rounded, size: 40)
                      : CachedNetworkImage(
                          imageUrl: widget.cover,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) =>
                              const Center(child: BookCardSkeleton()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.rating,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  width: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.read<BookProvider>().toggleSaved(widget.book);
                      setState(() {
                        on_pressed = !on_pressed;
                      });
                    },
                    icon: Icon(
                      on_pressed ? Icons.bookmark : Icons.bookmark_border,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, fontFamily: 'Lumanosimo'),
        ),
        Text(
          widget.author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13, fontFamily: 'Lumanosimo'),
        ),
        Text(
          '${widget.category}  •  ${widget.pages}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontFamily: 'Lumanosimo'),
        ),
      ],
    );
  }
}
