class Movie {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;
  final String backdropPath;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.backdropPath,
  });
}
