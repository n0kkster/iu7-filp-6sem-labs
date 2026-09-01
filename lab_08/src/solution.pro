total_price(Name, TotalPrice) :-  
    property_price(Name, auto, AutoPrice), !,
    property_price(Name, structure, StructPrice), !,
    property_price(Name, land, LandPrice), !,
    property_price(Name, vessel, VesselPrice), !,
    is(TotalPrice, +(+(AutoPrice, StructPrice), +(LandPrice, VesselPrice))).

property_price(Name, Kind, Cost) :- asset(Name, Kind, _, Cost, _).
property_price(_, _, 0). 


asset(smirnov, auto, mercedes, 5000000, auto_info(silver, k777kk77)).
asset(smirnov, structure, cottage, 15000000, struct_info(residential, 120)).
asset(smirnov, land, garden, 3000000, land_info(6)).
asset(smirnov, vessel, yacht, 12000000, vessel_info(18, luxury)).

asset(kuznetsov, auto, tesla, 8000000, auto_info(white, a001aa99)).
asset(kuznetsov, land, ranch, 20000000, land_info(50)).

asset(popova, structure, penthouse, 45000000, struct_info(residential, 200)).
asset(popova, auto, mini_cooper, 2500000, auto_info(red, x555xx199)).

asset(sokolov, vessel, motorboat, 1500000, vessel_info(4, fishing)).


contact(smirnov, 89110000001, address(spb, nevsky, 15, 4)).
contact(smirnov, 89110000002, address(sochi, morskaya, 3, 10)).
contact(kuznetsov, 89220000003, address(ekaterinburg, lenina, 50, 1)).
contact(popova, 89330000004, address(novosibirsk, krasny, 12, 88)).
contact(sokolov, 89440000005, address(rostov, sadovaya, 7, 21)).


account(smirnov, tinkoff, 101, 2500000).
account(smirnov, raiffeisen, 102, 1000000).
account(kuznetsov, gazprombank, 201, 5500000).
account(popova, alfa, 301, 15000000).
account(sokolov, tinkoff, 401, 300000).
