import 'package:assessment/domain/entities/recommended.dart';
import 'package:assessment/domain/repositories/movie_repo.dart';

class GetRecommended {
  final MovieRepository repository;

  GetRecommended(this.repository);

  Future<List<Recommended>> call(int videoId) {
    return repository.getRecommended(videoId);
  }
}
