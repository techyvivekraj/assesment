import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/domain/repositories/movie_repo.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call(String category) {
    return repository.getMovies(category);
  }
}
