// ─── SETTINGS PAGE ────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:aplikasi_pertama_gua/about/about.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifikasi = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    bool? _selectedOption = true;
    bool _selectedOption2 = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi'),
            subtitle: const Text('Aktifkan notifikasi pesan'),
            secondary: const Icon(Icons.notifications),
            value: _notifikasi,
            onChanged: (val) => setState(() => _notifikasi = val),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Ganti tema gelap'),
            secondary: const Icon(Icons.dark_mode),
            value: _darkMode,
            onChanged: (val) => setState(() => _darkMode = val),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Aplikasi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const About()),
            ),
          ),
        ],
      ),
    );
  }
}
