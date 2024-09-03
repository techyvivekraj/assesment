import 'package:assessment/core/constants.dart';
import 'package:assessment/core/exceptions/http_exception.dart';
import 'package:assessment/core/parser.dart';
import 'package:assessment/data/models/cast_model.dart';
import 'package:assessment/data/models/movie_model.dart';
import 'package:assessment/data/models/recommended_model.dart';
import 'package:assessment/data/models/trailer_model.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  Parser parser = Parser();

  Future<List<MovieModel>> fetchMovies(String category) async {
    final response = await http.get(
        Uri.parse('${Constants.baseUrl}$category?api_key=${Constants.apiKey}'));
    try {
      if (response.statusCode == 200) {
        return parser.parseMovies(response.body);
      } else {
        throw HttpException(
            'Failed to load $category movies', response.statusCode);
      }
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

  Future<List<TrailerModel>> fetchTrailer(int videoId) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrl}$videoId/videos?api_key=${Constants.apiKey}'));
    try {
      if (response.statusCode == 200) {
        return parser.parseTrailer(response.body);
      } else {
        throw HttpException(
            'Failed to load $videoId movies', response.statusCode);
      }
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

  Future<List<CastModel>> fetchCast(int videoId) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrl}$videoId/credits?api_key=${Constants.apiKey}'));
    try {
      if (response.statusCode == 200) {
        return parser.parseCast(response.body);
      } else {
        throw HttpException(
            'Failed to load $videoId cast', response.statusCode);
      }
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

  Future<List<RecommendedModel>> fetchRecommended(int videoId) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrl}$videoId/recommendations?api_key=${Constants.apiKey}'));
    try {
      if (response.statusCode == 200) {
        return parser.parseRecommended(response.body);
      } else {
        throw HttpException(
            'Failed to load $videoId cast', response.statusCode);
      }
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }
}
