# Site da Con Affetto

Apresentação da marca e cardápio de biscoitos artesanais e pipocas gourmet. Projeto independente do aplicativo Caixa da Feira, em português do Brasil.

A versão local usa Astro, TypeScript e CSS próprio. O servidor Node gera o HTML por requisição, incluindo os produtos; a leitura e a navegação do cardápio funcionam sem JavaScript no navegador. Os logotipos e as fontes da identidade existente ficam no projeto. O cardápio é mantido em arquivo versionado, sem banco de dados.

## Instalar e abrir localmente

Use Node.js compatível com `package.json` (mínimo 22.22.0) e npm (mínimo 9.6.5). A imagem Docker usa Node 24.22.0 LTS. A validação no host também foi realizada com Node 26.12.0 e npm 12.2.1.

Na raiz do repositório:

```bash
npm ci
npm run dev
```

Acesse `http://127.0.0.1:4173`. O servidor de desenvolvimento acompanha as alterações nos fontes. `Ctrl+C` encerra o processo. Se a porta estiver ocupada, use `npm run dev -- --port 4174`; preserve o serviço existente.

## Conferir a versão de produção

```bash
npm run build
HOST=127.0.0.1 PORT=4173 npm start
```

O build executa a verificação de tipos e gera `dist/`. O segundo comando serve essa versão compilada em `http://127.0.0.1:4173`. Encerre a prévia que você iniciou antes de reutilizar sua porta, ou escolha outra. `npm run check` permite conferir os tipos sem compilar.

## Docker e Coolify

O repositório contém um Dockerfile de produção, com Node LTS, usuário sem privilégios de root, porta interna `4321` e healthcheck. Build, teste local e parâmetros para a futura VPS estão em [Docker e Coolify](Docs/07-docker-e-coolify.md). O teste local da imagem não constitui publicação na VPS.

## Entender e alterar o projeto

- [Escopo e origem do cardápio](Docs/01-projeto-e-cardapio.md): produtos confirmados e limites das informações públicas.
- [Tecnologias e código](Docs/02-tecnologias-e-codigo.md): fluxo da requisição, estrutura e alterações frequentes.
- [Identidade visual](Docs/03-identidade-visual.md): cores, fontes e aplicação da marca.
- [Desenvolvimento, validação e Git](Docs/04-desenvolvimento-e-git.md): comandos, conferências e recuperação.
- [Decisões e andamento](Docs/05-decisoes-e-andamento.md): decisões, resultados e pendências.
- [Arquitetura e renderização](Docs/06-arquitetura-e-renderizacao.md): escolha do frontend e demonstração de SSR.
- [Docker e Coolify](Docs/07-docker-e-coolify.md): imagem, operação local e configuração de publicação.
- [Diretrizes de desenvolvimento](Docs/DIRETRIZES-DE-DESENVOLVIMENTO.md): critérios para decisões, código, validação e manutenção.

Para mudar um produto, edite `src/data/cardapio.ts`. Para mudar o visual, edite `src/styles/global.css`. Os textos de apresentação e história estão em `src/pages/index.astro`. A documentação acompanha as mudanças de comportamento e estrutura.

## Estado

Astro SSR e Docker implementados, com código publicado na branch `main` do repositório público [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page). A revisão visual em computador e celular e a aprovação comercial continuam pendentes. Domínio e publicação na VPS são etapas posteriores.

A planilha, o banco do caixa e os documentos completos da marca permanecem fora do repositório. Os recursos públicos usados e as licenças OFL das fontes ficam em `public/assets/`. A licença do código ainda precisa ser definida; as licenças das fontes e os direitos sobre a identidade permanecem descritos em [Identidade visual](Docs/03-identidade-visual.md).
