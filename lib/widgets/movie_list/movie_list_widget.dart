import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12.withOpacity(0.2)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Image(image: AssetImage(AppImages.console)),
                  Expanded(
                    child: Column (
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                      Text('Movie Title'),
                      SizedBox(height: 8),
                      Text('Movie Description'),
                      SizedBox(height: 5),
                      Text( 'Release Date'),
                      SizedBox(height: 5),
                      Text('Opisanie filma fdfjsjdfnsjdfnsdfnsijdfnsijdnfisjdnfisjdfnisjnfijs',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}