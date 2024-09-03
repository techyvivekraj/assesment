import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assessment/presentation/widgets/get_cached_image.dart';

Widget buildHorizontalList(String title, RxList<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      SizedBox(
        height: 280,
        child: Obx(() {
          if (movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(movie: movie));
                },
                child: Container(
                  width: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 4,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: getCachedImage(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              200)),
                      Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    ],
  );
}
