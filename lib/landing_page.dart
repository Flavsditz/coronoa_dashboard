import 'package:coronadashboard/simple_api/simple_api_service.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final String title;

  LandingPage({Key key, this.title}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _infections = 0;
  SimpleAPIService _apiService = SimpleAPIService();

  void _getGlobalStats() async {
    _apiService.getGlobalStatistics().then((stat) => {});
  }

  void _getAllCountriesStats() async {
    _apiService.getAllCountriesStatistics().then((statsList) => {});
  }

  void _getCountryStats() async {
    _apiService.getCountryStatistics("DE").then((stat) => {});
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
            if (_infections == 0)
              Text(
                'You don\'t have any data yet, click on the reload button to get it',
              ),
            if (_infections != 0)
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
        onPressed: () {},
        tooltip: 'Reload Data',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
