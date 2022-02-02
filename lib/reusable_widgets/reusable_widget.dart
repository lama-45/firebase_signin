import 'package:flutter/material.dart';
//logo Widget
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType, //used with the sign in and signup fields
    TextEditingController controller) {
  return TextField(
    controller: controller, // allow us to access the text and handle it
    obscureText: isPasswordType, // check if the password is a password type or not and, obscure the Text if it is a password type
    enableSuggestions: !isPasswordType, // enable suggestions and auto correct if it is nit a password
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)), // styling if the text
    decoration: InputDecoration(
      prefixIcon: Icon( // prefix icon in the left for both the sign in and signup fields
        icon,
        color: Colors.white70,
      ),
      labelText: text, // label and styling of the label
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // the boarder for the fields is circular
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType //??
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) { // reusable buttons
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)), //circular radius
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26; // if pressed change the button color
            }
            return Colors.white; // not pressed
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>( // the shape of the button
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
