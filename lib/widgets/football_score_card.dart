import 'package:firebaseapplication/entities/football.dart';
import 'package:flutter/material.dart';

class FootballScoreCard extends StatelessWidget {
  const FootballScoreCard({
    super.key,
    required this.football,
  });

  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeam(football.team1name, football.team1Score),
            Text("VS"),
            _buildTeam(football.team2name, football.team2Score),
          ],
        ),
      ),
    );
  }
}

Widget _buildTeam(String teamName, int score) {
  return Column(
    children: [
      Text(
        score.toString(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        teamName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
