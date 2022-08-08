import 'package:flutter/material.dart';
import 'movie_details_view.dart';
import '../widgets/movie_banner_tile.dart';

import '../controller/movie_list_controller.dart';

class MyMovieBannner extends StatefulWidget {
  const MyMovieBannner({super.key});

  @override
  State<MyMovieBannner> createState() => _MyMovieBannnerState();
}

class _MyMovieBannnerState extends State<MyMovieBannner>
    with AutomaticKeepAliveClientMixin<MyMovieBannner> {
  MovieListController _movieBannerController = MovieListController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _movieBannerController.fetchMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyMovieDetails(
                                    imbd_id: snapshot.data[index].imdbId,
                                  )));
                    },
                    child: MovieBannerTile(snapshot.data[index].poster));
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
