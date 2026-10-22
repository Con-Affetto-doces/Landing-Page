# Docker e Coolify

## Objetivo e estado

O site foi implantado pelo responsável na VPS com Coolify, em `https://conaffetto.com.br`. A página e seu CSS responderam por HTTPS em 21/10/2026. Dockerfile e imagem da base já tinham sido testados localmente. O código base está em [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page); o envio da revisão visual para `main` foi autorizado em 22/10/2026. O estado de uma implantação resultante deve ser confirmado no Coolify e na aplicação. O painel e o estado interno da VPS não foram inspecionados.

A configuração atende o site na raiz do domínio. O endereço confirmado é `https://conaffetto.com.br/`. Os valores abaixo documentam o contrato esperado pela imagem; não são uma cópia das configurações efetivamente inspecionadas no painel. A documentação oficial consultada pode diferir da versão instalada na VPS; conferir os campos equivalentes ao configurar a aplicação.

## O que a imagem contém

O Dockerfile usa dois estágios:

1. `build`: instala pelo lockfile, verifica tipos, compila e remove dependências exclusivamente de desenvolvimento.
2. `runtime`: copia a saída compilada, manifests e dependências de produção; executa o servidor como usuário `node`.

A base é `node:24.22.0-bookworm-slim`, com Node LTS compatível com o Astro adotado. Atualizar essa versão deve ser uma mudança deliberada, seguida de build e teste da imagem. O pacote Astro ainda inclui ferramentas transitivas como Vite e compiladores; a imagem não é descrita como livre de qualquer ferramenta de build.

`src`, documentação, Git e arquivos locais não são copiados para a imagem final. `.dockerignore` também reduz o contexto de build. O servidor entrega os recursos de `dist/client/` e renderiza a página pelo entrypoint `dist/server/entry.mjs`.

| Parâmetro | Valor |
| --- | --- |
| Processo | `node ./dist/server/entry.mjs` |
| `HOST` no contêiner | `0.0.0.0` |
| `PORT` e porta interna exposta | `4321` |
| `NODE_ENV` | `production` |
| Healthcheck | GET interno de `/`, executado pelo próprio Node. |
| Persistência de aplicação | Nenhum volume necessário no escopo atual. |

`session: false` no Astro desativa sessões; o site não grava cardápio, uploads ou banco em runtime. Alterar os produtos exige reconstruir e publicar uma versão.

## Construir e executar localmente

Na raiz do repositório, com Docker disponível:

```bash
docker build -t con-affetto-site:local .
docker run --rm --name con-affetto-site-local -p 127.0.0.1:4174:4321 con-affetto-site:local
```

Acesse `http://127.0.0.1:4174`. O mapeamento fica restrito ao computador local. Se a porta ou o nome já estiver em uso, escolha outro; preserve os serviços existentes. O servidor dentro do contêiner precisa escutar em `0.0.0.0` para receber esse encaminhamento.

Em outro terminal, conferir a saúde:

```bash
docker inspect --format '{{.State.Health.Status}}' con-affetto-site-local
```

O estado inicial pode ser `starting`; depois de uma checagem bem-sucedida, deve ser `healthy`. O healthcheck faz parte da imagem e usa Node, sem depender de instalar `curl` ou `wget`. A resposta do cardápio deve ser conferida também no navegador.

Para encerrar o contêiner iniciado por esse comando:

```bash
docker stop con-affetto-site-local
```

`--rm` remove o contêiner ao encerrar; a imagem fica disponível para outros testes. Os testes realizados nesta etapa usaram uma imagem local identificada como `con-affetto-site:astro-ssr-20261020`, em Linux/amd64.

## Configuração para o Coolify

Usar uma aplicação construída a partir do repositório Git do site, já publicado, com acesso compatível com sua visibilidade:

| Campo ou responsabilidade | Configuração |
| --- | --- |
| Repositório | `https://github.com/Con-Affetto-doces/Landing-Page.git` (público). |
| Build pack / Build strategy | Dockerfile. |
| Branch | `main`, se mantida como branch de publicação. |
| Base Directory | Raiz do repositório (`/`). |
| Dockerfile Location | `/Dockerfile`, relativo à base. |
| Ports Exposes | `4321`. |
| Execução | Servidor Node com SSR. |
| Domínio | O domínio escolhido para o site, servido pela raiz. |
| Volumes | Nenhum para esta versão. |

O Dockerfile já define host e porta. Manter esses valores coerentes com `Ports Exposes` se houver sobrescrita por variáveis no painel. O proxy do Coolify encaminha o domínio à porta interna; não é necessário configurar um mapeamento público da porta `4321` no host para esse fluxo.

Em aplicações Dockerfile, a documentação atual do Coolify informa que o `HEALTHCHECK` da imagem tem precedência sobre a checagem configurada no painel. Conferir esse comportamento na versão instalada. O comando da imagem já está disponível no runtime.

O build executa os comandos necessários; não é preciso manter um segundo conjunto de comandos de instalação e compilação no painel. O contexto deve ser a raiz do repositório para que o Dockerfile encontre o lockfile, `src` e `public`.

## Verificação da publicação

Depois de implantar de fato, registrar o commit publicado e conferir logs de inicialização, saúde do contêiner, acesso pelo domínio com TLS e carregamento de CSS, fontes e logotipos. Conferir o HTML entregue e percorrer cardápio e navegação. O acesso HTTPS à página e aos recursos da versão anterior foi observado. Logs, saúde do contêiner e configuração do proxy ainda não foram inspecionados na VPS.

A última consulta de 21/10/2026 retornou HTTP 503, `no available server`. O horário e o limite da observação estão em [Decisões e andamento](05-decisoes-e-andamento.md); a causa não foi investigada nesta revisão visual local.

O healthcheck responde se a rota está disponível; não aprova o visual ou o conteúdo comercial. Em uma troca de versão, voltar o Git local não muda a aplicação publicada: será necessário reconstruir ou selecionar a versão anterior no ambiente de hospedagem e verificar o resultado.

Referências: [Dockerfile no Coolify](https://coolify.io/docs/applications/builds/dockerfile), [healthchecks do Coolify](https://coolify.io/docs/applications/configuration/health-checks), [builds em estágios](https://docs.docker.com/build/building/multi-stage/) e [ciclo de suporte do Node](https://nodejs.org/en/about/previous-releases).
