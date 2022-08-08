import 'package:get/get.dart';

import '../model/search_mode_model.dart';
import '../service/api_service.dart';

class MovieSearchController extends GetxController {
  late SearchMovieModel _searchMovieModel;
  List movieList = List.empty(growable: true).obs;
  int _maxPage = 1;
  int _currentPage = 1;
  bool loadMore = false;
  Future fetchSearchMovie(String movieName) async {
    try {
      if (loadMore) {
        _currentPage++;
        if (_currentPage <= _maxPage) {
          _searchMovieModel =
              await ApiService.getMovieByName(movieName, _currentPage);
          for (var element in _searchMovieModel.search) {
            movieList.add(element);
          }
        }
      } else {
        _searchMovieModel = await ApiService.getMovieByName(movieName, 1);
        _maxPage = (int.parse(_searchMovieModel.totalResults) / 10).ceil();
        movieList.clear();
        for (var element in _searchMovieModel.search) {
          movieList.add(element);
        }
      }

      return movieList;
    } catch (_) {
      print(_);
      movieList.clear();
      //throw Exception('invalid input');
    }
  }
}
