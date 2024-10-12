# DiveCalc2 - Plano de Mergulho

Bem-vindo ao **DiveCalc2**, um aplicativo desenvolvido para ajudar mergulhadores e profissionais de resgate a planejar e monitorar suas atividades subaquáticas com precisão e segurança. O projeto foi criado com o objetivo de fornecer uma plataforma intuitiva e eficiente para planejamento de mergulhos, cálculo de reflutuação e registro de ocorrências.

## 📋 Descrição do Projeto

O **DiveCalc2** é um aplicativo multiplataforma desenvolvido em Flutter, voltado para mergulhadores profissionais, especialmente para uso em operações de resgate. Ele inclui as seguintes funcionalidades:

- **Plano de Mergulho**: Interface interativa para planejar mergulhos com campos específicos para detalhamento das operações.
- **Pré-Planejamento**: Ferramenta para planejamento e configuração de mergulhos antes das operações.
- **Registro de Ocorrências**: Registro e acompanhamento de ocorrências durante e após as atividades subaquáticas.
- **Reflutuação**: Cálculo de reflutuação para ajudar a gerenciar operações de resgate subaquático.

## 🚀 Funcionalidades

- **Interface Intuitiva**: Design simples e intuitivo, facilitando o preenchimento e gerenciamento dos planos de mergulho.
- **Integração com WebView**: Capacidade de renderizar páginas HTML interativas para visualização de planos e relatórios.
- **Geração de PDFs**: Possibilidade de gerar relatórios detalhados em PDF a partir dos planos de mergulho e ocorrências registradas.
- **Salvamento Local**: Armazenamento dos dados localmente no dispositivo para acesso e consulta futura.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework principal para desenvolvimento multiplataforma (iOS e Android).
- **Dart**: Linguagem de programação usada para escrever o código do aplicativo.
- **WebView Flutter**: Para exibir conteúdo HTML e interativo dentro do app.
- **SQLite / Hive**: Para armazenamento local e persistência de dados.
- **HTML/CSS**: Para criação de layouts interativos que são renderizados no WebView.
- **PDF Generation**: Utilização de pacotes como `flutter_html_to_pdf` e `pdf` para criação de relatórios em PDF.

## 📲 Como Executar o Projeto

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado na sua máquina.
- Emulador ou dispositivo físico conectado.

### Passos para Execução

1. Clone este repositório:
   git clone https://github.com/seu-usuario/divecalc2.git

2. Navegue até a pasta do projeto:
   cd divecalc2

3. Instale as dependências:
   flutter pub get

4. Execute o aplicativo:
   flutter run

   Certifique-se de que você tenha um emulador ativo ou um dispositivo físico conectado para rodar o aplicativo. O comando acima compilará o aplicativo e o executará no dispositivo escolhido.

5. Caso você precise construir o APK para distribuição ou testes em um dispositivo Android, use o comando:
   flutter build apk

   O APK será gerado na pasta build/app/outputs/flutter-apk/ e poderá ser instalado manualmente no dispositivo.

6. Para testar o aplicativo no iOS, você precisará de um Mac com o Xcode instalado. Configure o projeto para o iOS com:
   flutter build ios

   Abra o arquivo Runner.xcworkspace no Xcode, configure um dispositivo ou simulador, e clique em **Run** para executar o aplicativo.

> **Nota**: Certifique-se de ter todas as dependências e permissões corretamente configuradas no AndroidManifest.xml (Android) e Info.plist (iOS) para que o WebView e outras funcionalidades funcionem corretamente.

## 📚 Documentação

Confira a [documentação do Flutter](https://flutter.dev/docs) para mais informações sobre como configurar e rodar projetos Flutter.

## 🖼️ Screenshots

*Adicione aqui capturas de tela do aplicativo funcionando, se possível, para ilustrar as funcionalidades.*

## 💼 Contato e Redes Sociais

Conecte-se comigo para acompanhar meus projetos e novidades:

- [LinkedIn](https://www.linkedin.com/in/nicollas-soares/)
- [Website](https://nicksoares.com/)
- [GitHub](https://github.com/nickksoares)

## 📄 Licença

Este projeto está sob a licença Licença Pública Geral Affero GNU Consulte o arquivo [LICENSE](./LICENSE) para mais informações.

---

Desenvolvido com 💙 por **[Nicollas Soares](https://www.linkedin.com/in/nicollas-soares/))**.

