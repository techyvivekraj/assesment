import 'package:assessment/domain/entities/trailer.dart';
import 'package:assessment/domain/repositories/movie_repo.dart';

class GetTrailer {
  final MovieRepository repository;

  GetTrailer(this.repository);

  Future<List<Trailer>> call(int videoId) {
    return repository.getTrailer(videoId);
  }
}
