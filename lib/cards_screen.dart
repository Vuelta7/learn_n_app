import 'package:flutter/material.dart';
import 'package:learn_n_app/home_screen.dart';
import 'package:learn_n_app/question_card.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Java',
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
              print('Notification button pressed');
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
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              QuestionCard(
                title: "What is Flutter?",
                backContent:
                    "Flutter is an open-source UI software development toolkit created by Google.",
              ),
              QuestionCard(
                title: "What is programming?",
                backContent: "ewan diko alam",
              ),
              QuestionCard(
                title: "What is love?",
                backContent: "si august",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.black,
            height: 4.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 3.0,
                height: 40.0,
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          print('Custom image button pressed');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/hexagon_button.png",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            const Icon(
              Icons.play_arrow,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
