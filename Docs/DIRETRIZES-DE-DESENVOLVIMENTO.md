# Diretrizes de desenvolvimento baseadas no curso.dev

## Origem e alcance

O responsável definiu como máxima seguir as práticas de código e desenvolvimento ensinadas por Filipe Deschamps. Este documento traduz o material de estudo em diretrizes para o site da Con Affetto e para sua evolução.

A análise de 20/10/2026 cobriu os 50 arquivos da pasta `Aprendizado subjetivo`: o agente principal leu o índice e 29 notas temáticas; o Luna leu integralmente as outras 20. A primeira seleção de oito notas, feita pelos títulos, foi ampliada após a solicitação do responsável. A classificação abaixo considera o conteúdo de todas as 49 notas temáticas.

As notas são sínteses comentadas de estudo, com referências às aulas. O índice informa que elas foram elaboradas sobre transcrições automáticas revisadas, sem nova conferência integral dos áudios. Este guia contém uma interpretação aplicada dessas sínteses. Uma regra específica do curso deve ser conferida na aula correspondente antes de ser atribuída literalmente ao professor. Não houve leitura integral das transcrições nesta etapa.

Seguir essas práticas exige compreender finalidade, contexto e consequências. Linguagem, framework, licença, estrutura de pastas e mecanismos usados no TabNews precisam de uma justificativa própria para entrar neste projeto.

## 1. Começar pelo problema e pelo resultado esperado

- Definir quem usará a entrega, o que essa pessoa precisa conseguir fazer e quais condições permitem considerá-la concluída.
- Escrever a ligação entre problema e solução antes de acrescentar funcionalidades. Tornar ambiguidades materiais explícitas.
- Verificar tanto a viabilidade técnica quanto a utilidade para o negócio. Uma página entregue por HTTP ainda precisa permitir ao visitante compreender a marca e encontrar os produtos.
- Separar requisitos essenciais de ideias para outro ciclo. Manter visível o que ainda não foi atendido.

## 2. Escolher tecnologia pelo contexto

- Entender o problema e o mecanismo que uma ferramenta resolve. Considerar manutenção, equipe, operação, restrições e custo de reversão.
- Distinguir preferência pessoal de requisito funcional. Explicar a vantagem concreta procurada e o custo acrescentado.
- Separar valor didático de adequação para produção. Implementar algo à mão pode ensinar; operar para usuários exige avaliar também experiência acumulada e consequências da falha.
- Tomar uma decisão quando houver informação suficiente para o próximo passo. Reavaliar se o requisito, a restrição ou a evidência mudar.

## 3. Buscar simplicidade com modificabilidade

- Pedir uma necessidade presente para cada camada, abstração, serviço ou dependência. Manter as proteções necessárias ao comportamento e aos dados.
- Organizar por responsabilidades que facilitem alterações reais. Ler o fluxo como entrada, decisões, efeitos e saída; localizar onde o trabalho do produto se mistura com seu suporte.
- Avaliar quem conseguirá compreender, operar e modificar a solução. Um desenho sofisticado que concentra conhecimento pode dificultar a continuidade do projeto.
- Dimensionar pastas, tarefas, campos e processos pelo benefício de encontrá-los, mantê-los e usá-los.

## 4. Crescer em etapas observáveis

- Dividir o trabalho até existir uma próxima entrega pequena que possa ser examinada e verificada.
- Buscar retorno cedo e usar o que for aprendido para decidir a próxima alteração. Uma sugestão não vira obrigação automaticamente.
- Tratar o plano como hipótese e explicar revisões por descobertas, dependências e mudanças reais de escopo.
- Definir o suficiente para entregar. Evitar refinamento interminável quando as condições essenciais já estiverem atendidas.

## 5. Tornar o código legível e consistente

- Usar nomes e limites que expressem responsabilidade. Conseguir explicar o papel do trecho, além de reconhecer sua sintaxe.
- Combinar convenções cedo e automatizar as regras que tiverem critério claro. Uma configuração pessoal de editor não garante o estado compartilhado do código.
- Preservar a atenção da revisão para comportamento e consequências. Separar uma reformatação ampla de uma mudança funcional quando isso facilitar a análise.
- Antes de desviar de uma convenção, identificar a expectativa que ela protege e registrar benefício e efeitos da exceção.

## 6. Adotar e manter dependências conscientemente

