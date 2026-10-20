# Projeto e cardápio

## Objetivo confirmado

Apresentar a marca Con Affetto e permitir que o visitante consulte seus produtos em computador ou celular. O responsável definiu esta primeira versão como apresentação e cardápio.

O caminho principal é abrir a página, acessar o cardápio, consultar biscoitos e pipocas e conhecer a história da marca. A navegação usa links para seções da própria página.

Nesta etapa não foram pedidos carrinho, pagamentos, cadastro de clientes, recebimento de pedidos ou integração com o caixa. Os preços ficam ausentes até uma definição do responsável. Essas escolhas delimitam o trabalho atual.

## Fontes

A fonte principal dos produtos é `Rotulagem Nutricional biscoitos - receitas atuais.ods`, em `/home/luiz-avcruz/Documents/Orgs/Con affetto/`, indicada pelo responsável em 20/10/2026. A leitura usa o XML interno do ODS, incluindo títulos dentro de cada aba. O arquivo não é modificado nem copiado para o repositório.

SHA-256 da planilha consultada:

```text
eba3f5de9846771b0a6903cbe27cc5813807e4e63fe7a4242a26761e2510eddf
```

O cadastro do Caixa da Feira foi consultado em modo somente leitura como referência secundária. Ele inclui outros artigos e nomes diferentes dos rótulos; por isso não foi importado como cardápio atual. Nenhuma leitura de vendas, clientes ou pagamentos é necessária ao site.

A história da marca e o slogan vêm do manual visual e dos logotipos fornecidos. A procedência está em [Identidade visual](03-identidade-visual.md).

## Correspondência dos produtos

As células abaixo identificam a primeira ocorrência do título, antes das repetições das etiquetas de impressão.

| Nome no cardápio | Origem no ODS | Tratamento |
| --- | --- | --- |
| Baunilha | `Biscoito de baunilha!A3`; `Canela e baunilha!A86` | Uma entrada para o mesmo produto. |
| Canela | `Canela 2!A3`; `Canela e baunilha!A2` | Uma entrada para o mesmo produto. |
| Chocolate | `Chocolate!A3` | Biscoito de chocolate. |
| Dedinho | `Dedinho!A3` | O rótulo identifica biscoito amanteigado de coco. |
| Especiarias com glacê | `Especiarias Glace!A3` | Nome apresentado por extenso. |
| Limão | `Especiarias Glace!A25` | Produto presente dentro da aba de especiarias. |
| Melado | `Melado!A3`; `Melado com especiarias!A3` | Uma entrada: o responsável confirmou que é o mesmo produto. |
| Melado com chocolate | `Melado com chocolate!A3` | Nome do rótulo, sem desdobrar variantes do cadastro do caixa. |
| Pipoca gourmet de leite Ninho | `Pipoca Ninho!A3` | Categoria pipocas gourmet. |
| Pipoca gourmet de chocolate | `Pipoca Chocolate!A3` | Categoria pipocas gourmet. |

`Doce-Maria!A3` foi excluído por instrução expressa do responsável: o produto não é da Con Affetto.

A aba `Melado com especiarias!A3` usa o título “BISCOITO MELADO”. O responsável confirmou em 20/10/2026 que as duas abas representam o mesmo produto. O cardápio usa uma única entrada “Melado”, resultando em oito biscoitos e duas pipocas.

## Limites das informações apresentadas

O ODS reúne etiquetas de momentos diferentes. A aba `Melado com especiarias`, por exemplo, contém um texto de ingredientes que menciona limão. Essa divergência não deve ser resolvida por inferência nem transformada em composição pública.

A primeira versão apresenta nomes e categorias. Não transcreve tabelas nutricionais, alergênicos, validade, datas de lote ou pesos. A eventual inclusão desses dados requer confirmar os rótulos aplicáveis aos produtos em venda. Não houve auditoria nutricional ou alteração de receitas.

Não há fotos atuais de produtos selecionadas para a página. Os mockups da identidade são aplicações gráficas; não foram apresentados como fotografias dos produtos atuais.

## Critérios de entrega desta versão

- Página local com a identidade existente, apresentação e cardápio dos produtos confirmados.
- Cardápio legível em tela estreita, com navegação por teclado e conteúdo disponível sem JavaScript.
- Arquivos e fontes locais, sem dependência do aplicativo do caixa ou de serviços de terceiros para carregar o conteúdo.
- Documentação de código, decisões, manutenção e validação junto dos fontes.
- Histórico Git local com mudanças coerentes e sem os dados operacionais do comércio.

A aprovação visual e comercial do responsável deve preceder a divulgação. A publicação no GitHub e a hospedagem terão resultado registrado separadamente.
