import 'package:flutter/material.dart';
import './home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = "";
  String _password = "";
  String? _nickname;
  bool isLoginSuccess = false;

  // function
  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 300), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(username: _username, nickname: _nickname),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 24, 101), Color.fromARGB(255, 228, 68, 121)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Judul di atas form
                  Text(
                    "Selamat Datang!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Card untuk form login
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _usernameField(),
                          SizedBox(height: 10),
                          _passwordField(),
                          SizedBox(height: 10),
                          _nicknameField(),
                          SizedBox(height: 20),
                          _loginButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        setState(() {
          _username = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Username',
        prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      enabled: true,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _nicknameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        _nickname = value;
      },
      decoration: InputDecoration(
        hintText: 'Nama Panggilan',
        prefixIcon: Icon(Icons.tag, color: Colors.blueAccent),
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
        ),
        onPressed: () {
          String text = "";
          if (_username == "123" && _password == "123") {
            _navigateHome();
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          final snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
