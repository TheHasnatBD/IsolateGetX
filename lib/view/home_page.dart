/*
 * PROJECT: isolatetest
 * @author Abdullah Al-Hasnat
 * Created at Friday, 9/10/2021
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolatetest/controller/photo_controller.dart';
import 'package:isolatetest/model/photo.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  final PhotoController photoController = Get.put(PhotoController());
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Isolate Example"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photoController.fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            var photoList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: photoList.length,
              itemBuilder: (context, index) {
                final photo = photoList[index];
                return InkWell(
                    onTap: (){
                      print("ID= ${photo.id}, Title= ${photo.title}, albumId= ${photo.albumId}");
                    },
                    child: Image.network(photo.thumbnailUrl)
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}