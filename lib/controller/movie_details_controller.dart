import '../model/movie_details_model.dart';
import '../service/api_service.dart';

class MovieDetailsController {
  late MovieDetailsModel _movieDetailsModel;
  List detailsList = List.empty();
  Future fetchMovieDetails(String imdbId) async {
    try {
      _movieDetailsModel = await ApiService.getMovieById(imdbId);

      //print(_movieDetailsModel);
      return _movieDetailsModel;
    } catch (_) {
      //throw Exception('invalid input');
      print(_);
    }
  }
}
