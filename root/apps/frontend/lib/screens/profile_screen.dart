import 'package:flutter/material.dart';
import 'package:frontend/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 32),
          _buildStatsSection(),
          const SizedBox(height: 32),
          _buildFavoritesSection(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppTheme.borderColor,
          child: Icon(
            Icons.person,
            size: 60,
            color: AppTheme.subtleTextColor,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Mario Rossi', // Placeholder username
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textColor),
        ),
        Text(
          'mario.rossi@email.com', // Placeholder email
          style: TextStyle(fontSize: 16, color: AppTheme.subtleTextColor),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Le tue statistiche',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textColor),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            _StatCard(icon: Icons.timer_outlined, value: '12.5', label: 'Ore di gioco'),
            SizedBox(width: 16),
            _StatCard(icon: Icons.swap_horiz, value: '34', label: 'Prestiti totali'),
          ],
        ),
      ],
    );
  }

  Widget _buildFavoritesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I tuoi preferiti',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textColor),
        ),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.park_outlined, color: AppTheme.accentColor),
            title: Text('Locker Piazza Duomo'),
            subtitle: Text('Disponibile'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.park_outlined, color: AppTheme.accentColor),
            title: Text('Locker MUSE'),
            subtitle: Text('Disponibile'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: AppTheme.primaryColor, size: 30),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textColor)),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(color: AppTheme.subtleTextColor, fontSize: 12), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
