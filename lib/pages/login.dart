import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/user.dart';
import 'package:shopping_cart_1/classes_widgets/routes.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String signIn = 'Sign in';

  String logIn = 'Log in';

  List<User> userData = [
    User(username: 'ana', password: 'maria'),
    User(username: 'carlo', password: 'ursu'),
    User(username: 'clara', password: 'maria'),
    User(username: 'parola', password: '123'),
    User(username: 'alexia', password: 'abc'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification page'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.amber[600]),
                    cursorColor: Colors.amber,
                    controller: nameController,
                    decoration: decoration(label: "Username"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    cursorColor: Colors.amber,
                    obscureText: true,
                    controller: passwordController,
                    decoration: decoration(label: "Password"),
                  ),
                ),
                SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          child: const Text(
                              style: TextStyle(fontSize: 15.0), 'Login'),
                          onPressed: () {
                            checkIfEmpty(nameController, passwordController,
                                context, 'Login', userData);
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          child: const Text(
                              style: TextStyle(fontSize: 15.0), 'Sign in'),
                          onPressed: () {
                            checkIfEmpty(nameController, passwordController,
                                context, 'Sign in', userData);
                          },
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        style: TextStyle(fontSize: 10.0),
                        'Did you forget the password?'),
                    TextButton(
                      onPressed: () {
                        newAlert("Better remember it next time ! ;)", context);
                        //forgot password screen
                      },
                      child: const Text(
                          style: TextStyle(color: Colors.amber, fontSize: 15.0),
                          'Forgot Password'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration decoration({required String label}) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 239, 206, 107), width: 2.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 239, 206, 107), width: 2.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.amber),
    );
  }
}

checkIfEmpty<Widget>(TextEditingController nameController,
    TextEditingController passwordController, context, action, userData) {
  if (nameController.text == '' || passwordController.text == '') {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text('$action alert!'),
            content: const Text("Both fields have to be completed!!!")));
  } else {
    if (action == 'Sign in') {
      bool foundUser = false;
      for (var user in userData) {
        if (nameController.text == user.username) foundUser = true;
      }
      if (foundUser == false) {
        userData.add(User(
            username: nameController.text, password: passwordController.text));
        Navigator.pushReplacementNamed(
          context,
          Routes.shop,
        );
      } else {
        newAlert(
            "This username is already taken! Please choose another!", context);
      }
    } else {
      logInAccount(nameController, passwordController, userData, context);
    }
  }
}

logInAccount(TextEditingController nameController,
    TextEditingController passwordController, userData, context) {
  bool succesfulLogin = false;
  for (var user in userData) {
    if (nameController.text == user.username) {
      if (passwordController.text == user.password) {
        succesfulLogin = true;
        Navigator.pushReplacementNamed(
          context,
          Routes.shop,
        );
      } else {
        newAlert("Password is incorrect!!!", context);
      }
    }
  }
  if (succesfulLogin == false) {
    newAlert("Username does not exist!!! Please sign in!", context);
  }
}

newAlert(text, context) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(content: Text(text)));
}
