import 'package:flutter/material.dart';

class AntifungicosScreen extends StatefulWidget {
  const AntifungicosScreen({Key? key}) : super(key: key);

  @override
  _AntifungicosScreenState createState() => _AntifungicosScreenState();
}

class _AntifungicosScreenState extends State<AntifungicosScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _medicamentoSelecionado;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _antifungicos = [
    {
      'nome': 'Fluconazol',
      'via': 'VO/IV',
      'dose': 6.0, // mg/kg/dia
      'intervalo': '1x/dia',
      'apresentacoes': [
        'Suspensão 50mg/5ml',
        'Comprimido 100mg',
        'Comprimido 200mg',
        'Ampola 200mg/100ml',
      ],
      'indicacoes': [
        'Candidíase oral',
        'Candidíase esofágica',
        'Candidíase sistêmica',
        'Profilaxia em imunossuprimidos',
      ],
      'orientacoes': [
        'Monitorar função hepática',
        'Ajustar dose em insuficiência renal',
        'Pode causar náuseas',
        'Interação com múltiplos medicamentos',
      ],
    },
    {
      'nome': 'Nistatina',
      'via': 'VO',
      'dose': 100000, // UI/kg/dia
      'intervalo': '4x/dia',
      'apresentacoes': [
        'Suspensão 100.000 UI/ml',
        'Comprimido 500.000 UI',
      ],
      'indicacoes': [
        'Candidíase oral',
        'Candidíase intestinal',
        'Profilaxia de candidíase',
      ],
      'orientacoes': [
        'Manter na boca por alguns minutos',
        'Não engolir imediatamente',
        'Pode causar náuseas',
        'Seguro para uso prolongado',
      ],
    },
    {
      'nome': 'Anfotericina B',
      'via': 'IV',
      'dose': 1.0, // mg/kg/dia
      'intervalo': '1x/dia',
      'apresentacoes': [
        'Ampola 50mg',
        'Ampola 100mg',
      ],
      'indicacoes': [
        'Candidíase sistêmica grave',
        'Criptococose',
        'Aspergilose',
        'Infecções fúngicas invasivas',
      ],
      'orientacoes': [
        'Monitorar função renal',
        'Monitorar eletrólitos',
        'Pode causar febre e calafrios',
        'Infusão lenta necessária',
      ],
    },
    {
      'nome': 'Caspofungina',
      'via': 'IV',
      'dose': 50.0, // mg/m²/dia
      'intervalo': '1x/dia',
      'apresentacoes': [
        'Ampola 50mg',
        'Ampola 70mg',
      ],
      'indicacoes': [
        'Candidíase invasiva',
        'Aspergilose refratária',
        'Infecções fúngicas graves',
      ],
      'orientacoes': [
        'Dose baseada na superfície corporal',
        'Monitorar função hepática',
        'Pode causar reações alérgicas',
        'Infusão em 1 hora',
      ],
    },
  ];

  void _calcularDose() {
    if (_pesoController.text.isEmpty || _medicamentoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha o peso e selecione um medicamento'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double peso = double.parse(_pesoController.text);
    var medicamento = _antifungicos.firstWhere(
      (med) => med['nome'] == _medicamentoSelecionado,
    );

    double doseTotal = medicamento['dose'] * peso;
    double dosePorAplicacao = doseTotal;

    setState(() {
      _resultado = {
        'medicamento': medicamento,
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
        title: Text('Anti-fúngicos'),
        backgroundColor: Color(0xFF27AE60),
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
                        color: Color(0xFF27AE60),
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
                    
                    // Seleção de Medicamento
                    DropdownButtonFormField<String>(
                      value: _medicamentoSelecionado,
                      decoration: InputDecoration(
                        labelText: 'Selecione o Anti-fúngico',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.eco),
                      ),
                      items: _antifungicos.map<DropdownMenuItem<String>>((med) {
                        return DropdownMenuItem<String>(
                          value: med['nome'] as String,
                          child: Text('${med['nome']} (${med['via']})'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _medicamentoSelecionado = value;
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
                          backgroundColor: Color(0xFF27AE60),
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
                          color: Color(0xFF27AE60),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      _buildResultItem('Medicamento', _resultado!['medicamento']['nome']),
                      _buildResultItem('Via', _resultado!['medicamento']['via']),
                      _buildResultItem('Peso', '${_resultado!['peso']} kg'),
                      _buildResultItem('Dose Total/Dia', '${_resultado!['doseTotal'].toStringAsFixed(1)} ${_resultado!['medicamento']['nome'] == 'Nistatina' ? 'UI' : 'mg'}'),
                      _buildResultItem('Dose por Aplicação', '${_resultado!['dosePorAplicacao'].toStringAsFixed(1)} ${_resultado!['medicamento']['nome'] == 'Nistatina' ? 'UI' : 'mg'}'),
                      _buildResultItem('Intervalo', _resultado!['medicamento']['intervalo']),
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
                          color: Color(0xFF27AE60),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['apresentacoes'] as List<String>).map((apresentacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.medication, size: 16, color: Color(0xFF27AE60)),
                              SizedBox(width: 8),
                              Expanded(child: Text(apresentacao)),
                            ],
                          ),
                        );
                      }),
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
                          color: Color(0xFF27AE60),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['indicacoes'] as List<String>).map((indicacao) {
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
                      }),
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
                          color: Color(0xFF27AE60),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['orientacoes'] as List<String>).map((orientacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.warning, size: 16, color: Colors.orange),
                              SizedBox(width: 8),
                              Expanded(child: Text(orientacao)),
                            ],
                          ),
                        );
                      }),
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
                color: Color(0xFF27AE60),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 