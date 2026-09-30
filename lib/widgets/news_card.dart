import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final double imageSize;

  const NewsCard({
    super.key,
    required this.article,
    required this.onTap,
    this.imageSize = 90,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              article.imageUrl,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: imageSize,
                height: imageSize,
                color: AppColors.background,
                child: const Icon(Icons.image_not_supported_outlined,
                    color: AppColors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  article.category,
                  style: const TextStyle(color: AppColors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
