import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class NewsArticle {
  final String title;
  final String summary;
  final String source;
  final String category;
  final String publishedAgo;
  final String imageName;

  const NewsArticle({
    required this.title,
    required this.summary,
    required this.source,
    required this.category,
    required this.publishedAgo,
    required this.imageName,
  });
}

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  static const List<NewsArticle> _articles = [
    NewsArticle(
      title: '5 Top Tips To Perfect Your Lipstick Application',
      summary:
          'Need a flawless finish? We have five quick wins to help avoid application faux pas and keep color locked in.',
      source: 'Refinery29',
      category: 'Beauty',
      publishedAgo: '21 hours ago',
      imageName: AppImages.newsPlaceholder,
    ),
    NewsArticle(
      title: 'Leaders Unveil Health Care Bill To Win Over Skeptics',
      summary:
          'A new proposal aims to gather bipartisan support ahead of votes expected later this month.',
      source: 'New York Times',
      category: 'Health Care',
      publishedAgo: '30 mins ago',
      imageName: AppImages.newsPlaceholder,
    ),
    NewsArticle(
      title: 'Streaming Platforms Announce Joint Original Series',
      summary:
          'Two leading platforms collaborate on a limited series featuring an award-winning ensemble cast.',
      source: 'Variety',
      category: 'Entertainment',
      publishedAgo: '2 hours ago',
      imageName: AppImages.newsPlaceholder,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final article = _articles[index];
        return _NewsCard(article: article);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: _articles.length,
    );
  }
}

class _NewsCard extends StatelessWidget {
  final NewsArticle article;

  const _NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black12,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          debugPrint('News article tapped: ${article.title}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                article.imageName,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Theme.of(context).primaryColorDark.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        article.category,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.summary,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        article.source,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        article.publishedAgo,
                        style: const TextStyle(color: Colors.black45),
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
