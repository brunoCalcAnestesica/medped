import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({Key? key}) : super(key: key);

  @override
  _ConfiguracoesScreenState createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  bool _notificacoesAtivadas = true;
  bool _modoEscuro = false;
  String _unidadePeso = 'kg';
  String _unidadeVolume = 'ml';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Color(0xFF4A90E2),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Seção Geral
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Geral',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Notificações
                  SwitchListTile(
                    title: Text('Notificações'),
                    subtitle: Text('Receber lembretes de medicamentos'),
                    value: _notificacoesAtivadas,
                    onChanged: (value) {
                      setState(() {
                        _notificacoesAtivadas = value;
                      });
                    },
                    secondary: Icon(Icons.notifications),
                  ),
                  
                  // Modo Escuro
                  SwitchListTile(
                    title: Text('Modo Escuro'),
                    subtitle: Text('Ativar tema escuro'),
                    value: _modoEscuro,
                    onChanged: (value) {
                      setState(() {
                        _modoEscuro = value;
                      });
                    },
                    secondary: Icon(Icons.dark_mode),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Seção Unidades
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unidades',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Unidade de Peso
                  ListTile(
                    title: Text('Unidade de Peso'),
                    subtitle: Text('Unidade padrão para peso'),
                    trailing: DropdownButton<String>(
                      value: _unidadePeso,
                      items: ['kg', 'lb'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _unidadePeso = newValue!;
                        });
                      },
                    ),
                    leading: Icon(Icons.monitor_weight),
                  ),
                  
                  // Unidade de Volume
                  ListTile(
                    title: Text('Unidade de Volume'),
                    subtitle: Text('Unidade padrão para volume'),
                    trailing: DropdownButton<String>(
                      value: _unidadeVolume,
                      items: ['ml', 'cc'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _unidadeVolume = newValue!;
                        });
                      },
                    ),
                    leading: Icon(Icons.water_drop),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Seção Sobre
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  ListTile(
                    title: Text('Versão do App'),
                    subtitle: Text('1.0.0'),
                    leading: Icon(Icons.info),
                  ),
                  
                  ListTile(
                    title: Text('Desenvolvedor'),
                    subtitle: Text('MedPed Team'),
                    leading: Icon(Icons.person),
                  ),
                  
                  ListTile(
                    title: Text('Política de Privacidade'),
                    leading: Icon(Icons.privacy_tip),
                    onTap: () {
                      // TODO: Implementar política de privacidade
                    },
                  ),
                  
                  ListTile(
                    title: Text('Termos de Uso'),
                    leading: Icon(Icons.description),
                    onTap: () {
                      // TODO: Implementar termos de uso
                    },
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Botão Limpar Dados
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dados',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  ListTile(
                    title: Text('Limpar Dados'),
                    subtitle: Text('Remover todos os dados salvos'),
                    leading: Icon(Icons.delete_forever, color: Colors.red),
                    onTap: () {
                      _mostrarDialogoConfirmacao();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoConfirmacao() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Tem certeza que deseja limpar todos os dados? Esta ação não pode ser desfeita.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _limparDados();
              },
              child: Text('Confirmar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _limparDados() {
    // TODO: Implementar limpeza de dados
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Dados limpos com sucesso'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 