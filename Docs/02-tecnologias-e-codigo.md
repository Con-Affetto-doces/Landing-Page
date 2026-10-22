# Tecnologias e código

## Como o site funciona

Uma requisição chega ao servidor Node compilado pelo adaptador do Astro. O Astro executa `src/pages/index.astro`, compõe o documento com o layout e o cardápio e devolve o HTML. O navegador carrega o CSS e os recursos locais da marca. Não há consulta a banco ou API separada.

O cardápio já está no HTML recebido. Links para as seções e para os contatos usam a navegação do navegador. Nenhum componente desta versão precisa de hidratação ou JavaScript de cliente em produção. WhatsApp e Instagram são destinos de links; não há SDK, feed incorporado ou chamada a essas plataformas para montar a página.

| Tecnologia | Responsabilidade | Onde aparece |
| --- | --- | --- |
| Astro 7.4.1 | Composição de páginas e componentes, compilação e SSR. | Arquivos `.astro` e `astro.config.mjs`. |
| Adaptador Node 11.1.9 | Gerar o servidor standalone que atende páginas e arquivos públicos. | `@astrojs/node`; saída em `dist/server/entry.mjs`. |
| TypeScript 6.0.3 | Descrever os produtos e conferir compatibilidade dos dados e componentes. | `src/data/cardapio.ts`, componentes e `tsconfig.json`. |
| Astro Check 0.9.11 | Verificar arquivos TypeScript e Astro. | `npm run check`; também integra `npm run build`. |
| CSS próprio | Cores, fontes, espaçamento e adaptação às telas. | `src/styles/global.css`. |
| PNG e SVG do HTML | Imagens da marca e janelas para sua área útil. | `public/assets/marca/` e elementos `svg` da página. |
| WOFF2 | Fontes locais da identidade. | `public/assets/fontes/`, com licenças OFL. |
| Docker | Construir e executar o conjunto de produção em Node 24.22.0 LTS. | `Dockerfile` e `.dockerignore`. |
| Git | Histórico dos fontes, recursos usados e documentação. | Repositório próprio na raiz. |

As versões diretas são fixadas em `package.json`; o lockfile registra as resoluções das dependências. `npm ci` usa esse conjunto. O pacote `@astrojs/check` aceita TypeScript 5 ou 6; a versão 6.0.3 foi escolhida dentro desse contrato.

## Estrutura e responsabilidades

```text
Site-Con-Affetto/
  AGENTS.md                    instruções para manutenção
  README.md                    entrada para uso e documentação
  package.json                 dependências e comandos
  package-lock.json            resoluções reproduzíveis
  astro.config.mjs             SSR, adaptador Node e sessões desativadas
  tsconfig.json                preset estrito do Astro
  Dockerfile                   build e execução da imagem
  .dockerignore                exclusões do contexto Docker
  Docs/                        projeto, código, marca e decisões
  src/
    pages/index.astro          composição e textos da página inicial
    layouts/SiteLayout.astro   documento HTML, metadados e CSS global
    components/
      Cardapio.astro           seções e categorias do cardápio
      ItemCardapio.astro       apresentação de um produto e nota opcional
      Marca.astro              logotipo e símbolos, preservando os PNGs
    data/
      cardapio.ts             nomes e notas confirmados dos produtos
      contato.ts              número, perfil e URLs dos contatos públicos
    styles/global.css          regras visuais
  public/assets/
    marca/                     PNGs originais utilizados
    fontes/                    WOFF2 e licenças
    imagens/                   mock ilustrativo em dois tamanhos WebP
```

`ItemCardapio.astro` concentra a mesma apresentação de produto usada nas duas categorias. O cabeçalho, a apresentação, a história e o rodapé permanecem na página; não há uma camada ou componente adicional para cada trecho de HTML.

