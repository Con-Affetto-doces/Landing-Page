# Arquitetura e renderização

## Decisão e estado

O site apresenta a marca e o cardápio. O responsável definiu SSR, dispensou banco nesta etapa e pediu escolher a tecnologia pela adequação ao projeto. Após comparação, autorizou o experimento com Astro e solicitou Docker para futura publicação na VPS com Coolify.

A versão local usa Astro, TypeScript, CSS próprio e adaptador Node standalone. Build, servidor compilado, SSR por requisição e execução da imagem foram verificados. A aprovação visual, o uso real e a configuração da VPS continuam pendentes.

A escolha aproveita o conteúdo e os estilos existentes e organiza a composição do cardápio. É uma decisão de adequação ao escopo, sem benchmark comparativo entre frameworks. A experiência de manutenção pode justificar sua revisão.

## Responsabilidades e interação

| Parte | Responsabilidade | Implementação |
| --- | --- | --- |
| Dados editoriais | Nomes, categorias e notas confirmadas. | `src/data/cardapio.ts`. |
| Cardápio | Compor as duas categorias e a apresentação dos produtos. | `Cardapio.astro` e `ItemCardapio.astro`. |
| Página | Apresentação, navegação, história e rodapé. | `src/pages/index.astro`. |
| Documento | HTML, idioma, metadados, fonte pré-carregada e CSS global. | `src/layouts/SiteLayout.astro`. |
| Visual e marca | Distribuição, adaptação às telas, fontes e logotipos. | CSS próprio e recursos em `public/assets/`. |
| Servidor | Receber requisições, renderizar a página e servir os recursos. | Adaptador Node; `dist/server/entry.mjs`. |
| Empacotamento | Compilar e executar uma versão de produção em Node LTS. | `Dockerfile`. |

A requisição percorre servidor → página → layout e componentes → HTML. O navegador recebe o conteúdo e carrega os recursos. O renderizador usa os dados diretamente; não há uma API HTTP intermediária.

O arquivo editorial é incorporado à versão compilada. Editar os produtos exige novo build e publicação. SSR não sincroniza a planilha nem cria administração ou persistência.

## SSR e limite da evidência

SSR nesta implementação significa gerar o HTML no servidor por requisição. Pré-renderização estática gera o HTML no build; ambas podem entregar conteúdo completo. `output: "server"` seleciona SSR por padrão, conforme a [documentação do Astro](https://docs.astro.build/en/guides/on-demand-rendering/).

A configuração usa `@astrojs/node` com modo standalone e sessões desativadas. Não existe uma cópia `public/index.html` que possa atender a rota antes do renderizador. O manifesto compilado marca `/` com `prerender: false`, e o adaptador instalado encaminha a rota para a renderização.

Para demonstrar execução, a verificação foi feita em uma cópia isolada dos fontes:

1. Adicionar um identificador aleatório no frontmatter de `Cardapio.astro` e incluí-lo em um atributo temporário do HTML.
2. Compilar e iniciar o servidor de produção da cópia.
3. Solicitar duas vezes a mesma rota `/` e conferir que os identificadores são diferentes.
4. Compilar o controle com renderização estática, servir o arquivo gerado e repetir os pedidos: o identificador permanece igual.
5. Conferir os hashes dos fontes do projeto original para garantir que a instrumentação permaneceu apenas na cópia.

O controle mostrou que o instrumento distingue execução por requisição de valor fixado no build. O HTML e a imagem entregues não incluem essa instrumentação. A conferência HTTP normal validou o conteúdo completo e os recursos separadamente.

## Comparação que levou ao experimento

Foram discutidos Astro, React/Next, Vue/Nuxt, SvelteKit, Angular SSR e Express com templates, além de opções de estilos. Os critérios foram objetivo atual, modo de escrever e manter componentes, interatividade necessária e operação.

Astro foi recomendado pela composição de conteúdo próxima da base existente e pela possibilidade de acrescentar comportamento no navegador conforme a necessidade. A escolha também tem custo: convenções próprias, dependências, compilação e servidor de execução.

Next e as demais alternativas continuam tecnicamente viáveis. Familiaridade com uma ferramenta, requisitos de interação compartilhada ou uma necessidade concreta de biblioteca podem alterar a avaliação. Não há uma limitação visual imposta pela escolha atual.

CSS próprio preserva a identidade existente. Uma biblioteca de interface não foi necessária para a migração e deve ser avaliada quando resolver um comportamento ou custo concreto.

## Execução e hospedagem

Versões e comandos estão em [Tecnologias e código](02-tecnologias-e-codigo.md) e [Desenvolvimento e Git](04-desenvolvimento-e-git.md). A imagem usa Node 24.22.0 LTS; o servidor local também foi conferido em Node 26.12.0. A configuração atende a raiz do domínio.

Docker e os parâmetros do Coolify estão em [Docker e Coolify](07-docker-e-coolify.md). A imagem usa a porta interna `4321` e escuta em `0.0.0.0`. O navegador acessará o domínio através do proxy, cuja configuração e TLS dependem da futura implantação.

O código está no repositório público [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page). [GitHub Pages oferece hospedagem estática](https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages) e, sozinho, não executa este SSR.

## Critérios e limites

- Conteúdo, navegação e recursos da base inicial preservados.
- SSR demonstrado em servidor compilado, com controle estático.
- Build e execução da imagem conferidos, incluindo healthcheck e usuário sem root.
- Comandos e responsabilidades documentados junto do código.
- Revisão visual e comercial, teste na VPS e implantação registrados como pendentes.

Banco, autenticação, administração, pedidos e integração com o Caixa da Feira permanecem fora desta etapa. Os resultados detalhados ficam em [Decisões e andamento](05-decisoes-e-andamento.md).
