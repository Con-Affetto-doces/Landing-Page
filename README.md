# Site da Con Affetto

Apresentação da marca e cardápio de biscoitos artesanais e pipocas gourmet. Este é um projeto próprio, separado do aplicativo Caixa da Feira.

A implementação atual é uma página estática em português do Brasil. O conteúdo fica em HTML e o visual em CSS, com os logotipos e as fontes da identidade existente. Essa base ainda não exige instalação de pacotes nem compilação.

O site passou a ter SSR como requisito, sem banco de dados nesta etapa. A comparação de frontend, as responsabilidades e os critérios da migração estão em [Arquitetura e renderização](Docs/06-arquitetura-e-renderizacao.md). O código ainda não foi migrado.

## Abrir a base atual localmente

Na raiz deste repositório, com Python 3 instalado:

```bash
python3 -m http.server 4173 --bind 127.0.0.1 --directory public
```

Abra `http://127.0.0.1:4173`. O terminal precisa continuar aberto; `Ctrl+C` encerra a prévia. Python serve apenas os arquivos da base estática durante o desenvolvimento; essa prévia não implementa SSR. A versão planejada precisará de hospedagem capaz de executar a renderização no servidor.

## Entender e alterar o projeto

- [Escopo e origem do cardápio](Docs/01-projeto-e-cardapio.md): o que entra nesta versão e de onde vêm os produtos.
- [Tecnologias e código](Docs/02-tecnologias-e-codigo.md): como a página funciona e onde fazer cada alteração.
- [Identidade visual](Docs/03-identidade-visual.md): cores, fontes, arquivos e decisões de aplicação da marca.
- [Desenvolvimento, validação e Git](Docs/04-desenvolvimento-e-git.md): prévia, conferência, commits e futura publicação.
- [Decisões e andamento](Docs/05-decisoes-e-andamento.md): etapas realizadas, evidência e pendências.
- [Arquitetura e renderização](Docs/06-arquitetura-e-renderizacao.md): requisito de SSR, opções de frontend e proposta de evolução.
- [Diretrizes de desenvolvimento](Docs/DIRETRIZES-DE-DESENVOLVIMENTO.md): princípios e critérios para decisões técnicas, código, validação e manutenção.

Para mudar um produto, edite a lista correspondente em `public/index.html`. Para mudar espaçamento, tipografia ou cores, edite `public/styles.css`. A documentação acompanha as mudanças de comportamento e estrutura.

A base HTML/CSS é a primeira proposta local. As próximas decisões de tecnologia e código seguem o contexto do site e as diretrizes de desenvolvimento, com critérios explicados ao responsável antes de incorporar complexidade.

## Estado

Versão inicial em desenvolvimento local. O cardápio usa a planilha de receitas atuais indicada pelo responsável pela marca, excluindo Doce Maria. Preços ainda não foram definidos para exibição. A conferência visual pelo responsável e a publicação no GitHub e na hospedagem pertencem às próximas etapas.

O repositório inclui somente os arquivos necessários ao site e à sua documentação. A planilha, o banco do caixa e os documentos completos da identidade permanecem nos seus locais de origem. As fontes distribuídas com o site conservam suas licenças OFL em `public/assets/fontes/`. A licença do código e a visibilidade do futuro repositório no GitHub ainda precisam ser definidas.
