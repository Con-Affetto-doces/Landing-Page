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

## Revisão de 21/10/2026

O responsável implantou a base no Coolify em `https://conaffetto.com.br` e considerou o visual genérico. A consulta HTTP confirmou a página e seu CSS na versão publicada. Não foi inspecionado o painel ou o estado interno da aplicação na VPS.

As decisões desta revisão são:

- Biscoitos são o carro-chefe, com prioridade para decorados e também para os tradicionais. Doces variados são uma oferta complementar; pipocas são um exemplo dessa oferta.
- Não há fotos próprias selecionadas. Mock autorizado pelo responsável e identificado como “Imagem ilustrativa”.
- A planilha indicada mantém o mesmo SHA-256 já registrado e contém títulos antigos. Limão e Dedinho saem por confirmação explícita; Doce Maria permanece excluído. A presença de um título na planilha não confirma disponibilidade.
- Propostas permanecem locais até avaliação. Encerrar a implementação não autoriza criar commit, fazer push ou publicar.
- Leitura integral das 46 transcrições de design e experiência, de 01 a 46, concluída. O guia portátil fica em `DIRETRIZES-DE-DESIGN-E-UX.md`, com fontes, aplicações e limites; foi integrado também ao template de projetos.
- Revisão independente confrontou o guia com as 46 transcrições, confirmou as fontes e a integração, sem apontar correções necessárias. A revisão compartilha o limite do corpus de ASR; não houve conferência dos áudios.
- A direção editorial da primeira proposta usa imagem de biscoitos, título amplo, aplicações da marca e maior destaque para o catálogo de biscoitos. Continua sujeita à avaliação do responsável.

### Implementação local

A página, o cardápio e o CSS foram recompostos. `Marca.astro` concentra o uso do logotipo e dos símbolos existentes. O símbolo branco foi copiado sem alterar bytes. A imagem mock gerada foi preparada em WebP de 640 e 1120 pixels, com cerca de 69 e 167 kB. Metadados e textos passam a apresentar biscoitos decorados, artesanais e doces.

A lista tem seis biscoitos: Baunilha, Canela, Chocolate, Especiarias com glacê, Melado e Melado com chocolate. As pipocas de Leite Ninho e Chocolate ficam no bloco complementar de doces.

Astro, SSR, Node, dependências, Docker e configuração de publicação não foram alterados. O arquivo `CNAME` acrescentado pelo responsável no GitHub foi preservado ao atualizar o checkout por fast-forward para `7017831`.

### Conferências da revisão local

- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluiu a verificação dos oito arquivos Astro/TypeScript com zero erros, avisos e sugestões e gerou o servidor. A variável evita a tentativa de gravar configuração global de telemetria neste ambiente restrito; o Docker já a define.
- Servidor de produção executado em endereço local temporário. HTML analisado em modo estrito, idioma e título conferidos, um único título principal, IDs únicos e nove destinos de âncora válidos.
- Lista recebida por HTTP corresponde aos seis biscoitos e às duas pipocas confirmados. Limão, Dedinho e Doce Maria ausentes. Imagem mock identificada na legenda; nenhum script no HTML de produção.
- Os dez recursos públicos e o CSS compilado responderam com bytes iguais aos arquivos correspondentes. Os WebP tiveram tipo MIME correto; referências de fontes responderam. Caminhos de documentação, dados-fonte, manifests e rota inexistente retornaram 404.
- Nove pares de texto e fundo calculados, todos acima de 4,5:1, com resultados entre 5,09:1 e 12,63:1. Isso não constitui auditoria integral de acessibilidade.
- Vinte e sete referências relativas nos documentos alterados do site e sete no template conferidas. Os dois guias de design têm conteúdo idêntico; a revisão independente confirmou o mapa das 46 fontes.
- A ferramenta de interface desta sessão não disponibilizou navegador. Composição, adaptação observada, navegação por teclado e usabilidade continuam dependendo de conferência no navegador; regras CSS e respostas HTTP não demonstram essas propriedades.
- O servidor temporário de verificação foi encerrado. Nenhuma dependência da aplicação ou configuração global foi adicionada. Os backups centrais do site e do template foram verificados antes das alterações.
- Sem commit, arquivos preparados no índice, push ou publicação nesta revisão.

### Condição de avaliação

A implementação local, as conferências técnicas, a aprovação visual e o aceite comercial são estados diferentes. Nesta revisão não foi criado commit nem realizado push ou deploy. A versão publicada continua sendo a anterior.

### Última consulta ao ambiente publicado

Em 21/10/2026, às 14h54 no horário de Brasília, `https://conaffetto.com.br/` retornou HTTP 503 com a mensagem `no available server`, também em consulta com identificação de navegador. A página e o CSS haviam respondido na consulta anterior desta revisão. A causa da indisponibilidade não foi determinada; painel, logs e configuração interna da VPS não foram inspecionados. A proposta local não foi enviada ao ambiente publicado.

## Refinamento do front após avaliação independente

Em 21/10/2026, o responsável pediu a participação do Astra na composição, no front e nos textos, por rejeitar o aspecto genérico da proposta anterior. A avaliação independente examinou os fontes, a imagem e as diretrizes. Não houve navegador disponível; as conclusões sobre a distribuição visual são inferências desses materiais.

