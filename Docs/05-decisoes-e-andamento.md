# Decisões e andamento

## Forma de condução

O responsável pediu participação nas decisões técnicas e documentação de projeto e código, seguindo a prática do Caixa da Feira. As etapas devem permanecer compreensíveis no chat e neste repositório. Mudanças estruturais precisam de motivo, arquivos afetados, verificação e limites declarados.

Neste projeto, a eficiência deve ser avaliada ao longo de sua vida: compreender, corrigir, operar e evoluir. Mais tempo inicial é aceitável quando reduz dificuldades posteriores. Pesquisa, documentação e estrutura adicional precisam contribuir para uma necessidade concreta. Essa prioridade é específica deste site; o modo de condução de outros projetos deve ser definido conforme seus próprios objetivos.

## Decisões de 20/10/2026

| Decisão | Motivo | Quando rever |
| --- | --- | --- |
| Repositório próprio `Site-Con-Affetto` | O site público tem conteúdo e ciclo de publicação próprios. | Se houver necessidade concreta de compartilhar código. |
| Base inicial em HTML e CSS | Primeira referência local de conteúdo e visual. | Migrada para Astro com conteúdo e estilos preservados; fontes anteriores disponíveis no histórico. |
| SSR para o site | Requisito definido pelo responsável; nesta proposta, significa gerar o HTML no servidor por requisição. | Se o responsável redefinir o requisito de renderização. |
| Astro, TypeScript e CSS próprio | Responsável autorizou testar Astro após comparação pelo objetivo de apresentação e cardápio. | Resultado de uso, manutenção e novas necessidades concretas. |
| Docker e futura VPS com Coolify | Pedido do responsável durante a implementação; imagem mantém o SSR no servidor. | Na configuração real de domínio, proxy e ambiente de publicação. |
| Node 24.22.0 LTS na imagem | Runtime de produção compatível e com suporte prolongado. | Atualizações de manutenção e segurança da linha e dos pacotes. |
| Sem banco de dados nesta etapa | O cardápio pode permanecer em um arquivo versionado, sem persistência ou interface administrativa. | Se surgirem requisitos de edição, persistência ou integração. |
| Links para categorias e seções | Navegação nativa, disponível sem script. | Se o volume do catálogo justificar busca ou filtros. |
| Recursos locais | Carregamento da marca e das fontes sem depender de serviços externos. | Medição de tamanho ou requisito concreto de distribuição. |
| ODS atual como fonte editorial | É a fonte indicada pelo responsável. O caixa inclui outros artigos e nomes. | Quando o responsável mudar a fonte oficial do cardápio. |
| Preços ausentes na primeira versão | Não houve definição de valores para exposição. | Confirmação de preço e unidade de venda. |
| Doce Maria excluído | Instrução expressa: o produto não é da marca. | Apenas com nova instrução do responsável. |
| Uma entrada para Melado | O responsável confirmou que as duas abas são do mesmo produto. | Mudança real do catálogo. |
| Fontes WOFF2 a partir dos TTFs entregues | Preservar a tipografia e reduzir o tamanho de transferência. | Necessidade de outro peso ou glifos. |
| Git local, seguido de GitHub e hospedagem | Ordem definida no pedido inicial; código já publicado no GitHub. | Etapa de implantação na VPS. |
| Repositório público `Con-Affetto-doces/Landing-Page`, branch `main` | Endereço fornecido pelo responsável; repositório estava vazio. | Se mudar a origem do código ou sua visibilidade. |
| Diretrizes de desenvolvimento como referência central | Preservar compreensão, modificabilidade, consistência e custo total de manutenção, com critérios explícitos para o trabalho assistido por IA. | Mudanças nos requisitos ou nas condições de manutenção. |

## Etapas

1. **Levantamento:** manual de 38 páginas, logotipos e fontes localizados; documentação do Caixa da Feira consultada como referência de manutenção.
2. **Escopo:** responsável confirmou apresentação e cardápio e indicou a planilha de receitas atuais. Doce Maria excluído.
3. **Base:** pasta independente criada; dois PNGs copiados sem alteração; três fontes convertidas para WOFF2; licenças OFL conservadas; documentação inicial escrita.
4. **Página:** apresentação, cardápio com oito biscoitos e duas pipocas, história e navegação implementados em HTML e CSS. Conferências estáticas e HTTP realizadas; revisão visual e comercial pendente.
5. **Versionamento:** repositório próprio com branch `main`. O conjunto inicial reúne os fontes, os recursos da marca utilizados e a documentação. A identificação do commit fica no histórico Git; naquela etapa ainda não havia remoto ou publicação no GitHub.
6. **Diretrizes de desenvolvimento:** princípios para decisões técnicas, arquitetura, código, validação, entrega, manutenção e uso de IA consolidados em `DIRETRIZES-DE-DESENVOLVIMENTO.md`, com regras de aplicação integradas ao `AGENTS.md`. O guia distingue princípios gerais de decisões que dependem do contexto e inclui um bloco de instruções reutilizável em outros projetos. A documentação está organizada em `Docs/`.
7. **Planejamento de SSR:** requisito registrado sem incluir banco de dados. Comparação inicial documentada e outras alternativas discutidas com o responsável. Naquela etapa a base permaneceu HTML/CSS.
8. **Experimento com Astro:** cardápio extraído para TypeScript, página e apresentação dos produtos compostas por componentes, CSS preservado e servidor Node standalone configurado. Dependências e lockfile adicionados; build inclui verificação de tipos.
9. **Docker e Coolify:** imagem de produção construída e executada localmente com Node LTS e healthcheck. Parâmetros de futura publicação documentados em `07-docker-e-coolify.md`; naquela etapa VPS e GitHub não foram alterados.
10. **GitHub:** remoto `origin` configurado com o endereço fornecido pelo responsável, `https://github.com/Con-Affetto-doces/Landing-Page.git`. Primeiro push real de `main` concluído; commit `e0e8221` confirmado na branch remota. A documentação desta etapa registra o destino e mantém a implantação na VPS como pendente.

