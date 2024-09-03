import 'package:assessment/presentation/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:assessment/presentation/widgets/get_cached_image.dart';

Widget buildRecommendedList(DetailController controller) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: controller.recommendedList.length,
    itemBuilder: (context, index) {
      final recom = controller.recommendedList[index];
      return Container(
        // width: 150,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 4,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: getCachedImage(
                      'https://image.tmdb.org/t/p/w500${recom.posterPath}',
                      140)),
            ),
            Text(
              recom.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        ),
      );
    },
  );
}
