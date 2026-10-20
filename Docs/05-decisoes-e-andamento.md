# Decisões e andamento

## Forma de condução

O responsável pediu participação nas decisões técnicas e documentação de projeto e código, seguindo a prática do Caixa da Feira. As etapas devem permanecer compreensíveis no chat e neste repositório. Mudanças estruturais precisam de motivo, arquivos afetados, verificação e limites declarados.

Neste projeto, a eficiência deve ser avaliada ao longo de sua vida: compreender, corrigir, operar e evoluir. Mais tempo inicial é aceitável quando reduz dificuldades posteriores. Pesquisa, documentação e estrutura adicional precisam contribuir para uma necessidade concreta. Essa prioridade é específica deste site; o modo de condução de outros projetos deve ser definido conforme seus próprios objetivos.

## Decisões de 20/10/2026

| Decisão | Motivo | Quando rever |
| --- | --- | --- |
| Repositório próprio `Site-Con-Affetto` | O site público tem conteúdo e ciclo de publicação próprios. | Se houver necessidade concreta de compartilhar código. |
| Base inicial em HTML e CSS | Primeira referência local de conteúdo e visual. | Revisada pelo novo requisito de SSR; permanece como implementação até a migração. |
| SSR para o site | Requisito definido pelo responsável; nesta proposta, significa gerar o HTML no servidor por requisição. | Se o responsável redefinir o requisito de renderização. |
| Sem banco de dados nesta etapa | O cardápio pode permanecer em um arquivo versionado, sem persistência ou interface administrativa. | Se surgirem requisitos de edição, persistência ou integração. |
| Links para categorias e seções | Navegação nativa, disponível sem script. | Se o volume do catálogo justificar busca ou filtros. |
| Recursos locais | Carregamento da marca e das fontes sem depender de serviços externos. | Medição de tamanho ou requisito concreto de distribuição. |
| ODS atual como fonte editorial | É a fonte indicada pelo responsável. O caixa inclui outros artigos e nomes. | Quando o responsável mudar a fonte oficial do cardápio. |
| Preços ausentes na primeira versão | Não houve definição de valores para exposição. | Confirmação de preço e unidade de venda. |
| Doce Maria excluído | Instrução expressa: o produto não é da marca. | Apenas com nova instrução do responsável. |
| Uma entrada para Melado | O responsável confirmou que as duas abas são do mesmo produto. | Mudança real do catálogo. |
| Fontes WOFF2 a partir dos TTFs entregues | Preservar a tipografia e reduzir o tamanho de transferência. | Necessidade de outro peso ou glifos. |
| Git local agora; GitHub e hospedagem depois | Ordem definida no pedido inicial. | Etapa de publicação. |
| Diretrizes de desenvolvimento como referência central | Preservar compreensão, modificabilidade, consistência e custo total de manutenção, com critérios explícitos para o trabalho assistido por IA. | Mudanças nos requisitos ou nas condições de manutenção. |

## Etapas

1. **Levantamento:** manual de 38 páginas, logotipos e fontes localizados; documentação do Caixa da Feira consultada como referência de manutenção.
2. **Escopo:** responsável confirmou apresentação e cardápio e indicou a planilha de receitas atuais. Doce Maria excluído.
3. **Base:** pasta independente criada; dois PNGs copiados sem alteração; três fontes convertidas para WOFF2; licenças OFL conservadas; documentação inicial escrita.
4. **Página:** apresentação, cardápio com oito biscoitos e duas pipocas, história e navegação implementados em HTML e CSS. Conferências estáticas e HTTP realizadas; revisão visual e comercial pendente.
5. **Versionamento:** repositório próprio com branch `main`. O conjunto inicial reúne os fontes, os recursos da marca utilizados e a documentação. A identificação do commit fica no histórico Git; não há remoto configurado ou publicação no GitHub nesta etapa.
6. **Diretrizes de desenvolvimento:** princípios para decisões técnicas, arquitetura, código, validação, entrega, manutenção e uso de IA consolidados em `DIRETRIZES-DE-DESENVOLVIMENTO.md`, com regras de aplicação integradas ao `AGENTS.md`. O guia distingue princípios gerais de decisões que dependem do contexto e inclui um bloco de instruções reutilizável em outros projetos. A documentação está organizada em `Docs/`.
7. **Planejamento de SSR:** requisito registrado sem incluir banco de dados. Astro e Next.js comparados pelo perfil de apresentação e cardápio; responsabilidades e critérios de migração descritos em `06-arquitetura-e-renderizacao.md`. A base pública permanece HTML/CSS; não houve instalação de framework ou migração nesta etapa.

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
- Na revisão das diretrizes, os links locais renderizados em Markdown e seus destinos foram conferidos. As alterações ficaram restritas ao guia, às instruções e a este registro de andamento.

A aparência no navegador, a experiência de uso em celular e a aprovação comercial ainda não estão verificadas. Não foram realizados testes visuais ou interação automatizada com navegador.

## Pendências para a revisão do responsável

- Definir o frontend a partir da comparação registrada e, na implementação, validar SSR no servidor de produção local.
- Conferir o conjunto final de nomes e a apresentação visual em computador e celular.
- Percorrer os fontes com o responsável para conferir a compreensão da estrutura e das escolhas de implementação.
- Definir preços e unidades caso devam ser exibidos.
- Selecionar fotografias reais caso o cardápio deva ter imagens dos produtos.
- Definir os dados públicos de contato se forem incluídos.
- Na etapa posterior, definir repositório GitHub, visibilidade, licença do código, hospedagem e domínio.
- Definir o mecanismo compartilhado de formatação ao tratar das ferramentas de desenvolvimento.

O site ainda não foi publicado. Não há sincronização contínua, importador da planilha ou ligação ao banco do comércio.
