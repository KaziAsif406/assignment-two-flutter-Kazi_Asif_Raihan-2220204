import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ActionCard(icon: Icons.swap_horiz, label: 'Transfer'),
        SizedBox(width: 12),
        _ActionCard(icon: Icons.receipt_long, label: 'Pay Bills'),
        SizedBox(width: 12),
        _ActionCard(icon: Icons.link, label: 'Invest'),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionCard({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 92,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEFF0FF),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, color: const Color(0xFF6F4AF6)),
            ),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
