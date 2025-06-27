import 'package:flutter/material.dart';

class HidratacaoVenosaScreen extends StatefulWidget {
  const HidratacaoVenosaScreen({Key? key}) : super(key: key);

  @override
  _HidratacaoVenosaScreenState createState() => _HidratacaoVenosaScreenState();
}

class _HidratacaoVenosaScreenState extends State<HidratacaoVenosaScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _tipoHidratacao;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _tiposHidratacao = [
    {
      'nome': 'Hidratação de Manutenção',
      'descricao': 'Para pacientes que não conseguem ingerir líquidos por via oral',
      'formula': 'Fórmula de Holliday-Segar',
      'calculo': 'Peso < 10kg: 100ml/kg/dia\n10-20kg: 1000ml + 50ml/kg/dia (acima de 10kg)\n>20kg: 1500ml + 20ml/kg/dia (acima de 20kg)',
    },
    {
      'nome': 'Hidratação para Desidratação Leve',
      'descricao': 'Perda de 3-5% do peso corporal',
      'formula': 'Reposição + Manutenção',
      'calculo': 'Déficit: 50ml/kg\nManutenção: Fórmula de Holliday-Segar\nRepor em 4-6 horas',
    },
    {
      'nome': 'Hidratação para Desidratação Moderada',
      'descricao': 'Perda de 6-9% do peso corporal',
      'formula': 'Reposição + Manutenção',
      'calculo': 'Déficit: 100ml/kg\nManutenção: Fórmula de Holliday-Segar\nRepor em 4-6 horas',
    },
    {
      'nome': 'Hidratação para Desidratação Grave',
      'descricao': 'Perda de 10% ou mais do peso corporal',
      'formula': 'Reposição + Manutenção',
      'calculo': 'Déficit: 150ml/kg\nManutenção: Fórmula de Holliday-Segar\nRepor em 2-4 horas',
    },
  ];

  void _calcularHidratacao() {
    if (_pesoController.text.isEmpty || _tipoHidratacao == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha o peso e selecione o tipo de hidratação'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double peso = double.parse(_pesoController.text);
    var tipo = _tiposHidratacao.firstWhere(
      (t) => t['nome'] == _tipoHidratacao,
    );

    double manutencao = _calcularManutencao(peso);
    double deficit = _calcularDeficit(peso, tipo['nome']);
    double total = manutencao + deficit;

    setState(() {
      _resultado = {
        'tipo': tipo,
        'peso': peso,
        'manutencao': manutencao,
        'deficit': deficit,
        'total': total,
      };
    });
  }

  double _calcularManutencao(double peso) {
    if (peso < 10) {
      return peso * 100;
    } else if (peso <= 20) {
      return 1000 + (peso - 10) * 50;
    } else {
      return 1500 + (peso - 20) * 20;
    }
  }

  double _calcularDeficit(double peso, String tipo) {
    switch (tipo) {
      case 'Hidratação para Desidratação Leve':
        return peso * 50;
      case 'Hidratação para Desidratação Moderada':
        return peso * 100;
      case 'Hidratação para Desidratação Grave':
        return peso * 150;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hidratação Venosa'),
        backgroundColor: Color(0xFF00BCD4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Section
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cálculo de Hidratação Venosa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00BCD4),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Peso Input
                    TextField(
                      controller: _pesoController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Peso da Criança (kg)',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.monitor_weight),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Seleção de Tipo de Hidratação
                    DropdownButtonFormField<String>(
                      value: _tipoHidratacao,
                      decoration: InputDecoration(
                        labelText: 'Tipo de Hidratação',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.water_drop),
                      ),
                      items: _tiposHidratacao.map<DropdownMenuItem<String>>((tipo) {
                        return DropdownMenuItem<String>(
                          value: tipo['nome'] as String,
                          child: Text(tipo['nome']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _tipoHidratacao = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    
                    // Botão Calcular
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calcularHidratacao,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00BCD4),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Calcular Hidratação',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Resultado
            if (_resultado != null) ...[
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resultado do Cálculo',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      _buildResultItem('Tipo', _resultado!['tipo']['nome']),
                      _buildResultItem('Peso', '${_resultado!['peso']} kg'),
                      _buildResultItem('Hidratação de Manutenção', '${_resultado!['manutencao'].toStringAsFixed(0)} ml/dia'),
                      if (_resultado!['deficit'] > 0) ...[
                        _buildResultItem('Déficit a Repor', '${_resultado!['deficit'].toStringAsFixed(0)} ml'),
                        _buildResultItem('Total (24h)', '${_resultado!['total'].toStringAsFixed(0)} ml'),
                        _buildResultItem('Taxa de Infusão', '${(_resultado!['total'] / 24).toStringAsFixed(1)} ml/h'),
                      ],
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Descrição
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Descrição',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        _resultado!['tipo']['descricao'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Fórmula
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fórmula Utilizada',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        _resultado!['tipo']['formula'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _resultado!['tipo']['calculo'],
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Orientações
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Orientações Importantes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(height: 12),
                      _buildOrientacaoItem(
                        'Monitoramento',
                        'Avaliar sinais vitais, turgor cutâneo, mucosas e fontanela',
                      ),
                      _buildOrientacaoItem(
                        'Soluções',
                        'SF 0,9% ou Ringer Lactato para reposição de volume',
                      ),
                      _buildOrientacaoItem(
                        'Glicose',
                        'Soro glicosado 5% para manutenção',
                      ),
                      _buildOrientacaoItem(
                        'Eletrólitos',
                        'Monitorar Na+, K+, Cl- e bicarbonato',
                      ),
                      _buildOrientacaoItem(
                        'Reavaliação',
                        'Reavaliar a cada 2-4 horas',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF00BCD4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrientacaoItem(String titulo, String descricao) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, size: 16, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              descricao,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
} 