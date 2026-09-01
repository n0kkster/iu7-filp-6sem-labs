% Дано:
%% Три категории продуктов по 4 позиции.
%% В каждом из четырех домов живет человек, который 
%% предпочитает три сервиса - по одному из каждой категории.
%% Необходимо найти в каком доме живет фанат кинопоиска.

right_of(R, L, [L, R | _]).
right_of(R, L, [_ | Rest]) :- right_of(R, L, Rest).

somewhere_left_of(L, R, List) :-
    append(_, [L | Rest], List),
    member(R, Rest).


solve(Houses) :-
    length(Houses, 4),
    Houses = [
        house(C1, Co1, F1, E1),
        house(C2, Co2, F2, E2),
        house(C3, Co3, F3, E3),
        house(C4, Co4, F4, E4)
    ],


    % 1. Крайний справа дом — белый.
    Houses = [_, _, _, house(white, _, _, _)],

    % 2. Зелёный дом стоит сразу справа от синего.
    right_of(house(green, _, _, _), house(blue, _, _, _), Houses),

    % 3. Красный дом не крайний.
    Houses = [House1, _, _, House4],
    House1 = house(Color1, _, _, _), dif(Color1, red),
    House4 = house(Color4, _, _, _), dif(Color4, red),
    member(house(red, _, _, _), Houses),

    % 4. Сосед справа от пользователя приложения Пэй делит покупки — платит через Сплит.
    right_of(house(_, _, split, _), house(_, _, pay_app, _), Houses),

    % 5. Человек, который заработал ... в Игромире и не пропускает ... на Кинопоиске, живёт левее белого дома.
    somewhere_left_of(house(_, kinopoisk, _, igromir), house(white, _, _, _), Houses),

    % 6. Житель с ежедневной чек-серией в Едадиле всегда платит в магазине картой Пэй.
    member(house(_, _, pay_card, edadil), Houses),

    % 7. Тот, кто покупает ... через Афишу, всегда оплачивает их только картой Пэй.
    member(house(_, afisha, pay_card, _), Houses),

    % 8. В первом доме оплачивают покупки через приложение Пэй.
    Houses = [house(_, _, pay_app, _) | _],

    % 9. В синем доме ... включает Мою волну в Яндекс Музыке, а по вечерам в Своих Плюсах...
    member(house(blue, music, _, own_pluses), Houses),

    % 10. Любитель читать в приложении Яндекс Книги, который живёт в красном доме, накопил ... с помощью Сейвов.
    member(house(red, books, saves, _), Houses),

    % 11. У этого же любителя чтения книг оформлена мультиподписка Яндекс Плюс.
    member(house(_, books, _, ya_plus), Houses),

    % 12. Тот, кто копит на поездку в Сейвах и читает в Яндекс Книгах, ещё не играет в Игромире.
    member(house(_, books, saves, Ent12), Houses),
    dif(Ent12, igromir), % Убеждаемся, что его развлечение точно не Игромир

    % 13. Музыкальный фанат первым ловит новые релизы и советует свежие треки друзьям.
    member(house(_, music, _, _), Houses),


    permutation([C1, C2, C3, C4], [blue, green, red, white]),
    permutation([Co1, Co2, Co3, Co4], [music, afisha, kinopoisk, books]),
    permutation([F1, F2, F3, F4], [pay_app, pay_card, split, saves]),
    permutation([E1, E2, E3, E4], [ya_plus, own_pluses, edadil, igromir]).
