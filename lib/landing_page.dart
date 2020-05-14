import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final String title;

  LandingPage({Key key, this.title}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _infections = 0;

  void _getGlobalInfectionsNumber() async {
    //TODO: Make your HTTP request here
    // 1) use this URL: https://api.thevirustracker.com/free-api?global=stats
    //    check what you get and how to extract it correctly
    // 2) play around with the other enpoints if you want

    //Remember to set the state of the app once you have a value
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(_infections == 0)
              Text(
                'You don\'t have any data yet, click on the reload button to get it',
              ),
            if(_infections != 0)
              Text(
                'Globally, the number of infections at the moment is:',
              ),
            Text(
              '$_infections',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getGlobalInfectionsNumber,
        tooltip: 'Reload Data',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
