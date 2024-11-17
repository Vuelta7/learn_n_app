import 'package:flutter/material.dart';
import 'package:learn_n_app/home%20page/home_main_widget.dart';
import 'package:learn_n_app/sub%20folder%20&%20flash%20card%20list%20page/add_button_dialog_widget.dart';

PreferredSizeWidget insideFolderAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text(
      'Python',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'PressStart2P',
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.list_alt_rounded,
        size: 40,
      ),
      color: Colors.black,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.add_box_rounded,
          size: 40,
        ),
        color: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddButtonDialogWidget(),
          );
        },
      ),
    ],
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(3.0),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 4.0,
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            height: 2.0,
          ),
        ],
      ),
    ),
  );
}
