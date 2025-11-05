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

class MovieListWidget extends StatefulWidget {

  const MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

    class _MovieListWidgetState extends State<MovieListWidget> {
      final _movies = const [
        Movie  (
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
          title: 'asd',
          description:
              'asd asdA thief who steals corporate secrets through the use of dream-sharing technology.',
          releaseDate: '2010-07-16',
        ),
      ];

      var _filteredMovies = <Movie>[];

      final _searchController = TextEditingController();

    void _searchMovies () {
      final query = _searchController.text;
      if (query.isNotEmpty) {
        _filteredMovies = _movies
            .where((Movie movie) =>
                movie.title.toLowerCase().contains( query.toLowerCase()) ||
                movie.description.contains( query) )
            .toList();
      } else {
        _filteredMovies = _movies;
      }
      setState(() {});
    }

      @override
      void initState() {
        super.initState();
        _filteredMovies = _movies;
        _searchController.addListener(_searchMovies);
      }


  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 60),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (context, index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black12.withOpacity(0.2),
                      ),
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
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
        ),

        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200]?.withAlpha(235),
          ),
        ),
      ],
    );
  }
}