- Conferir funcionamento relevante, condições de uso, licença e obrigações de distribuição. Separar termos documentados de rumores ou preferências.
- Considerar o custo para quem vai usar e manter o projeto. Uma dependência conhecida também precisa ser compreendida.
- Fazer manutenção em conjuntos controlados. Examinar compatibilidade antes de atualizar e preservar contexto suficiente para relacionar mudança e efeito.
- Interpretar alertas pelo componente atingido e por onde ele é executado. A existência de uma nova versão, sozinha, não decide uma atualização.

## 7. Verificar comportamentos conforme o risco

- Escolher a verificação pelo comportamento que precisa permanecer correto, pela consequência da falha e pelo custo de sustentar a checagem.
- Exercitar a fronteira relevante. Partes aprovadas isoladamente podem falhar na integração que o usuário precisa.
- Registrar comportamentos importantes em testes quando a repetição da conferência manual se tornar frágil ou cara. Não usar quantidade de testes como evidência de cobertura do uso.
- Em uma correção, distinguir regressão de mudança deliberada de contrato. Entender a falha antes de alterar a expectativa para obter aprovação.
- Conferir o instrumento: em ambiente apropriado, verificar que a checagem reprova a condição que deveria detectar.

## 8. Investigar e medir antes de concluir

- Separar observações, hipóteses e lacunas. Escolher a próxima ação pela informação que ela pode produzir.
- Definir o efeito desejado e uma referência comparável antes de declarar uma melhoria. Avaliar também confiabilidade e custo de manutenção.
- Usar logs, requisições e relatos de uso para confrontar a hipótese. Um painel de status é uma evidência a conferir com o comportamento observado.
- Compartilhar constatações para que a próxima investigação aproveite o trabalho anterior.

## 9. Proteger estado e tornar a recuperação compreensível

- Experimentar onde alcance e recuperação sejam conhecidos. Documentar o necessário para recriar o ambiente.
- Dimensionar as proteções pelo risco. Em operações relevantes, avaliar barreiras do próprio fluxo em vez de depender só de lembrar uma advertência.
- Conceder acesso e expor dados conforme a necessidade concreta da ação e do recurso. Dados internos não se tornam públicos apenas por estarem disponíveis.
- Antes de desfazer uma mudança, considerar dados e dependências criados desde sua aplicação. Comparar retorno e correção adiante pelas consequências reais.
- Transformar procedimentos importantes em passos explícitos e rastreáveis. Conferir o resultado mesmo quando a execução for automatizada.

## 10. Usar Git e documentação para comunicar intenção

- Dar a cada commit um objetivo coerente, com as partes necessárias para compreender, aplicar ou desfazer a mudança juntas.
- Escrever a mensagem para quem não participou da conversa. Registrar efeito, motivo e contexto material.
- Documentar problema, decisão, dependências e critério de conclusão. Corrigir anotações ambíguas antes de tratá-las como instruções de execução.
- Manter mudanças e entregas em recortes compreensíveis. Colaboração frequente pode exigir integrar mais cedo; CI e um fluxo complexo de branches dependem da necessidade presente.
- Avaliar ferramentas de organização e rituais pela clareza, coordenação e entrega que produzem.

## 11. Acompanhar a entrega até o uso

- Distinguir trabalho iniciado, código escrito, verificação local, publicação e resultado observado pelo usuário.
- Conhecer o caminho que leva a versão ao ambiente real e os sinais que permitem perceber uma falha.
- Considerar dependências de infraestrutura e meios de recuperação compatíveis com a operação. Confrontar promessas e painéis com evidência do serviço.
- Respeitar limites de acesso e responsabilidades ao investigar ou operar um ambiente compartilhado.

## 12. Preservar participação, explicação e revisão

- Explicar finalidade, alternativa relevante e custo de uma decisão na profundidade que a dúvida exige. Usar um exemplo pequeno quando ele permitir compreender o mecanismo.
- Deixar o responsável examinar, experimentar e questionar propostas recuperáveis. Ajustar a liberdade de experimentação às consequências da ação.
- Ouvir quem usa o produto: esforço de navegação e dificuldade para encontrar informação podem ficar invisíveis para quem construiu a página.
- Tratar revisão como investigação da proposta. Identificar a preocupação concreta e sustentar mudanças com evidência.
- Declarar o que foi demonstrado e o que ainda falta conhecer. Ao compartilhar o projeto, oferecer contexto e reconhecer contribuições, preservando os limites de privacidade.

