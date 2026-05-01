import 'package:flutter/material.dart';

class AdDetailsPage extends StatelessWidget {
  const AdDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال البيانات الممرة من الصفحة السابقة
    final ad = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(ad['title'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, width: double.infinity, color: Colors.grey[300], child: const Icon(Icons.image, size: 100)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ad['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('السعر: ${ad['price']}', style: const TextStyle(fontSize: 20, color: Colors.green)),
                  const Divider(height: 32),
                  const Text('الوصف الكامل:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('هذا وصف تجريبي لقطع غيار أصلية بجودة عالية مستوردة من الوكالة مباشرة.'),
                  const SizedBox(height: 16),
                  Text('الناشر: ${ad['publisher']}'),
                  Text('تاريخ النشر: ${ad['date']}'),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone), label: const Text('اتصل بالبائع'))),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('حذف الإعلان'),
                              content: const Text('هل أنت متأكد من حذف هذا الإعلان؟'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء')),
                                TextButton(onPressed: () {
                                  Navigator.pop(ctx);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الحذف بنجاح')));
                                }, child: const Text('حذف', style: TextStyle(color: Colors.red))),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}