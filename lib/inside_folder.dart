import 'package:flutter/material.dart';
import 'package:learn_n_app/card.dart';
import 'package:learn_n_app/home.dart';
import 'package:learn_n_app/question.dart';

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
              // Show a dialog when the add button is pressed
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Answer:',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'PressStart2P'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              child: TextField(
                                cursorColor: const Color.fromARGB(255, 7, 7, 7),
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                ),
                                maxLines:
                                    null, // Allows the field to expand as the user types
                                keyboardType: TextInputType
                                    .multiline, // Enable multiline typing
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Question or Definition:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'PressStart2P',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              child: TextField(
                                cursorColor: const Color.fromARGB(255, 7, 7, 7),
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                ),
                                maxLines:
                                    null, // Allows the field to expand as the user types
                                keyboardType: TextInputType
                                    .multiline, // Enable multiline typing
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Add Button
                            ElevatedButton(
                              onPressed: () {
                                // Add question and answer saving logic here
                                print('Add button pressed');
                                Navigator.pop(context); // Close the dialog
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'PressStart2P',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
          Container(
            color: Colors.white,
            height: 60,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          // Navigate to the QuestionScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuestionScreen()),
          );
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
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
