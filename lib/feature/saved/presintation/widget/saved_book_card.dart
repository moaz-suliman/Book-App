import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/core/colors.dart';
import 'package:first_project/feature/home/data/model/books_model.dart';
import 'package:first_project/feature/home/presintation/widget/book_card_skeleton.dart';
import 'package:flutter/material.dart';

class SavedBookCard extends StatefulWidget {
  final Items book;
  final String title;
  final String author;
  final String category;
  final String pages;
  final String rating;
  final String cover;

  const SavedBookCard({
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
  State<SavedBookCard> createState() => _BookCardState();
}

class _BookCardState extends State<SavedBookCard> {
  bool on_pressed=false;
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
