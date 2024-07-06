import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, required this.name, required this.profession,
  });

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(color: Colors.black38),
      ),
    );
  }
}