A avaliação apontou repetição de slogans, ornamentação concorrendo com os produtos e excesso de introduções antes dos sabores. Também identificou uma ambiguidade comercial: o texto junto à lista poderia sugerir versão decorada para todos os sabores, o que não está confirmado.

A revisão aplicada concentra a página em apresentação, cardápio e origem familiar:

- A abertura diz “Biscoitos decorados e tradicionais.”, usa uma descrição curta e o link “Ver cardápio”. A foto inteira mantém a proporção 4:5 e a legenda “Imagem ilustrativa”. Foram retirados selo, moldura, faixa repetitiva e nota sob o botão.
- O cardápio usa títulos literais e uma lista aberta. O nome de cada sabor continua vindo de `src/data/cardapio.ts`, sem associação a um tipo de decoração. Os biscoitos precedem os doces e têm mais destaque.
- A história apresenta o fato sobre Maria e as receitas da família, confirmado no manual. A aspa e as frases com aparência de depoimento foram retiradas. O rodapé permite retornar ao cardápio e ao início.
- O branco predomina, com violeta nos títulos e na história. A imagem e a tipografia da identidade sustentam a apresentação. A abertura fica em uma coluna até 900 pixels; o cardápio e a história, até 760 pixels. Em tela estreita, os sabores ficam em uma coluna.

Uma segunda leitura do Astra sobre a implementação confirmou a resolução dos seis pontos levantados, sem apontar correção adicional necessária antes da avaliação visual. A revisão destacou uma decisão ainda a julgar: entre aproximadamente 700 e 900 pixels, a imagem pode chegar a 600 × 750 pixels e alongar a abertura. O acesso direto ao cardápio vem antes dela; conservar a imagem inteira é a proposta atual, pendente de observação em tela.

### Evidências desta etapa

- Backup central compactado do rascunho anterior, incluindo os arquivos ainda não versionados, criado e conferido com `zstd -q -t` e `tar --compare` antes das alterações.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído: oito arquivos verificados, sem erros, avisos ou sugestões; servidor de produção gerado.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, com um H1, IDs únicos, referências `aria-labelledby` existentes e dez destinos de âncora válidos.
- Os seis biscoitos e as duas pipocas confirmados foram conferidos no HTML recebido. Limão, Dedinho e Doce Maria estão ausentes. A legenda identifica a imagem ilustrativa. Não há scripts de cliente no HTML.
- Dez recursos públicos e o CSS compilado foram entregues com bytes iguais aos arquivos locais. As fontes responderam e os WebP tiveram o tipo MIME esperado. Documentação, fontes do projeto, manifesto e rota inexistente continuaram retornando 404.
- Os quatro pares de texto e fundo usados na proposta têm contraste calculado entre 6,20:1 e 12,63:1. O cálculo não verifica a experiência com as fontes nem substitui auditoria de acessibilidade.
- O servidor temporário foi encerrado. Astro, SSR, dependências, configuração Docker e hospedagem não foram alterados. A imagem Docker desta revisão visual não foi reconstruída.

Aparência renderizada, interação por teclado, adaptação observada em diferentes telas e aprovação comercial continuam pendentes. Não houve commit, preparação de arquivos no índice, push ou deploy. A versão em Coolify não recebeu este refinamento.

## Equilíbrio visual e contatos após as capturas

O responsável enviou duas capturas da página e confirmou que retirar slogans melhorou o texto, mas considerou a composição seca. As capturas mostram o desktop da proposta anterior: abertura alta, branco contínuo, títulos de categoria isolados à esquerda e uma faixa violeta com pouca informação ao final. Essas observações substituem parte das inferências anteriores sobre a aparência, sem comprovar o comportamento mobile.

O Astra examinou as duas imagens e reviu a direção anterior. A recomendação foi conservar a concisão e recuperar cor, agrupamento e função nos blocos. A pesquisa em páginas oficiais de confeitaria e na referência de hierarquia visual foi registrada em [Identidade visual](03-identidade-visual.md). As referências externas foram consultadas por conteúdo e estrutura, sem observação de seus layouts renderizados nem cópia de identidade.

### Alterações aplicadas

- Abertura em rosa suave, título com limite de 72 pixels no desktop e imagem quadrada de até 540 pixels. O recorte por CSS reduz fundo superior e parte da fita, mantendo o mock identificado. Os arquivos da imagem não foram alterados.
- Cardápio em um único painel branco sobre papel. Títulos acima das listas, biscoitos ocupando dois terços no desktop e doces em uma região complementar rosada. Foram retirados os atalhos de categoria da proposta anterior, pois as categorias aparecem juntas no painel.
- Origem familiar e encomendas compartilham a faixa violeta, em seções semânticas distintas. O cabeçalho leva à área de encomendas e o rodapé oferece Instagram e retorno ao início. Não voltaram os slogans repetidos nem foram criados depoimentos ou alegações comerciais.
- Contatos fornecidos pelo responsável: Instagram `@conaffetto66` e WhatsApp corrigido para **+55 47 99911-7567**. `src/data/contato.ts` centraliza a apresentação e as URLs. Os três links de WhatsApp usam `https://wa.me/5547999117567`; os dois links de Instagram usam `https://www.instagram.com/conaffetto66/`.
- Os contatos são links comuns, sem feed, SDK, mensagem automática ou novo serviço no servidor. A página não recebe nem confirma pedidos. Astro, SSR, banco ausente, dependências e Docker foram preservados.

