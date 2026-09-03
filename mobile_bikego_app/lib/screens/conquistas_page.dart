import 'package:flutter/material.dart';
import 'home_page.dart';
import 'impacto_page.dart';
import 'planejar_page.dart';

class ConquistasPage extends StatelessWidget {
  const ConquistasPage({super.key});

  static const green = Color(0xFF0FBA7A);
  static const ink = Color(0xFF172033);
  static const muted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Conquistas',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Continue pedalando e desbloqueie novas recompensas.',
                      style: TextStyle(fontSize: 11, color: muted),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8F8F1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.workspace_premium,
                              color: green,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Explorador Sustentável',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: ink,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '240 / 300 EcoPoints',
                                style: TextStyle(fontSize: 10, color: muted),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Suas conquistas',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 9),
                    const AchievementTile(
                      icon: Icons.directions_bike,
                      title: 'Primeiro deslocamento',
                      description: 'Complete sua primeira viagem sustentável',
                      completed: true,
                    ),
                    const SizedBox(height: 8),
                    const AchievementTile(
                      icon: Icons.eco_outlined,
                      title: 'Amigo do planeta',
                      description: 'Evite 10 kg de CO₂',
                      completed: false,
                    ),
                    const SizedBox(height: 8),
                    const AchievementTile(
                      icon: Icons.route_outlined,
                      title: 'Explorador de rotas',
                      description: 'Conheça 5 rotas diferentes',
                      completed: false,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: 3,
                onTap: (index) {
                  if (index == 3) return;
                  final pages = [
                    const HomePage(),
                    const PlanejarPage(),
                    const ImpactoPage(),
                    const ConquistasPage(),
                  ];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => pages[index]),
                  );
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: green,
                unselectedItemColor: const Color(0xFF8FA0B5),
                selectedFontSize: 9,
                unselectedFontSize: 9,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    activeIcon: Icon(Icons.explore),
                    label: 'Planejar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.eco_outlined),
                    activeIcon: Icon(Icons.eco),
                    label: 'Impacto',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.workspace_premium_outlined),
                    activeIcon: Icon(Icons.workspace_premium),
                    label: 'Conquistas',
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

class AchievementTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool completed;

  const AchievementTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: completed
              ? const Color(0xFFBDEDDD)
              : const Color(0xFFE7ECF0),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: completed ? ConquistasPage.green : ConquistasPage.muted,
            size: 22,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: ConquistasPage.ink,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(fontSize: 9, color: ConquistasPage.muted),
                ),
              ],
            ),
          ),
          Icon(
            completed ? Icons.check_circle : Icons.lock_outline,
            color: completed ? ConquistasPage.green : const Color(0xFFB6C0CA),
            size: 18,
          ),
        ],
      ),
    );
  }
}
