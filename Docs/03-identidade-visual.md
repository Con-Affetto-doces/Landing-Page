# Identidade visual

## Referência da marca

O projeto usa `Diretrizes Visuais da Marca - Con Affetto.pdf`, de Fernanda Vansuita, e os arquivos entregues na pasta `Documentação/Logotipo e personalidade`, ao lado dos projetos. O PDF tem 38 páginas e metadados de criação de 26/04/2023. As referências centrais são introdução na página 2, DNA na 4, paleta na 18, tipografia nas 20–21, símbolo na 23 e aplicações a partir da 26. A paleta e a aplicação principal foram conferidas também por renderização.

SHA-256 do manual consultado:

```text
52455b5f3ca6915d82a4bff9e8cb521ad9b44094e21d9faddcd5ec0e7c8b7f66
```

| Referência original | Valor | Aplicação atual |
| --- | --- | --- |
| Violeta | `#685498` | Botões, foco sobre superfícies claras e símbolo do cardápio. |
| Rosa | `#DE8096` | Referência cromática; o rosa dos PNGs originais foi preservado. |
| Branco | `#FFFFFF` | Letras do logotipo inverso original, sobre cabeçalho e rodapé escuros. |

Os PNGs não foram recoloridos. Há diferenças entre algumas cores codificadas nos arquivos e os hexadecimais escritos no manual. Os valores da interface são escolhas de aplicação digital e não redefinem a identidade original.

## Aplicação cromática em avaliação

O responsável escolheu experimentar uma direção mais acolhedora, admitindo equilíbrio com elementos contemporâneos. A primeira revisão de tipografia e cor usou creme contínuo e painéis rosé. O retorno seguinte rejeitou a falta de limites perceptíveis, o aspecto ainda branco e solto e o contraste dos logotipos sobre fundo claro. A existência de margem no CSS não tornou a página visualmente delimitada.

A proposta atual ocupa a largura da tela. A delimitação fica nos painéis e no alinhamento interno do conteúdo:

| Papel | Cor | Uso |
| --- | --- | --- |
| Fundo rosé | `#E3CCD0` | Fundo da página, abertura e entorno dos painéis até as bordas da tela. |
| Painel creme | `#EFE5DA` | Cardápio e painel compartilhado por história e encomendas; texto dos botões e da navegação escura. |
| Ameixa escuro | `#443640` | Texto nas áreas claras, cabeçalho e rodapé. |
| Ação violeta | `#685498` | Botões e foco nas superfícies claras. |

O estado de hover dos botões usa `#57447F`, derivação mais escura do violeta. As linhas usam ameixa a 28% de opacidade. Imagem e painéis mantêm cantos discretamente arredondados. A página não tem moldura, borda ou margem externas. Não há recorte global por `overflow: hidden`, sombra forte, cartões individuais de produto ou novos ornamentos.

Violeta sobre rosé tem contraste calculado de aproximadamente 4,17:1, insuficiente para texto pequeno no critério adotado. Os links desse fundo usam ameixa e sublinhado; os botões usam texto creme sobre violeta. Cabeçalho e rodapé usam navegação creme, inclusive borda do acesso a encomendas e contorno de foco. O hover desse acesso usa creme com texto ameixa. Contraste matemático, percepção de cor e aprovação estética são verificações diferentes; a nova combinação ainda depende de observação renderizada.

## Papéis tipográficos

O manual apresenta Bodoni Moda como família principal e Poppins como complementar. A primeira aplicação levou a Bodoni Black Italic a todos os títulos. O responsável rejeitou essa repetição: o desenho funciona no logotipo, mas pesava quando reaparecia na abertura, nas categorias, na história e no contato.

A interface passa a usar Poppins Regular e Medium. A expressão ornamental permanece no logotipo original, que é uma imagem e não depende de carregar a fonte Bodoni no navegador.

| Papel atual | Fonte | Escala de referência |
| --- | --- | --- |
| Título principal | Poppins Medium, 500 | 40–52 px em duas colunas; aproximadamente 53–64 px a partir de 1600 px; 32–36 px na abertura empilhada. |
| Títulos de seção | Poppins Medium, 500 | 26–32 px. |
| Categorias do cardápio | Poppins Medium, 500 | 20–24 px; doces com menor destaque. |
| Sabores | Poppins Medium, 500 | 17 px. |
| Texto corrido | Poppins Regular, 400 | 16 px; descrição da abertura com 17 px. |
| História | Poppins Regular, 400 | 18–20 px. |
| Navegação e ações | Poppins Medium, 500 | 13–14 px. |
| Legenda e número | Poppins Regular, 400 | 13–14 px. |

