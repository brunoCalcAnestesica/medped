import 'package:flutter/material.dart';

class PuericulturaScreen extends StatefulWidget {
  final String categoria;

  PuericulturaScreen({required this.categoria});

  @override
  _PuericulturaScreenState createState() => _PuericulturaScreenState();
}

class _PuericulturaScreenState extends State<PuericulturaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: Color(0xFF7ED321),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.categoria == 'alimentacao') ...[
              _buildAlimentacaoContent(),
            ] else if (widget.categoria == 'crescimento') ...[
              _buildCrescimentoContent(),
            ] else if (widget.categoria == 'suplementacao') ...[
              _buildSuplementacaoContent(),
            ] else if (widget.categoria == 'vacinas') ...[
              _buildVacinasContent(),
            ] else ...[
              _buildDefaultContent(),
            ],
          ],
        ),
      ),
    );
  }

  String _getTitle() {
    switch (widget.categoria) {
      case 'alimentacao':
        return 'Alimentação';
      case 'crescimento':
        return 'Crescimento';
      case 'suplementacao':
        return 'Suplementação';
      case 'vacinas':
        return 'Vacinas';
      default:
        return 'Puericultura';
    }
  }

  Widget _buildAlimentacaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aleitamento Materno',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7ED321),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'A Organização Mundial da Saúde (OMS), o Ministério da Saúde do Brasil (MS) e a Sociedade Brasileira de Pediatria (SBP) recomendam por 2 anos ou mais, sendo de forma exclusiva nos primeiros 6 meses.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 20),
        
        _buildFAQItem(
          'Quando iniciar a amamentação?',
          'A amamentação deve ser iniciada tão logo quanto possível após o parto, sempre que as condições de saúde da mãe e do bebê permitirem. A sucção precoce da mama reduz o risco de hemorragia pós-parto, ao liberar ocitocina, e de icterícia no recém-nascido, por aumentar a motilidade gastrointestinal.',
        ),
        
        _buildFAQItem(
          'Qual deve ser a frequência das mamadas?',
          'O leite materno deve ser oferecido em livre demanda, ou seja, quando ele quiser. O estabelecimento de horários para o aleitamento só gera ansiedade para a mãe. É comum um bebê em AME sob livre demanda mamar de 8 a 12 vezes ao dia.',
        ),
        
        _buildFAQItem(
          'Qual o padrão de evacuação do recém-nascido?',
          'O bebê em aleitamento materno costuma evacuar toda vez que mama, podendo ter fezes líquidas, explosivas, amareladas ou mesmo esverdeadas (reflexo gastrocólico exacerbado). Assim, o recém-nascido pode evacuar cerca de 8 vezes/dia, como também pode ficar sem defecar durante 7 dias. Ambas as situações são normais.',
        ),
        
        _buildFAQItem(
          'O que fazer diante a queixa de "pouco leite"?',
          'A lactante produz em média 800 ml de leite por dia, o que suplanta em muito a necessidade alimentar do bebê. Muitas vezes, fatores como depressão puerperal, técnica inadequada de amamentação e afecções mamárias podem levar de fato a uma redução da produção láctea (hipogalactia).',
        ),
        
        _buildFAQItem(
          'Aleitamento Materno e Anticoncepção',
          'O Método de Amenorréia Lactacional é seguro se três regras forem respeitadas: 1ª) O aleitamento deve ser exclusivo ou predominante de dia e de noite; 2ª) A nutriz deve estar em amenorreia; 3ª) Durante os seis primeiros meses de vida apenas.',
        ),
      ],
    );
  }

  Widget _buildCrescimentoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Curvas de Crescimento',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7ED321),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'O acompanhamento do crescimento é fundamental para avaliar a saúde e o desenvolvimento adequado da criança.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 20),
        
        _buildFAQItem(
          'Como interpretar as curvas de crescimento?',
          'As curvas de crescimento da OMS são o padrão internacional para avaliar o crescimento de crianças de 0 a 5 anos. Percentis entre 3 e 97 são considerados normais. Abaixo do percentil 3 pode indicar desnutrição, e acima do percentil 97 pode indicar sobrepeso.',
        ),
        
        _buildFAQItem(
          'Qual a velocidade de crescimento esperada?',
          'No primeiro ano de vida, o bebê cresce cerca de 25 cm. No segundo ano, cresce aproximadamente 12 cm. A partir dos 2 anos, o crescimento é mais lento, cerca de 5-7 cm por ano até a puberdade.',
        ),
        
        _buildFAQItem(
          'Quando se preocupar com o crescimento?',
          'Preocupe-se quando: 1) A criança não cresce por 3 meses consecutivos; 2) Está abaixo do percentil 3; 3) Há mudança brusca no percentil; 4) Crescimento está abaixo do esperado para a idade.',
        ),
      ],
    );
  }

  Widget _buildSuplementacaoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suplementação Vitamínica',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7ED321),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'A suplementação vitamínica é importante para garantir o desenvolvimento adequado da criança.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 20),
        
        _buildFAQItem(
          'Vitamina D',
          'Recomendada para todos os bebês desde o nascimento até 1 ano: 400 UI/dia. Para crianças de 1-18 anos: 600 UI/dia. Importante para o desenvolvimento ósseo e sistema imunológico.',
        ),
        
        _buildFAQItem(
          'Vitamina K',
          'Administrada no nascimento (1mg IM) para prevenir doença hemorrágica do recém-nascido. Em casos de amamentação exclusiva, pode ser necessária suplementação adicional.',
        ),
        
        _buildFAQItem(
          'Ferro',
          'Suplementação de 1mg/kg/dia a partir dos 4 meses para bebês em aleitamento materno exclusivo. Para crianças de 6-24 meses: 11mg/dia. Previne anemia ferropriva.',
        ),
        
        _buildFAQItem(
          'Flúor',
          'Suplementação de flúor deve ser individualizada baseada na concentração de flúor na água de abastecimento. Geralmente iniciada aos 6 meses de idade.',
        ),
      ],
    );
  }

  Widget _buildVacinasContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calendário Vacinal',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7ED321),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'O calendário vacinal é essencial para proteger a criança contra doenças infecciosas.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 20),
        
        _buildVacinaItem('Ao nascer', 'BCG, Hepatite B'),
        _buildVacinaItem('2 meses', 'Pentavalente, VORH, Pneumocócica 10V, Meningocócica C'),
        _buildVacinaItem('4 meses', 'Pentavalente, VORH, Pneumocócica 10V, Meningocócica C'),
        _buildVacinaItem('6 meses', 'Pentavalente, VORH, Pneumocócica 10V, Meningocócica C'),
        _buildVacinaItem('9 meses', 'Febre Amarela'),
        _buildVacinaItem('12 meses', 'Tríplice Viral, Meningocócica C'),
        _buildVacinaItem('15 meses', 'DTP, VOP'),
        _buildVacinaItem('4 anos', 'DTP, VOP, Tríplice Viral, Varicela'),
      ],
    );
  }

  Widget _buildDefaultContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.child_care,
            size: 100,
            color: Color(0xFF7ED321),
          ),
          SizedBox(height: 20),
          Text(
            'Puericultura',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7ED321),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Selecione uma categoria específica para ver mais informações.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF7ED321),
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              answer,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVacinaItem(String idade, String vacinas) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          Icons.vaccines,
          color: Color(0xFF7ED321),
        ),
        title: Text(
          idade,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF7ED321),
          ),
        ),
        subtitle: Text(
          vacinas,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
} 