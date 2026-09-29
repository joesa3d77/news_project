import '../models/article.dart';

/// بيانات وهمية (Fake Data) بنستخدمها عشان نجرب الشكل بسرعة
/// من غير ما نحتاج نعمل ربط مع سيرفر أو API حقيقي.
///
/// لما يبقى عندك API حقيقي، هتستبدل الليست دي بكول للـ API
/// وترجع بيانات من نفس نوع Article.
final List<Article> dummyArticles = [
  Article(
    title: "Experience the Serenity of Japan's Traditional Countryside",
    category: "Travel",
    author: "Luc Olinga",
    date: "Apr 9, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=800",
    content:
        "Japan's countryside offers a peaceful escape from the busy city life, "
        "with traditional wooden houses, quiet rice fields, and ancient shrines "
        "hidden between the mountains...",
    isBookmarked: false,
  ),
  Article(
    title: "The Pros and Cons of Remote Work",
    category: "Technology",
    author: "Sarah Ahmed",
    date: "Apr 8, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    content:
        "Remote work changed the way people think about productivity and "
        "work-life balance. In this article we explore the biggest advantages "
        "and challenges of working from home...",
    isBookmarked: false,
  ),
  Article(
    title: "The Pros and Cons of Remote Work (Part 2)",
    category: "Technology",
    author: "Sarah Ahmed",
    date: "Apr 8, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800",
    content:
        "Continuing our discussion about remote work, this part focuses on "
        "team communication and how companies keep employees connected...",
    isBookmarked: false,
  ),
  Article(
    title: "How to Setup Your Workspace",
    category: "Interior",
    author: "Mona Khaled",
    date: "Apr 5, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=800",
    content: "A good workspace setup can boost your focus and comfort...",
    isBookmarked: true,
  ),
  Article(
    title: "Discovering Hidden Gems: 8 Off-The-Beaten-Path Destinations",
    category: "Travel",
    author: "Omar Adel",
    date: "Apr 3, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1500534623283-312aade485b7?w=800",
    content: "Away from the crowded tourist spots, these destinations offer "
        "authentic and unforgettable experiences...",
    isBookmarked: true,
  ),
  Article(
    title: "Exploring the World's Best Beaches: Top 5 Picks",
    category: "Travel",
    author: "Yara Samir",
    date: "Apr 1, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
    content: "From the Maldives to Bali, here are the beaches that should be "
        "on every traveler's bucket list...",
    isBookmarked: true,
  ),
  Article(
    title: "Travel Destinations That Won't Break the Bank",
    category: "Travel",
    author: "Ali Hassan",
    date: "Mar 29, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800",
    content: "Traveling on a budget doesn't mean sacrificing the experience, "
        "here are affordable destinations worth visiting...",
    isBookmarked: true,
  ),
  Article(
    title: "How Working Remotely Will Make You More Happy",
    category: "Business",
    author: "Nour Mostafa",
    date: "Mar 27, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=800",
    content: "Studies show a strong link between remote work flexibility and "
        "overall employee happiness and satisfaction...",
    isBookmarked: true,
  ),
  Article(
    title: "Destinations for Authentic Local Experiences",
    category: "Business",
    author: "Karim Fathy",
    date: "Mar 25, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=800",
    content: "Skip the tourist traps and dive into real local culture with "
        "these recommended experiences...",
    isBookmarked: true,
  ),
  Article(
    title: "A Guide to Seasonal Gardening",
    category: "Travel",
    author: "Salma Adel",
    date: "Mar 22, 2023",
    imageUrl:
        "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800",
    content: "Learn how to plan your garden according to each season for the "
        "best results all year round...",
    isBookmarked: true,
  ),
];
