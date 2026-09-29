/// موديل بسيط بيمثل الخبر/المقال الواحد.
/// أي شاشة تحتاج تعرض خبر هتستخدم الكلاس ده.
class Article {
  final String title;
  final String category;
  final String author;
  final String date;
  final String imageUrl; // ممكن تبقى رابط نت أو مسار asset محلي
  final String content;
  bool isBookmarked;

  Article({
    required this.title,
    required this.category,
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.content,
    this.isBookmarked = false,
  });
}
