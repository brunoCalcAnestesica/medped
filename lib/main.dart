import 'package:flutter/material.dart';
import 'screens/antibioticos_screen.dart';
import 'screens/anticonvulsionantes_screen.dart';
import 'screens/antiinflamatorios_screen.dart';
import 'screens/antifungicos_screen.dart';
import 'screens/broncodilatadores_screen.dart';
import 'screens/hidratacaovenosa_screen.dart';
import 'screens/puericultura_screen.dart';
import 'screens/busca_screen.dart';
import 'screens/configuracoes_screen.dart';

void main() => runApp(MedPedApp());

class MedPedApp extends StatelessWidget {
  const MedPedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedPed - PedAjuda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF4A90E2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4A90E2),
          secondary: Color(0xFF7ED321),
        ),
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF4A90E2),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4A90E2),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedPed'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuscaScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfiguracoesScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.medical_services,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Quando Eles Chegarem: MedPed!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tudo que você precisa saber para manejar de forma correta e tranquila seus pacientes pediátricos, na palma da sua mão.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Cálculo de Doses Section
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cálculo de Doses Pediátricas',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'As principais medicações usadas na pediatria, divididas por categorias, para auxiliá-lo nas suas condutas diárias.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Medication Categories Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.2,
                    children: [
                      _buildCategoryCard(
                        context,
                        'Antibióticos',
                        Icons.bug_report,
                        Color(0xFFE74C3C),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AntibioticosScreen()),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Anti-convulsionantes',
                        Icons.psychology,
                        Color(0xFF9B59B6),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AnticonvulsionantesScreen()),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Anti-inflamatórios',
                        Icons.local_fire_department,
                        Color(0xFFE67E22),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AntiinflamatoriosScreen()),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Anti-fúngicos',
                        Icons.eco,
                        Color(0xFF27AE60),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AntifungicosScreen()),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Anti-histamínicos',
                        Icons.healing,
                        Color(0xFF3498DB),
                        () => _navigateToCategory(context, 'antihistaminicos'),
                      ),
                      _buildCategoryCard(
                        context,
                        'Anti-parasitários',
                        Icons.bug_report_outlined,
                        Color(0xFF8E44AD),
                        () => _navigateToCategory(context, 'antiparasitarios'),
                      ),
                      _buildCategoryCard(
                        context,
                        'Broncodilatadores',
                        Icons.air,
                        Color(0xFF1ABC9C),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BroncodilatadoresScreen()),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Corticosteróides',
                        Icons.medical_information,
                        Color(0xFFF39C12),
                        () => _navigateToCategory(context, 'corticosteroides'),
                      ),
                      _buildCategoryCard(
                        context,
                        'Laxativos',
                        Icons.cleaning_services,
                        Color(0xFF95A5A6),
                        () => _navigateToCategory(context, 'laxativos'),
                      ),
                      _buildCategoryCard(
                        context,
                        'Sintomáticos',
                        Icons.healing,
                        Color(0xFFE91E63),
                        () => _navigateToCategory(context, 'sintomaticos'),
                      ),
                      _buildCategoryCard(
                        context,
                        'Hidratação Venosa',
                        Icons.water_drop,
                        Color(0xFF00BCD4),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HidratacaoVenosaScreen()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Puericultura Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7ED321), Color(0xFF6BCF1A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Puericultura',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Destacamos os pontos fundamentais para auxiliá-lo no acompanhamento de seus pacientes, de maneira rápida e eficaz.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Puericultura Categories
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.2,
                    children: [
                      _buildCategoryCard(
                        context,
                        'Alimentação',
                        Icons.restaurant,
                        Colors.white,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PuericulturaScreen(categoria: 'alimentacao'),
                          ),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Crescimento',
                        Icons.trending_up,
                        Colors.white,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PuericulturaScreen(categoria: 'crescimento'),
                          ),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Suplementação',
                        Icons.medication,
                        Colors.white,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PuericulturaScreen(categoria: 'suplementacao'),
                          ),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Vacinas',
                        Icons.vaccines,
                        Colors.white,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PuericulturaScreen(categoria: 'vacinas'),
                          ),
                        ),
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

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color, [
    VoidCallback? onTap,
  ]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Categoria $category será implementada em breve!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}