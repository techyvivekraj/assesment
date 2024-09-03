import 'package:assessment/domain/entities/cast_entities.dart';
import 'package:assessment/domain/repositories/movie_repo.dart';

class GetCast {
  final MovieRepository repository;

  GetCast(this.repository);

  Future<List<Cast>> call(int videoId) {
    return repository.getCast(videoId);
  }
}
