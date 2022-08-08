import 'dart:ui';

import 'package:flutter/material.dart';

import '../controller/movie_details_controller.dart';

class MyMovieDetails extends StatelessWidget {
  final String imbd_id;
  final MovieDetailsController _movieDetailsController =
      MovieDetailsController();
  MyMovieDetails({super.key, required this.imbd_id});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: FutureBuilder(
      future: _movieDetailsController.fetchMovieDetails(imbd_id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: (snapshot.data.poster != "N/A")
                    ? Image.network(
                        snapshot.data.poster,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image),
              ),
              Positioned.fill(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      snapshot.data.title,
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(snapshot.data.year),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(snapshot.data.rated),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(snapshot.data.runtime),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 250.0,
                          width: 190.0,
                          child: (snapshot.data.poster != "N/A")
                              ? Image.network(
                                  snapshot.data.poster,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.image),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: [
                              const Text('IMDB Rating'),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(snapshot.data.imdbRating)
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text('IMDB Vote'),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.people,
                                    color: Colors.blue,
                                  ),
                                  Text(snapshot.data.imdbVotes)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      snapshot.data.genre,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const Divider(color: Colors.white),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(snapshot.data.plot),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text('Derector : ${snapshot.data.director}'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text('Writer : ${snapshot.data.writer}'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text('Actors : ${snapshot.data.actors}'),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
