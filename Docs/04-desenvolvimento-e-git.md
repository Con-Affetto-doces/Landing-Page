# Desenvolvimento, validação e Git

## Fluxo de trabalho

Cada etapa começa por uma necessidade observável: conteúdo, problema de leitura, comportamento ou requisito novo. Antes de adotar uma tecnologia, registrar o que ela resolve e o custo de mantê-la. Depois da alteração, conferir o resultado e atualizar a documentação afetada. Quando houver autorização para versionar a proposta, criar um commit coerente.

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

### Prévia no celular pela rede local

O padrão `127.0.0.1` em `astro.config.mjs` limita a prévia ao próprio computador. Para conferir em um celular real, conecte os dois aparelhos à mesma rede e identifique o IP da interface ligada ao roteador:

```bash
ip -brief address
```

Se esse endereço for `192.168.1.10`, por exemplo:

```bash
npm run dev -- --host 192.168.1.10
```

Abra `http://192.168.1.10:4173` no celular e no computador, substituindo o exemplo pelo IP atual. `localhost` e `127.0.0.1` no celular apontam para o celular. A opção da CLI substitui o host da configuração apenas nessa execução; o endereço da máquina não precisa ser gravado no projeto. O host específico escolhe a interface da rede local, em vez de escutar em todas as interfaces. Não há publicação no Coolify, mudança de DNS ou necessidade de encaminhamento de porta do roteador.

Para manter uma prévia iniciada por você em segundo plano, acrescente `--background`. Use `npm run dev -- status` e `npm run dev -- logs` para conferir; `npm run dev -- stop` encerra o processo desse projeto, após confirmar sua identidade. Se já houver um servidor ativo, preserve-o ou escolha outra porta e uma execução separada; não use `--force` para substituí-lo sem autorização. O IP pode mudar ao reconectar a rede, portanto confira-o novamente em uma nova sessão.

Ao executar por um agente, conferir também a resposta HTTP após o comando de partida encerrar. Um processo iniciado dentro de um isolamento temporário pode desaparecer com esse ambiente, mesmo depois de imprimir uma URL. O registro de PID deve ser interpretado no contexto em que o processo foi criado; não usar um PID antigo isoladamente para encerrar processos em outro contexto.

Uma resposta obtida pelo computador no próprio IP confirma o listener e a página, mas ainda não demonstra a conexão pelo Wi-Fi do celular. Esse último trecho depende da rede e precisa ser observado no aparelho.

### Quando a prévia responde no PC, mas não no celular

Confirmar o endereço e o listener, a conexão do telefone à mesma rede e a zona da interface no firewall. Em uma máquina com Firewalld:

```bash
firewall-cmd --get-active-zones
firewall-cmd --get-zone-of-interface=enp4s0
firewall-cmd --zone=home --list-all
```

Os nomes `enp4s0` e `home` são os desta máquina; conferir os valores do ambiente antes de agir. Se o serviço estiver ativo no IP correto e a zona bloquear a porta, uma exceção de sessão pode ser restrita à sub-rede de origem, ao IP de destino e a TCP 4173. Por exemplo, para uma rede `192.168.1.0/24` e computador `192.168.1.10`:

```bash
REGRA_PREVIA='rule family="ipv4" source address="192.168.1.0/24" destination address="192.168.1.10" port port="4173" protocol="tcp" accept'
firewall-cmd --zone=home --add-rich-rule="$REGRA_PREVIA" --timeout=3600
firewall-cmd --zone=home --query-rich-rule="$REGRA_PREVIA"
```

Substituir a faixa, o IP e a zona pelos valores confirmados. Esse comando mantém o firewall ativo, cria somente uma regra de runtime e a remove automaticamente após uma hora. Não usa `--permanent`, não recarrega o firewall e não encaminha portas no roteador. A prévia pode continuar rodando depois de a exceção expirar; nesse caso, o acesso externo volta a depender da política anterior.

Para retirar antecipadamente a exceção criada por você, mantendo o mesmo valor de `REGRA_PREVIA`:

```bash
firewall-cmd --zone=home --remove-rich-rule="$REGRA_PREVIA"
```

Conferir a presença no runtime, a ausência no permanente e a preservação das demais regras. Repetir o acesso pelo telefone: resposta HTTP da própria máquina não cobre a passagem pelo firewall de entrada. Em 22/10/2026, o responsável confirmou que o celular carregou a página após essa liberação restrita.

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

1. Navegação até cardápio, história e encomendas; títulos e produtos completos.
2. Leitura sem rolagem horizontal, sobreposição ou texto cortado.
3. Uso de `Tab`: atalho para o conteúdo e links com foco visível.
4. Ampliação do texto e uso da página sem JavaScript.
5. Fontes, proporções do logotipo e contraste.
6. Correspondência comercial dos nomes e variantes.
7. Destinos de WhatsApp e Instagram e número exibido; distinguir URL correta de conversa efetivamente aberta no aplicativo.
8. Recorte quadrado da imagem e preservação dos biscoitos decorados, com legenda ilustrativa legível.

A resposta HTTP `200`, a equivalência da estrutura HTML e o estado `healthy` do contêiner são evidências distintas da revisão visual. Registrar apenas o que foi observado em [Decisões e andamento](05-decisoes-e-andamento.md).

## Histórico local

O repositório é independente do `Sistema-Con-Affetto`, com branch `main`. O Git guarda fontes, lockfile, configuração de execução, recursos públicos usados e documentação.

Antes de uma alteração:

```bash
git status --short
git diff
```

A proposta fica como alterações locais enquanto estiver em avaliação. Criar commit somente após aprovação do responsável ou autorização explícita para essa etapa. Depois dessa autorização e da conferência, selecionar os arquivos da etapa e revisar o índice. Por exemplo, ao alterar o cardápio e sua documentação:

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

Com autorização para publicar os próximos commits:

```bash
git push origin main
git rev-parse HEAD
git ls-remote --heads origin refs/heads/main
```

O SHA local e o SHA da branch remota devem corresponder. A licença do código continua pendente de definição. A VPS com Coolify é o destino de hospedagem solicitado, e o responsável já implantou a base. A configuração interna e a implantação de uma revisão posterior precisam de verificação própria.

Commit local e dry-run não confirmam publicação. Build local da imagem também não confirma implantação na VPS.