Uma segunda leitura independente do Astra não encontrou falha concreta a corrigir antes da conferência visual. Ela examinou fonte, contatos, pares de contraste e condições de quebra do layout. Isso não equivale a observar a nova página renderizada nem a aprovar sua estética.

### Evidências e limites

- Rascunho anterior, incluindo os arquivos ainda não versionados, preservado em backup central compactado e conferido por `zstd -q -t` e `tar --compare` antes das alterações.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído com nove arquivos verificados, zero erros, avisos ou sugestões e saída de servidor Node.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, com um H1, IDs únicos, referências `aria-labelledby` existentes e oito destinos de âncora válidos.
- Os seis biscoitos e as duas pipocas confirmados permanecem no HTML. Limão, Dedinho e Doce Maria estão ausentes; imagem identificada como ilustrativa; nenhum script ou iframe de cliente.
- Três destinos de WhatsApp e dois de Instagram conferidos no HTML servido, além do número visível e do link interno para encomendas. Conta ativa, abertura efetiva nos aplicativos e envio de mensagem não foram verificados; nenhuma mensagem foi enviada.
- Os dez recursos públicos e o CSS compilado foram entregues com os bytes esperados. Recursos WebP e CSS tiveram tipo MIME correto, fontes responderam e sete caminhos de documentação, fontes e manifesto ou inexistentes retornaram 404.
- Sete pares de texto e fundo calculados, entre 5,68:1 e 12,63:1. O foco usa violeta nas superfícies claras e branco sobre violeta; essa inspeção de código não comprova a interação por teclado nem conformidade integral com acessibilidade.
- O servidor temporário foi encerrado. Não houve reconstrução da imagem Docker, commit, preparação de arquivos no índice, push ou deploy.

O CUA continuou sem navegador disponível. A nova composição precisa ser observada especialmente em 320/390 pixels, na faixa de 761–900 pixels e no desktop. Conferir recorte dos decorados, visibilidade da legenda, encaixe dos títulos, distinção entre superfícies suaves, destaque dos biscoitos e facilidade de encontrar encomendas. As capturas recebidas comprovam a composição anterior; não demonstram o resultado desta revisão.

## Aceite parcial e revisão do encerramento

O responsável enviou novas capturas e considerou a abertura e o cardápio adequados por ora, com melhora clara em relação às propostas anteriores. Rejeitou, porém, a parte final: história e encomendas na faixa violeta e o rodapé. Esse retorno é um aceite localizado da composição desktop mostrada, sem aprovação de toda a página, de uso mobile ou de publicação.

A captura do encerramento confirma uma grande massa de violeta em torno de pouco conteúdo, história pequena, título quebrado e contato fragmentado entre frase, botão, telefone e Instagram. O Instagram reaparece imediatamente no rodapé. O contraste tecnicamente suficiente não resolveu proporção, hierarquia e continuidade com a área anterior.

O Astra examinou as duas capturas e reviu a recomendação da faixa violeta. A implementação foi delimitada ao trecho depois de `<Cardapio />` e aos estilos do encerramento:

- História em área clara, com título “Nossa história”, largura de leitura de até 720 pixels e parágrafo entre 19 e 22 pixels. O conteúdo factual sobre Maria e a família permanece; símbolo lateral, grade compartilhada e limite de título em `13ch` foram retirados.
- Encomendas em uma faixa rosa dentro da largura de conteúdo, com título, botão violeta e número imediatamente abaixo. A frase que repetia a ação e o Instagram foram retirados dessa região. No celular, título, botão e número empilham.
- Rodapé claro em continuidade com o encerramento, com logotipo, Instagram uma única vez e retorno ao início como ação secundária. Em tela estreita, os elementos empilham.

### Aprendizado persistido

As observações específicas, o aceite parcial e os critérios desta decisão estão em [Identidade visual](03-identidade-visual.md). Os aprendizados transferíveis foram incorporados à seção “Aprender com as revisões visuais” de [Diretrizes de design e UX](DIRETRIZES-DE-DESIGN-E-UX.md) e ao guia de mesmo conteúdo no template de projetos.

O registro distingue decisões desta marca de critérios reutilizáveis: avaliar cada região no conjunto, dimensionar o destaque pelo conteúdo e pela tarefa, distinguir legibilidade técnica de hierarquia percebida, repetir ações por função e preservar trechos aceitos. Não estabelece que faixas escuras, duas colunas ou uma estética específica sejam inadequadas em outros contextos. São critérios documentados para reaplicação, não alegação de treinamento permanente do modelo.

### Conferências e limites

