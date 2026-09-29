import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/dummy_data.dart';
import '../widgets/news_card.dart';
import 'article_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = dummyArticles.first; // أول خبر بنستخدمه كبانر كبير
    final popular = dummyArticles.skip(1).take(4).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildBanner(context, banner),
          const SizedBox(height: 24),
          _buildSectionTitle('Most Popular'),
          const SizedBox(height: 12),
          ...popular.map(
            (article) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: NewsCard(
                article: article,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ArticleScreen(article: article),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Good Morning,', style: TextStyle(color: AppColors.grey)),
            Text('joe,menna',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 4),
            Text('Sun 9 April, 2023',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.wb_sunny, color: Colors.amber),
            SizedBox(width: 4),
            Text('Sunny 32°C'),
          ],
        ),
      ],
    );
  }

  Widget _buildBanner(BuildContext context, article) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ArticleScreen(article: article)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.network(
              article.imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(article.author,
                      style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text('See More', style: TextStyle(color: AppColors.primary)),
      ],
    );
  }
}
