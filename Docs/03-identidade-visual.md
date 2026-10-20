# Identidade visual

## Referência

O projeto usa `Diretrizes Visuais da Marca - Con Affetto.pdf`, de Fernanda Vansuita, e os arquivos entregues na pasta `Documentação/Logotipo e personalidade`, ao lado dos projetos. O PDF tem 38 páginas e metadados de criação de 26/04/2023. Os números abaixo são páginas do arquivo, contando a primeira como 1.

SHA-256 do manual consultado:

```text
52455b5f3ca6915d82a4bff9e8cb521ad9b44094e21d9faddcd5ec0e7c8b7f66
```

As referências centrais são a introdução na página 2, o DNA da marca na página 4, a paleta na página 18, a tipografia nas páginas 20–21, o símbolo na página 23 e as aplicações a partir da página 26. A paleta e a aplicação principal foram conferidas também por renderização do PDF.

## Cores

| Uso de referência | Cor no manual | Aplicação no site |
| --- | --- | --- |
| Violeta | `#685498` | Cor principal, títulos e elementos de navegação. |
| Rosa | `#DE8096` | Acentos e superfícies de apoio. |
| Branco | `#FFFFFF` | Fundo e texto sobre violeta. |

O CSS usa ainda neutros escuros e tintas claras para texto e fundos. São escolhas de aplicação digital, registradas no código; não são novas cores declaradas pelo manual. Rosa e branco não devem formar o par de cores de texto pequeno. O texto corrido usa um tom escuro para manter a leitura.

As imagens originais podem apresentar diferenças entre as cores codificadas no PNG e os hexadecimais escritos no manual. Os PNGs não foram recoloridos. Para superfícies e texto da página, a referência são os valores hexadecimais documentados.

## Tipografia

O manual escolhe Bodoni Moda como família principal e Poppins como complementar. O pacote local contém Poppins Light, Poppins Medium e Bodoni Moda 28pt Black Italic. O site usa exatamente esses arquivos, convertidos para WOFF2 sem alterar o desenho dos glifos.

| Arquivo de origem | Arquivo do site | Uso |
| --- | --- | --- |
| `Tipografia/Poppins/Poppins-Light.ttf` | `poppins-light.woff2` | Texto corrido, peso 300. |
| `Tipografia/Poppins/Poppins-Medium.ttf` | `poppins-medium.woff2` | Navegação e nomes, peso 500. |
| `Tipografia/Bodoni Moda/BodoniModa_28pt-BlackItalic.ttf` | `bodoni-moda-black-italic.woff2` | Títulos, peso 900, itálico. |

As fontes são servidas pelo próprio site. Não há consulta ao Google Fonts durante o carregamento. Os metadados dos TTFs identificam licença SIL Open Font License 1.1. As licenças completas obtidas dos repositórios oficiais estão junto das fontes, em `OFL-poppins.txt` e `OFL-bodonimoda.txt`.

Fontes das licenças: [Poppins](https://github.com/google/fonts/blob/main/ofl/poppins/OFL.txt) e [Bodoni Moda](https://github.com/google/fonts/blob/main/ofl/bodonimoda/OFL.txt). A conversão foi feita com `woff2_compress`; ela não é necessária para abrir ou editar a página.

## Logotipos

| Origem em `Logotipo/Sem Fundo/` | Arquivo do site | Uso |
| --- | --- | --- |
| `Logo Con Afetto_ 1.png` | `public/assets/marca/logo-principal.png` | Logotipo principal do cabeçalho. |
| `Logo Con Afetto_14.png` | `public/assets/marca/simbolo-violeta.png` | Símbolo decorativo da apresentação. |

A grafia “Afetto” aparece nos nomes dos arquivos originais; a marca na página é “Con Affetto”. Os dois PNGs foram copiados sem modificar os bytes. A janela SVG remove apenas o espaço transparente de apresentação e mantém o desenho original.

O símbolo combina coração e rosa. A história da página retoma a origem familiar da confeitaria de Maria descrita no manual. O slogan existente é usado como referência para a apresentação.

## Direção desta primeira página

Fundo claro, títulos com a fonte principal, violeta predominante e rosa em detalhes. O cardápio usa listas legíveis e categorias visíveis. A seção de história é curta e se apoia no material existente.

O símbolo da marca ocupa a área gráfica da apresentação. Fotografias atuais poderão substituir ou complementar essa área quando houver arquivos selecionados. Nenhuma imagem gerada ou foto genérica representa produtos reais nesta versão.

A autoria da identidade é de Fernanda Vansuita. O uso destes arquivos no projeto não concede a terceiros uma licença geral sobre a marca. A escolha de licença do código do site fica separada das licenças das fontes e dos direitos sobre a identidade.
