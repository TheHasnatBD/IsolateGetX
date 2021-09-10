/*
 * PROJECT: isolatetest
 * @author Abdullah Al-Hasnat
 * Created at Friday, 9/10/2021
 */

import 'package:get/get.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isolatetest/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoController extends GetxController{
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const photosApiEndPath = 'photos/';
  static const photosApiUrl = baseUrl + photosApiEndPath;

  @override
  void onInit() {
    super.onInit();
    print("------- PhotoController: onInit -------");

    // also you can get data in reactive way by using observable pattern
    // for detail, https://pub.dev/packages/get/example
    // fetchPhotos(http.Client());
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client.get(Uri.parse(photosApiUrl));
    /// Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }

  // A function that converts a response body into a List<Photo>.
  static List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  @override
  void onClose() {
    super.onClose();
    print("------- PhotoController: onClose -------");
  }


}