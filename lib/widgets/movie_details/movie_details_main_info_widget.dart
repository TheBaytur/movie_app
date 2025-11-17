import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        SizedBox(height: 20),
        Padding(padding: EdgeInsets.all(10.0), child: _MovieNameWidget()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: _ScoreWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          child: _SummaryWidget(),
        ),

        Padding(padding: EdgeInsets.all(10.0), child: _OverviewWidget()),
        Padding(padding: EdgeInsets.all(10.0), child: _DescriptionWidget()),
        SizedBox(height: 20),
        _PeopleWidget(),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Cast out from his clan, a young Predator finds an unlikely ally in a damaged android and embarks on a treacherous journey in search of the ultimate adversary',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [Image(image: AssetImage(AppImages.actor))]);
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            
            text: 'White Scar ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: '(2010)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 5),
        Text(
          '8.8',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white60,
          ),
        ),
        Text(' User Score',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white60,
            )),

      
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      ' R, PG * 11/05/2025 * (PH) *  Action, Science Fiction, Adventure 1h 47m',
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white60,
    );
    const jobStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white60,
    );
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Director, Story', style: nameStyle),
                SizedBox(height: 10),

                Text('Dan Trachtenberg', style: nameStyle),
                SizedBox(height: 20),
                Text('Screenplay, Story', style: jobStyle),
                SizedBox(height: 10),

                Text('Jim Thomas, John Thomas', style: nameStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Characters', style: nameStyle),
                SizedBox(height: 10),
                Text('Michael Homick', style: nameStyle),
                SizedBox(height: 20),
                Text('Characters', style: jobStyle),
                SizedBox(height: 10),
                Text('Elle Fanning', style: nameStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