## Aplicação nesta primeira versão

A base HTML/CSS é a primeira proposta local para apresentação e cardápio. O conteúdo está no HTML; a aparência, no CSS. Os critérios dessa proposta e a localização das alterações estão em `02-tecnologias-e-codigo.md`.

Os nomes vêm da planilha indicada pelo responsável, com duplicatas conciliadas e Doce Maria excluído. A planilha e o banco do caixa permanecem fora do repositório e da raiz pública. A documentação distingue leitura dos fontes, resposta HTTP e revisão visual e comercial ainda pendente.

`.editorconfig` registra a convenção inicial. O mecanismo compartilhado de formatação ainda será definido na etapa de ferramentas; a referência específica é a aula `Dia 10/Configurar o Prettier`. Não há uma garantia de estilo automatizada apenas por esse arquivo existir.

Os tópicos de dados, autorização, suites de teste, integração de colaboradores e produção entram conforme o comportamento e a etapa exigirem. Este guia não cria essas funcionalidades ou infraestrutura antecipadamente.

## Cobertura das notas e classificação

**Agora** significa aplicação no desenvolvimento, no acompanhamento ou no conteúdo desta fase. **Condicional** identifica uma situação futura específica. **Pessoal** significa que a nota não forneceu uma regra técnica direta para a fase; seu valor humano permanece fora da seleção de regras de código.

