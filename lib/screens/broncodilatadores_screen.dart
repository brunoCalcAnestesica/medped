import 'package:flutter/material.dart';

class BroncodilatadoresScreen extends StatefulWidget {
  const BroncodilatadoresScreen({Key? key}) : super(key: key);

  @override
  _BroncodilatadoresScreenState createState() => _BroncodilatadoresScreenState();
}

class _BroncodilatadoresScreenState extends State<BroncodilatadoresScreen> {
  final TextEditingController _pesoController = TextEditingController();
  String? _medicamentoSelecionado;
  Map<String, dynamic>? _resultado;

  final List<Map<String, dynamic>> _broncodilatadores = [
    {
      'nome': 'Salbutamol',
      'via': 'Inalatório/IV',
      'dose': 0.15, // mg/kg/dose
      'intervalo': '4-6h',
      'apresentacoes': [
        'Aerossol 100mcg/dose',
        'Solução para nebulização 5mg/ml',
        'Ampola 0.5mg/ml',
      ],
      'indicacoes': [
        'Broncoespasmo agudo',
        'Asma',
        'Bronquiolite',
        'DPOC',
      ],
      'orientacoes': [
        'Usar espaçador em crianças pequenas',
        'Monitorar frequência cardíaca',
        'Pode causar tremores',
        'Não exceder 8 inalações/dia',
      ],
    },
    {
      'nome': 'Fenoterol',
      'via': 'Inalatório',
      'dose': 0.1, // mg/kg/dose
      'intervalo': '4-6h',
      'apresentacoes': [
        'Aerossol 100mcg/dose',
        'Solução para nebulização 1mg/ml',
      ],
      'indicacoes': [
        'Broncoespasmo agudo',
        'Asma',
        'Bronquiolite',
      ],
      'orientacoes': [
        'Usar espaçador',
        'Monitorar efeitos cardíacos',
        'Pode causar tremores',
        'Usar com cautela em cardiopatas',
      ],
    },
    {
      'nome': 'Ipratrópio',
      'via': 'Inalatório',
      'dose': 0.25, // mg/dose
      'intervalo': '6-8h',
      'apresentacoes': [
        'Aerossol 20mcg/dose',
        'Solução para nebulização 0.25mg/ml',
      ],
      'indicacoes': [
        'Broncoespasmo',
        'Asma',
        'Bronquiolite',
        'DPOC',
      ],
      'orientacoes': [
        'Usar espaçador',
        'Pode causar boca seca',
        'Não usar em glaucoma',
        'Efeito mais lento que beta-2',
      ],
    },
    {
      'nome': 'Terbutalina',
      'via': 'Inalatório/SC',
      'dose': 0.01, // mg/kg/dose
      'intervalo': '4-6h',
      'apresentacoes': [
        'Aerossol 250mcg/dose',
        'Ampola 0.5mg/ml',
      ],
      'indicacoes': [
        'Broncoespasmo agudo',
        'Asma',
        'Bronquiolite',
      ],
      'orientacoes': [
        'Usar espaçador',
        'Monitorar frequência cardíaca',
        'Pode causar tremores',
        'Via SC em emergências',
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
    var medicamento = _broncodilatadores.firstWhere(
      (med) => med['nome'] == _medicamentoSelecionado,
    );

    double dosePorAplicacao = medicamento['dose'] * peso;

    setState(() {
      _resultado = {
        'medicamento': medicamento,
        'peso': peso,
        'dosePorAplicacao': dosePorAplicacao,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broncodilatadores'),
        backgroundColor: Color(0xFF1ABC9C),
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
                        color: Color(0xFF1ABC9C),
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
                        labelText: 'Selecione o Broncodilatador',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.air),
                      ),
                      items: _broncodilatadores.map<DropdownMenuItem<String>>((med) {
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
                          backgroundColor: Color(0xFF1ABC9C),
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
                          color: Color(0xFF1ABC9C),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      _buildResultItem('Medicamento', _resultado!['medicamento']['nome']),
                      _buildResultItem('Via', _resultado!['medicamento']['via']),
                      _buildResultItem('Peso', '${_resultado!['peso']} kg'),
                      _buildResultItem('Dose por Aplicação', '${_resultado!['dosePorAplicacao'].toStringAsFixed(3)} mg'),
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
                          color: Color(0xFF1ABC9C),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...(_resultado!['medicamento']['apresentacoes'] as List<String>).map((apresentacao) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.medication, size: 16, color: Color(0xFF1ABC9C)),
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
                          color: Color(0xFF1ABC9C),
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
                          color: Color(0xFF1ABC9C),
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
                color: Color(0xFF1ABC9C),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 