import 'package:flutter/material.dart';

void main() {
  runApp(const AdhkarApp());
}

class AdhkarApp extends StatelessWidget {
  const AdhkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أذكار الصباح والمساء',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: AdhkarHomePage(),
      ),
    );
  }
}

class DhikrItem {
  final String text;
  final int maxCount;
  int currentCount;
  final String? reward;

  DhikrItem({
    required this.text,
    required this.maxCount,
    required this.currentCount,
    this.reward,
  });
}

class AdhkarHomePage extends StatefulWidget {
  const AdhkarHomePage({super.key});

  @override
  State<AdhkarHomePage> createState() => _AdhkarHomePageState();
}

class _AdhkarHomePageState extends State<AdhkarHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<DhikrItem> morningAdhkar = [
    DhikrItem(
      text: "أَصْبَحْنَا وَأَصْبَحَ المُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ.",
      maxCount: 1,
      currentCount: 1,
      reward: "من قالها حين يصبح أجير من الجن حتى يمسي",
    ),
    DhikrItem(
      text: "اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ.",
      maxCount: 1,
      currentCount: 1,
    ),
    DhikrItem(
      text: "اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ.",
      maxCount: 1,
      currentCount: 1,
      reward: "سيد الاستغفار: من قالها موقناً بها ومات دخل الجنة",
    ),
    DhikrItem(
      text: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
      maxCount: 100,
      currentCount: 100,
      reward: "حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ",
    ),
  ];

  final List<DhikrItem> eveningAdhkar = [
    DhikrItem(
      text: "أَمْسَيْنَا وَأَمْسَى المُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ.",
      maxCount: 1,
      currentCount: 1,
    ),
    DhikrItem(
      text: "اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ المَصِيرُ.",
      maxCount: 1,
      currentCount: 1,
    ),
    DhikrItem(
      text: "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ.",
      maxCount: 3,
      currentCount: 3,
      reward: "لم تضره حمة تلك الليلة",
    ),
    DhikrItem(
      text: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
      maxCount: 100,
      currentCount: 100,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _resetAdhkar(List<DhikrItem> list) {
    setState(() {
      for (var item in list) {
        item.currentCount = item.maxCount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أذكار الصباح والمساء', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white70,
          labelColor: Colors.white,
          tabs: const [
            Tab(text: 'أذكار الصباح'),
            Tab(text: 'أذكار المساء'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAdhkarList(morningAdhkar),
          _buildAdhkarList(eveningAdhkar),
        ],
      ),
    );
  }

  Widget _buildAdhkarList(List<DhikrItem> list) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              final isDone = item.currentCount == 0;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: isDone ? Colors.teal.shade50 : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: isDone ? Colors.grey : Colors.black87,
                        ),
                      ),
                      if (item.reward != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'فضلها: ${item.reward}',
                          style: TextStyle(fontSize: 13, color: Colors.teal.shade700, fontStyle: FontStyle.italic),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'المتبقي: ${item.currentCount} من ${item.maxCount}',
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          ElevatedButton(
                            onPressed: isDone
                                ? null
                                : () {
                                    setState(() {
                                      if (item.currentCount > 0) {
                                        item.currentCount--;
                                      }
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDone ? Colors.grey : Colors.teal,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              isDone ? 'تم بحمد الله' : 'تكرار (${item.currentCount})',
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: ElevatedButton.icon(
            onPressed: () {
              int currentIndex = _tabController.index;
              if (currentIndex == 0) {
                _resetAdhkar(morningAdhkar);
              } else {
                _resetAdhkar(eveningAdhkar);
              }
            },
            icon: const Icon(Icons.refresh),
            label: const Text('إعادة ضبط الأذكار'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade700,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 45),
            ),
          ),
        ),
      ],
    );
  }
}