`contato.ts` é importado pela página e pelo cardápio. O número formatado gera a URL `wa.me` com os dígitos internacionais; o nome de usuário gera a URL e o rótulo do Instagram. Alterar o número ou o perfil nesse arquivo mantém os destinos consistentes. São informações públicas, sem credenciais nem variáveis de ambiente. A integração oferece conversa externa, sem receber pedidos no servidor do site.

## Ler um arquivo Astro

O bloco entre `---` prepara a renderização: importa dados e componentes e lê as propriedades recebidas. O trecho abaixo descreve o HTML e pode usar expressões como `{nome}` e listas geradas com `map`. Esse código de preparação executa no servidor nesta configuração.

Em `ItemCardapio.astro`, o tipo `Produto` define `nome` obrigatório e `nota` opcional. O componente recebe esses valores e inclui a nota apenas quando ela existe. O TypeScript ajuda na consistência da estrutura; não confirma a correção comercial de um nome nem substitui a fonte editorial.

`SiteLayout.astro` importa o CSS e define idioma, codificação, viewport, título, descrição e pré-carregamento da fonte principal. O `slot` recebe o conteúdo de `index.astro`. Há um único `h1` e hierarquia de seções e categorias.

## Renderização e recursos públicos

`output: "server"` em `astro.config.mjs` seleciona renderização por requisição. O adaptador usa `mode: "standalone"`, e `session: false` desativa o suporte a sessões que esta versão não utiliza. `server` define host e porta padrão apenas da prévia; o servidor standalone usa as variáveis `HOST` e `PORT`. A comprovação de execução está em [Arquitetura e renderização](06-arquitetura-e-renderizacao.md).

O build cria `dist/server/` para o servidor e `dist/client/` para os recursos públicos. `public/` contém apenas recursos copiados para a saída; a antiga página `public/index.html` foi retirada para não competir com a rota SSR. `dist/`, `.astro/` e `node_modules/` ficam fora do Git.

Os recursos da marca usam caminhos sob `/assets/`; esta configuração atende o site na raiz do domínio. Publicar em subcaminho exigirá configurar a base e conferir os caminhos antes de afirmar suporte. CSS compilado pode receber nome com hash em `/_astro/`.

Os PNGs incluem margens transparentes grandes. `Marca.astro` registra arquivo, dimensões e janela SVG de cada variante: principal, principal inverso e símbolos violeta e branco. O cabeçalho e o rodapé usam a variante completa inversa sobre ameixa escuro. Ela foi copiada do material original, com bytes e janela próprios; não é uma recoloração do principal. Os links da marca têm nome acessível; os desenhos decorativos ficam ocultos de leitores de tela.

A imagem ilustrativa da abertura tem versões WebP de 640 e 1120 pixels de largura, selecionadas pelo navegador com `srcset` e `sizes`. O arquivo maior tem cerca de 167 kB. O enquadramento quadrado é feito no CSS com `aspect-ratio`, `object-fit` e `object-position`; o WebP original não foi alterado. A legenda identifica o mock. A imagem é um recurso estático; não acrescenta JavaScript ou serviço externo ao carregamento da página.

O CSS usa Poppins Regular 400 para leitura e Medium 500 para títulos e ações, com arquivos reais de cada peso. O Regular 4.004 foi acrescentado a partir da distribuição oficial Google Fonts e convertido para WOFF2 de cerca de 52 kB. Sua licença, origem e hashes estão em [Identidade visual](03-identidade-visual.md). O preload do layout aponta para o Regular. Light e Bodoni permanecem preservados como arquivos, sem declaração nas regras atuais; o desenho ornamental do logotipo já faz parte do PNG.

## CSS e responsividade

A migração inicial preservou o CSS da base HTML. A composição foi revista com feedback do responsável. O retorno mais recente remove o enquadramento externo e preserva o agrupamento dos painéis. A página rosé, o cabeçalho e o rodapé escuros ocupam toda a largura da tela; os painéis continuam creme e os botões usam violeta. Poppins e seus papéis foram preservados. O catálogo mantém dois terços para biscoitos e um terço para doces em tela larga; conteúdo, produtos e contatos não mudaram.

