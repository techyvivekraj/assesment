import 'package:assessment/domain/entities/cast_entities.dart';
import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/domain/entities/recommended.dart';
import 'package:assessment/domain/entities/trailer.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies(String category);
  Future<List<Trailer>> getTrailer(int videoId);
  Future<List<Cast>> getCast(int videoId);
  Future<List<Recommended>> getRecommended(int videoId);
}
