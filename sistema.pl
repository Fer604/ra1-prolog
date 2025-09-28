:- consult(base_conhecimento).

:- dynamic resposta/2.

% Ponto de entrada
iniciar :-
    writeln('=== Sistema Especialista: Trilha Acadêmica ==='),
    retractall(resposta(_, _)), % limpa respostas antigas
    faz_perguntas,
    calcula_recomendacoes,
    halt. % encerra o programa (útil no Swish pode ser comentado)

% Faz perguntas interativas
faz_perguntas :-
    pergunta(Id, Texto, _),
    format("~w (s/n): ", [Texto]),
    read(Resp),
    assertz(resposta(Id, Resp)),
    fail.
faz_perguntas.

% Calcula pontuação para cada trilha
calcula_recomendacoes :-
    findall((Trilha, Pontuacao), calcula_pontuacao(Trilha, Pontuacao), Lista),
    sort(2, @>=, Lista, Ordenada), % ordena por pontuação decrescente
    exibe_resultado(Ordenada).

% Calcula a pontuação de uma trilha
calcula_pontuacao(Trilha, Pontuacao) :-
    trilha(Trilha, _),
    findall(Peso, (
        resposta(Id, s),
        pergunta(Id, _, Caracteristica),
        perfil(Trilha, Caracteristica, Peso)
    ), Pesos),
    sum_list(Pesos, Pontuacao).


% Exibe resultado
exibe_resultado([]) :- !, writeln('Nenhuma trilha recomendada.').

exibe_resultado(Resultados) :-
    Resultados \= [],
    writeln('\n=== Recomendações de Trilhas ==='),
    forall(member((Trilha, Pont), Resultados),
        (trilha(Trilha, Desc),
         format("~w (~w pontos): ~w~n", [Trilha, Pont, Desc]))).
