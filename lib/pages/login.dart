import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/data.dart';
import 'package:shopping_cart_1/classes_widgets/user.dart';
import 'package:shopping_cart_1/pages/shop.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final String signIn = 'Sign in';

  final String logIn = 'Log in';

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
                              style: TextStyle(fontSize: 15.0), 'Sign up'),
                          onPressed: () {
                            checkIfEmpty(nameController, passwordController,
                                context, 'Sign up', userData);
                          },
                        ),
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
    if (action == 'Sign up') {
      bool foundUser = false;
      for (var user in userData) {
        if (nameController.text == user.username) foundUser = true;
      }
      if (foundUser == false) {
        userData.add(User(
            username: nameController.text, password: passwordController.text));
        goToOtherPage(
            context,
            Shop(
              newUsername: nameController.text,
            ),
            'shop');
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
  bool foundUser = false;
  for (var user in userData) {
    if (nameController.text == user.username) {
      if (passwordController.text == user.password) {
        succesfulLogin = true;
        foundUser = true;
        goToOtherPage(
            context,
            Shop(
              newUsername: nameController.text,
            ),
            'shop');
      } else {
        foundUser = true;
        newAlert("Password is incorrect!!!", context);
      }
    }
  }
  if (!foundUser && !succesfulLogin) {
    newAlert("Username does not exist!!! Please sign up!", context);
  }
}

newAlert(text, context) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(content: Text(text)));
}

goToOtherPage(BuildContext context, Widget destination, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destination,
      settings: RouteSettings(name: title),
    ),
  );
}
