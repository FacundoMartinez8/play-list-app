import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playlist_app/widgets/atoms/select_image.dart';
import 'package:playlist_app/widgets/molecules/post_content.dart';

class NewPlaylistDetails extends StatefulWidget {
  final Function(File? image, String name, String description)? function;
  const NewPlaylistDetails({super.key, this.function});

  @override
  State<NewPlaylistDetails> createState() => _NewPlaylistDetailsState();
}

class _NewPlaylistDetailsState extends State<NewPlaylistDetails> {
  File? _imageFile;
  PostContent? newPost;
  String _playlistName = '';
  String _playlistDescription = '';

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          _imageFile != null
              ? Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF3f2845),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF3f2845),
                    ),
                  ),
                  child: Center(
                      child: SelectImage(
                    onSelectImage: _getImageFromGallery,
                  )
                      //selectImage(),
                      ),
                ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Playlist Name",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (value) => _playlistName = value,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: const Color(0xFF402c40),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                      0xFF554458), // Color de los bordes cuando el TextField no está enfocado
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                      0xFF554458), // Color de los bordes cuando el TextField está enfocado
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Playlist Description",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (value) => {
              _playlistDescription = value,
              widget.function!(_imageFile, _playlistName, _playlistDescription)
            },
            maxLines: 5,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: const Color(0xFF402c40),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                      0xFF554458), // Color de los bordes cuando el TextField no está enfocado
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                      0xFF554458), // Color de los bordes cuando el TextField está enfocado
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
