import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Connexion CHINA DEALS')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (val) => email = val,
                validator: (val) => val!.isEmpty ? 'Entrez votre email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                onChanged: (val) => password = val,
                validator: (val) => val!.length < 6 ? 'Mot de passe trop court' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Se connecter'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await auth.signIn(email, password);
                    } catch (e) {
                      setState(() {
                        error = 'Erreur de connexion';
                      });
                    }
                  }
                },
              ),
              if (error.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(error, style: TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}