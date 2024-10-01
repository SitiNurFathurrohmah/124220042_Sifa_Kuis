import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isClicked = false;
  bool _isPasswordVisible = false; // State untuk mengatur visibilitas password

  // Function
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView( // Menambahkan scroll
          child: Column(
            children: [
              SizedBox(height: 20), 
              _buildLogo(), 
              SizedBox(height: 20), 
              Text(
                "Selamat Datang Kembali",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Colors.purple),
              ),
              SizedBox(height: 20), 
              _buildPhoneImage(), 
              SizedBox(height: 20), 
              usernameField(),
              passwordField(),
              _LoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'images/logo.png', 
      width: 100,
      height: 100,
    );
  }

  Widget _buildPhoneImage() {
    return Image.asset(
      'images/illustration.png', 
      width: 200,
      height: 200,
    );
  }

  Widget usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            username = value;
          },
          decoration: const InputDecoration(
            hintText: 'Masukkan Username',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: !_isPasswordVisible, // Mengatur visibilitas password
          onChanged: (value) {
            password = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan Password',
            contentPadding: const EdgeInsets.all(8.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible; // Toggle visibilitas
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      width: 200, 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked
              ? MaterialStateProperty.all(Colors.yellow[200])
              : MaterialStateProperty.all(Colors.purple[300]),
        ),
        onPressed: () {
          if (username == 'sifa' && password == '123') {
            _navigateToHome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Anda Berhasil'),
              ),
            );
            setState(() {
              isClicked = !isClicked;
            });
          }
        },
        child: const Text('Masuk'),
      ),
    );
  }
}
