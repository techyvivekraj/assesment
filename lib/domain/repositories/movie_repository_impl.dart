import 'package:assessment/data/sources/movie_service.dart';
import 'package:assessment/domain/entities/cast_entities.dart';
import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/domain/entities/recommended.dart';
import 'package:assessment/domain/entities/trailer.dart';
import 'package:assessment/domain/repositories/movie_repo.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<Movie>> getMovies(String category) async {
    final movieModels = await apiService.fetchMovies(category);
    return movieModels
        .map((model) => Movie(
            id: model.id,
            title: model.title,
            posterPath: model.posterPath,
            voteAverage: model.voteAverage,
            overview: model.overview,
            releaseDate: model.releaseDate,
            backdropPath: model.backdropPath))
        .toList();
  }

  @override
  Future<List<Trailer>> getTrailer(int movieId) async {
    final trailrModels = await apiService.fetchTrailer(movieId);
    return trailrModels
        .map((model) => Trailer(
            id: model.id, key: model.key, name: model.name, site: model.site))
        .toList();
  }

  @override
  Future<List<Cast>> getCast(int movieId) async {
    final castModels = await apiService.fetchCast(movieId);
    return castModels
        .map((model) => Cast(
            id: model.id,
            name: model.name.toString(),
            originalName: model.originalName.toString(),
            profilePath: model.profilePath.toString()))
        .toList();
  }

  @override
  Future<List<Recommended>> getRecommended(int movieId) async {
    final recommendedModels = await apiService.fetchRecommended(movieId);
    return recommendedModels
        .map((model) => Recommended(
              id: model.id,
              title: model.title,
              posterPath: model.posterPath,
            ))
        .toList();
  }
}