- Backups centrais do rascunho do site e do guia do template criados antes das alterações, compactados e conferidos com `zstd -q -t` e `tar --compare`.
- Conteúdo da página até `<Cardapio />` comparado byte a byte com o estado anterior: idêntico. Vinte e três arquivos de código, dados, recursos e configuração protegidos mantiveram seus hashes. Cem registros de regras CSS fora do encerramento, incluindo regras em media queries, permaneceram iguais após análise por PostCSS. Isso confere o recorte da alteração; não prova aparência em tela.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído: nove arquivos verificados sem erros, avisos ou sugestões; servidor Node gerado.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito; um H1, IDs únicos, referências de títulos existentes e oito destinos de âncora válidos. História, número e destinos de contato conferidos; três links de WhatsApp e um de Instagram.
- Os seis biscoitos e as duas pipocas permanecem corretos, com Limão, Dedinho e Doce Maria ausentes. Mock identificado; sem script ou iframe de cliente. Dez recursos públicos e CSS compilado entregues corretamente; sete caminhos de documentação, fontes, manifesto ou inexistentes retornaram 404.
- Sete pares de texto e fundo calculados, todos acima de 4,5:1. Os guias do site e do template têm conteúdo idêntico. O servidor temporário foi encerrado.

O navegador continua indisponível no CUA. A nova composição do encerramento e seu uso por teclado ainda não foram observados; as capturas recebidas mostram a versão substituída e a parte preservada. A avaliação seguinte deve conferir leitura da história, ação de encomenda, continuidade do rodapé e transição com o cardápio aceito. Sem commit, preparação de arquivos no índice, push ou deploy.

## Revisão conjunta de tipografia, cores e acabamento

O retorno seguinte reabriu a aplicação visual da página inteira: excesso de branco, contrastes percebidos como desconfortáveis, uso repetido da fonte expressiva da marca e aparência ainda crua. O responsável escolheu experimentar uma direção mais acolhedora, admitindo uma combinação com a sobriedade anterior. O aceite parcial da composição não impede esta revisão de cores e tipografia; conteúdo, ordem das seções e funções foram preservados.

A revisão distingue a expressão do logotipo da leitura do site:

- O logotipo original permanece intacto. Os títulos do conteúdo passam a usar Poppins Medium, sem itálico e com escala menor; o texto usa Poppins Regular. A abertura fica entre 40 e 52 pixels no desktop e entre 32 e 36 pixels na faixa de até 900 pixels. Os demais títulos têm escala própria, sem repetir o tratamento da marca.
- O fundo creme contínuo conecta cabeçalho, abertura, cardápio, história e rodapé. Um rosé suave identifica o painel do cardápio e a área de encomendas. Texto ameixa e botões violeta têm funções consistentes. O botão mantém preenchimento no hover, com violeta mais escuro; o foco permanece visível nas superfícies previstas.
- O cardápio deixa de alternar branco e rosa entre suas categorias. Biscoitos continuam ocupando a região principal e doces a complementar, com divisão espacial e linha. Bordas discretamente arredondadas aparecem na imagem, no cardápio e no contato. A linha decorativa acima do título foi retirada.
- Poppins Regular 400 foi obtida do repositório oficial Google Fonts, na mesma versão 4.004 da Medium existente, convertida para WOFF2 e servida localmente. O arquivo acrescenta 51.528 bytes. A licença existente foi preservada e sua correspondência com a fonte oficial foi conferida. O preload acompanha a fonte efetivamente usada no texto. Os arquivos antigos de Light e Bodoni foram mantidos, sem referência no CSS atual.

A paleta, os papéis tipográficos, a procedência da fonte e os limites desta proposta estão em [Identidade visual](03-identidade-visual.md); a aplicação no código está em [Tecnologias e código](02-tecnologias-e-codigo.md). O guia de design do site e o mesmo guia do template receberam dois critérios transferíveis: separar a expressão da identidade das funções de leitura e dar uma função consistente a cada superfície. Isso não transforma Poppins, creme ou rosé em padrão obrigatório para outros projetos.

### Evidências e limites desta revisão

- Backups centrais do rascunho do site e do guia do template criados e conferidos antes das alterações. Nenhum arquivo de origem da marca foi substituído.
- Vinte e três arquivos de código, dados, recursos originais e configuração mantiveram os hashes do início desta revisão. Estrutura da página, nomes dos produtos, contatos, imagem e recorte, dependências, SSR e Docker foram preservados.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído: nove arquivos verificados, zero erros, avisos ou sugestões e servidor Node gerado. CSS analisado por PostCSS sem erro; variáveis resolvidas e apenas as faces Regular 400 e Medium 500, ambas normais, referenciadas.
- Metadados da Regular conferidos: peso 400, versão 4.004 e caracteres usados em português presentes. Conversão para WOFF2 preservou mapa de caracteres, ordem dos glifos e métricas horizontais. O arquivo servido respondeu HTTP 200, com tipo `font/woff2` e bytes iguais ao recurso local.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, com idioma `pt-BR`, um H1, IDs únicos, referências de títulos existentes e oito destinos internos válidos. Onze recursos públicos e o CSS compilado foram entregues com os bytes esperados; sete caminhos privados ou inexistentes retornaram 404.
- Seis biscoitos e duas pipocas conferidos, exclusões preservadas, mock identificado e nenhum script ou iframe no HTML. Os três links de WhatsApp, o único link de Instagram e o número visível permanecem corretos. Não houve envio de mensagem nem verificação de conta ou abertura efetiva nos aplicativos.
- Cinco pares de texto e fundo calculados, entre 5,10:1 e 9,14:1. O foco violeta tem 4,17:1 sobre rosé e 5,10:1 sobre creme. Texto pequeno sobre rosé usa ameixa; o indicador de foco usa o limiar de contraste para elementos não textuais. Esses resultados verificam os pares definidos, sem comprovar conforto visual ou acessibilidade integral.
- A segunda leitura independente do Astra conferiu fontes, escalas, limites de largura, cores, estados e coerência da documentação. Não encontrou correção concreta necessária antes da avaliação em tela. A revisão não observou a página renderizada nem aprovou sua estética.

