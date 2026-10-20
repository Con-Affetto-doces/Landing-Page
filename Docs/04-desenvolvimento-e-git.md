# Desenvolvimento, validação e Git

## Fluxo de trabalho

Cada etapa começa por uma necessidade observável: conteúdo a acrescentar, problema de leitura, comportamento ou requisito novo. Antes de adotar uma tecnologia, registrar o que ela resolve e o custo de mantê-la. Depois da alteração, conferir o resultado, atualizar a documentação afetada e criar um commit coerente.

O arquivo HTML entregue ao visitante é o próprio fonte da página. Não existe uma pasta de compilação para regenerar. Atualizar o navegador depois de salvar é suficiente; se o navegador conservar uma versão antiga do CSS, faça um recarregamento completo.

## Prévia local

Na raiz do projeto:

```bash
python3 -m http.server 4173 --bind 127.0.0.1 --directory public
```

Acesse `http://127.0.0.1:4173`. O bind em `127.0.0.1` limita esta prévia ao próprio computador. Para encerrar, use `Ctrl+C` no terminal que iniciou o comando. Se a porta já estiver ocupada, escolha outra e use o endereço correspondente; não encerre o serviço existente.

Servir `public/` mantém a documentação e os demais arquivos do repositório fora da raiz HTTP. O servidor Python é somente a ferramenta local, não uma proposta de servidor de produção.

## O que verificar

Para esta página estática, a verificação proporcional cobre os produtos escolhidos, as referências do HTML/CSS, a integridade dos arquivos da marca e a resposta HTTP. Não há regra financeira, persistência ou aplicação JavaScript a testar.

Antes de considerar o visual aprovado, abrir a página em computador e celular ou em uma janela estreita e conferir:

1. Navegação até cardápio e história; títulos e produtos completos.
2. Leitura sem rolagem horizontal, sobreposição ou texto cortado.
3. Uso de `Tab`: o atalho para o conteúdo e os links têm foco visível.
4. Ampliação do texto e uso da página sem JavaScript.
5. Aparência das fontes, proporções do logotipo e contraste.
6. Correspondência comercial dos nomes e variantes com os produtos atuais.

A resposta HTTP `200` confirma que o servidor entregou o recurso. A conferência de links confirma referências locais. Nenhuma das duas substitui a aprovação visual e comercial do responsável. Os resultados efetivamente obtidos ficam em [Decisões e andamento](05-decisoes-e-andamento.md).

## Histórico local

O repositório é independente do `Sistema-Con-Affetto`. A branch inicial é `main`. O Git guarda fontes, recursos necessários à página, licenças das fontes e documentação.

Antes de uma alteração:

```bash
git status --short
git diff
```

Depois da conferência, selecionar os arquivos da etapa, examinar o índice e registrar:

```bash
git add public/index.html public/styles.css Docs/
git diff --cached
git status --short
git commit -m "feat: atualiza cardapio da Con Affetto"
```

Os caminhos são exemplos de seleção; inclua apenas os arquivos realmente alterados pela etapa. Uma alteração posterior ao `git add` não entra no commit anterior à seleção. Confira o estado final e o histórico:

```bash
git status --short --branch
git log --oneline -5
```

Para recuperar um arquivo, primeiro consulte a versão desejada com `git show COMMIT:caminho/do/arquivo`. Preserve qualquer trabalho ainda não registrado antes de uma restauração. O retorno de uma publicação, quando existir, também precisará atualizar o que a hospedagem entrega.

## O que fica fora do histórico

A planilha de receitas, o banco do caixa, dados de atendimento, backups e documentos completos de criação da marca. O `.gitignore` previne inclusões comuns; ele não remove arquivos já rastreados. Confira a seleção antes de cada commit.

O repositório contém somente cópias dos logotipos usados e fontes com suas licenças. Não há sincronização automática com o cadastro do caixa ou com a planilha.

## GitHub e hospedagem

Git registra a história local. GitHub hospeda uma cópia do repositório. Hospedagem do site entrega os arquivos de `public/` aos visitantes. São três estados distintos.

A instrução inicial deixa GitHub para depois. Antes dessa etapa, definir o nome e a visibilidade do repositório, a licença do código e conferir o material que será enviado. A organização do projeto do caixa é uma referência possível, não um remoto já configurado para este site.

Depois de um push real, confirmar o hash da branch no remoto com `git ls-remote --heads origin refs/heads/main`. Um commit local ou `git push --dry-run` não confirma publicação.

A hospedagem será escolhida quando o conteúdo e a apresentação estiverem revisados. O formato estático permite publicar o diretório `public/` em uma hospedagem que o suporte. Não há domínio ou provedor assumido, nem integração externa ativada nesta fase.
