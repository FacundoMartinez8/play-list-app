import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/molecules/create_playlist_modal.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
          32, // Valor aumentado de rojo
          25, // Valor aumentado de verde
          44, // Valor aumentado de azul
          0.9, // Opacidad
        ), // Color #160f1c con 80% de opacidad
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -1),
            blurRadius: 6.0,
          ),
        ],
      ),
      // El resto de tu código...

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => widget.onItemSelected(0),
            icon: Icon(
              Icons.home_sharp,
              color: widget.selectedIndex == 0 ? Colors.white : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () => {
              widget.onItemSelected(1),
            },
            icon: Icon(
              Icons.play_circle_fill_rounded,
              color: widget.selectedIndex == 1 ? Colors.white : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () => {
              widget.onItemSelected(2),
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return (const CreatePlaylistModal());
                },
              )
            },
            child: Container(
              width: 50,
              height:
                  50, // Asegúrate de establecer la altura para que el contenedor sea circular
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(127, 0, 255, 1),
                    Color.fromRGBO(223, 0, 253, 1),
                  ],
                ),
                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.add,
                size: 30,
                color: widget.selectedIndex == 2 ? Colors.white : Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () => widget.onItemSelected(3),
            icon: Icon(
              Icons.notifications,
              color: widget.selectedIndex == 3 ? Colors.white : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () => widget.onItemSelected(4),
            icon: Icon(
              Icons.person,
              color: widget.selectedIndex == 4 ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
