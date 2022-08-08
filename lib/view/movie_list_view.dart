import 'package:flutter/material.dart';
import '../controller/movie_list_controller.dart';
import '../widgets/movie_text_list.dart';

import 'movie_details_view.dart';

class MyMovieList extends StatefulWidget {
  const MyMovieList({super.key});

  @override
  State<MyMovieList> createState() => _MyMovieListState();
}

class _MyMovieListState extends State<MyMovieList>
    with AutomaticKeepAliveClientMixin<MyMovieList> {
  MovieListController _movieListController = MovieListController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _movieListController.fetchMovieList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
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
                child: MovieTextList(
                    snapshot.data[index].title,
                    snapshot.data[index].year,
                    snapshot.data[index].rated,
                    snapshot.data[index].runtime,
                    snapshot.data[index].imdbRating),
              );
            },
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Text('No connection');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Text('No connection');
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
