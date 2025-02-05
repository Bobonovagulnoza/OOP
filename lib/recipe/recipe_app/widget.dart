import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 356,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color(0xffFFC6C9)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem("60", "recipes"),
            _buildDivider(),
            _buildStatItem("120", "Following"),
            _buildDivider(),
            _buildStatItem("250", "Followers"),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Color(0xffFFC6C9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Color(0xffFFC6C9),
    );
  }
}