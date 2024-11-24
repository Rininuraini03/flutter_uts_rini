import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.red, // AppBar warna merah
      ),
      body: SingleChildScrollView( // Menambahkan SingleChildScrollView agar konten dapat digulirkan
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Menampilkan gambar berbentuk lingkaran
                CircleAvatar(
                  radius: 60, // Ukuran lingkaran
                  backgroundImage: AssetImage('image/profile.jpeg'), // Gambar profil
                  backgroundColor: Colors.grey[300], // Warna latar belakang jika gambar tidak ada
                ),
                const SizedBox(height: 16), // Jarak antara gambar dan teks
                const Text(
                  'Welcome to KWU Himatif UTB',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Teks berwarna merah
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32), // Jarak antara teks dan form login
                _buildUsernameField(),
                const SizedBox(height: 16),
                _buildPasswordField(),
                const SizedBox(height: 20),
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = _usernameController.text;
        String password = _passwordController.text;

        // Validasi login
        if (username == 'kwuhimatif' && password == '123') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid username or password')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Tombol login warna merah
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Tombol dengan sudut melengkung
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Teks pada tombol warna putih
        ),
      ),
    );
  }
}
