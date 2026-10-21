# Desenvolvimento, validação e Git

## Fluxo de trabalho

Cada etapa começa por uma necessidade observável: conteúdo, problema de leitura, comportamento ou requisito novo. Antes de adotar uma tecnologia, registrar o que ela resolve e o custo de mantê-la. Depois da alteração, conferir o resultado, atualizar a documentação afetada e criar um commit coerente.

A implementação usa os fontes de `src/`; os recursos públicos ficam em `public/assets/`. `dist/` é saída gerada. Não editar os arquivos compilados como forma de manutenção.

## Instalação e prévia

Na raiz, com Node e npm compatíveis com `package.json`:

```bash
npm ci
npm run dev
```

Acesse `http://127.0.0.1:4173`. O servidor acompanha alterações e pode incluir ferramentas de desenvolvimento no navegador. `Ctrl+C` encerra o processo iniciado. Se a porta estiver ocupada, use `npm run dev -- --port 4174`; não encerre um serviço alheio.

Host e porta padrão ficam em `astro.config.mjs`, permitindo que uma opção da CLI substitua a porta sem duplicar argumentos. Astro 7 detecta agentes de IA e pode iniciar a prévia em segundo plano. Em testes controlados, `npm run dev -- --ignore-lock` mantém a execução em primeiro plano, sem substituir um servidor existente. Para uma prévia em background iniciada por você neste projeto, os subcomandos `npm run dev -- status`, `npm run dev -- logs` e `npm run dev -- stop` permitem acompanhar e encerrar o processo. Conferir a identidade antes de encerrar; não usar `--force` para substituir uma sessão alheia.

O mínimo atual é Node 22.22.0 e npm 9.6.5. A imagem de produção usa Node 24.22.0 LTS; as versões efetivamente verificadas ficam em [Decisões e andamento](05-decisoes-e-andamento.md). `npm ci` instala a árvore do lockfile. Para alterar dependências, conferir compatibilidade, modificar o conjunto deliberadamente e revisar também o lockfile.

## Tipos, compilação e execução de produção

```bash
npm run check
```

Esse comando verifica `.astro` e TypeScript. Para compilar, use:

```bash
npm run build
```

O build já executa `astro check` antes de `astro build`; não é necessário repetir a checagem sem alteração dos fontes. Para servir o resultado compilado apenas no computador local:

```bash
HOST=127.0.0.1 PORT=4173 npm start
```

O processo usa `dist/server/entry.mjs` e atende os recursos de `dist/client/`. Ajuste `PORT` se a porta estiver em uso. O adaptador aceita `HOST` e `PORT` por ambiente; os valores explícitos acima limitam o teste ao computador. No Docker, o processo usa `HOST=0.0.0.0` para ser alcançável pelo proxy.

Build e verificações não exigem acesso à planilha, ao caixa ou a banco. Para conferir o pacote que será usado na VPS, siga [Docker e Coolify](07-docker-e-coolify.md).

## O que verificar

Escolher as conferências pelo comportamento alterado. Na migração de renderização, conferir o HTML do servidor compilado, nomes e notas dos produtos, metadados, links, recursos e limites da raiz pública. Tipagem e build não demonstram esses resultados sozinhos.

HTML completo não distingue SSR de pré-renderização estática. A prova da migração usou instrumentação do componente em cópia isolada e um controle estático; o método está em [Arquitetura e renderização](06-arquitetura-e-renderizacao.md). Repetir esse tipo de prova quando houver mudança na estratégia de renderização ou no adaptador que possa alterar o contrato.

Antes de considerar o visual aprovado, abrir a página em computador e celular ou janela estreita e conferir:

1. Navegação até cardápio e história; títulos e produtos completos.
2. Leitura sem rolagem horizontal, sobreposição ou texto cortado.
3. Uso de `Tab`: atalho para o conteúdo e links com foco visível.
4. Ampliação do texto e uso da página sem JavaScript.
5. Fontes, proporções do logotipo e contraste.
6. Correspondência comercial dos nomes e variantes.

A resposta HTTP `200`, a equivalência da estrutura HTML e o estado `healthy` do contêiner são evidências distintas da revisão visual. Registrar apenas o que foi observado em [Decisões e andamento](05-decisoes-e-andamento.md).

## Histórico local

O repositório é independente do `Sistema-Con-Affetto`, com branch `main`. O Git guarda fontes, lockfile, configuração de execução, recursos públicos usados e documentação.

Antes de uma alteração:

```bash
git status --short
git diff
```

Depois da conferência, selecionar os arquivos da etapa e revisar o índice. Por exemplo, ao alterar o cardápio e sua documentação:

```bash
git add src/data/cardapio.ts Docs/01-projeto-e-cardapio.md
git diff --cached
git status --short
git commit -m "feat: atualiza cardapio da Con Affetto"
```

Os caminhos são exemplos; incluir apenas as alterações da etapa. Uma edição posterior ao `git add` exige nova seleção. Conferir o resultado:

```bash
git status --short --branch
git log --oneline -5
```

## Recuperação

A base HTML/CSS anterior à migração está no commit `e4fc9da`. Consultar um arquivo sem alterar o checkout:

```bash
git show e4fc9da:public/index.html
```

Preservar trabalho ainda não registrado antes de restaurar ou reverter qualquer conjunto. O retorno do código não recupera edições editoriais posteriores que tenham sido descartadas. Esta versão não cria banco ou estado persistente de aplicação.

Na operação futura, reverter o Git local não muda a VPS. A hospedagem precisa reconstruir ou selecionar a versão correspondente; conferir domínio e aplicação depois de qualquer troca.

## Histórico, GitHub e hospedagem

Planilha, banco do caixa, dados de atendimento, backups e documentos completos da marca ficam fora do repositório. `node_modules/`, `.astro/`, `dist/` e configurações locais são ignorados. `.gitignore` não remove arquivos já rastreados: revisar sempre a seleção.

Git registra a história local. O remoto `origin` aponta para o repositório público [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page), indicado pelo responsável. A branch local `main` acompanha `origin/main`. O primeiro envio publicou o commit `e0e8221`, e a referência remota foi conferida após o push.

Neste clone, a autenticação HTTPS usa a sessão já existente do GitHub CLI, por meio do helper `gh auth git-credential` configurado apenas no Git local do repositório. Essa configuração não é versionada nem acompanha novos clones. A autenticação não exige incluir tokens nos arquivos versionados.

Para publicar os próximos commits:

```bash
git push origin main
git rev-parse HEAD
git ls-remote --heads origin refs/heads/main
```

O SHA local e o SHA da branch remota devem corresponder. A licença do código continua pendente de definição. A VPS com Coolify é o destino de hospedagem solicitado; sua preparação está documentada, mas a implantação ainda não foi executada.

Commit local e dry-run não confirmam publicação. Build local da imagem também não confirma implantação na VPS.
