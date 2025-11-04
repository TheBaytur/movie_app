import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class Movie {
  final String title;
  final String description;
  final String releaseDate;
  final String imageName;

  const Movie({
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.imageName,
  });
}

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key})
      : _movies = const [
          Movie(
            imageName: AppImages.moviePlaceholder,
            title: 'Inception',
            description:
                'A thief who steals corporate secrets through the use of dream-sharing technology.',
            releaseDate: '2010-07-16',
          ),
          Movie(
            imageName: AppImages.moviePlaceholder,
            title: 'Inception',
            description:
                'A thief who steals corporate secrets through the use of dream-sharing technology.',
            releaseDate: '2010-07-16',
          ),
          Movie(
            imageName: AppImages.moviePlaceholder,
            title: 'Inception',
            description:
                'A thief who steals corporate secrets through the use of dream-sharing technology.',
            releaseDate: '2010-07-16',
          ),
          Movie(
            imageName: AppImages.moviePlaceholder,
            title: 'Inception',
            description:
                'A thief who steals corporate secrets through the use of dream-sharing technology.',
            releaseDate: '2010-07-16',
          ),
          Movie(
            imageName: AppImages.moviePlaceholder,
            title: 'Inception',
            description:
                'A thief who steals corporate secrets through the use of dream-sharing technology.',
            releaseDate: '2010-07-16',
          ),
        ];

  final List<Movie> _movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movies.length,
      itemExtent: 163,
      itemBuilder: (context, index) {
        final movie = _movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Image.asset(
                        movie.imageName,
                        width: 95,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.description,
                              style: const TextStyle(color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.releaseDate,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    print('Movie item tapped: $index');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
