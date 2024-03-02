import 'package:flutter/material.dart';
import 'package:playlist_app/providers/home_providers.dart';
import 'package:playlist_app/widgets/molecules/post_content.dart';
import 'package:provider/provider.dart';

class NewPlaylistContent extends StatefulWidget {
  final TabController? tabController;
  final void Function(List<Widget>) onSelectAndContinue;
  const NewPlaylistContent(
      {super.key, this.tabController, required this.onSelectAndContinue});

  @override
  State<NewPlaylistContent> createState() => _NewPlaylistContentState();
}

class _NewPlaylistContentState extends State<NewPlaylistContent> {
  bool value = false;
  List<bool> checkboxValues = [];
  List<Widget> postContentSelected = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(40, 26, 48, 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'My Content',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Upload from devices',
                    style: TextStyle(
                      color: Color.fromRGBO(223, 91, 255, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 500,
                width: 380,
                child: ListView.builder(
                    itemCount: context.watch<HomeProviders>().post.length,
                    itemBuilder: (_, index) {
                      Widget post = context.watch<HomeProviders>().post[index];
                      return itemBuilder(context, post as PostContent, index);
                    }),
              )
            ],
          ),
        ),
        checkboxValues.contains(true)
            ? Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => {
                    widget.tabController!.animateTo(1),
                    widget.onSelectAndContinue(postContentSelected)
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      //color: Colors.white,
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(127, 0, 255, 1),
                          Color.fromRGBO(223, 0, 253, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Select (${checkboxValues.where((element) => element).length}) and continue',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Widget itemBuilder(BuildContext context, PostContent post, int index) {
    while (checkboxValues.length <= index) {
      checkboxValues.add(false);
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(53, 29, 62, 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              post.image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Icon(Icons.av_timer_rounded, color: Colors.grey, size: 15),
                    Text(
                      '10 mins',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
              value: checkboxValues[index],
              onChanged: (newValue) {
                setState(() {
                  checkboxValues[index] = newValue!;
                  if (newValue) {
                    postContentSelected.insert(index, post);
                  } else {
                    postContentSelected.removeAt(index);
                  }
                });
              },
              activeColor: const Color.fromRGBO(223, 91, 255, 1),
              shape: OutlinedBorder.lerp(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                1,
              )),
        ],
      ),
    );
  }
}
