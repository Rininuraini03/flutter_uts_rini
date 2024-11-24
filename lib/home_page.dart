import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar layar berdasarkan index
  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
      drawer: _buildDrawer(),
      backgroundColor: Colors.white, // Background putih
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red, // Background merah
          borderRadius: BorderRadius.circular(8), // Membuat border radius
        ),
        child: const Text(
          'KWU HIMATIF UTB ',
          style: TextStyle(
            color: Colors.white, // Teks warna putih
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white, // Background AppBar tetap putih
      iconTheme: const IconThemeData(color: Colors.red), // Ikon AppBar warna merah
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      selectedItemColor: Colors.red,
      unselectedItemColor: const Color.fromARGB(255, 103, 101, 101),
      type: BottomNavigationBarType.fixed,
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.redAccent),
            child: Text(
              'KWU_HIMATIF INFO',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}

// Contoh layar dummy
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Daftar item dengan jumlah yang dapat dikelola
  final List<Map<String, dynamic>> items = [
    {'image': 'image/ganci.jpeg', 'name': 'GANTUNGAN KUNCI', 'quantity': 0},
    {'image': 'image/Gelang.jpeg', 'name': 'GELANG', 'quantity': 0},
    {'image': 'image/jaket.jpeg', 'name': 'JAKET', 'quantity': 0},
    {'image': 'image/Notepad.jpeg', 'name': 'NOTEPAD', 'quantity': 0},
    {'image': 'image/Tumbrl.jpeg', 'name': 'TUMBLR', 'quantity': 0},
    {'image': 'image/Workshit.jpeg', 'name': 'WORKSHIRT', 'quantity': 0},
  ];

  void _incrementQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (items[index]['quantity'] > 0) {
        items[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: items.length,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.asset(
                    items[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  items[index]['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Teks warna merah
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Menambahkan tombol + dan -
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.red),
                    onPressed: () => _decrementQuantity(index),
                  ),
                  Text(
                    '${items[index]['quantity']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.red),
                    onPressed: () => _incrementQuantity(index),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar menu pada Settings
    final List<String> settingsOptions = [
      'Account Settings',
      'Privacy & Security',
      'Notifications',
      'Language',
      'Help Center',
    ];

    return ListView.builder(
      itemCount: settingsOptions.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.red,
            ),
            title: Text(
              settingsOptions[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Aksi saat opsi ditekan (dummy)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${settingsOptions[index]} clicked'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center( // Memusatkan konten
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Tambahkan agar tampilan responsif jika konten terlalu panjang
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Memusatkan konten secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 60, // Ukuran avatar
                backgroundImage: AssetImage('image/profile.jpeg'), // Gambar profil
                backgroundColor: Colors.grey[300], // Warna latar belakang jika gambar tidak ada
              ),
              const SizedBox(height: 16),

              // Nama Profil
              Text(
                'KWU HIMATIF UTB', // Nama profil
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center, // Memusatkan teks
              ),
              const SizedBox(height: 8),

              // Deskripsi Profil
              const Text(
                'KWU HIMATIF adalah departemen unggulan di Himpunan Mahasiswa Informatika (HIMATIF) Universitas Teknologi Bandung yang berfokus pada pengembangan kreativitas dan semangat kewirausahaan mahasiswa.\n\n'
                'Sebagai motor penggerak inovasi di bidang bisnis dan penjualan, KWU HIMATIF menawarkan beragam produk berkualitas yang dirancang khusus untuk memenuhi kebutuhan dan mendukung identitas mahasiswa HIMATIF.\n\n'
                'Produk-produk unggulan KWU meliputi:\n\n'
                '• Gelang eksklusif: Menampilkan desain yang trendi, cocok sebagai aksesori sehari-hari.\n'
                '• Worksheets edukatif: Praktis untuk menunjang kegiatan belajar dan organisasi.\n'
                '• Jaket stylish: Nyaman dipakai dan menampilkan kebanggaan sebagai bagian dari HIMATIF.\n'
                '• Notepad minimalis: Untuk mencatat ide-ide brilian kapan saja.\n'
                '• Gantungan kunci kreatif: Simbol identitas dan kreativitas HIMATIF.\n\n'
                'Melalui KWU HIMATIF, kami tidak hanya menjual produk tetapi juga membangun semangat kolaborasi, kreativitas, dan inovasi mahasiswa. Dukung langkah kami untuk terus maju dengan menjelajahi dan memiliki produk-produk KWU HIMATIF! 💡✨',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify, // Justify agar lebih rapi
              ),
              const SizedBox(height: 20),

              // Tombol Aksi
              ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol ditekan
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Explore KWU HIMATIF clicked')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  
                ),
                child: const Text('Explore KWU HIMATIF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
