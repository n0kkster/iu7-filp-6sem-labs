contact(ivanov, '111-11-11', address(moscow, lenina, 10, 5)).
contact(ivanov, '222-22-22', address(moscow, lenina, 10, 5)).

contact(ivanov, '333-33-33', address(kazan, pushkina, 15, 42)).

contact(petrov, '444-44-44', address(moscow, tverskaya, 1, 12)).
contact(petrov, '444-44-45', address(moscow, tverskaya, 1, 12)).

contact(sidorov, '555-55-55', address(spb, nevsky, 100, 1)).


car(ivanov, bmw, black, 50000, 'A111AA177').
car(ivanov, bmw, black, 100000, 'A001MP97').
car(ivanov, lada, white, 5000, 'B222BB97').

car(petrov, bmw, black, 55000, 'X999XX77').
car(petrov, porsche, gray, 55000, 'E999KX97').

car(sidorov, audi, red, 40000, 'O000OO78').
car(sidorov, audi, blue, 40000, 'O001OO78').
car(sidorov, bmw, black, 400000, 'O777OO178').


search(LastName, Phone, City, Street, House, Flat, Brand, Color, Price, RegNum) :-
    car(LastName, Brand, Color, Price, RegNum),
    contact(LastName, Phone, address(City, Street, House, Flat)).
