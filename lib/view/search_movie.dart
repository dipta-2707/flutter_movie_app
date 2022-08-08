import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/movie_search_controller.dart';
import '../widgets/movie_list_tile.dart';
import 'movie_details_view.dart';

class MySearchMovie extends StatefulWidget {
  const MySearchMovie({super.key});

  @override
  State<MySearchMovie> createState() => _MySearchMovieState();
}

class _MySearchMovieState extends State<MySearchMovie>
    with AutomaticKeepAliveClientMixin<MySearchMovie> {
  final MovieSearchController movieSearchController =
      Get.put(MovieSearchController());
  late TextEditingController _searchController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  _loadMore() {
    movieSearchController.loadMore = true;
    movieSearchController.fetchSearchMovie(_searchController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xff2C3639),
              borderRadius: BorderRadius.circular(35)),
          margin: const EdgeInsets.only(
              left: 25, right: 25, top: 15.0, bottom: 25.0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _searchController,
            autocorrect: false,
            autofocus: false,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) {
              movieSearchController.loadMore = false;
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'search your movie',
                suffixIcon: IconButton(
                  onPressed: () {
                    movieSearchController.loadMore = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.search),
                )),
          ),
        ),
        (_searchController.text.isNotEmpty)
            ? Expanded(
                child: FutureBuilder(
                    future: movieSearchController
                        .fetchSearchMovie(_searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if(snapshot.hasData){
                          return Obx(() => ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: movieSearchController.movieList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyMovieDetails(
                                                imbd_id: snapshot
                                                    .data[index].imdbId,
                                              )));
                                },
                                child: MovieListTile(
                                  snapshot.data[index].title,
                                  snapshot.data[index].year,
                                  snapshot.data[index].poster,
                                ),
                              );
                            },
                          ));
                        }else{
                          return const Center(child: Text('No movie found :('));
                        }

                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              )
            : const Center(child: Text('search your movie')),
      ],
    );
  }
}
