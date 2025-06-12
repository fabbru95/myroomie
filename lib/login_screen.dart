import 'package:flutter/material.dart';
import 'package:myroomie/auth_service.dart';
import 'register_screen.dart'; // Assicurati che questo import ci sia

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // Logo MyRoomie
              const Text(
                'MyRoomie',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              // Email input
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              // Password input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 30),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // login logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Accedi'),
                ),
              ),
              const SizedBox(height: 10),

              // Facebook login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/facebook_logo.png', // Assicurati che il logo sia presente nei tuoi asset
                    height: 24,
                    width: 24,
                  ),
                  label: const Text('Accedi con Facebook'),
                  onPressed: () async {
                    final user = await AuthService().signInWithFacebook();
                    if (user != null) {
                      // Naviga all’home screen o fai qualcosa
                      print('Accesso Facebook riuscito: ${user.email}');
                    } else {
                      print('Accesso Facebook fallito');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1877F2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Registration link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Non hai un account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Registrati',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}