import 'package:flutter/material.dart';

class SelectImage extends StatefulWidget {
  final Function()? onSelectImage;
  const SelectImage({super.key, this.onSelectImage});

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Choose Playlist Thumbnail",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () => widget.onSelectImage!(),
          child: Container(
            width: 170,
            height: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(127, 0, 255, 1),
                  Color.fromRGBO(223, 0, 253, 1),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                "Upload from Device",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Select from content",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}
