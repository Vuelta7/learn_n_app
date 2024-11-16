import 'package:flutter/material.dart';
import 'package:learn_n_app/folder.dart';
import 'package:learn_n_app/home%20page/add_folder_button_widget.dart';
import 'package:learn_n_app/home%20page/drawer_widget.dart';
import 'package:learn_n_app/home%20page/home_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbarWidget(),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              FolderDecks(title: "Python"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFolderButtonWidget(context);
        },
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
