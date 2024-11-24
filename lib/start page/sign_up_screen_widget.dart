import 'package:flutter/material.dart';
import 'package:learn_n_app/home%20page/home_main_widget.dart';

// class SignUpPage extends StatefulWidget {
//   static route() => MaterialPageRoute(
//         builder: (context) => const SignUpPage(),
//       );
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> createUserWithEmailandPassword() async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim());
//       print(userCredential);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Sign Up.',
//                 style: TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(
//                   hintText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   await createUserWithEmailandPassword();
//                 },
//                 child: const Text(
//                   'SIGN UP',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, LoginPage.route());
//                 },
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Already have an account? ',
//                     style: Theme.of(context).textTheme.titleMedium,
//                     children: [
//                       TextSpan(
//                         text: 'Sign In',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// make this as a basis for sign up

//can u remove the _playbutton instead if the user is already login they will go to the HomeMainWidget direcctly
//make this page Sign up page and create other widget screen for sign in page just like the example i give
// create the controller/getter of the email and password now, lets make the firebaseAuth later
class SignupScreenWidget extends StatelessWidget {
  const SignupScreenWidget({super.key});

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

// class LoginPage extends StatefulWidget {
//   static route() => MaterialPageRoute(
//         builder: (context) => const LoginPage(),
//       );
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> loginUserWithEmailAndPassword() async {
//     try {
//       final UserCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim());
//       print(UserCredential);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Sign In.',
//                 style: TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(
//                   hintText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   await loginUserWithEmailAndPassword();
//                 },
//                 child: const Text(
//                   'SIGN IN',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, SignUpPage.route());
//                 },
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Don\'t have an account? ',
//                     style: Theme.of(context).textTheme.titleMedium,
//                     children: [
//                       TextSpan(
//                         text: 'Sign Up',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//make this a basis for my sign in but the design must be tha same as mine