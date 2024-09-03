import 'package:assessment/data/sources/movie_service.dart';
import 'package:assessment/domain/repositories/movie_repository_impl.dart';
import 'package:assessment/domain/usecases/get_cast.dart';
import 'package:assessment/domain/usecases/get_movies.dart';
import 'package:assessment/domain/usecases/get_recommended.dart';
import 'package:assessment/domain/usecases/get_trailer.dart';
import 'package:assessment/presentation/controllers/detail_controller.dart';
import 'package:assessment/presentation/controllers/movie_controller.dart';
import 'package:assessment/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  final movieApiService = MovieApiService();
  final movieRepository = MovieRepositoryImpl(movieApiService);
  final getMovies = GetMovies(movieRepository);
  final getTraier = GetTrailer(movieRepository);
  final getCast = GetCast(movieRepository);
  final getRecommended = GetRecommended(movieRepository);

  Get.put(MovieController(getMovies));
  Get.put(DetailController(getTraier, getCast, getRecommended));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Movies App',
      home: HomePage(),
    );
  }
}
