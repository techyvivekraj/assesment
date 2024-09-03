import 'package:assessment/presentation/controllers/movie_controller.dart';
import 'package:assessment/presentation/widgets/movie_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find<MovieController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage.value}'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              buildHorizontalList('Popular Movies', controller.popularMovies),
              buildHorizontalList(
                  'Top Rated Movies', controller.topRatedMovies),
              buildHorizontalList('Upcoming Movies', controller.upcomingMovies),
            ],
          ),
        );
      }),
    );
  }
}