O servidor temporário foi encerrado. O CUA permaneceu sem navegador disponível. A aparência atual, a navegação por teclado e o ajuste observado em diferentes telas continuam pendentes, com atenção especial à transição próxima de 900 pixels e à coluna de doces entre 761 e 900 pixels. As capturas anteriores não mostram esta nova tipografia e paleta. Os guias do site e do template têm conteúdo idêntico. Sem commit, preparação de arquivos no índice, push, reconstrução Docker ou deploy nesta revisão.

## Enquadramento e aplicação dos logotipos — 21–22/10/2026

O responsável rejeitou a revisão de creme contínuo e painéis rosé. Embora tenha reconhecido melhorias pontuais, descreveu a página como ainda branca, solta e sem margem ou limite perceptível. Também rejeitou o contraste dos logotipos no cabeçalho e no rodapé. Esse retorno reabriu o enquadramento e o agrupamento; não pediu outra mudança de família tipográfica, conteúdo ou funcionalidades.

A revisão anterior tinha largura máxima e margem no CSS, mas esses limites não desenhavam uma página distinta do exterior. A nova hipótese de composição separa três níveis:

- Exterior ameixa acinzentado, página rosé e painéis creme. `.page-shell` tem borda contínua, largura máxima de 1280 pixels e margem externa mínima entre 8 e 32 pixels. Em telas maiores, a centralização amplia a área exterior. A margem interna de conteúdo é independente, entre 16 e 48 pixels.
- Cabeçalho e rodapé ameixa escuro ocupam a largura inteira da moldura. Uma camada interna alinha marca e navegação ao restante do conteúdo. Links, acesso a encomendas e foco receberam estados próprios para esses fundos. As regiões escuras ficam nas extremidades, sem recuperar a grande faixa violeta antes rejeitada.
- O cardápio continua em um painel, com prioridade para biscoitos. História e encomendas passam a compartilhar outro painel da mesma largura, separados por linha. A história distribui título e parágrafo no desktop e empilha até 760 pixels. O contato permanece depois da história. Até 600 pixels, o padding lateral dos painéis é de 16 pixels, para não somar afastamentos excessivos no celular.

O cabeçalho e o rodapé usam `Logo Con Afetto_ 2.png`, variante inversa já existente no material original, copiada sem alteração para `public/assets/marca/logo-inverso.png`. O recurso acrescenta 36.836 bytes; o mesmo caminho é usado nas duas aplicações. Não houve filtro ou recoloração. `Marca.astro` passou a registrar dimensões e janela de cada variante, incluindo a inversa completa. A janela própria evita confundi-la com o símbolo isolado.

Poppins, pesos, escalas, textos, nomes de produtos, contatos, ordem das seções e enquadramento da imagem foram preservados. O atributo `sizes` foi ajustado como indicação aproximada ao navegador diante da nova largura da moldura. Não houve mudança de Astro, SSR, dependências ou Docker.

### Continuidade e aprendizado

As decisões atuais estão em [Identidade visual](03-identidade-visual.md) e a estrutura de implementação em [Tecnologias e código](02-tecnologias-e-codigo.md). Os guias de design do site e do template receberam os mesmos critérios: distinguir margem geométrica de limite percebido, evitar afastamentos cumulativos desnecessários e avaliar a variante do logotipo junto ao fundo e à escala. Não se estabelece uma moldura, uma paleta ou uma variante como padrão para todos os projetos.

O backup anterior às alterações, com 39 arquivos do site, fica em `/home/luiz-avcruz/Misc/Backups/Site-Con-Affetto/20261021T235452257451Z-enquadramento-e-marca/antes-das-alteracoes.tar.zst`. O guia anterior do template também foi preservado em backup central. Ambos foram conferidos antes das alterações por `zstd -q -t` e `tar --compare`. Na retomada de 22/10, os arquivos temporários da sessão anterior já não estavam disponíveis; os recibos e arquivos centrais foram verificados por hash e descompactação, recuperando a referência necessária sem restaurar fontes sobre o rascunho.

### Evidências e limites

- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído com nove arquivos verificados, zero erros, avisos ou sugestões e saída de servidor Node. CSS analisado por PostCSS sem erro; 11 variáveis declaradas, nenhuma referência sem definição e apenas as faces Poppins 400 e 500. A moldura não usa `overflow: hidden`.
- Vinte e seis arquivos protegidos de dados, recursos, configuração e código mantiveram os hashes do backup anterior. O conteúdo textual literal da página também permaneceu igual, desconsiderando as mudanças de marcação e atributos. O contrato da fonte e o preload não mudaram nesta etapa.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, idioma `pt-BR`, um H1, IDs únicos, referências de títulos existentes e oito destinos internos válidos. A moldura contém cabeçalho, conteúdo principal e rodapé; história e contato estão no mesmo painel, alinhado ao cardápio.
- Seis biscoitos e duas pipocas conferidos; Limão, Dedinho e Doce Maria ausentes. Mock identificado; nenhum script ou iframe no HTML. Três links de WhatsApp, um de Instagram e número visível preservados. Não houve envio de mensagem ou abertura de aplicativos externos.
- Doze recursos públicos e o CSS compilado entregues com os bytes esperados. PNG, WebP, WOFF2 e CSS tiveram os tipos MIME previstos. Sete caminhos privados ou inexistentes retornaram 404. O servidor temporário foi encerrado ao fim da verificação.
- A variante inversa foi comparada byte a byte com o original. O PNG tem 1755 × 1241 pixels, região não transparente de `(533, 391)` a `(1245, 808)` e janela `521 379 736 441`, que contém integralmente o desenho com folga de 12 pixels por lado. As duas ocorrências no HTML usam esse arquivo e essas dimensões. Isso confere a integridade do recorte, sem comprovar a legibilidade da assinatura pequena no tamanho final.
- Seis papéis de texto e fundo conferidos, com contrastes entre 5,10:1 e 9,14:1. O foco calculado tem 4,17:1 sobre rosé, 5,10:1 sobre creme e 9,14:1 no cabeçalho e rodapé ameixa. A conferência das regras não demonstra navegação efetiva por teclado ou acessibilidade integral.
- O Astra reviu a implementação e o contrato do PNG contra o arquivo real. Não encontrou defeito concreto que exigisse mudança antes da avaliação visual. Conferiu por cálculo a margem externa de 8 pixels em 320 pixels e destacou como condições de observação o botão de WhatsApp nessa largura, a densidade dos doces entre 761 e 900 pixels e a assinatura do logotipo em tamanho final.

O CUA continuou sem aplicativos ou navegadores disponíveis. A distinção percebida entre exterior, página e painéis, o equilíbrio das cores, o uso por teclado e a adaptação observada em tela permanecem pendentes. Build, contraste e revisão estática não aprovam o resultado estético. Os guias do site e do template têm conteúdo idêntico. A proposta continua local, sem preparação de arquivos no índice, commit, push, reconstrução Docker ou deploy.

## Desktop amplo e prévia no celular — 22/10/2026

O responsável considerou o enquadramento muito melhor, mas descreveu a composição como parecida com mobile no PC e pediu acesso pelo celular. A captura recebida mostra a abertura em duas colunas, com grande área externa e a moldura ocupando aproximadamente metade da largura da imagem. O código confirma um teto de 1280 pixels. A interpretação adotada foi ampliar o aproveitamento do desktop, preservando a moldura, as cores e a aplicação da marca que receberam avaliação favorável.

### Alterações delimitadas

- Largura máxima da página de 1280 para 1792 pixels e do conteúdo de 1184 para 1664 pixels, preservando borda e margens. Os valores em pixels pressupõem a referência de 16 pixels por `rem`.
- A partir de 1600 pixels, título principal entre aproximadamente 53 e 64 pixels, descrição de até 544 pixels, imagem de até 640 pixels e lista de biscoitos em três colunas. As duas colunas principais do cardápio continuam priorizando biscoitos sobre doces. O atributo `sizes` acompanha o limite ampliado da imagem.
- As regras existentes de empilhamento, afastamentos móveis, fontes, cores e estados foram preservadas. Os arquivos da imagem e dos logotipos, textos, produtos e contatos não mudaram.
- A prévia de rede usa a opção de host da CLI com o endereço da interface local. O padrão `127.0.0.1` de `astro.config.mjs` permanece, sem fixar no projeto o IP desta máquina. O procedimento está em [Desenvolvimento e validação](04-desenvolvimento-e-git.md) e no README.

O guia de design do site e o do template receberam o mesmo critério sobre composição em telas amplas: conferir largura útil, escala e densidade no desktop e distinguir uma janela estreita do uso em celular real. O registro não impõe que todo site ocupe a tela inteira.

### Prévia de rede e continuidade do processo

As consultas iniciais não encontraram listener na porta 4173 nem servidor Astro ativo. A primeira partida em segundo plano dentro do ambiente isolado imprimiu URL e PID, mas a consulta seguinte não encontrou listener alcançável. Os contextos de PID entre comandos diferiram; o registro isolado não comprovava uma prévia persistente na máquina.

A prévia foi iniciada fora desse isolamento temporário, com o modo `--background` do próprio Astro e logs em arquivo. Depois de o comando terminar, a consulta HTTP ao IP da interface física retornou 200 e o CSS entregue continha as larguras e a media query atuais. O listener ficou vinculado ao endereço específico da rede local, sem escutar em `0.0.0.0`, e o processo nativo registrado foi o PID 39198, iniciado às 17h57 UTC. Nenhum processo alheio foi encerrado. Não houve alteração de firewall, roteador ou encaminhamento de portas.

O endereço atual foi entregue ao responsável para acesso pelo PC e pelo celular na mesma rede. Ele é dado operacional da sessão, não configuração permanente do projeto; pode mudar com a rede. A prévia de desenvolvimento foi mantida ativa para essa avaliação. O processo e os logs podem ser consultados pelos comandos do Astro a partir de um terminal normal da máquina, conforme o procedimento documentado.

### Evidências e limites

