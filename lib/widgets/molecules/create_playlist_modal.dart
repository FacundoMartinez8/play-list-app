import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:playlist_app/providers/home_providers.dart';
import 'package:playlist_app/widgets/atoms/new_playlist.details.dart';
import 'package:playlist_app/widgets/atoms/new_playlist_content.dart';
import 'package:playlist_app/widgets/molecules/post_content.dart';
import 'package:provider/provider.dart';

class CreatePlaylistModal extends StatefulWidget {
  const CreatePlaylistModal({super.key});

  @override
  State<CreatePlaylistModal> createState() => _CreatePlaylistModalState();
}

class _CreatePlaylistModalState extends State<CreatePlaylistModal>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController? tabController = TabController(length: 3, vsync: this);

    File? imageFile;
    PostContent? newPost;
    String playlistDescription = '';
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(40, 26, 48, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 55,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Create New Playlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  newPost = PostContent(
                    date: DateFormat('dd/MM/yy').format(DateTime.now()),
                    image: imageFile,
                    like: 100,
                    mostLiked: false,
                    description: playlistDescription,
                    id: 'ZZZ999',
                  );
                  context.read<HomeProviders>().addPost(newPost!);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color.fromRGBO(223, 91, 255, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TabBar(
            controller: tabController,
            indicatorColor: const Color.fromRGBO(223, 91, 255, 1),
            labelColor: const Color.fromRGBO(223, 91, 255, 1),
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                child: Text(
                  'Content',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
            dividerColor: const Color(0xFF3f2845),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                NewPlaylistContent(
                  tabController: tabController,
                  onSelectAndContinue: (List<Widget> postContentSelected) {
                    // print(postContentSelected.length);
                  },
                ),
                NewPlaylistDetails(
                    function: (File? image, String name, String description) {
                  imageFile = image;
                  playlistDescription = description;
                }),
                const Center(
                  child: Text('Contenido del Item 3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
