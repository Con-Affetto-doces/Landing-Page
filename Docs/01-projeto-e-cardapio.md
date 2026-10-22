# Projeto e cardápio

## Objetivo confirmado

Apresentar a marca Con Affetto, permitir que o visitante consulte seus produtos em computador ou celular e oferecer contato para encomendas. O responsável definiu inicialmente apresentação e cardápio e forneceu WhatsApp e Instagram para esta revisão.

O site usa SSR em Astro e Node, sem banco de dados. A implementação e a comprovação da renderização estão em [Arquitetura e renderização](06-arquitetura-e-renderizacao.md). A imagem e os parâmetros de publicação na VPS com Coolify estão em [Docker e Coolify](07-docker-e-coolify.md).

Os biscoitos são o carro-chefe, principalmente os decorados e também os tradicionais. Doces variados são uma oferta complementar; as pipocas fazem parte dela, sem definir o posicionamento da marca. Essa prioridade foi confirmada pelo responsável em 21/10/2026.

O caminho principal é reconhecer a especialidade da marca, acessar os sabores dos biscoitos e, quando houver interesse, conversar sobre uma encomenda. Doces e origem familiar complementam a apresentação. A navegação interna usa âncoras; WhatsApp e Instagram abrem os respectivos destinos externos.

O site não recebe nem confirma pedidos em seu próprio sistema. O contato para encomendas acontece pelo WhatsApp. Carrinho, pagamentos, cadastro de clientes e integração com o caixa continuam fora do escopo. Os preços ficam ausentes até uma definição do responsável.

## Contatos públicos confirmados

O responsável forneceu o Instagram e confirmou a correção do WhatsApp em 21/10/2026:

- WhatsApp: **+55 47 99911-7567**; destino `https://wa.me/5547999117567`.
- Instagram: **@conaffetto66**; destino `https://www.instagram.com/conaffetto66/`.

`src/data/contato.ts` centraliza esses dados. A URL do WhatsApp é derivada do número formatado, retirando a pontuação. Os links não enviam mensagem automaticamente, não confirmam pedido e não acrescentam promessa de prazo, entrega ou disponibilidade. O site não incorpora feed nem solicita acesso às contas.

Referência técnica: [formato de conversa por link, na central oficial do WhatsApp](https://faq.whatsapp.com/5913398998672934).

## Fontes

A fonte principal dos produtos é `Rotulagem Nutricional biscoitos - receitas atuais.ods`, em `/home/luiz-avcruz/Documents/Orgs/Con affetto/`, indicada pelo responsável em 20/10/2026. A leitura usa o XML interno do ODS, incluindo títulos dentro de cada aba. O arquivo não é modificado nem copiado para o repositório.

SHA-256 da planilha consultada:

```text
eba3f5de9846771b0a6903cbe27cc5813807e4e63fe7a4242a26761e2510eddf
```

O cadastro do Caixa da Feira foi consultado em modo somente leitura como referência secundária. Ele inclui outros artigos e nomes diferentes dos rótulos; por isso não foi importado como cardápio atual. Nenhuma leitura de vendas, clientes ou pagamentos é necessária ao site.

A história da marca e o slogan vêm do manual visual e dos logotipos fornecidos. A procedência está em [Identidade visual](03-identidade-visual.md).

## Correspondência dos produtos

As células abaixo identificam a primeira ocorrência do título, antes das repetições das etiquetas de impressão.

| Nome no cardápio | Origem no ODS | Tratamento |
| --- | --- | --- |
| Baunilha | `Biscoito de baunilha!A3`; `Canela e baunilha!A86` | Uma entrada para o mesmo produto. |
| Canela | `Canela 2!A3`; `Canela e baunilha!A2` | Uma entrada para o mesmo produto. |
| Chocolate | `Chocolate!A3` | Biscoito de chocolate. |
| Dedinho | `Dedinho!A3` | Fora do cardápio atual por confirmação de 21/10/2026. |
| Especiarias com glacê | `Especiarias Glace!A3` | Nome apresentado por extenso. |
| Limão | `Especiarias Glace!A25` | Etiqueta antiga; fora do cardápio atual por confirmação de 21/10/2026. |
| Melado | `Melado!A3`; `Melado com especiarias!A3` | Uma entrada: o responsável confirmou que é o mesmo produto. |
| Melado com chocolate | `Melado com chocolate!A3` | Nome do rótulo, sem desdobrar variantes do cadastro do caixa. |
| Pipoca gourmet de leite Ninho | `Pipoca Ninho!A3` | Categoria pipocas gourmet. |
| Pipoca gourmet de chocolate | `Pipoca Chocolate!A3` | Categoria pipocas gourmet. |

`Doce-Maria!A3` foi excluído por instrução expressa do responsável: o produto não é da Con Affetto.

A aba `Melado com especiarias!A3` usa o título “BISCOITO MELADO”. O responsável confirmou em 20/10/2026 que as duas abas representam o mesmo produto. O cardápio usa uma única entrada “Melado”.

A leitura de 21/10/2026 confirmou o mesmo SHA-256 registrado anteriormente: o arquivo indicado contém títulos de etiquetas antigas, sem marcar disponibilidade. A interpretação inicial transformou esses títulos em oferta ativa. Após a correção do responsável, Limão e Dedinho foram retirados. O catálogo desta proposta contém seis biscoitos — Baunilha, Canela, Chocolate, Especiarias com glacê, Melado e Melado com chocolate — e as duas pipocas. Um novo título na planilha exige confirmação editorial antes de entrar no site.

## Limites das informações apresentadas

O ODS reúne etiquetas de momentos diferentes. A aba `Melado com especiarias`, por exemplo, contém um texto de ingredientes que menciona limão. Essa divergência não deve ser resolvida por inferência nem transformada em composição pública.

A primeira versão apresenta nomes e categorias. Não transcreve tabelas nutricionais, alergênicos, validade, datas de lote ou pesos. A eventual inclusão desses dados requer confirmar os rótulos aplicáveis aos produtos em venda. Não houve auditoria nutricional ou alteração de receitas.

Não há fotos próprias atuais selecionadas. O responsável autorizou usar mock em 21/10/2026. A imagem de abertura foi gerada como ilustração e aparece com a legenda “Imagem ilustrativa”; ela não comprova formato, decoração ou composição dos produtos reais. A troca por fotografias confirmadas permanece prevista. Os mockups do manual continuam sendo referências de identidade, sem representar produtos atuais.

## Critérios de entrega desta versão

- Página local com a identidade existente, apresentação e cardápio dos produtos confirmados.
- HTML gerado no servidor por requisição, conforme o requisito de SSR; implementação e verificação local registradas em [Decisões e andamento](05-decisoes-e-andamento.md).
- Cardápio legível em tela estreita, com navegação por teclado e conteúdo disponível sem JavaScript.
- Acesso ao contato de encomendas e ao Instagram confirmado, com destinos consistentes em todos os pontos da página.
- Arquivos e fontes locais, sem dependência do aplicativo do caixa ou de serviços de terceiros para carregar o conteúdo.
- Documentação de código, decisões, manutenção e validação junto dos fontes.
- Histórico Git local com mudanças coerentes e sem os dados operacionais do comércio.

A aprovação visual e comercial do responsável deve preceder a divulgação. A publicação no GitHub e a hospedagem terão resultado registrado separadamente.
