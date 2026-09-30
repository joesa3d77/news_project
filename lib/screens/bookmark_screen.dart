import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/dummy_data.dart';
import '../models/article.dart';
import '../widgets/news_card.dart';
import 'article_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late List<Article> _bookmarked =
      dummyArticles.where((a) => a.isBookmarked).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bookmark',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            Expanded(
              child: _bookmarked.isEmpty
                  ? const Center(child: Text('No bookmarks yet'))
                  : ListView.separated(
                      itemCount: _bookmarked.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final article = _bookmarked[index];
                        return Dismissible(
                          key: ValueKey(article.title),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (_) => _confirmDelete(article),
                          onDismissed: (_) => _deleteArticle(article),
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                          child: NewsCard(
                            article: article,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ArticleScreen(article: article),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(Article article) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Sure You want to delete this item?'),
        content: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(article.imageUrl,
                  width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(article.category,
                      style: const TextStyle(color: AppColors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes, Delete'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _deleteArticle(Article article) {
    setState(() {
      article.isBookmarked = false;
      _bookmarked.remove(article);
    });
  }
}
