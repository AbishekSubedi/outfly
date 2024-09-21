import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:outfly/screens/login_screen.dart';
import 'package:outfly/theme/theme.dart';
import 'package:outfly/widgets/custom_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:outfly/firebase_options.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final TextEditingController _fullName;
  late final TextEditingController _email;
  late final TextEditingController _password;
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  void initState() {
    _fullName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        // get started form
                        child: Form(
                          key: _formSignupKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // get started text
                              Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              // full name
                              TextFormField(
                                controller: _fullName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Full name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: const Text('Full Name'),
                                  hintText: 'Enter Full Name',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              // email
                              TextFormField(
                                controller: _email,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: const Text('Email'),
                                  hintText: 'Enter Email',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              // password
                              TextFormField(
                                controller: _password,
                                obscureText: true,
                                obscuringCharacter: '*',
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: const Text('Password'),
                                  hintText: 'Enter Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              // i agree to the processing
                              Row(
                                children: [
                                  Checkbox(
                                    value: agreePersonalData,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        agreePersonalData = value!;
                                      });
                                    },
                                    activeColor: lightColorScheme.primary,
                                  ),
                                  const Text(
                                    'I agree to the processing of ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Text(
                                    'Personal data',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              // signup button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formSignupKey.currentState!
                                            .validate() &&
                                        agreePersonalData) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Processing Data'),
                                        ),
                                      );
                                    } else if (!agreePersonalData) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please agree to the processing of personal data')),
                                      );
                                    }
                                    final email = _email.text;
                                    final password = _password.text;

                                    try {
                                      final userCredential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);
                                      print(userCredential);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        print('Weak password');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        print('Email already in use');
                                      } else if (e.code == 'invalid-email') {
                                        print('Invalid email');
                                      }
                                    }
                                  },
                                  child: const Text('Sign up'),
                                ),
                              ),

                              const SizedBox(
                                height: 30.0,
                              ),
                              // sign up divider
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.7,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      'Sign up with',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.7,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              // sign up social media logo
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(BoxIcons.bxl_facebook),
                                  Icon(BoxIcons.bxl_twitter),
                                  Icon(BoxIcons.bxl_google),
                                  Icon(BoxIcons.bxl_apple),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              // already have an account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account? ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (e) => const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Log in',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lightColorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
