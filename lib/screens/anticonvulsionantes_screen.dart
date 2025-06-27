import 'package:flutter/material.dart';

class AnticonvulsionantesScreen extends StatefulWidget {
  const AnticonvulsionantesScreen({Key? key}) : super(key: key);

  @override
  _AnticonvulsionantesScreenState createState() => _AnticonvulsionantesScreenState();
}

class _AnticonvulsionantesScreenState extends State<AnticonvulsionantesScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _medicamentoSelecionado;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _anticonvulsionantes = [
    {
      'nome': 'Fenobarbital',
      'via': 'VO/IM/IV',
      'dose': 3.0, // mg/kg/dia
      'intervalo': '1x/dia',
      'apresentacoes': [
        'Comprimido 100mg',
        'Elixir 40mg/5ml',
        'Ampola 200mg/2ml',
      ],
      'indicacoes': [
        'Epilepsia',
        'Convulsões febris',
        'Status epilepticus',
        'Profilaxia de convulsões',
      ],
      'orientacoes': [
        'Monitorar níveis séricos',
        'Ajustar dose gradualmente',
        'Pode causar sedação',
        'Interação com outros medicamentos',
      ],
    },
    {
      'nome': 'Fenitoína',
      'via': 'VO/IM/IV',
      'dose': 5.0, // mg/kg/dia
      'intervalo': '2x/dia',
      'apresentacoes': [
        'Cápsula 100mg',
        'Suspensão 30mg/5ml',
        'Ampola 250mg/5ml',
      ],
      'indicacoes': [
        'Epilepsia parcial',
        'Convulsões tônico-clônicas',
        'Status epilepticus',
        'Profilaxia pós-trauma',
      ],
      'orientacoes': [
        'Monitorar níveis séricos (10-20 mcg/ml)',
        'Ajustar dose baseado em níveis',
        'Pode causar hiperplasia gengival',
        'Interação com múltiplos medicamentos',
      ],
    },
    {
      'nome': 'Carbamazepina',
      'via': 'VO',
      'dose': 10.0, // mg/kg/dia
      'intervalo': '2x/dia',
      'apresentacoes': [
        'Comprimido 200mg',
        'Suspensão 100mg/5ml',
        'Comprimido de liberação controlada 200mg',
      ],
      'indicacoes': [
        'Epilepsia parcial',
        'Convulsões tônico-clônicas',
        'Neuralgia do trigêmeo',
        'Transtorno bipolar',
      ],
      'orientacoes': [
        'Monitorar hemograma completo',
        'Iniciar com dose baixa',
        'Pode causar rash cutâneo',
        'Interação com contraceptivos',
      ],
    },
    {
      'nome': 'Valproato de Sódio',
      'via': 'VO/IV',
      'dose': 20.0, // mg/kg/dia
      'intervalo': '2x/dia',
      'apresentacoes': [
        'Comprimido 250mg',
        'Suspensão 200mg/5ml',
        'Ampola 400mg/4ml',
      ],
      'indicacoes': [
        'Epilepsia generalizada',
        'Convulsões mioclônicas',
        'Convulsões de ausência',
        'Transtorno bipolar',
      ],
      'orientacoes': [
        'Monitorar função hepática',
        'Monitorar hemograma',
        'Contraindicado em gestantes',
        'Pode causar ganho de peso',
      ],
    },
    {
      'nome': 'Levetiracetam',
      'via': 'VO/IV',
      'dose': 20.0, // mg/kg/dia
      'intervalo': '2x/dia',
      'apresentacoes': [
        'Comprimido 250mg',
        'Suspensão 100mg/ml',
        'Ampola 500mg/5ml',
      ],
      'indicacoes': [
        'Epilepsia parcial',
        'Convulsões mioclônicas',
        'Convulsões tônico-clônicas',
        'Epilepsia refratária',
      ],
      'orientacoes': [
        'Boa tolerabilidade',
        'Poucas interações medicamentosas',
        'Pode causar irritabilidade',
        'Monitorar função renal',
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
    var medicamento = _anticonvulsionantes.firstWhere(
      (med) => med['nome'] == _medicamentoSelecionado,
    );

    double doseTotal = medicamento['dose'] * peso;
    double dosePorAplicacao = doseTotal / 2; // Assumindo 2 aplicações por dia

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
        title: Text('Anti-convulsionantes'),
        backgroundColor: Color(0xFF9B59B6),
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
                        color: Color(0xFF9B59B6),
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
                        labelText: 'Selecione o Anti-convulsionante',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.psychology),
                      ),
                      items: _anticonvulsionantes.map<DropdownMenuItem<String>>((med) {
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
                          backgroundColor: Color(0xFF9B59B6),
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
                          color: Color(0xFF9B59B6),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      _buildResultItem('Medicamento', _resultado!['medicamento']['nome']),
                      _buildResultItem('Via', _resultado!['medicamento']['via']),
                      _buildResultItem('Peso', '${_resultado!['peso']} kg'),
                      _buildResultItem('Dose Total/Dia', '${_resultado!['doseTotal'].toStringAsFixed(1)} mg'),
                      _buildResultItem('Dose por Aplicação', '${_resultado!['dosePorAplicacao'].toStringAsFixed(1)} mg'),
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
                          color: Color(0xFF9B59B6),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['apresentacoes'] as List<String>).map((apresentacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.medication, size: 16, color: Color(0xFF9B59B6)),
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
                          color: Color(0xFF9B59B6),
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
                          color: Color(0xFF9B59B6),
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
                color: Color(0xFF9B59B6),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 