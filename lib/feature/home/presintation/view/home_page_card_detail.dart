import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/core/colors.dart';
import 'package:first_project/feature/home/data/model/books_model.dart';
import 'package:flutter/material.dart';

class HomePageCardDetail extends StatelessWidget {
  final VolumeInfo volumeInfo;
  const HomePageCardDetail({super.key, required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    final colors=AppColor();
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.5;
    final imageHeight = imageWidth * 1.5;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        title: Text('Book details', style: TextStyle(color: colors.textColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colors.secondaryColor, colors.backgroundColor],
          ),
        ),

        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colors.textColor.withOpacity(0.30),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: (volumeInfo.imageLinks?.thumbnail ?? "").replaceFirst('http://', 'https://'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              volumeInfo.title ?? "",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colors.textColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              volumeInfo.authors?.join('، ') ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.subtitleColor,fontSize: 22),
            ),
            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: colors.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors.dividerColor),
                boxShadow: [
                  BoxShadow(
                    color: colors.primaryColor.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: colors.accentColor, size: 22),
                          const SizedBox(width: 4),
                          Text(
                            "${volumeInfo.averageRating ?? '-'}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: colors.textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "rate",
                        style: TextStyle(color: colors.subtitleColor),
                      ),
                    ],
                  ),
                  Container(width: 1, height: 40, color: colors.dividerColor),
                  Column(
                    children: [
                      Text(
                        "${volumeInfo.pageCount ?? '-'}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "page",
                        style: TextStyle(color: colors.subtitleColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
