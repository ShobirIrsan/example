import 'package:example_get_team_football/models/team.dart';
import 'package:example_get_team_football/page/list_tile.dart';
import 'package:example_get_team_football/services/api.dart';
import 'package:example_get_team_football/services/warna.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var teams = List<Team>();
  Warna _warna = new Warna();
  bool _isLoading = true;

  @override
  void initState() {
    _fetchTeam();
    super.initState();
  }

  void _fetchTeam() async {
    setState(() {
      _isLoading = true;
    });
    var tempTeams = await Api().getTeams();
    print(tempTeams);

    setState(() {
      teams = tempTeams;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: _fetchTeam),
      body: SafeArea(
        child: !_isLoading
            ? ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return ListTeam(_warna.getColor(), teams[index].teamName,image: teams[index].teamBadge,);
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
