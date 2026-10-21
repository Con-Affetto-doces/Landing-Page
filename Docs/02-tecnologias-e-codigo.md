# Tecnologias e código

## Como o site funciona

Uma requisição chega ao servidor Node compilado pelo adaptador do Astro. O Astro executa `src/pages/index.astro`, compõe o documento com o layout e o cardápio e devolve o HTML. O navegador carrega o CSS e os recursos locais da marca. Não há consulta a banco ou API separada.

O cardápio já está no HTML recebido. Links para as seções usam a navegação do navegador. Nenhum componente desta versão precisa de hidratação ou JavaScript de cliente em produção.

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
    data/cardapio.ts           nomes e notas confirmados dos produtos
    styles/global.css          regras visuais
  public/assets/
    marca/                     PNGs originais utilizados
    fontes/                    WOFF2 e licenças
```

`ItemCardapio.astro` concentra a mesma apresentação de produto usada nas duas categorias. O cabeçalho, a apresentação, a história e o rodapé permanecem na página; não há uma camada ou componente adicional para cada trecho de HTML.

## Ler um arquivo Astro

O bloco entre `---` prepara a renderização: importa dados e componentes e lê as propriedades recebidas. O trecho abaixo descreve o HTML e pode usar expressões como `{nome}` e listas geradas com `map`. Esse código de preparação executa no servidor nesta configuração.

Em `ItemCardapio.astro`, o tipo `Produto` define `nome` obrigatório e `nota` opcional. O componente recebe esses valores e inclui a nota apenas quando ela existe. O TypeScript ajuda na consistência da estrutura; não confirma a correção comercial de um nome nem substitui a fonte editorial.

`SiteLayout.astro` importa o CSS e define idioma, codificação, viewport, título, descrição e pré-carregamento da fonte principal. O `slot` recebe o conteúdo de `index.astro`. Há um único `h1` e hierarquia de seções e categorias.

## Renderização e recursos públicos

`output: "server"` em `astro.config.mjs` seleciona renderização por requisição. O adaptador usa `mode: "standalone"`, e `session: false` desativa o suporte a sessões que esta versão não utiliza. `server` define host e porta padrão apenas da prévia; o servidor standalone usa as variáveis `HOST` e `PORT`. A comprovação de execução está em [Arquitetura e renderização](06-arquitetura-e-renderizacao.md).

O build cria `dist/server/` para o servidor e `dist/client/` para os recursos públicos. `public/` contém apenas recursos copiados para a saída; a antiga página `public/index.html` foi retirada para não competir com a rota SSR. `dist/`, `.astro/` e `node_modules/` ficam fora do Git.

Os recursos da marca usam caminhos sob `/assets/`; esta configuração atende o site na raiz do domínio. Publicar em subcaminho exigirá configurar a base e conferir os caminhos antes de afirmar suporte. CSS compilado pode receber nome com hash em `/_astro/`.

Os PNGs incluem margens transparentes grandes. Os elementos SVG e seus `viewBox` foram preservados para mostrar a área útil sem modificar os arquivos. O logotipo tem nome acessível; o símbolo decorativo fica oculto de leitores de tela.

## CSS e responsividade

O CSS anterior foi movido para `src/styles/global.css`; a migração ajustou apenas os caminhos das fontes. Os arquivos da marca e das fontes não foram alterados.

O início declara `@font-face`, com pesos e estilos correspondentes aos arquivos locais e `font-display: swap`. `:root` concentra cores e largura máxima. As regras seguem a ordem da página: base, cabeçalho, apresentação, cardápio, história e rodapé.

Flexbox, Grid e `clamp()` organizam o layout. As regras de `@media` mudam a distribuição abaixo de 900 e 600 pixels; a preferência por movimento reduzido desativa a rolagem suave. A existência dessas regras e a preservação do HTML não constituem revisão visual em aparelhos reais.

## Convenções e alterações frequentes

Os fontes usam dois espaços por nível, UTF-8, LF e nova linha final. `.editorconfig` orienta editores compatíveis. As configurações TypeScript usam o preset estrito do Astro. Ainda não foi escolhido formatador; a verificação de tipos não garante formatação.

| Alteração | Local | Conferência |
| --- | --- | --- |
| Adicionar ou retirar produto | `src/data/cardapio.ts`. | Fonte do nome, duplicata, categoria e resultado em tela estreita. |
| Mudar a apresentação de todos os produtos | `src/components/ItemCardapio.astro`. | As duas categorias e a nota opcional. |
| Mudar a organização das categorias | `src/components/Cardapio.astro`. | Navegação, IDs e hierarquia de títulos. |
| Corrigir apresentação ou história | `src/pages/index.astro`. | Fato confirmado e leitura. |
| Ajustar título ou descrição da página | `src/layouts/SiteLayout.astro`. | HTML entregue e texto nos metadados. |
| Ajustar o visual | `src/styles/global.css`. | Identidade, contraste e distribuição nas telas. |
| Acrescentar foto | `public/assets/` e componente correspondente. | Produto correto, texto alternativo e transferência. |
| Alterar execução Docker | `Dockerfile`. | Build, inicialização, HTTP e healthcheck da imagem. |

Salvar a planilha não atualiza o site. O arquivo de produtos é uma seleção editorial; sua alteração exige nova publicação da aplicação, também com SSR. Não há importador automático ou interface administrativa.

Referências: [componentes Astro](https://docs.astro.build/en/basics/astro-components/), [verificação de TypeScript](https://docs.astro.build/en/guides/typescript/) e [adaptador Node](https://docs.astro.build/en/guides/integrations-guide/node/).