A família Poppins já fazia parte da marca, mas o pacote fornecido continha apenas Light e Medium. O Regular foi obtido do [repositório oficial Google Fonts](https://github.com/google/fonts/blob/main/ofl/poppins/Poppins-Regular.ttf), versão 4.004, a mesma dos pesos locais. O arquivo foi convertido com `woff2_compress` para `public/assets/fontes/poppins-regular.woff2`, com 51.528 bytes. Não há nova biblioteca nem carregamento de fonte por serviço externo.

SHA-256 do TTF de origem: `7e65201e9b79159e2300267cc885e16c8dcef2424cdfa09a29bfb0980a94a7ba`.

SHA-256 do WOFF2 Regular: `168aae2bf5b20ff9931b7463deea95c2ea02d4dcad2128ad609575244a369a24`.

A conversão preservou mapa de caracteres, ordem e métricas horizontais dos glifos. A licença [SIL Open Font License 1.1 do Poppins](https://github.com/google/fonts/blob/main/ofl/poppins/OFL.txt) tem conteúdo equivalente à já conservada em `OFL-poppins.txt`; a diferença observada é um espaço ao fim de uma linha. A licença existente foi preservada.

O CSS declara apenas os pesos 400 e 500 usados na interface. O preload passou da Bodoni para Poppins Regular. Os WOFF2 Light e Bodoni e suas licenças permanecem no projeto como recursos preservados; não são requisitados pelas regras atuais. O licenciamento das fontes não define a licença do código nem os direitos sobre a marca.

## Logotipos e imagem

| Origem em `Logotipo/Sem Fundo/` | Arquivo do site | Uso |
| --- | --- | --- |
| `Logo Con Afetto_ 1.png` | `public/assets/marca/logo-principal.png` | Recurso original preservado, sem uso na composição atual. |
| `Logo Con Afetto_ 2.png` | `public/assets/marca/logo-inverso.png` | Logotipo do cabeçalho e do rodapé, com letras brancas e símbolo rosa sobre ameixa escuro. |
| `Logo Con Afetto_14.png` | `public/assets/marca/simbolo-violeta.png` | Símbolo no cabeçalho do cardápio. |
| `Logo Con Afetto_16.png` | `public/assets/marca/simbolo-branco.png` | Recurso preservado, sem uso na composição atual. |

A grafia “Afetto” aparece nos nomes dos originais; a marca na página é “Con Affetto”. Os PNGs foram copiados sem modificar bytes. `Marca.astro` registra arquivo, dimensões e janela SVG de cada variante para retirar apenas as margens transparentes de apresentação. A variante inversa completa tem janela própria: `521 379 736 441`, em um PNG de 1755 × 1241 pixels. Usar a janela do símbolo ou presumir o alinhamento do principal anterior não representa corretamente esse arquivo. O símbolo combina coração e rosa.

O novo PNG tem 36.836 bytes e SHA-256 `e7ecc16141079bf694381b9d0e649c7e83e3e7b17caf666ab1b5d5a07bf7e007`. A versão branca já existia no material entregue; não foi criada por filtro CSS nem por recoloração.

Não há fotos próprias atuais selecionadas. O responsável autorizou mock, identificado na legenda e no texto alternativo. A imagem ilustra biscoitos decorados e tradicionais; não comprova um acabamento ou a decoração disponível para cada sabor. Os WebP de 640 e 1120 pixels permanecem inalterados. O CSS mantém enquadramento quadrado, posição vertical em 65% e cantos suaves. A largura é limitada a 540 pixels no desktop intermediário, 640 pixels a partir de 1600 pixels e 520 pixels na abertura empilhada. Ao trocar por foto real, confirmar produto, enquadramento e texto alternativo antes de retirar a identificação ilustrativa.

## Estrutura e estado da avaliação

A abertura e o cardápio receberam aceite parcial de composição. Os retornos posteriores reabriram cores, tipografia, delimitação e agrupamento. Depois da ampliação do desktop e do acesso pelo celular, o responsável rejeitou o afastamento externo da página nos dois aparelhos. O limite solicitado passa a ser o dos grupos de conteúdo, com o site preenchendo a tela. Textos, ordem das seções, produtos, contatos, tipografia, cores restantes e aplicação dos logotipos permanecem.

A página tem largura de 100%, sem teto próprio, margem externa ou borda. Cabeçalho, fundo rosé e rodapé chegam às bordas da tela. `.container` mantém o conteúdo centralizado em até 1664 pixels, com afastamento interno de 16 a 48 pixels conforme a largura disponível. Os contornos do cardápio e do painel de história e encomendas permanecem. Os fundos escuros ficam nas extremidades compactas, sem recuperar a grande faixa violeta anterior.

A partir de 1600 pixels, a abertura amplia título, largura da descrição e imagem, e os seis sabores de biscoitos se distribuem em três colunas. Abaixo desse ponto, a lista mantém duas colunas até o empilhamento em 760 pixels. As regras internas de celular permanecem; retirar a moldura recupera a largura antes consumida pelo afastamento externo e pela borda. Responsividade inclui o aproveitamento de uma tela ampla, além da redução para uma tela estreita.

História e encomendas passam a compartilhar um painel creme com a mesma largura do cardápio. A história distribui título e parágrafo em duas colunas no desktop; o contato vem abaixo, separado por uma linha. Até 760 pixels, a história fica em uma coluna e o contato empilha. Até 600 pixels, os painéis usam 16 pixels de padding lateral, evitando somar a antiga margem a todas as camadas em uma tela de 320 pixels.

Biscoitos decorados e tradicionais continuam prioritários, com doces em região complementar. A história mantém apenas o fato confirmado sobre Maria e a família. O contato tem uma ação principal e o Instagram aparece uma vez no rodapé. Não voltaram slogans sucessivos, selos ou depoimentos aparentes.

As novas capturas mostram o desktop ampliado e a abertura carregada no celular, ainda com a moldura externa rejeitada. No telefone, fundo e texto aparecem escurecidos em relação ao desktop e às cores do CSS. Não há tema escuro definido pelo site; uma transformação do navegador ou do aparelho é uma hipótese, sem causa confirmada nesta revisão. Essa diferença não foi tratada como aprovação da paleta mobile nem motivou mudança de tema.

A remoção da moldura precisa ser conferida nas bordas da tela e nas transições perto de 900 e 1600 pixels, preservando leitura, foco, encaixe da navegação e contornos internos. O procedimento da prévia e o diagnóstico do firewall estão em [Desenvolvimento e validação](04-desenvolvimento-e-git.md). As capturas recebidas não mostram a versão sem margem externa. Aceite visual e autorização de commit ou publicação continuam distintos.

## Aprendizados reutilizáveis

- Identidade e interface têm papéis diferentes. A fonte expressiva do logotipo não precisa ser repetida em todos os títulos de conteúdo.
- Definir funções para fontes, pesos e superfícies antes de aplicar propriedades globais. Uma troca de família exige rever escala, entrelinha, limites de largura, exceções e preload.
- Uma família tipográfica deve usar os arquivos e pesos efetivamente disponíveis. A presença de `font-weight: 400` no CSS não comprova a existência do Regular desejado.
- Contraste suficiente não demonstra conforto cromático ou hierarquia. Poucos fundos com função clara podem dar mais unidade que alternâncias de quase branco.
- Margem geométrica e limite percebido são propriedades diferentes. Quando o conjunto parece solto, rever exterior, enquadramento, bordas e alinhamentos, além dos valores de espaçamento.
- Agrupar informações relacionadas pode exigir um contorno compartilhado, em vez de manter elementos isolados sobre o mesmo fundo. Logo e fundo também precisam ser avaliados juntos; conferir as variantes originais antes de alterar o desenho da marca.
- Identificar se a delimitação necessária pertence à página, à seção ou ao grupo. Uma moldura externa não é consequência obrigatória de um pedido de maior agrupamento.
- Preservar o que foi aceito conforme o alcance do feedback mais recente. Nesta rodada, conteúdo, marca, tipografia e tratamento do desktop permanecem; o afastamento externo foi retirado.

Esses critérios complementam a seção “Aprender com as revisões visuais” das [diretrizes de design e UX](DIRETRIZES-DE-DESIGN-E-UX.md), também presente no template. A preferência por creme, rosé e Poppins é desta proposta, sem virar padrão obrigatório para outros projetos. O histórico fica em [Decisões e andamento](05-decisoes-e-andamento.md).

## Referências complementares

As consultas anteriores às páginas oficiais de [Biscuiteers](https://www.biscuiteers.com/) e [Biscoitê](https://www.biscoite.com.br/) sustentaram a organização por produtos e destinos comerciais; seus layouts renderizados não foram observados nem copiados. Os critérios de agrupamento também usam [Visual Hierarchy in UX, do Nielsen Norman Group](https://www.nngroup.com/articles/visual-hierarchy-ux-definition/).

A autoria da identidade original é de Fernanda Vansuita. O uso destes recursos no projeto não concede a terceiros uma licença geral da marca. Regras CSS, build e contraste calculado não constituem aprovação estética ou auditoria integral de acessibilidade.
