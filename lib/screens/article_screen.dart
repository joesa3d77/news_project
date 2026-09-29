import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Image.network(
                article.imageUrl,
                width: double.infinity,
                height: 260,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(Icons.arrow_back, () => Navigator.pop(context)),
                    Row(
                      children: [
                        _circleIcon(Icons.bookmark_border, () {
                          article.isBookmarked = !article.isBookmarked;
                        }),
                        const SizedBox(width: 10),
                        _circleIcon(Icons.share_outlined, () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const CircleAvatar(radius: 14, backgroundColor: AppColors.background),
                    const SizedBox(width: 8),
                    Text('${article.author} · ${article.date}',
                        style: const TextStyle(color: AppColors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                Text(article.content, style: const TextStyle(height: 1.6, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: AppColors.dark, size: 20),
      ),
    );
  }
}
