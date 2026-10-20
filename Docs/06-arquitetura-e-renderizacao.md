# Arquitetura e renderização

## Estado e requisitos

O responsável definiu SSR como requisito e informou que o site não precisa de banco de dados nesta etapa. A escolha do frontend deve considerar o perfil do projeto, sem preferência prévia por React/Next.js.

A implementação disponível continua sendo HTML e CSS em `public/`. Este documento registra a comparação e uma proposta técnica; não confirma instalação de framework, execução de SSR ou escolha de hospedagem.

O produto continua sendo apresentação da marca e cardápio, com os nomes e a origem editorial descritos em [Projeto e cardápio](01-projeto-e-cardapio.md). Identidade visual, fontes, conteúdo confirmado e navegação acessível são referências para a migração. O visual ainda depende da revisão do responsável.

## O que significa SSR nesta proposta

SSR significa montar o HTML da página no servidor durante uma requisição. Gerar o HTML uma vez no build é pré-renderização estática. Ambos podem entregar conteúdo completo ao navegador; a presença desse conteúdo, sozinha, não distingue os modos. Essa diferença aparece na [renderização sob demanda do Astro](https://docs.astro.build/en/guides/on-demand-rendering/).

O requisito está sendo interpretado como SSR por requisição. A arquitetura não depende de banco: o servidor pode montar a página a partir de dados editoriais versionados. Alterar esses dados ainda exigirá publicar a versão correspondente do site; SSR não cria uma interface administrativa ou atualização automática da planilha.

## Responsabilidades propostas

| Parte | Responsabilidade |
| --- | --- |
| Dados do cardápio | Arquivo TypeScript com categorias, nomes e notas confirmadas, usado como fonte única pela página. |
| Componentes de apresentação | Cabeçalho, apresentação, grupos de produtos, história e rodapé, conforme as responsabilidades já visíveis no HTML. |
| Página e layout | Compor os componentes, definir metadados e produzir o HTML no servidor. |
| CSS e recursos da marca | Aplicar a identidade existente, adaptar o layout às telas e entregar fontes e imagens locais. |
| Código no navegador | Atender interações que precisem dele; a leitura principal do cardápio deve continuar disponível sem JavaScript. |

O framework pode atender páginas e recursos no mesmo projeto. Uma API HTTP separada não tem um consumidor ou comportamento necessário no escopo atual. O arquivo editorial do cardápio pode ser usado diretamente pelo renderizador.

O CSS existente é o ponto de partida para a composição visual. A convenção de estilos e uma eventual biblioteca devem ser avaliadas pelo benefício concreto. O requisito de SSR não determina uma biblioteca de componentes, uma estratégia de CSS ou um redesenho da marca.

## Comparação de frontend

| Critério | Astro + TypeScript | Next.js + React + TypeScript |
| --- | --- | --- |
| Composição | Componentes `.astro`, com uma estrutura próxima de HTML e CSS. | Componentes React e convenções do App Router. |
| SSR | Adaptador de runtime e configuração das páginas para renderização sob demanda. | Rotas configuradas para execução por requisição; ser Server Component não significa, por si, executar a cada acesso. |
| Interação no navegador | Scripts ou componentes interativos acrescentados onde necessários. | Client Components para estado, eventos e APIs do navegador. |
| Adequação ao escopo atual | Minha avaliação: combina com conteúdo editorial, apresentação e cardápio, preservando uma relação direta com HTML/CSS. | Minha avaliação: ganha peso se trabalhar com React e App Router desde o início for um objetivo do projeto. |

Os [componentes Astro](https://docs.astro.build/en/basics/astro-components/) produzem HTML sem acrescentar um runtime de cliente por padrão. Para SSR em Node, o [adaptador oficial](https://docs.astro.build/en/guides/integrations-guide/node/) oferece modo standalone, incluindo atendimento de páginas e recursos.

No Next.js, a divisão entre [Server e Client Components](https://nextjs.org/docs/app/getting-started/server-and-client-components) permite separar renderização e interação. A função [`connection()`](https://nextjs.org/docs/app/api-reference/functions/connection) pode vincular a execução à requisição quando não há outra dependência de dados do pedido. Isso precisa ser configurado e verificado na versão adotada.

**Recomendação provisória: Astro com TypeScript e adaptador Node.** A justificativa é o escopo conhecido e a proximidade com a base HTML/CSS existente. Essa é uma avaliação de adequação, sem medição de desempenho ou implementação comparativa realizada. Next.js permanece uma alternativa válida; as responsabilidades propostas não dependem dessa preferência de framework.

Versões, requisitos de Node, comandos e dependências devem ser conferidos e registrados quando o framework for incorporado. Não há configuração de runtime adicionada nesta etapa.

## Hospedagem

A versão SSR precisa de execução de servidor ou funções compatíveis com o framework. Um processo Node é uma possibilidade, sem provedor assumido: o Astro dispõe do adaptador citado, e o [Next.js também pode ser executado como servidor Node](https://nextjs.org/docs/app/getting-started/deploying).

GitHub pode continuar sendo o destino do código. [GitHub Pages é hospedagem estática](https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages) e, sozinho, não atende SSR por requisição. A publicação exigirá definir runtime, processo de build, execução e entrega dos recursos. Não há hospedagem contratada ou configurada.

## Etapas e critérios de migração

1. Definir o frontend pelos requisitos e custos apresentados, explicando o modelo de componentes e a configuração de SSR.
2. Incorporar configuração, scripts e lockfile reproduzíveis, com versões compatíveis; preservar a base anterior no histórico Git.
3. Extrair o cardápio para dados versionados e compor a página com responsabilidades reconhecíveis, conservando os oito biscoitos, as duas pipocas e o tratamento confirmado de Melado e Doce Maria.
4. Reaproveitar os recursos originais e o CSS como referência, conferindo caminhos e conteúdo. Mudanças visuais devem ter seu próprio motivo e revisão.
5. Compilar e executar o servidor de produção local. Conferir o HTML entregue, metadados, navegação, arquivos, fonte e conteúdo sem depender da execução de JavaScript no navegador.
6. Demonstrar que a rota é renderizada em runtime, e não apenas no build. Usar o contrato do framework e, quando necessário, instrumentação controlada da renderização durante o teste; uma resposta HTTP com HTML completo não prova SSR sozinha.
7. Atualizar os comandos e a documentação conforme o que foi executado. Registrar a revisão visual e comercial separadamente da prova de servidor e da futura publicação.

O critério de saída é uma página com o conteúdo e os recursos preservados, SSR demonstrado no modo de produção local, comandos reproduzíveis e limites declarados. Banco, autenticação, administração, pedidos e integração com o Caixa da Feira continuam fora desta etapa.
