import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final bool isHighlighted;

  const ProfileInfoTile({
    Key? key,
    required this.label,
    required this.value,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontStyle: isHighlighted
                      ? FontStyle.italic
                      : FontStyle.normal,
                  fontWeight: isHighlighted
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
