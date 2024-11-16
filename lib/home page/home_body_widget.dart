import 'package:flutter/material.dart';
import 'package:learn_n_app/folder.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
            FolderDecks(title: "Python"),
          ],
        ),
      ),
    );
  }
}
