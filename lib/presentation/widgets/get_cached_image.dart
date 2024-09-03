import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget getCachedImage(String url, double height) {
  return CachedNetworkImage(
    height: height,
    imageUrl: url,
    fit: BoxFit.cover,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
