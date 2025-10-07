import 'package:flutter/material.dart';

void main() {
  runApp(KitabuMkononiUI());
}

class KitabuMkononiUI extends StatefulWidget {
  @override
  _KitabuMkononiUIState createState() => _KitabuMkononiUIState();
}

class _KitabuMkononiUIState extends State<KitabuMkononiUI> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ReaderPage(),
    FavoritesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KitabuMkononi',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KitabuMkononi', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Nyumbani'),
            BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode), label: 'Soma'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Vipendwa'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mipangilio'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vitabu Vipya', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                _buildBookCard('Hadithi za Kuingia', 'Mwandishi A'),
                _buildBookCard('Mbinu za Maisha', 'Mwandishi B'),
                _buildBookCard('Safari ya Ndoto', 'Mwandishi C'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(String title, String author) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.book, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(author),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

class ReaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Chagua kitabu kutoka Nyumbani ili kuanza kusoma.\\n\\nHapa msomaji wa kitabu utaonekana. 📖',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hakuna vitabu vipendwa bado ❤️',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mipangilio ya Mtumiaji', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.text_increase, color: Colors.teal),
            title: const Text('Ukubwa wa Maandishi'),
            subtitle: const Text('Rekebisha ukubwa wa maandishi kwa urahisi.'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_6, color: Colors.teal),
            title: const Text('Mandhari ya Usiku'),
            subtitle: const Text('Badilisha kati ya mwanga na giza.'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: const Text('Lugha'),
            subtitle: const Text('Chagua lugha ya programu.'),
          ),
        ],
      ),
    );
  }
}
