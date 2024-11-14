import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn-N',
      home: CardsScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progress;
  late Timer _dotTimer;
  String loadingText = 'Loading';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _progress = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    _dotTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (!mounted) return;
      setState(() {
        loadingText = 'Loading${'.' * ((timer.tick % 3) + 1)}';
      });
      if (_controller.isCompleted) {
        timer.cancel();
      }
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const StartScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _dotTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.jpg',
              width: 200,
              height: 200,
            ),
            const Text(
              'Learn-N',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.black,
                fontSize: 24,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadingText,
                    style: const TextStyle(fontFamily: 'PressStart2P'),
                  ),
                  Container(
                    width: 260,
                    height: 26,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: Row(
                      children: List.generate(10, (index) {
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: index / 10 <= _progress.value
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/logo_icon.png',
                height: 200,
                width: 200,
              ),
              const Text(
                'Learn-N',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 250),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
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
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'PressStart2P',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        print('Terms of Service clicked');
                      },
                      child: const Text(
                        'Terms of Service • Privacy Policy',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Decks',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'PressStart2P',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, size: 30),
          color: Colors.black,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
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
              FolderDecks(title: "Python"),
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
            height: 50,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Add New Folder",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'PressStart2P',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromARGB(255, 7, 7, 7),
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Folder Name',
                            labelStyle: const TextStyle(
                              fontFamily: 'PressStart2P',
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add folder creation logic here
                            print('Create button pressed');
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
                            "Create",
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
        child: Image.asset(
          'assets/add_button.png',
          width: 100,
          height: 100,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 188, 196, 202),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black, // Black line under the header
                    width: 4.0, // Thickness of the line
                  ),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo_icon.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Learn-N',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PressStart2P"),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                print('Settings tapped');
              },
            ),
            ListTile(
              title: const Text(
                'About Us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                print('About Us tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FolderDecks extends StatelessWidget {
  final String title;

  const FolderDecks({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // When the FolderDecks container is tapped, navigate to CardsScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardsScreen()),
            );
          },
          child: Container(
            width: 310,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                width: 4,
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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Favorite button
                        Icon(
                          Icons.star_border_purple500_rounded,
                          size: 40,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        // Edit button
                        Icon(
                          Icons.more_horiz_rounded,
                          size: 40,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

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
            MaterialPageRoute(
                builder: (context) =>
                    QuestionScreen()), // Assuming you already have the QuestionScreen
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

class QuestionCard extends StatefulWidget {
  final String title;
  final String backContent;

  const QuestionCard(
      {super.key, required this.title, required this.backContent});

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        });
      },
      child: Column(
        children: [
          // Only animated front and back card area (no button inside)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationY(_animation.value * 3.14159),
                alignment: Alignment.center,
                child: _buildCard(),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: 310,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          width: 4,
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
      child: Stack(
        children: [
          // Front Side (Question)
          _buildFront(),
          // Back Side (Answer)
          _buildBack(),
        ],
      ),
    );
  }

  Widget _buildFront() {
    return Visibility(
      visible:
          _animation.value < 0.5, // Show front when animation is less than 0.5
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                print("Edit button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack() {
    return Visibility(
      visible: _animation.value >= 0.5,
      child: Transform(
        transform: Matrix4.rotationY(_animation.value < 0.5 ? 0 : 3.14159),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.backContent,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Handle edit action for front side
                  print("Edit button pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Icons.arrow_back_rounded,
            size: 40,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CardsScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '_',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Text(
                        'a programming language that lets you work quickly and integrate systems more effectively.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: const Color.fromARGB(255, 7, 7, 7),
                style: const TextStyle(
                  fontFamily: 'Arial',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  labelText: 'answer',
                  labelStyle: const TextStyle(
                    fontFamily: 'PressStart2P',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
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
            ],
          ),
        ),
      ),
    );
  }
}
