class MedicamentosData {
  static final List<Map<String, dynamic>> antibioticos = [
    {
      'nome': 'Amicacina',
      'via': 'IM/IV',
      'dose': 15.0,
      'intervalo': '1x/dia',
      'apresentacoes': ['Ampola 500mg/2ml', 'Ampola 1g/2ml'],
      'indicacoes': ['Infecções graves', 'Infecções do trato urinário', 'Septicemia'],
      'orientacoes': ['Monitorar função renal', 'Ajustar dose em insuficiência renal'],
    },
    {
      'nome': 'Amoxicilina',
      'via': 'VO',
      'dose': 50.0,
      'intervalo': '8/8h',
      'apresentacoes': ['Suspensão 250mg/5ml', 'Suspensão 500mg/5ml', 'Comprimido 500mg'],
      'indicacoes': ['Otite média', 'Sinusite', 'Infecções respiratórias'],
      'orientacoes': ['Tomar com ou sem alimentos', 'Pode causar diarreia'],
    },
  ];

  static final List<Map<String, dynamic>> anticonvulsionantes = [
    {
      'nome': 'Fenobarbital',
      'via': 'VO/IM/IV',
      'dose': 3.0,
      'intervalo': '1x/dia',
      'apresentacoes': ['Comprimido 100mg', 'Elixir 40mg/5ml', 'Ampola 200mg/2ml'],
      'indicacoes': ['Epilepsia', 'Convulsões febris', 'Status epilepticus'],
      'orientacoes': ['Monitorar níveis séricos', 'Ajustar dose gradualmente'],
    },
  ];

  static final List<Map<String, dynamic>> antiinflamatorios = [
    {
      'nome': 'Ibuprofeno',
      'via': 'VO',
      'dose': 30.0,
      'intervalo': '6/6h',
      'apresentacoes': ['Suspensão 100mg/5ml', 'Suspensão 200mg/5ml'],
      'indicacoes': ['Febre', 'Dor leve a moderada', 'Processos inflamatórios'],
      'orientacoes': ['Tomar com alimentos', 'Não usar por mais de 3 dias para febre'],
    },
  ];

  static final List<Map<String, dynamic>> hidratacaoVenosa = [
    {
      'nome': 'Hidratação de Manutenção',
      'descricao': 'Para pacientes que não conseguem ingerir líquidos por via oral',
      'formula': 'Fórmula de Holliday-Segar',
      'calculo': 'Peso < 10kg: 100ml/kg/dia\n10-20kg: 1000ml + 50ml/kg/dia\n>20kg: 1500ml + 20ml/kg/dia',
    },
  ];

  static final List<Map<String, dynamic>> todosMedicamentos = [
    ...antibioticos.map((med) => {...med, 'categoria': 'Antibióticos', 'cor': 0xFFE74C3C}),
    ...anticonvulsionantes.map((med) => {...med, 'categoria': 'Anti-convulsionantes', 'cor': 0xFF9B59B6}),
    ...antiinflamatorios.map((med) => {...med, 'categoria': 'Anti-inflamatórios', 'cor': 0xFFE67E22}),
    ...hidratacaoVenosa.map((med) => {...med, 'categoria': 'Hidratação Venosa', 'cor': 0xFF00BCD4}),
  ];
} 