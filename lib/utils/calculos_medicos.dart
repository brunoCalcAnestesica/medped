class CalculosMedicos {
  /// Calcula a dose baseada no peso
  static double calcularDose(double peso, double dosePorKg) {
    return peso * dosePorKg;
  }

  /// Calcula a dose por aplicação baseada no intervalo
  static double calcularDosePorAplicacao(double doseTotal, int aplicacoesPorDia) {
    return doseTotal / aplicacoesPorDia;
  }

  /// Calcula a hidratação de manutenção usando a fórmula de Holliday-Segar
  static double calcularHidratacaoManutencao(double peso) {
    if (peso < 10) {
      return peso * 100;
    } else if (peso <= 20) {
      return 1000 + (peso - 10) * 50;
    } else {
      return 1500 + (peso - 20) * 20;
    }
  }

  /// Calcula o déficit de hidratação baseado no grau de desidratação
  static double calcularDeficitHidratacao(double peso, String grauDesidratacao) {
    switch (grauDesidratacao.toLowerCase()) {
      case 'leve':
        return peso * 50;
      case 'moderada':
        return peso * 100;
      case 'grave':
        return peso * 150;
      default:
        return 0;
    }
  }

  /// Calcula a taxa de infusão em ml/h
  static double calcularTaxaInfusao(double volumeTotal, int horas) {
    return volumeTotal / horas;
  }

  /// Calcula a superfície corporal usando a fórmula de DuBois
  static double calcularSuperficieCorporal(double peso, double altura) {
    return 0.007184 * (peso * 0.425) * (altura * 0.725);
  }

  /// Converte peso de kg para lb
  static double kgParaLb(double kg) {
    return kg * 2.20462;
  }

  /// Converte peso de lb para kg
  static double lbParaKg(double lb) {
    return lb / 2.20462;
  }

  /// Converte volume de ml para cc
  static double mlParaCc(double ml) {
    return ml; // 1ml = 1cc
  }

  /// Valida se o peso está dentro de um range aceitável
  static bool validarPeso(double peso) {
    return peso > 0 && peso <= 200; // 0-200kg
  }

  /// Valida se a idade está dentro de um range aceitável
  static bool validarIdade(int idade) {
    return idade >= 0 && idade <= 18; // 0-18 anos
  }

  /// Calcula a dose baseada na superfície corporal
  static double calcularDosePorSuperficieCorporal(double superficieCorporal, double dosePorMetroQuadrado) {
    return superficieCorporal * dosePorMetroQuadrado;
  }

  /// Calcula o índice de massa corporal (IMC)
  static double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  /// Classifica o IMC em crianças
  static String classificarIMCCrianca(double imc, int idade, String sexo) {
    // Esta é uma implementação simplificada
    // Em um app real, seria necessário usar tabelas específicas por idade e sexo
    if (imc < 18.5) {
      return 'Baixo peso';
    } else if (imc < 25) {
      return 'Peso normal';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }

  /// Calcula a frequência cardíaca máxima estimada
  static int calcularFrequenciaCardiacaMaxima(int idade) {
    return 220 - idade;
  }

  /// Calcula a pressão arterial sistólica normal estimada
  static int calcularPressaoArterialSistolicaNormal(int idade) {
    return 90 + (idade * 2);
  }

  /// Calcula a pressão arterial diastólica normal estimada
  static int calcularPressaoArterialDiastolicaNormal(int idade) {
    return 60 + idade;
  }

  /// Formata um número para exibição com o número correto de casas decimais
  static String formatarNumero(double numero, {int casasDecimais = 1}) {
    return numero.toStringAsFixed(casasDecimais);
  }

  /// Formata uma dose para exibição
  static String formatarDose(double dose, String unidade) {
    return '${formatarNumero(dose)} $unidade';
  }

  /// Formata um volume para exibição
  static String formatarVolume(double volume, String unidade) {
    return '${formatarNumero(volume)} $unidade';
  }
} 