import 'package:flutter/material.dart';

class AntiinflamatoriosScreen extends StatefulWidget {
  const AntiinflamatoriosScreen({Key? key}) : super(key: key);

  @override
  _AntiinflamatoriosScreenState createState() => _AntiinflamatoriosScreenState();
}

class _AntiinflamatoriosScreenState extends State<AntiinflamatoriosScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _medicamentoSelecionado;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _antiinflamatorios = [
    {
      'nome': 'Ibuprofeno',
      'via': 'VO',
      'dose': 30.0, // mg/kg/dia
      'intervalo': '6/6h',
      'apresentacoes': [
        'Suspensão 100mg/5ml',
        'Suspensão 200mg/5ml',
        'Comprimido 400mg',
        'Comprimido 600mg',
      ],
      'indicacoes': [
        'Febre',
        'Dor leve a moderada',
        'Processos inflamatórios',
        'Cefaleia',
        'Dor pós-operatória',
      ],
      'orientacoes': [
        'Tomar com alimentos',
        'Não usar por mais de 3 dias para febre',
        'Pode causar irritação gástrica',
        'Evitar em casos de úlcera gástrica',
      ],
    },
    {
      'nome': 'Dipirona',
      'via': 'VO/IM/IV',
      'dose': 25.0, // mg/kg/dia
      'intervalo': '6/6h',
      'apresentacoes': [
        'Suspensão 500mg/5ml',
        'Comprimido 500mg',
        'Ampola 500mg/2ml',
        'Ampola 1g/2ml',
      ],
      'indicacoes': [
        'Febre',
        'Dor aguda',
        'Cólica',
        'Dor pós-operatória',
        'Cefaleia',
      ],
      'orientacoes': [
        'Pode causar agranulocitose (raro)',
        'Monitorar hemograma em uso prolongado',
        'Evitar em casos de porfiria',
        'Pode causar hipotensão',
      ],
    },
    {
      'nome': 'Paracetamol',
      'via': 'VO/IM/IV',
      'dose': 60.0, // mg/kg/dia
      'intervalo': '6/6h',
      'apresentacoes': [
        'Suspensão 200mg/5ml',
        'Suspensão 500mg/5ml',
        'Comprimido 500mg',
        'Ampola 500mg/5ml',
      ],
      'indicacoes': [
        'Febre',
        'Dor leve a moderada',
        'Cefaleia',
        'Dor pós-operatória',
        'Dor de dente',
      ],
      'orientacoes': [
        'Não exceder 4g/dia',
        'Monitorar função hepática',
        'Evitar em casos de hepatopatia',
        'Pode causar hepatotoxicidade em overdose',
      ],
    },
    {
      'nome': 'Cetoprofeno',
      'via': 'VO/IM',
      'dose': 2.0, // mg/kg/dia
      'intervalo': '12/12h',
      'apresentacoes': [
        'Suspensão 20mg/ml',
        'Comprimido 50mg',
        'Ampola 50mg/2ml',
      ],
      'indicacoes': [
        'Processos inflamatórios',
        'Dor articular',
        'Dor pós-operatória',
        'Traumatismos',
      ],
      'orientacoes': [
        'Tomar com alimentos',
        'Monitorar função renal',
        'Pode causar fotossensibilidade',
        'Evitar em casos de úlcera gástrica',
      ],
    },
    {
      'nome': 'Nimesulida',
      'via': 'VO',
      'dose': 5.0, // mg/kg/dia
      'intervalo': '12/12h',
      'apresentacoes': [
        'Suspensão 50mg/5ml',
        'Comprimido 100mg',
        'Comprimido 200mg',
      ],
      'indicacoes': [
        'Processos inflamatórios',
        'Dor articular',
        'Febre',
        'Dor pós-operatória',
      ],
      'orientacoes': [
        'Contraindicado em menores de 12 anos',
        'Monitorar função hepática',
        'Pode causar hepatotoxicidade',
        'Usar com cautela',
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
    var medicamento = _antiinflamatorios.firstWhere(
      (med) => med['nome'] == _medicamentoSelecionado,
    );

    double doseTotal = medicamento['dose'] * peso;
    double dosePorAplicacao = doseTotal / 4; // Assumindo 4 aplicações por dia

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
        title: Text('Anti-inflamatórios'),
        backgroundColor: Color(0xFFE67E22),
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
                        color: Color(0xFFE67E22),
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
                        labelText: 'Selecione o Anti-inflamatório',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.local_fire_department),
                      ),
                      items: _antiinflamatorios.map<DropdownMenuItem<String>>((med) {
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
                          backgroundColor: Color(0xFFE67E22),
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
                          color: Color(0xFFE67E22),
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
                          color: Color(0xFFE67E22),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['apresentacoes'] as List<String>).map((apresentacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.medication, size: 16, color: Color(0xFFE67E22)),
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
                          color: Color(0xFFE67E22),
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
                          color: Color(0xFFE67E22),
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
                color: Color(0xFFE67E22),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 