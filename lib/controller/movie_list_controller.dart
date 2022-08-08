import '../model/movie_details_model.dart';
import '../service/api_service.dart';

class MovieListController {
  late MovieDetailsModel _movieDetailsModel;
  List<MovieDetailsModel> _detailsList = List.empty(growable: true);
  final int _initial_imbdId = 10928202;
  Future fetchMovieList() async {
    try {
      _detailsList.clear();
      for (var i = _initial_imbdId; i <= _initial_imbdId + 100; i = i + 2) {
        try {
          _movieDetailsModel = await ApiService.getMovieById("tt$i");
          if (_movieDetailsModel.type == "movie") {
            _detailsList.add(_movieDetailsModel);
          }
        } catch (_) {}
      }
      //print(_movieDetailsModel);
      return _detailsList;
    } catch (_) {
      //throw Exception('invalid input');
      print(_);
    }
  }
}
