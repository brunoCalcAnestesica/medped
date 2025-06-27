# MedPed - PedAjuda

## 📱 Aplicativo de Cálculo de Doses Pediátricas e Puericultura

O **MedPed** é um aplicativo Flutter baseado no site [PedAjuda](https://pedajuda.com.br), desenvolvido para auxiliar profissionais de saúde no cálculo de doses pediátricas e fornecer informações sobre puericultura.

## 🎯 Sobre o Projeto

Este projeto foi inspirado no site PedAjuda, que é um recurso desenvolvido por doutorandos do curso de Medicina da Universidade Federal do Rio Grande do Norte (UFRN) e docentes do Internato de Pediatria. O objetivo é disponibilizar as informações de forma mais acessível através de um aplicativo móvel.

## ✨ Funcionalidades

### 💊 Cálculo de Doses Pediátricas

O aplicativo oferece cálculo de doses para as principais categorias de medicamentos usados em pediatria:

- **Antibióticos** - Amicacina, Amoxicilina, Amoxicilina + Clavulanato, Ampicilina, Azitromicina
- **Anti-convulsionantes** - Em desenvolvimento
- **Anti-inflamatórios** - Em desenvolvimento
- **Anti-fúngicos** - Em desenvolvimento
- **Anti-histamínicos** - Em desenvolvimento
- **Anti-parasitários** - Em desenvolvimento
- **Broncodilatadores** - Em desenvolvimento
- **Corticosteróides** - Em desenvolvimento
- **Laxativos** - Em desenvolvimento
- **Sintomáticos** - Em desenvolvimento
- **Hidratação Venosa** - Em desenvolvimento

### 👶 Puericultura

Informações essenciais sobre o acompanhamento de crianças:

- **Alimentação** - Aleitamento materno, frequência das mamadas, padrão de evacuação
- **Crescimento** - Curvas de crescimento, velocidade esperada, quando se preocupar
- **Suplementação** - Vitamina D, Vitamina K, Ferro, Flúor
- **Vacinas** - Calendário vacinal completo

## 🚀 Como Usar

### Cálculo de Doses

1. Selecione a categoria de medicamento desejada
2. Digite o peso da criança em quilogramas
3. Escolha o medicamento específico
4. Visualize o resultado com:
   - Dose total por dia
   - Dose por aplicação
   - Intervalo de administração
   - Apresentações disponíveis
   - Indicações clínicas
   - Orientações importantes

### Puericultura

1. Acesse a seção de Puericultura
2. Escolha o tópico desejado (Alimentação, Crescimento, Suplementação ou Vacinas)
3. Explore as informações organizadas em formato de FAQ expansível

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento multiplataforma
- **Dart** - Linguagem de programação
- **Material Design** - Design system do Google

## 📱 Plataformas Suportadas

- Android
- iOS
- Web (em desenvolvimento)
- Desktop (em desenvolvimento)

## 🔧 Instalação e Execução

### Pré-requisitos

- Flutter SDK (versão 3.0 ou superior)
- Dart SDK
- Android Studio / VS Code
- Emulador Android ou dispositivo físico

### Passos para Execução

1. Clone o repositório:
```bash
git clone https://github.com/brunoCalcAnestesica/medped.git
cd medped
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o aplicativo:
```bash
flutter run
```

## 📋 Estrutura do Projeto

```
lib/
├── main.dart                 # Arquivo principal do aplicativo
├── screens/
│   ├── antibioticos_screen.dart    # Tela de cálculo de antibióticos
│   └── puericultura_screen.dart    # Tela de puericultura
└── shared/                   # Componentes compartilhados (futuro)
```

## 🎨 Design e Interface

O aplicativo utiliza um design moderno e intuitivo com:

- **Cores temáticas** - Azul para medicamentos, verde para puericultura
- **Cards interativos** - Interface limpa e organizada
- **Navegação intuitiva** - Fácil acesso às funcionalidades
- **Responsividade** - Adaptável a diferentes tamanhos de tela

## 📚 Base de Dados

As informações do aplicativo são baseadas em:

- **Site PedAjuda** - Fonte principal de dados
- **Sociedade Brasileira de Pediatria (SBP)**
- **Organização Mundial da Saúde (OMS)**
- **Ministério da Saúde do Brasil**

## ⚠️ Aviso Importante

Este conteúdo foi desenvolvido baseado nas principais referências da área, com objetivo de orientar médicos, estudantes e profissionais da saúde em seu dia-a-dia profissional. Ele não deve ser utilizado por pessoas que não se incluam nos grupos citados. Suas condutas servem como orientações para tomadas de decisão por escolha médica.

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores

- **Bruno Daroz** - Desenvolvimento do aplicativo Flutter
- **PedAjuda Team** - Conteúdo médico original

## 🙏 Agradecimentos

- Equipe do site PedAjuda pela disponibilização do conteúdo
- Universidade Federal do Rio Grande do Norte (UFRN)
- Sociedade Brasileira de Pediatria (SBP)

## 📞 Contato

- **GitHub**: [@brunoCalcAnestesica](https://github.com/brunoCalcAnestesica)
- **Projeto Original**: [PedAjuda](https://pedajuda.com.br)

---

**MedPed** - Quando Eles Chegarem: MedPed! 🏥👶
