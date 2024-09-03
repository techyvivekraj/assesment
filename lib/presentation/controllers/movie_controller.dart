import 'package:assessment/core/constants.dart';
import 'package:assessment/core/exceptions/date_exception.dart';
import 'package:assessment/core/exceptions/http_exception.dart';
import 'package:assessment/core/exceptions/model_serialization_exception.dart';
import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/domain/usecases/get_movies.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  var popularMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;
  var upcomingMovies = <Movie>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final GetMovies getMovies;

  MovieController(this.getMovies);

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      errorMessage('');
      await fetchPopularMovies();
      await fetchTopRatedMovies();
      await fetchUpcomingMovies();
    } on HttpException catch (e) {
      errorMessage('Network error: ${e.message}');
    } on ModelSerializationException catch (e) {
      errorMessage('Data error: ${e.message}');
    } on DateCastingException catch (e) {
      errorMessage('Date error: ${e.message}');
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchPopularMovies() async {
    try {
      final movies = await getMovies(Constants.popularMovie);
      popularMovies.assignAll(movies);
    } catch (e) {
      throw 'Failed to load popular movies: $e';
    }
  }

  Future<void> fetchTopRatedMovies() async {
    try {
      final movies = await getMovies(Constants.topRatedMovie);
      topRatedMovies.assignAll(movies);
    } catch (e) {
      throw 'Failed to load top-rated movies: $e';
    }
  }

  Future<void> fetchUpcomingMovies() async {
    try {
      final movies = await getMovies(Constants.upcomingMovie);
      upcomingMovies.assignAll(movies);
    } catch (e) {
      throw 'Failed to load upcoming movies: $e';
    }
  }
}
