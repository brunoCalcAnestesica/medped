import 'package:flutter/material.dart';

class AntibioticosScreen extends StatefulWidget {
  @override
  _AntibioticosScreenState createState() => _AntibioticosScreenState();
}

class _AntibioticosScreenState extends State<AntibioticosScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _antibioticoSelecionado;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _antibioticos = [
    {
      'nome': 'Amicacina',
      'via': 'IM/IV',
      'dose': 15.0, // mg/kg/dia
      'intervalo': '8/8h',
      'apresentacoes': [
        'Ampola 100mg/2ml',
        'Ampola 500mg/2ml',
        'Frasco 1g/4ml',
      ],
      'indicacoes': [
        'Infecções do trato urinário',
        'Infecções respiratórias',
        'Infecções intra-abdominais',
        'Sepse',
      ],
      'orientacoes': [
        'Monitorar função renal',
        'Ajustar dose em insuficiência renal',
        'Evitar uso prolongado',
      ],
    },
    {
      'nome': 'Amoxicilina',
      'via': 'VO',
      'dose': 50.0, // mg/kg/dia
      'intervalo': '8/8h',
      'apresentacoes': [
        'Suspensão 250mg/5ml',
        'Suspensão 500mg/5ml',
        'Comprimido 500mg',
        'Comprimido 875mg',
      ],
      'indicacoes': [
        'Otite média aguda',
        'Sinusite',
        'Faringoamigdalite',
        'Infecções do trato urinário',
      ],
      'orientacoes': [
        'Tomar com ou sem alimentos',
        'Completar o tratamento',
        'Pode causar diarreia',
      ],
    },
    {
      'nome': 'Amoxicilina + Clavulanato',
      'via': 'VO',
      'dose': 45.0, // mg/kg/dia (amoxicilina)
      'intervalo': '8/8h',
      'apresentacoes': [
        'Suspensão 200mg/5ml + 28,5mg/5ml',
        'Suspensão 400mg/5ml + 57mg/5ml',
        'Comprimido 500mg + 125mg',
        'Comprimido 875mg + 125mg',
      ],
      'indicacoes': [
        'Infecções por bactérias produtoras de beta-lactamase',
        'Otite média aguda',
        'Sinusite',
        'Infecções respiratórias',
      ],
      'orientacoes': [
        'Tomar com alimentos',
        'Monitorar função hepática',
        'Pode causar diarreia',
      ],
    },
    {
      'nome': 'Ampicilina',
      'via': 'IM/IV',
      'dose': 100.0, // mg/kg/dia
      'intervalo': '6/6h',
      'apresentacoes': [
        'Frasco 500mg',
        'Frasco 1g',
        'Frasco 2g',
      ],
      'indicacoes': [
        'Meningite',
        'Endocardite',
        'Infecções graves',
        'Sepse neonatal',
      ],
      'orientacoes': [
        'Monitorar função renal',
        'Ajustar dose em insuficiência renal',
        'Pode causar rash cutâneo',
      ],
    },
    {
      'nome': 'Azitromicina',
      'via': 'VO',
      'dose': 10.0, // mg/kg/dia
      'intervalo': '1x/dia',
      'apresentacoes': [
        'Suspensão 200mg/5ml',
        'Suspensão 500mg/5ml',
        'Comprimido 500mg',
      ],
      'indicacoes': [
        'Infecções respiratórias',
        'Pneumonia atípica',
        'Infecções por clamídia',
        'Otite média aguda',
      ],
      'orientacoes': [
        'Tomar 1h antes ou 2h após refeições',
        'Tratamento de 3-5 dias',
        'Pode causar náuseas',
      ],
    },
  ];

  void _calcularDose() {
    if (_pesoController.text.isEmpty || _antibioticoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha o peso e selecione um antibiótico'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double peso = double.parse(_pesoController.text);
    var antibiotico = _antibioticos.firstWhere(
      (ab) => ab['nome'] == _antibioticoSelecionado,
    );

    double doseTotal = antibiotico['dose'] * peso;
    double dosePorAplicacao = doseTotal / 3; // Assumindo 3 aplicações por dia

    setState(() {
      _resultado = {
        'antibiotico': antibiotico,
        'peso': peso,
        'doseTotal': doseTotal,
        'dosePorAplicacao': dosePorAplicacao,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antibióticos'),
        backgroundColor: Color(0xFFE74C3C),
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
                      'Cálculo de Dose',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE74C3C),
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
                    
                    // Seleção de Antibiótico
                    DropdownButtonFormField<String>(
                      value: _antibioticoSelecionado,
                      decoration: InputDecoration(
                        labelText: 'Selecione o Antibiótico',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.medication),
                      ),
                      items: _antibioticos.map<DropdownMenuItem<String>>((ab) {
                        return DropdownMenuItem<String>(
                          value: ab['nome'] as String,
                          child: Text('${ab['nome']} (${ab['via']})'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _antibioticoSelecionado = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    
                    // Botão Calcular
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calcularDose,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE74C3C),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Calcular Dose',
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
                          color: Color(0xFFE74C3C),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      _buildResultItem('Antibiótico', _resultado!['antibiotico']['nome']),
                      _buildResultItem('Via', _resultado!['antibiotico']['via']),
                      _buildResultItem('Peso', '${_resultado!['peso']} kg'),
                      _buildResultItem('Dose Total/Dia', '${_resultado!['doseTotal'].toStringAsFixed(1)} mg'),
                      _buildResultItem('Dose por Aplicação', '${_resultado!['dosePorAplicacao'].toStringAsFixed(1)} mg'),
                      _buildResultItem('Intervalo', _resultado!['antibiotico']['intervalo']),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Apresentações
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apresentações Disponíveis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE74C3C),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['antibiotico']['apresentacoes'] as List<String>).map((apresentacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.medication, size: 16, color: Color(0xFFE74C3C)),
                              SizedBox(width: 8),
                              Expanded(child: Text(apresentacao)),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Indicações
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Indicações Clínicas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE74C3C),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['antibiotico']['indicacoes'] as List<String>).map((indicacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, size: 16, color: Colors.green),
                              SizedBox(width: 8),
                              Expanded(child: Text(indicacao)),
                            ],
                          ),
                        );
                      }).toList(),
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
                        'Orientações',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE74C3C),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['antibiotico']['orientacoes'] as List<String>).map((orientacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.info, size: 16, color: Colors.blue),
                              SizedBox(width: 8),
                              Expanded(child: Text(orientacao)),
                            ],
                          ),
                        );
                      }).toList(),
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
                color: Color(0xFFE74C3C),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 