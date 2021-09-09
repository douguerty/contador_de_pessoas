import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Contador de Pessoas', home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoa = 0;
  String _infoText = 'Pode entrar!';

  void _alterarPessoa(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa < 0) {
        _infoText = 'Ta de sacanagem?';
      } else if(_pessoa <= 10) {
        _infoText = 'Pode entrar!';
      } else {
        _infoText = 'Lotou!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/restaurant.jpg', fit: BoxFit.cover),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pessoas: $_pessoa',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      '+1',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          backgroundColor: Colors.black),
                    ),
                    onPressed: () {
                      _alterarPessoa(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      '-1',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          backgroundColor: Colors.black),
                    ),
                    onPressed: () {
                      _alterarPessoa(-1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                  backgroundColor: Colors.black),
            ),
          ],
        )
      ],
    );
  }
}