- Backups centrais do site, com 40 arquivos, e do guia do template criados e conferidos por `zstd -q -t` e `tar --compare` antes das alterações. O arquivo do site fica em `/home/luiz-avcruz/Misc/Backups/Site-Con-Affetto/20261022T175135140762Z-desktop-e-previa-rede/antes-das-alteracoes.tar.zst`.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído: nove arquivos verificados, zero erros, avisos ou sugestões e saída de servidor Node.
- CSS analisado por PostCSS. Retirando somente os dois tetos de largura e a nova media query de desktop, todas as demais regras e declarações correspondem ao estado anterior. Nenhuma variável usada ficou sem definição. Os limites calculados em 320, 390, 600, 760 e 900 pixels permaneceram iguais. Em uma viewport de 1920 pixels, a moldura calculada passa de 1280 para 1792 pixels. Isso é cálculo do CSS, sem medição de navegador.
- Vinte e oito arquivos protegidos mantiveram seus hashes, incluindo fontes, recursos, dados, marca, configuração Astro, dependências e Docker. O conteúdo textual literal de `index.astro` permaneceu igual. Os guias de design do site e do template têm conteúdo idêntico.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, com um H1, IDs únicos, referências de títulos válidas e oito destinos internos. Os seis biscoitos, duas pipocas, exclusões e contatos foram preservados. Mock identificado; nenhum script ou iframe no HTML de produção.
- Doze recursos públicos e CSS compilado conferidos por HTTP, com bytes esperados e tipos MIME apropriados. Sete caminhos privados ou inexistentes continuaram retornando 404 no servidor de produção. Esse teste não descreve as rotas de ferramentas do servidor de desenvolvimento. O servidor temporário de produção foi encerrado; a prévia Astro da rede foi mantida.
- A prévia de rede e seu CSS responderam por requisição feita na própria máquina, depois da partida ter terminado. O CUA continuou sem aplicativos ou navegadores disponíveis. O caminho completo pelo celular, o reflow observado, o teclado e a aprovação estética do desktop ampliado continuam pendentes.

Conectividade pelo próprio IP não comprova o acesso do telefone através do Wi-Fi. A captura recebida mostra a composição anterior, com teto de 1280 pixels. Não houve nova revisão independente nesta alteração delimitada, reconstrução Docker, preparação de arquivos no índice, commit, push ou deploy. A publicação no Coolify não recebeu o rascunho.

## Acesso confirmado no celular e página em largura total — 22/10/2026

O responsável informou que o telefone não conectava à prévia. O servidor continuava respondendo HTTP 200 no IP da máquina e escutava na interface física correta. O Firewalld estava ativo; a interface `enp4s0` pertencia à zona `home`, sem permissão para TCP 4173. A resposta obtida no próprio computador não havia exercitado essa entrada pelo firewall.

Foi acrescentada somente uma regra de runtime, na zona `home`, aceitando origem `192.168.25.0/24`, destino `192.168.25.122` e TCP 4173, com duração de 3600 segundos. A regra foi aplicada por volta de 15h07 no horário de Brasília e expira aproximadamente às 16h07. A presença no runtime, ausência no permanente e equivalência da configuração permanente com o estado anterior foram conferidas. O firewall permaneceu ativo; não houve mudança de roteador, recarga de regras ou alteração de outras zonas. O servidor da prévia foi mantido.

Depois da liberação, o responsável confirmou que a página carregou no telefone. Esse retorno confirma o acesso real pelo celular após a correção do bloqueio. Não confirma, por si, navegação por teclado, todos os trechos da página ou aprovação do layout. O diagnóstico e os comandos para uma exceção de sessão estão em [Desenvolvimento e validação](04-desenvolvimento-e-git.md). O servidor pode continuar ativo quando a permissão temporária expirar; nesse caso, a política anterior volta a reger o acesso externo.

### Retorno sobre as bordas

O responsável enviou capturas do desktop ampliado e do telefone e rejeitou a borda e o afastamento externos nos dois. A delimitação desejada passa a ser a dos grupos de conteúdo, com a página preenchendo a largura da tela. A moldura externa era uma interpretação anterior, agora substituída pelo retorno explícito.

O CSS passa a usar `.page-shell` com largura de 100%, sem teto próprio, borda ou margem externa. O `body` mantém margem zero, perde o padding externo e usa o próprio fundo rosé. Foram retiradas as variáveis de exterior, largura de página e margem externa. Cabeçalho, fundo e rodapé chegam às bordas; `.container` continua limitando o conteúdo a 1664 pixels e preserva o espaçamento interno. Contornos dos painéis, cantos da imagem, cores restantes, tipografia, regras de empilhamento e tratamento de desktop permanecem.

Na captura do telefone, cores e textos aparecem escurecidos em relação ao desktop e ao CSS. O site não define um tema escuro. Uma transformação no navegador ou aparelho é uma hipótese, sem causa determinada nesta etapa. Essa diferença foi registrada em [Identidade visual](03-identidade-visual.md), sem acrescentar um tema ou mudar as cores para compensá-la.

O guia de design do site e o do template passaram a explicitar a diferença entre delimitar uma página, uma seção ou um grupo. Uma moldura externa não é consequência obrigatória de um pedido de maior agrupamento. Esse critério não impõe páginas sem margem em todos os projetos.

