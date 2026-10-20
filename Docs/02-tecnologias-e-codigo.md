# Tecnologias e código

## Estado da implementação

Este documento descreve a base HTML/CSS existente. O novo requisito é SSR sem banco de dados; a comparação de frontend e as responsabilidades propostas estão em [Arquitetura e renderização](06-arquitetura-e-renderizacao.md). Framework, dependências e comandos de servidor ainda não foram incorporados ao código.

## Como a base atual funciona

O navegador solicita `index.html`, encontra a folha de estilos e os arquivos da marca e monta a página. A hospedagem precisa apenas entregar esses arquivos por HTTP. Não existe código de servidor para calcular conteúdo ou consultar um banco.

| Tecnologia | Responsabilidade | Onde aparece |
| --- | --- | --- |
| HTML | Conteúdo, títulos, listas, links e significado dos elementos. | `public/index.html` |
| CSS | Cores, fontes, espaçamento, distribuição e adaptação à tela. | `public/styles.css` |
| PNG e SVG do HTML | Imagens originais da marca e sua janela de apresentação. | `public/assets/marca/`; elementos `svg` da página. |
| WOFF2 | Entregar as fontes da marca em formato próprio para a web. | `public/assets/fontes/` |
| Python 3 | Servir os arquivos para a prévia no computador de desenvolvimento. | Comando documentado no README. |
| Git | Histórico de código, arquivos da marca utilizados e documentação. | Repositório próprio na raiz do projeto. |

HTML e CSS atendem ao comportamento atual. JavaScript será acrescentado somente se uma interação futura o exigir. Uma navegação entre seções já é oferecida pelo navegador.

O projeto não exige Node, npm, framework ou etapa de compilação. Isso permite acompanhar a relação direta entre uma alteração no arquivo e o resultado no navegador. Em contrapartida, listas e trechos repetidos são editados à mão. Se o site crescer para várias páginas ou exigir atualização de catálogo por uma interface, essa manutenção será o motivo concreto para rever a arquitetura.

Referências técnicas: [HTML Living Standard](https://html.spec.whatwg.org/multipage/) e [servidor local da biblioteca padrão do Python](https://docs.python.org/3/library/http.server.html). O servidor Python é uma ferramenta de desenvolvimento; a documentação oficial não o recomenda para produção.

## Estrutura

```text
Site-Con-Affetto/
  README.md                 entrada para uso e documentação
  AGENTS.md                 convenções para futuras alterações
  .gitignore                exclusões do histórico
  Docs/                     projeto, código, marca e decisões
  public/
    index.html              página e cardápio
    styles.css              regras visuais
    assets/
      marca/                PNGs originais utilizados
      fontes/               WOFF2 e licenças OFL
```

Na base estática atual, `public/` reúne os arquivos servidos. A versão SSR terá artefatos e um processo de execução próprios, a definir na migração. Os documentos completos da marca e a planilha ficam fora desta árvore. Um clone do repositório terá os arquivos necessários para abrir a página sem depender dos caminhos originais.

## Organização do HTML

`head` reúne idioma, codificação, título, descrição e referências ao CSS e às fontes. O conteúdo está dividido em cabeçalho com navegação, seção de apresentação, cardápio, história e rodapé. Há um único `h1`; os títulos seguintes descrevem seções e categorias.

O link inicial “Ir para o conteúdo” aparece ao receber foco pelo teclado. A navegação aponta para IDs do documento. As listas do cardápio são elementos `ul` e `li`, disponíveis desde a leitura do HTML.

Os PNGs fornecidos incluem margens transparentes grandes. Elementos SVG com `viewBox` apresentam a área útil das imagens sem alterar seus arquivos, cores ou proporções. O logotipo no cabeçalho recebe um nome acessível; o símbolo decorativo da apresentação fica oculto de leitores de tela.

Os caminhos atuais são relativos, como `./styles.css` e `./assets/marca/logo-principal.png`. Isso permite servir a pasta na raiz de um domínio ou em um subcaminho. A resolução dos recursos também precisará ser conferida na migração para SSR.

## Organização do CSS

O início do arquivo declara as fontes locais com `@font-face` e `font-display: swap`. Em seguida, `:root` concentra as cores e a largura máxima de conteúdo. As regras seguem a ordem da página: base, cabeçalho, apresentação, cardápio, história e rodapé.

O layout usa Flexbox e Grid. Tamanhos com `clamp()` variam dentro de limites definidos; as regras de `@media` reduzem colunas em telas estreitas. A preferência do sistema por movimento reduzido desativa a rolagem suave.

As fontes disponíveis têm pesos específicos: Poppins Light 300, Poppins Medium 500 e Bodoni Moda Black Italic 900. O CSS associa cada arquivo ao peso e estilo correspondentes. Não solicita pesos inexistentes a um serviço externo.

## Convenções atuais

HTML e CSS usam dois espaços por nível, UTF-8, fim de linha LF e nova linha no final do arquivo. `.editorconfig` registra essas escolhas para editores compatíveis. Os comentários explicam decisões pouco evidentes, como a janela dos PNGs; o restante se apoia em nomes e estrutura legíveis.

O projeto ainda não tem formatador ou verificador de estilo automatizado. Essa escolha de ferramenta acompanha a definição das próximas etapas de desenvolvimento. Os princípios para organização do código, convenções e evolução técnica estão nas [Diretrizes de desenvolvimento](DIRETRIZES-DE-DESENVOLVIMENTO.md).

## Alterações frequentes

| Alteração | Local | Conferência necessária |
| --- | --- | --- |
| Adicionar ou retirar um produto | Lista da categoria em `index.html`. | Fonte do nome, duplicatas, categoria e quebra em celular. |
| Corrigir o texto da marca | Seção de apresentação ou história em `index.html`. | Fato confirmado e leitura em voz alta. |
| Acrescentar preços | HTML do cardápio e seu layout no CSS. | Aprovação dos valores, unidade ou peso e consistência entre produtos. |
| Ajustar cores | Variáveis de `:root` e seus usos. | Identidade e contraste dos pares de texto e fundo. |
| Ajustar a distribuição em celular | Regras de `@media` no CSS. | Sem rolagem horizontal nem conteúdo encoberto. |
| Adicionar foto | Arquivo próprio em `public/assets/` e HTML. | Produto correspondente, texto alternativo e tamanho de transferência. |

Não edite a planilha para atualizar o site nem suponha que salvar a planilha atualize a página. O cardápio é uma seleção editorial mantida no HTML. Uma automação de importação ainda não faz parte do projeto.
