import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class BookCardSkeleton extends StatelessWidget {
  const BookCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CardLoading(
            height: 200,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        SizedBox(height: 8),
        CardLoading(
          height: 16,
          width: 130,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        SizedBox(height: 6),
        CardLoading(
          height: 12,
          width: 90,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        SizedBox(height: 6),
        CardLoading(
          height: 12,
          width: 110,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ],
    );
  }
}