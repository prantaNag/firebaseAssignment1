import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapplication/entities/football.dart';
import 'package:firebaseapplication/widgets/football_score_card.dart';

import 'package:flutter/material.dart';

class MatchScoreScreen extends StatefulWidget {
  const MatchScoreScreen({super.key});

  @override
  State<MatchScoreScreen> createState() => _MatchScoreScreenState();
}

class _MatchScoreScreenState extends State<MatchScoreScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchList = [];

  Future<void> _getFootballMatches() async {
    matchList.clear();
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();
    for (QueryDocumentSnapshot doc in result.docs) {
      matchList.add(
        Football(
          matchName: doc.id,
          team1name: doc.get('team1name'),
          team2name: doc.get('team2name'),
          team1Score: doc.get('team1score'),
          team2Score: doc.get('team2score'),
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    _getFootballMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Score Football"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: matchList.length,
        itemBuilder: (context, index) {
          return FootballScoreCard(
            football: matchList[index],
          );
        },
      ),
    );
  }
}
