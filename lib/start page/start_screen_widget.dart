import 'package:flutter/material.dart';
import 'package:learn_n_app/home%20page/home_main_widget.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  final bool isLoggedIn = false;

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
              isLoggedIn ? _playButton(context) : _loginForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playButton(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 250),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeMainWidget(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
    );
  }

  Widget _loginForm() {
    return Column(
      children: [
        _buildRetroTextField('Username'),
        const SizedBox(height: 10),
        _buildRetroTextField('Password', isPassword: true),
        const SizedBox(height: 20),
        SizedBox(
          width: 170,
          child: _buildRetroButton('Login', const Color.fromARGB(255, 0, 0, 0),
              () {
            print('Login button pressed');
          }),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 170,
          child: _buildRetroButton(
              'Sign Up', const Color.fromARGB(255, 0, 0, 0), () {
            print('Sign Up button pressed');
          }),
        ),
      ],
    );
  }

  Widget _buildRetroTextField(String label, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      cursorColor: const Color.fromARGB(255, 7, 7, 7),
      style: const TextStyle(
        fontFamily: 'Arial',
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: label,
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
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2,
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
    );
  }

  Widget _buildRetroButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'PressStart2P',
          fontSize: 16,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