| Nota temática, sem a extensão `.md` | Leitura | Aplicação principal |
| --- | --- | --- |
| Aprender a acompanhar a entrega até o uso em produção | Principal | Condicional: publicação e operação. |
| Aprender a ensinar e ajustar a profundidade da explicação | Principal | Agora: explicar escolhas ao responsável. |
| Assumir responsabilidade sem ultrapassar a própria capacidade | Luna | Pessoal: alcance e compromissos. |
| Avaliar as consequências antes de desfazer uma mudança | Principal | Condicional: retorno sobre estado já utilizado. |
| Buscar simplicidade sem cair em overengineering ou underengineering | Principal | Agora: complexidade proporcional. |
| Compreender fundamentos e história para avaliar novidades | Luna | Agora: compreender ferramentas antes da adoção. |
| Conhecer uma convenção antes de aceitar um desvio deliberado | Principal | Agora: explicitar o motivo de exceções. |
| Considerar obrigações e confiança ao adotar dependências | Principal | Agora: condições de uso e licenças. |
| Construir confiança experimentando em condições seguras | Luna | Agora: alterações locais recuperáveis. |
| Criar proteções que não dependam apenas da disciplina individual | Principal | Agora: separar arquivos públicos e dados privados. |
| Definir o suficiente para entregar e aprender com o uso | Principal | Agora: critérios da primeira entrega. |
| Demonstrar capacidade de aprender e reconhecer o que ainda falta | Luna | Agora: demonstrar verificações e limites. |
| Desenvolver de forma orgânica e buscar retorno cedo | Principal | Agora: primeira proposta revisável. |
| Dimensionar a organização pelo benefício que ela produz | Principal | Agora: documentação e estrutura úteis. |
| Dimensionar o tratamento de falhas pelo impacto e pelo valor entregue | Principal | Agora: proteção conforme a consequência. |
| Enfrentar o desconhecido sem confundir a capacidade atual com um limite definitivo | Luna | Pessoal: relação com dificuldades de aprendizado. |
| Entender as duas muralhas de tecnologia e negócio | Luna | Agora: relacionar funcionamento e utilidade do cardápio. |
| Escolher testes pelo risco e pelo comportamento que importa | Principal | Agora: checagens nas fronteiras relevantes. |
| Escrever a ideia para descobrir qual problema ela resolve | Luna | Agora: explicitar problema e intenção. |
| Extrair conhecimento coletivo e registrar contexto suficiente | Principal | Agora: registrar decisões e resolver ambiguidades. |
| Fazer manutenção contínua com mudanças controladas | Principal | Condicional: alterações de dependências. |
| Integrar o trabalho com frequência para reduzir a distância entre pessoas | Luna | Condicional: colaboração e entregas frequentes. |
| Investigar problemas sem inventar monstros no desconhecido | Principal | Condicional: diagnóstico de falhas. |
| Julgar metodologias pelo trabalho e pelo valor que ajudam a produzir | Luna | Agora: evitar processos sem benefício concreto. |
| Ler código pelas funções e responsabilidades que ele cumpre | Principal | Agora: mapa compreensível dos arquivos. |
| Limitar acessos e exposição de dados ao que é necessário | Principal | Agora: seleção editorial e raiz pública. |
| Manter um ritmo sustentável de aprendizado | Luna | Pessoal: continuidade do estudo. |
| Medir resultados antes de declarar uma melhoria | Principal | Agora: evidência alinhada ao efeito declarado. |
| Orientar sem eliminar toda oportunidade de experimentar | Luna | Agora: participação do responsável no código. |
| Padronizar para reduzir ruído e preservar atenção | Principal | Agora: convenções e futura automação de estilo. |
| Participar de uma comunidade com abertura e reciprocidade | Luna | Condicional: compartilhamento e contribuições. |
| Preparar um ambiente que permita experimentar e se recuperar | Principal | Agora: prévia simples e reproduzível. |
| Preparar-se para falhas e verificar os sinais de saúde | Principal | Condicional: hospedagem e dependências externas. |
| Projetar interfaces para que as pessoas consigam avançar | Principal | Agora: navegação, leitura e acessibilidade. |
| Quebrar projetos grandes e abandonar o tudo ou nada | Luna | Agora: recortes verificáveis de trabalho. |
| Reconhecer valor sem depender apenas do julgamento alheio | Luna | Pessoal: interpretação do julgamento. |
| Respeitar o tempo e ouvir a experiência de quem usa o produto | Luna | Agora: observar esforço de consulta do cardápio. |
| Revisar planos conforme o contato com a realidade | Luna | Agora: registrar revisões justificadas. |
| Separar função de preferência pessoal nas discussões técnicas | Principal | Agora: discutir ferramentas por requisitos. |
| Separar o exercício de aprender da escolha para operar um produto | Principal | Agora: distinguir estudo e operação. |
| Tomar decisões pelo contexto e sair da paralisia por análise | Luna | Agora: escolher pelo requisito atual. |
| Tornar o progresso visível sem confundir marcação com entrega | Luna | Agora: distinguir implementação e verificação. |
| Trabalhar com revisão e feedback sem proteger o próprio ego | Luna | Agora: manter propostas revisáveis. |
| Transformar experiências difíceis em aprendizado | Luna | Pessoal: interpretação de experiências. |
| Transformar procedimentos em processos reproduzíveis e rastreáveis | Principal | Agora: comandos e decisões reproduzíveis. |
| Tratar a modificabilidade como um objetivo do software | Principal | Agora: continuidade por quem mantém. |
| Usar o histórico de mudanças como comunicação para outras pessoas | Principal | Agora: commits e contexto. |
| Usar testes para conseguir mudar o sistema com confiança | Principal | Condicional: regressões de comportamentos em evolução. |
| Verificar se os testes e as medições detectam falhas | Principal | Condicional: validar a capacidade da checagem. |

O resultado é 35 notas com aplicação imediata, nove condicionais e cinco principalmente pessoais nesta fase. Parte importante da contribuição do Luna veio de títulos inicialmente menos evidentes: fundamentos, relação entre tecnologia e negócio, participação no aprendizado e progresso verificável.

## Fontes e consulta pontual às aulas

Diretório local das notas:

```text
/home/luiz-avcruz/Misc/Obsidian Vaults/Luiz-AVcruz/Programação/Estudos/Cursos/curso.dev/Aprendizado subjetivo/
```

O índice é `Aprendizado subjetivo.md`. Cada nome da tabela corresponde a um arquivo nesse diretório. As seções “Fontes” das notas identificam as aulas usadas na síntese.

Transcrições de referência:

```text
/home/luiz-avcruz/Misc/Obsidian Vaults/Luiz-AVcruz/Programação/Estudos/Cursos/curso.dev/Transcrição/
```

Quando houver dúvida concreta, selecionar a aula apontada na nota e consultar o trecho pertinente. Exemplos: configurar o formatador, separar responsabilidades ou definir uma verificação de integração. Registrar a decisão e sua aplicação em `05-decisoes-e-andamento.md`.

Os caminhos do vault são referências locais de estudo. Este documento preserva as diretrizes necessárias para acompanhar o projeto mesmo sem o vault junto do clone.