## Validação registrada

### Base inicial e diretrizes

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

### Astro e Docker

- Backup central da base anterior criado e verificado por `zstd -q -t` e `tar --compare`. O commit anterior à migração é `e4fc9da`.
- Instalação com lockfile e `npm run build` concluídos no host (Node 26.12.0/npm 12.2.1) e no build Docker (Node 24.22.0/npm 11.19.1). Astro Check registrou zero erros, avisos ou sugestões. As versões diretas são Astro 7.4.1, adaptador Node 11.1.9, Astro Check 0.9.11 e TypeScript 6.0.3.
- Comando de desenvolvimento conferido por HTTP na porta padrão `4173` e com substituição para `4174`. Host e porta padrão foram centralizados na configuração para evitar argumentos duplicados. Nos testes por agente, `--ignore-lock` manteve execução em primeiro plano; os processos de teste foram encerrados e o status final não encontrou servidor de desenvolvimento ativo.
- Servidor compilado executado localmente: HTML válido analisado por `html5lib` em modo estrito, idioma, título, IDs e âncoras conferidos. A árvore do conteúdo foi comparada com a página anterior, normalizando espaços, comentários e prefixos das URLs; permaneceu equivalente.
- Oito biscoitos, duas pipocas, uma entrada exata para Melado e exclusão de Doce Maria confirmados no HTML recebido. Não há scripts no HTML de produção nem JavaScript em `dist/client`.
- Os sete arquivos de fontes, logotipos e licenças mantiveram os hashes anteriores e foram entregues por HTTP com bytes iguais aos fontes. O CSS compilado e as três referências de fontes responderam corretamente. O fonte CSS mudou apenas os caminhos das fontes ao ser movido para `src/styles/`.
- SSR demonstrado em cópia isolada: instrumentação temporária no frontmatter de `Cardapio.astro` gerou identificadores distintos em duas requisições à mesma rota `/`. O controle compilado como estático devolveu o mesmo identificador nas duas requisições. A instrumentação não foi introduzida no projeto entregue, e os hashes dos fontes foram conferidos após o teste.
- Imagem Docker construída e executada em Linux/amd64. Conferência HTTP de conteúdo, recursos e caminhos privados repetida na imagem. Healthcheck real atingiu `healthy`; processo Node v24.22.0 com UID 1000, `HOST=0.0.0.0` e `PORT=4321`.
- Confirmada a ausência de `src`, `Docs`, `.git`, `.env` e `@astrojs/check` na imagem final. `npm prune --omit=dev` remove dependências exclusivamente de desenvolvimento; o Astro mantém ferramentas transitivas necessárias à sua distribuição, como Vite e compiladores.
- `README.md`, documento de projeto, `package.json`, fonte de dados e rota inexistente retornaram `404` nos servidores de produção testados. O contêiner de teste e os servidores temporários da prova isolada foram encerrados.
- Revisão independente de código e contratos do adaptador não encontrou bloqueadores. A tentativa de abrir a prévia constatou ausência de navegador disponível na ferramenta desta sessão.
- Vinte e duas referências locais dos documentos alterados e a ausência de erros de whitespace no diff conferidas.

A aparência no navegador, a experiência em celular e a aprovação comercial continuam pendentes. A imagem local não comprova domínio, TLS ou integração real com o proxy Coolify. Não houve implantação na VPS.

### Publicação do código no GitHub

- O repositório informado estava público e sem referências Git. A conta autenticada tinha permissão de envio; a visibilidade existente foi preservada.
- Arquivos e histórico local conferidos antes do envio: sem planilhas, bancos, arquivos de ambiente ou indicadores de credenciais encontrados. Fontes, recursos públicos e documentação compõem o histórico publicado.
- Backup central criado e validado antes da configuração do remoto e da atualização dos documentos.
- Primeiro push de `main` concluído, com acompanhamento de `origin/main`. `git ls-remote --heads origin refs/heads/main` devolveu o mesmo SHA de `git rev-parse HEAD`: `e0e8221823cbf8950a702604fb9a42737063c331`.
- Helper de autenticação do GitHub CLI configurado apenas neste clone, reutilizando a sessão existente. Nenhum token foi acrescentado aos arquivos versionados.
- O endereço do código é [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page). Publicação do código e implantação da aplicação têm verificações distintas.

## Pendências para a revisão do responsável

- Avaliar o uso da versão local em Astro e a manutenção do cardápio em arquivo.
- Conferir o conjunto final de nomes e a apresentação visual em computador e celular.
- Percorrer os fontes com o responsável para conferir a compreensão da estrutura e das escolhas de implementação.
- Definir preços e unidades caso devam ser exibidos.
- Selecionar fotografias reais caso o cardápio deva ter imagens dos produtos.
- Definir os dados públicos de contato se forem incluídos.
- Definir a licença do código; configurar domínio e aplicação na VPS com Coolify e verificar o acesso real.
- Definir o mecanismo compartilhado de formatação ao tratar das ferramentas de desenvolvimento.

O código está disponível no GitHub; a aplicação ainda não foi implantada na VPS. Não há sincronização contínua, importador da planilha ou ligação ao banco do comércio.
