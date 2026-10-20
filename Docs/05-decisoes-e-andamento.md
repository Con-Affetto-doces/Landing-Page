# Decisões e andamento

## Forma de condução

O responsável pediu participação nas decisões técnicas e documentação de projeto e código, seguindo a prática do Caixa da Feira. As etapas devem permanecer compreensíveis no chat e neste repositório. Mudanças estruturais precisam de motivo, arquivos afetados, verificação e limites declarados.

## Decisões de 20/10/2026

| Decisão | Motivo | Quando rever |
| --- | --- | --- |
| Repositório próprio `Site-Con-Affetto` | O site público tem conteúdo e ciclo de publicação próprios. | Se houver necessidade concreta de compartilhar código. |
| Página estática em HTML e CSS | Apresentação e cardápio não exigem estado de aplicação. Os fontes podem ser lidos diretamente. | Novas interações ou manutenção de várias páginas. |
| Links para categorias e seções | Navegação nativa, disponível sem script. | Se o volume do catálogo justificar busca ou filtros. |
| Recursos locais | Carregamento da marca e das fontes sem depender de serviços externos. | Medição de tamanho ou requisito concreto de distribuição. |
| ODS atual como fonte editorial | É a fonte indicada pelo responsável. O caixa inclui outros artigos e nomes. | Quando o responsável mudar a fonte oficial do cardápio. |
| Preços ausentes na primeira versão | Não houve definição de valores para exposição. | Confirmação de preço e unidade de venda. |
| Doce Maria excluído | Instrução expressa: o produto não é da marca. | Apenas com nova instrução do responsável. |
| Uma entrada para Melado | O responsável confirmou que as duas abas são do mesmo produto. | Mudança real do catálogo. |
| Fontes WOFF2 a partir dos TTFs entregues | Preservar a tipografia e reduzir o tamanho de transferência. | Necessidade de outro peso ou glifos. |
| Git local agora; GitHub e hospedagem depois | Ordem definida no pedido inicial. | Etapa de publicação. |
| Práticas do Filipe Deschamps como diretriz central | Instrução do responsável; análise do conteúdo das 49 notas temáticas, com apoio do Luna. | Consultar aulas específicas nas próximas decisões. |

## Etapas

1. **Levantamento:** manual de 38 páginas, logotipos e fontes localizados; documentação do Caixa da Feira consultada como referência de manutenção.
2. **Escopo:** responsável confirmou apresentação e cardápio e indicou a planilha de receitas atuais. Doce Maria excluído.
3. **Base:** pasta independente criada; dois PNGs copiados sem alteração; três fontes convertidas para WOFF2; licenças OFL conservadas; documentação inicial escrita.
4. **Página:** apresentação, cardápio com oito biscoitos e duas pipocas, história e navegação implementados em HTML e CSS. Conferências estáticas e HTTP realizadas; revisão visual e comercial pendente.
5. **Versionamento:** repositório próprio com branch `main`. O conjunto inicial reúne os fontes, os recursos da marca utilizados e a documentação. A identificação do commit fica no histórico Git; não há remoto configurado ou publicação no GitHub nesta etapa.
6. **Referências de desenvolvimento:** a seleção inicial de oito notas foi ampliada a pedido do responsável. O principal leu 29 notas temáticas e o índice; o Luna leu integralmente outras 20, em tarefa somente leitura expressamente solicitada. As diretrizes, a classificação e a procedência estão em `DIRETRIZES-DE-DESENVOLVIMENTO.md`; as regras de aplicação foram integradas ao `AGENTS.md`. A documentação foi consolidada em `Docs/`, como solicitado.

## Validação registrada

- Manual extraído como texto; paleta e aplicação principal também examinadas em renderizações do PDF.
- Planilha lida pelo conteúdo XML do ODS, sem exportação ou alteração. Títulos dentro das abas foram examinados para evitar perder Limão ou duplicar as folhas de impressão.
- Cadastro do caixa consultado com conexão SQLite `mode=ro` e `query_only`, apenas nos campos de catálogo necessários à comparação.
- Licença OFL 1.1 conferida nos metadados das fontes fornecidas; textos das licenças obtidos do repositório oficial Google Fonts.
- HTML analisado em modo estrito por `html5lib`, sem erro: idioma `pt-BR`, um título principal, IDs únicos e destinos das âncoras existentes. CSS analisado pelo PostCSS já disponível no ambiente, sem erro de parsing; o verificador não foi adicionado como dependência do site.
- Conteúdo conferido: oito biscoitos e duas pipocas, Doce Maria ausente e uma entrada para Melado após confirmação do responsável.
- Seis referências locais da página e do CSS, e nove links locais entre documentos, conferidos. Os dois PNGs são idênticos aos originais; o SHA-256 da planilha permaneceu igual ao registrado.
- Nas três fontes WOFF2, mapa de caracteres, ordem dos glifos, métricas horizontais e coordenadas foram comparados com os TTFs de origem, sem diferença nessas propriedades.
- Sete pares de cores de texto e fundo calculados, com razões de contraste entre 5,45:1 e 13,29:1. Essa conferência dos pares do CSS não constitui uma auditoria completa de acessibilidade.
- Servidor HTTP temporário entregou o índice e os nove arquivos de `public/` com resposta `200` e bytes iguais aos fontes, em um subcaminho `/con-affetto/`. CSS e WOFF2 tiveram os tipos MIME esperados. Recurso inexistente e caminhos de documentos fora da raiz pública retornaram `404`. O servidor foi encerrado ao fim da verificação.
- O guia foi reconciliado contra os nomes dos arquivos do vault: todas as 49 notas temáticas constam uma vez na tabela, com 29 leituras pelo principal e 20 pelo Luna. A classificação final é de 35 aplicações imediatas, nove condicionais e cinco principalmente pessoais nesta fase. O índice foi lido separadamente.

A aparência no navegador, a experiência de uso em celular e a aprovação comercial ainda não estão verificadas. Não foram realizados testes visuais ou interação automatizada com navegador.

## Pendências para a revisão do responsável

- Conferir o conjunto final de nomes e a apresentação visual em computador e celular.
- Definir preços e unidades caso devam ser exibidos.
- Selecionar fotografias reais caso o cardápio deva ter imagens dos produtos.
- Definir os dados públicos de contato se forem incluídos.
- Na etapa posterior, definir repositório GitHub, visibilidade, licença do código, hospedagem e domínio.
- Definir o mecanismo compartilhado de formatação ao tratar das ferramentas de desenvolvimento, consultando a aula específica sobre Prettier se necessário.

O site ainda não foi publicado. Não há sincronização contínua, importador da planilha ou ligação ao banco do comércio.
