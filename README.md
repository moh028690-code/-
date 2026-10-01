import 'package:flutter/material.dart';

void main() {
  runApp(const TeacherStudentApp());
}

class TeacherStudentApp extends StatelessWidget {
  const TeacherStudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'منصة التعليم الذكي',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

// شاشة تحديد صفة المستخدم (طالب / مدرس)
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.indigo.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school_rounded, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'المنصة التعليمية',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'اختر نوع الحساب للمتابعة',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.white,
                foregroundColor: Colors.indigo.shade900,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.person_outline, size: 28),
              label: const Text('دخول كـ طالب', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentHomeScreen()));
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.assignment_ind_outlined, size: 28),
              label: const Text('دخول كـ مدرس', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TeacherHomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// بوابة الطالب
class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة الطالب'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildFeatureCard(context, 'المحاضرات المرئية', Icons.play_circle_fill, Colors.blue, 'مشاهدة الدروس والشروح'),
          _buildFeatureCard(context, 'الملازم والملفات (PDF)', Icons.picture_as_pdf, Colors.red, 'تحميل الملخصات والحلول'),
          _buildFeatureCard(context, 'الاختبارات الإلكترونية', Icons.quiz, Colors.green, 'إجراء الاختبارات وتقييم الدرجات'),
          _buildFeatureCard(context, 'تنبيهات المدرس', Icons.campaign, Colors.orange, 'الإعلانات والواجبات اليومية'),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, IconData icon, Color color, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(radius: 25, backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color, size: 30)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

// لوحة تحكم المدرس
class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة المدرس'),
        backgroundColor: Colors.indigo.shade900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildGridItem('رفع درس جديد', Icons.video_call, Colors.purple),
            _buildGridItem('إنشاء اختبار', Icons.note_add, Colors.teal),
            _buildGridItem('قائمة الطلاب', Icons.groups, Colors.orange),
            _buildGridItem('إرسال إشعار', Icons.add_alert, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 28, backgroundColor: color.withOpacity(0.15), child: Icon(icon, size: 32, color: color)),
            const SizedBox(height: 12),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey.shade800)),
          ],
        ),
      ),
    );
  }
}
