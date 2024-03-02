import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playlist_app/providers/home_providers.dart';
import 'package:playlist_app/widgets/atoms/most_liked.dart';
import 'package:playlist_app/widgets/molecules/modal_option_post.dart';

class PostContent extends StatelessWidget {
  final String id;
  final dynamic image;
  final String date;
  final bool mostLiked;
  final double like;
  final String description;

  const PostContent({
    super.key,
    required this.image,
    required this.date,
    required this.mostLiked,
    required this.like,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    void onPostContentTap(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return (const ModalOptionPost());
        },
      );
    }

    return GestureDetector(
      onTap: () => onPostContentTap(context),
      child: Container(
        color: const Color.fromRGBO(40, 7, 39, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 180,
              height: 250,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: image is File
                        ? Image.file(image as File)
                        : Image.asset(
                            image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: MostLiked(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            '${like.toString()}K',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: Colors.transparent,
                width: 180,
                child: Text(
                  description,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
