import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../gerenrate_password_method.dart';

class GeneratePasswordScreen extends StatefulWidget {
  const GeneratePasswordScreen({Key? key}) : super(key: key);

  @override
  _GeneratePasswordScreenState createState() => _GeneratePasswordScreenState();
}

class _GeneratePasswordScreenState extends State<GeneratePasswordScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text('Generate Random Password'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Generate Strong Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Flexible(
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      final data = ClipboardData(text: _controller.text);
                      Clipboard.setData(data);
                      final snackBar =
                          SnackBar(content: Text('Password Copied'));
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    icon: Icon(Icons.copy),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            buildButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildButtonWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      onPressed: () {
        final password = generatePassword();
        _controller.text = password;
      },
      child: Text(
        'Password Generate',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
