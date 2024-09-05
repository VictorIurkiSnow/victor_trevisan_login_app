# victor_trevisan_login_app

## Requisitos de ambiente

Este projeto foi desenvolvido utilizando Flutter.

- Flutter SDK: `>=3.4.4 <4.0.0`
- Dart SDK compatível

## Dependências

As principais dependências usadas neste projeto são:

- **cupertino_icons**: Ícones padrão do iOS.
- **get_it**: Injeção de dependências.
- **get**: Gerenciamento de estado e rotas.
- **go_router**: Navegação e gerenciamento de rotas.
- **dio**: Cliente HTTP para requisições de API.
- **test**: Ferramenta de testes unitários.
- **mocktail**: Mocking para testes unitários.

## Dependências de desenvolvimento

- **flutter_test**: Framework de testes do Flutter.
- **flutter_lints**: Conjunto de regras de linting recomendadas para projetos Flutter.

## Configuração de Assets

O projeto utiliza os seguintes assets:

- **Diretório de assets**: `assets/`
- **Imagens**: `assets/images/login_image.jpg`

## Estrutura de Pastas


- `assets/`: Armazena os recursos como imagens e arquivos estáticos.
- `lib/`: Contém o código principal da aplicação.
    - `core/`: Contém partes fundamentais e reutilizáveis do projeto. Ele centraliza as funções, classes e estruturas que podem ser usadas em diversas partes da aplicação, promovendo uma arquitetura mais modular e organizada.
        - `adapter/`: Ponto de integração da APIs, padronizando a comunicação.
        - `constants/`: Chaves de API, URLs de endpoints e qualquer valor que não deva ser alterado ao longo da execução do aplicativo.
        - `generic/`: Armazena implementações genéricas ou abstratas que podem ser reutilizadas em várias partes do projeto. 
        - `page_bases/`: Contém classes base para páginas da aplicação. Essas bases definem a estrutura fundamental que outras páginas herdam, como layouts, configurações padrões, headers, tratamento de erros, e configurações comuns de UI ou lógica.
        - `routes/`:Centraliza a definição e gerenciamento das rotas de navegação do aplicativo. Aqui ficam as configurações do sistema de rotas (usando, por exemplo, go_router), possibilitando o redirecionamento entre diferentes páginas ou módulos do app. Inclui rotas nomeadas e parâmetros de rota.
        - `services/`:Armazena classes de serviços que encapsulam a lógica de operações complexas, como autenticação. Cada serviço foca em uma responsabilidade única, facilitando a manutenção e o teste de funcionalidades críticas.
        - `utils/`: Pasta que contém utilitários e funções auxiliares usadas em várias partes do projeto. Incluir funções como formatação de datas, validação de entradas, manipulação de strings, conversores, etc. São ferramentas que não estão diretamente relacionadas à lógica de negócio, mas que auxiliam no funcionamento geral do aplicativo.
        - `widgets/`: Armazena widgets reutilizáveis. Esses widgets podem ser componentes de interface gráfica (UI) genéricos, como botões customizados, caixas de diálogo, formulários, campos de texto, ou outros elementos visuais que podem ser usados em diversas telas.
        
    - `features/`: pasta que contém as features
        - `community/`: feature 1
        - `login/`: feature 2
        - `home/`: feature 3
            - `data/`:  Camada responsável pelo acesso aos dados, seja de APIs externas ou fontes locais (bancos de dados, arquivos). Inclui as implementações de fontes de dados e repositórios.
                - `datasource/`: Contém as fontes de dados, que podem ser APIs remotas (como chamadas HTTP) ou locais (como cache, banco de dados local). Exemplos de arquivos: classes que utilizam Dio para requisições HTTP ou Hive para armazenamento local.
                - `repository/`: Implementação dos repositórios que conectam a camada de dados à camada de domínio, definindo como os dados são manipulados e servidos à aplicação.
            - `domain/`: Camada de negócio que contém as regras e entidades da aplicação. Essa camada é independente de qualquer framework ou biblioteca externa, focando nas funcionalidades centrais da feature.
                - `entity/`: Define as entidades que representam os modelos de dados puros da aplicação. São classes que descrevem objetos de negócio com seus atributos e comportamentos.
                - `repository/`:  Interface dos repositórios, que descrevem os métodos que devem ser implementados pela camada de dados para fornecer os dados necessários à aplicação.               
                - `usecase/`: Contém os casos de uso, ou seja, a lógica de negócios específica que coordena as ações necessárias para cumprir os requisitos da feature. Aqui ficam as classes que interagem com os repositórios e implementam o fluxo principal de dados e regras.
            - `presentation/`: Camada de apresentação, que lida com a interface do usuário (UI) e interações com o sistema. Contém as interfaces gráficas e lógica de exibição tanto para plataformas móveis quanto para web.
                - `common/`: Contém componentes e widgets que são utilizados em ambas as plataformas (mobile e web). Inclui elementos reutilizáveis, como botões, formulários, validadores, etc.
                - `mobile/`: Interface específica para dispositivos móveis (iOS e Android), contendo widgets e layouts otimizados para telas pequenas. Exemplo: telas de login, listas, cards, etc.
                - `web/`: Interface específica para navegadores web, com layouts e widgets ajustados para telas maiores, com maior detalhamento e navegação mais complexa. Exemplos: versões web das telas de login, dashboards, etc.



- `test/`: Contém os testes unitários


## Funcionalidades

- Gerenciamento de estado com `GetX`.
- Navegação entre páginas com `go_router`.
- Testes unitários com `flutter_test` e `mocktail`.
- Tratamento de requisições HTTP utilizando `dio`.