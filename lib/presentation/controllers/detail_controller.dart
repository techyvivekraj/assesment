import 'package:assessment/core/exceptions/date_exception.dart';
import 'package:assessment/core/exceptions/http_exception.dart';
import 'package:assessment/core/exceptions/model_serialization_exception.dart';
import 'package:assessment/domain/entities/cast_entities.dart';
import 'package:assessment/domain/entities/recommended.dart';
import 'package:assessment/domain/entities/trailer.dart';
import 'package:assessment/domain/usecases/get_cast.dart';
import 'package:assessment/domain/usecases/get_recommended.dart';
import 'package:assessment/domain/usecases/get_trailer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController {
  var trailerList = <Trailer>[].obs;
  var castList = <Cast>[].obs;
  var recommendedList = <Recommended>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final GetTrailer getTrailer;
  final GetCast getCast;
  final GetRecommended getRecommended;
  DetailController(this.getTrailer, this.getCast, this.getRecommended);

  void fettchData(int movieId) async {
    try {
      isLoading(true);
      errorMessage('');
      await fetchTrailerList(movieId);
      await fetchCastList(movieId);
      await fetchRecommendedList(movieId);
    } on HttpException catch (e) {
      errorMessage('Network error: ${e.message}');
    } on ModelSerializationException catch (e) {
      errorMessage('Data error: ${e.message}');
    } on DateCastingException catch (e) {
      errorMessage('Date error: ${e.message}');
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTrailerList(int movieId) async {
    try {
      final trailer = await getTrailer(movieId);
      trailerList.assignAll(trailer);
    } catch (e) {
      throw 'Failed to load trailer: $e';
    }
  }

  Future<void> fetchCastList(int movieId) async {
    try {
      final cast = await getCast(movieId);
      castList.assignAll(cast);
    } catch (e) {
      throw 'Failed to load cast: $e';
    }
  }

  Future<void> fetchRecommendedList(int movieId) async {
    try {
      final recommended = await getRecommended(movieId);
      recommendedList.assignAll(recommended);
    } catch (e) {
      throw 'Failed to load recommended: $e';
    }
  }

  void lauunchTrailer(Uri parse) async {
    Future.delayed(const Duration(seconds: 2)).then((val) async {
      if (!await launchUrl(parse)) {
        throw Exception('Could not launch $parse');
      }
    });
  }
}
