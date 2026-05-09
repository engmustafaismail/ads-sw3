import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // بيانات وهمية (Fake Data)
  final List<Map<String, dynamic>> ads = const [
    {'id': 1, 'title': 'محرك سيارة تويوتا', 'price': '5000 ريال', 'publisher': 'أحمد علي', 'date': '2024-05-01'},
    {'id': 2, 'title': 'إطارات ميشلان أصلية', 'price': '1200 ريال', 'publisher': 'متجر الزاهر', 'date': '2024-05-02'},
    {'id': 3, 'title': 'أضواء أمامية LED', 'price': '450 ريال', 'publisher': 'سارة محمد', 'date': '2024-05-03'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعلانات المتاحة'),
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () => Navigator.pushReplacementNamed(context, '/login'))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(hintText: 'ابحث عن قطع غيار...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [Text('عدد الإعلانات: ${ads.length}', style: const TextStyle(fontWeight: FontWeight.bold))]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ads.length,
              itemBuilder: (context, index) {
                final ad = ads[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.settings_suggest, size: 40),
                    title: Text(ad['title']),
                    subtitle: Text('السعر: ${ad['price']}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.pushNamed(context, '/ad_details', arguments: ad),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.ads_click), label: 'إعلاناتي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف الشخصي'),
        ],
      ),
    );
  }
}
