import 'package:flutter/material.dart';
import 'antibioticos_screen.dart';
import 'anticonvulsionantes_screen.dart';
import 'antiinflamatorios_screen.dart';
import 'hidratacaovenosa_screen.dart';

class BuscaScreen extends StatefulWidget {
  const BuscaScreen({Key? key}) : super(key: key);

  @override
  _BuscaScreenState createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _resultados = [];
  bool _isSearching = false;

  final List<Map<String, dynamic>> _todosMedicamentos = [
    {'nome': 'Amicacina', 'categoria': 'Antibióticos', 'cor': Color(0xFFE74C3C), 'tela': 'antibioticos'},
    {'nome': 'Amoxicilina', 'categoria': 'Antibióticos', 'cor': Color(0xFFE74C3C), 'tela': 'antibioticos'},
    {'nome': 'Fenobarbital', 'categoria': 'Anti-convulsionantes', 'cor': Color(0xFF9B59B6), 'tela': 'anticonvulsionantes'},
    {'nome': 'Ibuprofeno', 'categoria': 'Anti-inflamatórios', 'cor': Color(0xFFE67E22), 'tela': 'antiinflamatorios'},
    {'nome': 'Hidratação de Manutenção', 'categoria': 'Hidratação Venosa', 'cor': Color(0xFF00BCD4), 'tela': 'hidratacaovenosa'},
  ];

  void _buscarMedicamentos(String query) {
    if (query.isEmpty) {
      setState(() {
        _resultados = [];
        _isSearching = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _resultados = _todosMedicamentos.where((med) {
        return med['nome'].toString().toLowerCase().contains(query.toLowerCase()) ||
               med['categoria'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _navegarParaTela(String tela) {
    Widget telaDestino;
    
    switch (tela) {
      case 'antibioticos':
        telaDestino = AntibioticosScreen();
        break;
      case 'anticonvulsionantes':
        telaDestino = AnticonvulsionantesScreen();
        break;
      case 'antiinflamatorios':
        telaDestino = AntiinflamatoriosScreen();
        break;
      case 'hidratacaovenosa':
        telaDestino = HidratacaoVenosaScreen();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tela não implementada ainda')),
        );
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => telaDestino));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Medicamentos'),
        backgroundColor: Color(0xFF4A90E2),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Digite o nome do medicamento...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: _buscarMedicamentos,
            ),
          ),
          
          Expanded(
            child: _isSearching
                ? _resultados.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                            SizedBox(height: 16),
                            Text('Nenhum medicamento encontrado', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _resultados.length,
                        itemBuilder: (context, index) {
                          var medicamento = _resultados[index];
                          return Card(
                            margin: EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: medicamento['cor'],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.medication, color: Colors.white),
                              ),
                              title: Text(medicamento['nome'], style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(medicamento['categoria']),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () => _navegarParaTela(medicamento['tela']),
                            ),
                          );
                        },
                      )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, size: 80, color: Colors.grey[400]),
                        SizedBox(height: 16),
                        Text('Busque por medicamentos', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
} 