O início declara `@font-face`, com pesos e estilos correspondentes aos arquivos locais e `font-display: swap`. `:root` concentra cores, largura útil e margem interna. O `body` não tem margem ou padding externo; `.page-shell` ocupa 100% da largura, sem limite próprio ou borda. `.container` alinha o conteúdo em até 1664 pixels, com afastamento interno de 16 a 48 pixels. As variáveis do fundo exterior, da largura de página e da margem externa foram retiradas. Uma camada interna no cabeçalho permite limitar seu conteúdo enquanto a superfície escura preenche a tela. As regras seguem a ordem da página: base, cabeçalho, apresentação, cardápio, história e rodapé.

A media query `min-width: 100rem` acrescenta o tratamento de telas amplas: título entre aproximadamente 53 e 64 pixels, descrição com largura máxima de 544 pixels, imagem de até 640 pixels e três colunas de sabores na região de biscoitos. A indicação `sizes` acompanha o novo limite da imagem. As fontes e os arquivos da imagem não mudaram.

Flexbox, Grid e `clamp()` organizam o layout. Até 900 pixels, a abertura fica em uma coluna, com texto e ações antes da imagem, limitada a 520 pixels de largura. Até 760 pixels, categorias e lista de biscoitos ficam em uma coluna; a história empilha título e parágrafo e o contato empilha título, botão e número. História e encomendas compartilham `.closing-sheet`, alinhado ao cardápio, com uma linha entre as regiões. A história usa texto entre 18 e 20 pixels. Até 600 pixels, a navegação ocupa uma linha própria sob a marca, o rodapé empilha seus elementos e o padding lateral dos painéis é de 16 pixels. Os títulos quebram pelo espaço disponível, sem `<br>` de composição. Movimento reduzido desativa a rolagem suave. O foco usa violeta nas superfícies claras e creme no cabeçalho e rodapé escuros; texto e links sobre rosé usam ameixa. Não há `overflow: hidden` na página. Essas regras não constituem revisão visual em aparelhos reais.

## Convenções e alterações frequentes

Os fontes usam dois espaços por nível, UTF-8, LF e nova linha final. `.editorconfig` orienta editores compatíveis. As configurações TypeScript usam o preset estrito do Astro. Ainda não foi escolhido formatador; a verificação de tipos não garante formatação.

| Alteração | Local | Conferência |
| --- | --- | --- |
| Adicionar ou retirar produto | `src/data/cardapio.ts`. | Fonte do nome, duplicata, categoria e resultado em tela estreita. |
| Alterar WhatsApp ou Instagram | `src/data/contato.ts`. | Número/perfil confirmado, URL gerada e todos os links no HTML entregue. |
| Mudar a apresentação de todos os produtos | `src/components/ItemCardapio.astro`. | As duas categorias e a nota opcional. |
| Mudar a organização das categorias | `src/components/Cardapio.astro`. | Navegação, IDs e hierarquia de títulos. |
| Corrigir apresentação ou história | `src/pages/index.astro`. | Fato confirmado e leitura. |
| Ajustar título ou descrição da página | `src/layouts/SiteLayout.astro`. | HTML entregue e texto nos metadados. |
| Ajustar o visual | `src/styles/global.css`. | Identidade, contraste e distribuição nas telas. |
| Acrescentar foto | `public/assets/` e componente correspondente. | Produto correto, texto alternativo e transferência. |
| Alterar execução Docker | `Dockerfile`. | Build, inicialização, HTTP e healthcheck da imagem. |

Salvar a planilha não atualiza o site. O arquivo de produtos é uma seleção editorial; sua alteração exige nova publicação da aplicação, também com SSR. Não há importador automático ou interface administrativa.

Referências: [componentes Astro](https://docs.astro.build/en/basics/astro-components/), [verificação de TypeScript](https://docs.astro.build/en/guides/typescript/) e [adaptador Node](https://docs.astro.build/en/guides/integrations-guide/node/).
