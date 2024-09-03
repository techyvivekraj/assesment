import 'package:assessment/domain/entities/movie_entities.dart';
import 'package:assessment/presentation/controllers/detail_controller.dart';
import 'package:assessment/presentation/widgets/cast_list_widget.dart';
import 'package:assessment/presentation/widgets/recommended_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final DetailController controller = Get.find<DetailController>();
    controller.fettchData(widget.movie.id);
    return Scaffold(
        appBar: AppBar(title: Text(widget.movie.title)),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Error: ${controller.errorMessage.value}'));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                            fit: BoxFit.cover,
                            'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}'),
                      ),
                      Positioned(
                        top: 16.0,
                        left: 16.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                            height: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Score : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${widget.movie.voteAverage}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Release Date : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(DateFormat('dd MMM yyyy')
                                  .format(widget.movie.releaseDate)),
                            ],
                          ),
                        ],
                      ),
                      Material(
                        elevation: 5.0,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            controller.lauunchTrailer(Uri.parse(
                                "https://www.youtube.com/watch?v=${controller.trailerList[0].key}"));
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Star Cast",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 160, child: buildCastList(controller)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Recommended Movies",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 160, child: buildRecommendedList(controller))
                ],
              ),
            ),
          );
        }));
  }
}
