# Site da Con Affetto

Apresentação da Con Affetto, cardápio e contato para encomendas. Biscoitos decorados e artesanais são a especialidade da marca; doces variados são uma oferta complementar. Projeto independente do aplicativo Caixa da Feira, em português do Brasil.

A versão local usa Astro, TypeScript e CSS próprio. O servidor Node gera o HTML por requisição, incluindo os produtos; a leitura e a navegação do cardápio funcionam sem JavaScript no navegador. Os logotipos e as fontes da identidade existente ficam no projeto. O cardápio é mantido em arquivo versionado, sem banco de dados.

## Instalar e abrir localmente

Use Node.js compatível com `package.json` (mínimo 22.22.0) e npm (mínimo 9.6.5). A imagem Docker usa Node 24.22.0 LTS. A validação no host também foi realizada com Node 26.12.0 e npm 12.2.1.

Na raiz do repositório:

```bash
npm ci
npm run dev
```

Acesse `http://127.0.0.1:4173`. O servidor de desenvolvimento acompanha as alterações nos fontes. `Ctrl+C` encerra o processo. Se a porta estiver ocupada, use `npm run dev -- --port 4174`; preserve o serviço existente.

Para abrir no celular, conecte-o à mesma rede local e inicie a prévia no endereço de rede do computador. Confira esse endereço com `ip -brief address`. Por exemplo, se a interface ligada ao roteador tiver o IP `192.168.1.10`:

```bash
npm run dev -- --host 192.168.1.10
```

Nesse caso, use `http://192.168.1.10:4173` tanto no computador quanto no celular. Substitua o IP do exemplo pelo endereço atual da máquina. `127.0.0.1` aponta para o próprio aparelho que faz o acesso. Essa prévia é diferente da publicação no Coolify; o procedimento e o controle do processo estão em [Desenvolvimento e validação](Docs/04-desenvolvimento-e-git.md).

## Conferir a versão de produção

```bash
npm run build
HOST=127.0.0.1 PORT=4173 npm start
```

O build executa a verificação de tipos e gera `dist/`. O segundo comando serve essa versão compilada em `http://127.0.0.1:4173`. Encerre a prévia que você iniciou antes de reutilizar sua porta, ou escolha outra. `npm run check` permite conferir os tipos sem compilar.

## Docker e Coolify

O repositório contém um Dockerfile de produção, com Node LTS, usuário sem privilégios de root, porta interna `4321` e healthcheck. Build, teste local e parâmetros de publicação estão em [Docker e Coolify](Docs/07-docker-e-coolify.md). O teste local da imagem não constitui publicação na VPS.

## Entender e alterar o projeto

- [Escopo e origem do cardápio](Docs/01-projeto-e-cardapio.md): produtos confirmados e limites das informações públicas.
- [Tecnologias e código](Docs/02-tecnologias-e-codigo.md): fluxo da requisição, estrutura e alterações frequentes.
- [Identidade visual](Docs/03-identidade-visual.md): cores, fontes e aplicação da marca.
- [Desenvolvimento, validação e Git](Docs/04-desenvolvimento-e-git.md): comandos, conferências e recuperação.
- [Decisões e andamento](Docs/05-decisoes-e-andamento.md): decisões, resultados e pendências.
- [Arquitetura e renderização](Docs/06-arquitetura-e-renderizacao.md): escolha do frontend e demonstração de SSR.
- [Docker e Coolify](Docs/07-docker-e-coolify.md): imagem, operação local e configuração de publicação.
- [Diretrizes de desenvolvimento](Docs/DIRETRIZES-DE-DESENVOLVIMENTO.md): critérios para decisões, código, validação e manutenção.
- [Diretrizes de design e UX](Docs/DIRETRIZES-DE-DESIGN-E-UX.md): tarefa, composição, conteúdo, acessibilidade e avaliação da experiência.

Para mudar um produto, edite `src/data/cardapio.ts`. Os contatos públicos ficam em `src/data/contato.ts`; WhatsApp e Instagram são links comuns, sem feed incorporado ou recebimento de pedidos dentro do site. Para mudar o visual, edite `src/styles/global.css`. Os textos de apresentação, história e contato estão em `src/pages/index.astro`. A documentação acompanha as mudanças de comportamento e estrutura.

## Estado

A base está publicada na branch `main` de [Con-Affetto-doces/Landing-Page](https://github.com/Con-Affetto-doces/Landing-Page) e o responsável implantou o site em `https://conaffetto.com.br` pelo Coolify. Acesso HTTPS e CSS da versão anterior foram conferidos.

A revisão iniciada em 21/10/2026 reúne o refinamento visual, o cardápio comercial confirmado e os contatos para encomendas. O feedback mais recente remove a moldura e o afastamento externos: cabeçalho, fundo rosé e rodapé ocupam a largura inteira da tela. O conteúdo mantém até 1664 pixels e espaçamento interno, com tratamento próprio a partir de 1600 pixels: abertura maior e três colunas de sabores de biscoitos. Permanecem painéis creme e cabeçalho e rodapé escuros com o logotipo inverso original. História e encomendas compartilham um painel alinhado ao cardápio. As regras de empilhamento, o conteúdo e a ordem das seções foram preservados. O mock está identificado e os contatos públicos foram confirmados. O acesso pelo celular foi confirmado após uma liberação temporária e restrita no firewall; a aparência sem moldura externa ainda depende de avaliação em tela. O responsável autorizou o versionamento e o envio desta etapa para `main` em 22/10/2026. O resultado da implantação no Coolify é verificado separadamente do push.

A planilha, o banco do caixa e os documentos completos da marca permanecem fora do repositório. Os recursos públicos usados e as licenças OFL das fontes ficam em `public/assets/`. A licença do código ainda precisa ser definida; as licenças das fontes e os direitos sobre a identidade permanecem descritos em [Identidade visual](Docs/03-identidade-visual.md).
