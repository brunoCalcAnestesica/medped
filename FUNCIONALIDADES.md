# Funcionalidades Implementadas - MedPed

## 📱 Visão Geral
O MedPed é um aplicativo Flutter desenvolvido para auxiliar profissionais de saúde no cálculo de doses pediátricas e consulta de informações de puericultura.

## 🏥 Categorias de Medicamentos Implementadas

### 1. Antibióticos
- **Medicamentos incluídos:**
  - Amicacina
  - Amoxicilina
  - Amoxicilina + Clavulanato
  - Ampicilina
  - Azitromicina
  - Cefalexina
  - Ceftriaxona
  - Ciprofloxacino
  - Claritromicina
  - Eritromicina
  - Gentamicina
  - Metronidazol
  - Penicilina G
  - Vancomicina

- **Funcionalidades:**
  - Cálculo de dose baseado no peso
  - Informações sobre apresentações disponíveis
  - Indicações clínicas
  - Orientações importantes
  - Via de administração

### 2. Anti-convulsionantes
- **Medicamentos incluídos:**
  - Fenobarbital
  - Fenitoína
  - Carbamazepina
  - Valproato de Sódio
  - Levetiracetam

- **Funcionalidades:**
  - Cálculo de dose diária
  - Dose por aplicação
  - Monitoramento de níveis séricos
  - Interações medicamentosas

### 3. Anti-inflamatórios
- **Medicamentos incluídos:**
  - Ibuprofeno
  - Dipirona
  - Paracetamol
  - Cetoprofeno
  - Nimesulida

- **Funcionalidades:**
  - Cálculo de dose por peso
  - Intervalos de administração
  - Orientações sobre uso com alimentos
  - Monitoramento de efeitos adversos

### 4. Anti-fúngicos
- **Medicamentos incluídos:**
  - Fluconazol
  - Nistatina
  - Anfotericina B
  - Caspofungina

- **Funcionalidades:**
  - Cálculo de dose baseado no peso
  - Diferentes vias de administração
  - Monitoramento de função hepática
  - Orientações específicas por medicamento

### 5. Broncodilatadores
- **Medicamentos incluídos:**
  - Salbutamol
  - Fenoterol
  - Ipratrópio
  - Terbutalina

- **Funcionalidades:**
  - Cálculo de dose para inalação
  - Orientações sobre uso de espaçadores
  - Monitoramento de efeitos cardíacos
  - Diferentes apresentações

### 6. Hidratação Venosa
- **Tipos de hidratação:**
  - Hidratação de Manutenção
  - Hidratação para Desidratação Leve
  - Hidratação para Desidratação Moderada
  - Hidratação para Desidratação Grave

- **Funcionalidades:**
  - Cálculo usando fórmula de Holliday-Segar
  - Cálculo de déficit baseado no grau de desidratação
  - Taxa de infusão
  - Orientações sobre monitoramento

## 👶 Seção Puericultura

### 1. Alimentação
- Orientações sobre aleitamento materno
- Introdução alimentar
- Nutrição por faixa etária
- Dicas práticas

### 2. Crescimento
- Curvas de crescimento
- Marcos do desenvolvimento
- Avaliação antropométrica
- Sinais de alerta

### 3. Suplementação
- Vitaminas e minerais
- Indicações de suplementação
- Doses recomendadas
- Orientações para pais

### 4. Vacinas
- Calendário vacinal
- Esquemas de vacinação
- Contraindicações
- Efeitos adversos

## 🔍 Funcionalidades Gerais

### 1. Busca de Medicamentos
- Busca por nome do medicamento
- Busca por categoria
- Navegação direta para telas específicas
- Interface intuitiva

### 2. Configurações
- Configurações de notificações
- Modo escuro
- Unidades de medida (kg/lb, ml/cc)
- Informações sobre o app
- Limpeza de dados

### 3. Cálculos Médicos
- Utilitários para cálculos comuns
- Conversão de unidades
- Validação de dados
- Formatação de resultados

## 🛠️ Estrutura Técnica

### Arquivos Principais
- `lib/main.dart` - Tela principal e navegação
- `lib/screens/` - Telas específicas por categoria
- `lib/data/medicamentos_data.dart` - Dados centralizados
- `lib/utils/calculos_medicos.dart` - Utilitários de cálculo

### Telas Implementadas
1. `HomeScreen` - Tela principal com categorias
2. `AntibioticosScreen` - Cálculo de antibióticos
3. `AnticonvulsionantesScreen` - Cálculo de anti-convulsionantes
4. `AntiinflamatoriosScreen` - Cálculo de anti-inflamatórios
5. `AntifungicosScreen` - Cálculo de anti-fúngicos
6. `BroncodilatadoresScreen` - Cálculo de broncodilatadores
7. `HidratacaoVenosaScreen` - Cálculo de hidratação
8. `PuericulturaScreen` - Informações de puericultura
9. `BuscaScreen` - Busca de medicamentos
10. `ConfiguracoesScreen` - Configurações do app

## 🎨 Interface do Usuário

### Design System
- Cores temáticas por categoria
- Cards com elevação
- Ícones intuitivos
- Tipografia consistente
- Gradientes visuais

### Navegação
- AppBar com ações
- Navegação entre telas
- Botões de voltar
- Feedback visual

### Responsividade
- Layout adaptável
- Scroll em telas longas
- Grid responsivo
- Espaçamento consistente

## 📊 Dados e Informações

### Fonte dos Dados
- Baseado no site PedAjuda
- Informações médicas validadas
- Doses pediátricas padronizadas
- Orientações clínicas atualizadas

### Estrutura de Dados
- Listas de medicamentos por categoria
- Informações completas por medicamento
- Cálculos automáticos
- Validação de entrada

## 🔒 Segurança e Validação

### Validações Implementadas
- Verificação de campos obrigatórios
- Validação de peso (0-200kg)
- Validação de idade (0-18 anos)
- Feedback de erros ao usuário

### Tratamento de Erros
- Mensagens de erro claras
- Validação de entrada
- Tratamento de exceções
- Interface robusta

## 🚀 Próximas Implementações

### Categorias Pendentes
- Anti-histamínicos
- Anti-parasitários
- Corticosteróides
- Laxativos
- Sintomáticos

### Funcionalidades Futuras
- Histórico de cálculos
- Favoritos
- Notificações de medicamentos
- Modo offline
- Sincronização de dados
- Relatórios
- Exportação de dados

## 📱 Compatibilidade

### Plataformas Suportadas
- Android
- iOS
- Web (Flutter Web)
- Desktop (Windows, macOS, Linux)

### Requisitos Mínimos
- Flutter 3.0+
- Dart 2.17+
- Android API 21+
- iOS 11.0+

## 📄 Licença e Créditos

### Créditos
- Desenvolvido baseado no site PedAjuda
- Informações médicas validadas
- Interface inspirada em boas práticas de UX

### Licença
- Projeto educacional
- Uso para fins médicos
- Responsabilidade do profissional de saúde

---

**Nota:** Este aplicativo é uma ferramenta de apoio e não substitui o julgamento clínico do profissional de saúde. Sempre consulte as bulas dos medicamentos e protocolos locais antes de prescrever. 