### Verificação e estado

- Backups centrais do site, com 40 arquivos, e do guia do template criados antes da alteração de largura e conferidos com `zstd -q -t` e `tar --compare`. O arquivo do site fica em `/home/luiz-avcruz/Misc/Backups/Site-Con-Affetto/20261022T181207244014Z-largura-total/antes-das-alteracoes.tar.zst`. Os dois documentos de operação e andamento também haviam recebido backup antes do registro do firewall.
- `ASTRO_TELEMETRY_DISABLED=1 npm run build` concluído: nove arquivos verificados, sem erros, avisos ou sugestões, e servidor Node gerado.
- PostCSS confirmou sintaxe e variáveis válidas. Desconsiderando apenas as três variáveis retiradas e as declarações externas de `body` e `.page-shell`, todas as demais regras e declarações correspondem ao estado anterior. A página usa 100% de largura e o container interno mantém seu limite. Isso confere o escopo do CSS, sem observar a nova versão em tela.
- Vinte e nove arquivos protegidos, incluindo a marcação da página, dados, componentes, recursos, dependências, configuração Astro e Docker, mantiveram os hashes. Os guias de design do site e do template têm conteúdo idêntico.
- Servidor de produção temporário respondeu HTTP 200. HTML analisado em modo estrito, com um H1, IDs e referências de títulos válidos e oito destinos internos. Seis biscoitos, duas pipocas, exclusões e contatos preservados; mock identificado; nenhum script ou iframe de cliente na produção.
- Doze recursos públicos e o CSS compilado entregues com bytes esperados. Sete caminhos privados ou inexistentes retornaram 404 no servidor de produção. Pares de cores de texto e foco permaneceram iguais. O servidor temporário foi encerrado; a prévia da rede continuou ativa e entregou por HTTP o CSS de largura total.

As capturas recebidas mostram a versão com afastamento externo; a retirada desse afastamento ainda precisa ser vista pelo responsável. O acesso pelo telefone está confirmado, e a aparência da alteração mais recente permanece em avaliação. Não houve preparação de arquivos no índice, commit, push, reconstrução Docker ou deploy.

## Versionamento e envio autorizados — 22/10/2026

O responsável autorizou criar o commit e enviá-lo ao GitHub. Essa instrução encerra a retenção desta etapa como rascunho sem histórico; as regras de autorização para mudanças futuras continuam válidas. Os registros anteriores de ausência de commit e push descrevem o estado de cada revisão naquele momento.

O conjunto a versionar reúne o layout responsivo em largura total, o destaque para biscoitos, o cardápio corrigido, os contatos públicos centralizados, os recursos ilustrativos e tipográficos locais e a documentação de projeto, código, design e operação. São 24 arquivos alterados ou novos. Planilhas, bancos, originais privados da marca, arquivos de ambiente, `dist/`, `.astro/` e `node_modules/` permanecem fora da seleção. A conferência dos textos selecionados não encontrou os indicadores de credenciais pesquisados; isso não substitui a análise de conteúdo da seleção.

Antes da seleção, `git ls-remote --heads origin refs/heads/main` confirmou a mesma base do checkout: `70178311568f4d4629c505b2b6ff7a6bc43992a7`. O build foi repetido para o envio e verificou nove arquivos, com zero erros, avisos ou sugestões, gerando o servidor Node. As verificações anteriores de HTML e recursos de produção, navegação, cardápio e contatos continuam registradas nesta página. Nesta preparação, apenas o estado da documentação foi ajustado; não houve nova alteração de comportamento.

O rascunho completo foi preservado em backup central com 40 arquivos, conferido por `zstd -q -t` e `tar --compare`, em `/home/luiz-avcruz/Misc/Backups/Site-Con-Affetto/20261022T192325590139Z-antes-commit-e-push/rascunho.tar.zst`.

O envio usa `origin`, branch `main`, sem sobrescrever histórico remoto. A conclusão do push é aferida pela correspondência entre o SHA do commit local e o retornado por `git ls-remote`, além do estado do checkout. A mensagem da etapa é `feat: destaque biscoitos e facilite encomendas`. O histórico Git identifica o commit exato que contém este registro.

Um push pode disparar uma implantação se o Coolify estiver configurado para acompanhar a branch. O painel não foi inspecionado e nenhum comando de deploy integra esta etapa; a confirmação do GitHub não constitui confirmação da versão servida no domínio.

## Pendências para a revisão do responsável

- Avaliar o uso da versão local em Astro e a manutenção do cardápio em arquivo.
- Conferir o conjunto final de nomes e a apresentação visual em computador e celular.
- Percorrer os fontes com o responsável para conferir a compreensão da estrutura e das escolhas de implementação.
- Definir preços e unidades caso devam ser exibidos.
- Selecionar fotografias reais caso o cardápio deva ter imagens dos produtos.
- Definir a licença do código e registrar a configuração operacional quando ela for inspecionada.
- Definir o mecanismo compartilhado de formatação ao tratar das ferramentas de desenvolvimento.

A base está disponível no GitHub e foi implantada pelo responsável. O versionamento e o envio desta revisão foram autorizados em 22/10/2026; o estado de implantação é verificado separadamente. Não há importador da planilha ou ligação ao banco do comércio.
