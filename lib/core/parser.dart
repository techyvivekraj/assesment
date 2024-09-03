import 'dart:convert';
import 'package:assessment/core/exceptions/date_exception.dart';
import 'package:assessment/core/exceptions/model_serialization_exception.dart';
import 'package:assessment/data/models/cast_model.dart';
import 'package:assessment/data/models/movie_model.dart';
import 'package:assessment/data/models/recommended_model.dart';
import 'package:assessment/data/models/trailer_model.dart';

class Parser {
  List<MovieModel> parseMovies(String responseBody) {
    try {
      final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
      return (parsed['results'] as List)
          .map<MovieModel>((json) => MovieModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ModelSerializationException('Failed to parse movies: $e');
    }
  }

  List<TrailerModel> parseTrailer(String responseBody) {
    try {
      final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
      return (parsed['results'] as List)
          .map<TrailerModel>((json) => TrailerModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ModelSerializationException('Failed to parse trailer: $e');
    }
  }

  List<CastModel> parseCast(String responseBody) {
    try {
      final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
      return (parsed["cast"] as List)
          .map<CastModel>((json) => CastModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ModelSerializationException('Failed to parse cast: $e');
    }
  }

  List<RecommendedModel> parseRecommended(String responseBody) {
    try {
      final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
      return (parsed['results'] as List)
          .map<RecommendedModel>((json) => RecommendedModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ModelSerializationException('Failed to parse movies: $e');
    }
  }

  static DateTime parseDate(String? dateString) {
    try {
      if (dateString == null || dateString.isEmpty) {
        throw DateCastingException('Date string is null or empty');
      }
      return DateTime.parse(dateString);
    } catch (e) {
      throw DateCastingException('Failed to parse date: $e');
    }
  }
}
