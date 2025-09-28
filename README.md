# Trilha Acadêmica

Este projeto é um **sistema em Prolog** que recomenda uma trilha acadêmica (ex.: **Full Stack, Hardware, Segurança da Informação, Ciência de Dados, Redes**) baseando-se nas afinidades do usuário.

O sistema faz perguntas simples (respostas `s` ou `n`) e, a partir das respostas, calcula qual trilha mais se adequa ao perfil.


## Como Funciona

1. O sistema carrega a base de conhecimento (`base_conhecimento.pl`).
2. Faz perguntas ao usuário (`s` para sim, `n` para não).
3. Armazena as respostas.
4. Calcula a pontuação de cada trilha somando os pesos das características positivas (`s`).
5. Exibe as recomendações em ordem decrescente de pontos.

## Como Executar

Você pode rodar o sistema de duas formas:

### 1. Via **SWI-Prolog** (localmente)

1. Instale o SWI-Prolog.
2. Abra o terminal na pasta do projeto.
3. Execute:

   ```bash
   swipl sistema.pl
   ```
4. No interpretador, digite:

   ```prolog
   ?- iniciar.
   ```

### 2. Via **SWISH** (online, sem instalar nada)

* Acesse [SWISH](https://swish.swi-prolog.org/).
* Copie e cole o conteúdo dos arquivos `sistema.pl` e `base_conhecimento.pl`.
* Rode a consulta:

  ```prolog
  ?- iniciar.
  ```



## 🧪 Testando com Perfis Prontos

Para testar sem responder interativamente, basta carregar um perfil antes de calcular as recomendações:

Exemplo:

```prolog
?- consult(base_conhecimento).
?- consult(perfil_1).
?- calcula_recomendacoes.
```

Isso simula um usuário que respondeu:

* Gosta de lógica (`s`).
* Não gosta de conserto de máquinas (`n`).
* Gosta de matemática (`s`).
* Não gosta de design (`n`).
* Não gosta de atendimento (`n`).

Resultado esperado: maior afinidade com **Ciência de Dados** e **Segurança da Informação**.




