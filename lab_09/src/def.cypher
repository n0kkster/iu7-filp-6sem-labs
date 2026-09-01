match (n) detach delete n;

create 
    (ivan:Person {name: 'ivan', gender: 'male'}),
    (maria:Person {name: 'maria', gender: 'female'}),
    (anna:Person {name: 'anna', gender: 'female'}),
    (boris:Person {name: 'boris', gender: 'male'}),

    (petr:Person {name: 'petr', gender: 'male'}),
    (olga:Person {name: 'olga', gender: 'female'}),
    (dmitry:Person {name: 'dmitry', gender: 'male'}),
    (elena:Person {name: 'elena', gender: 'female'}),
    (maksim:Person {name: 'maksim', gender: 'male'}), 

    (kirill:Person {name: 'kirill', gender: 'male'}),
    (svetlana:Person {name: 'svetlana', gender: 'female'}),

    (ivan)-[:married_to]->(maria),
    (petr)-[:married_to]->(olga),
    (dmitry)-[:married_to]->(anna),
    (boris)-[:married_to]->(elena),

    (ivan)-[:parent_of]->(anna), 
    (ivan)-[:parent_of]->(boris),
    (maria)-[:parent_of]->(anna), 
    (maria)-[:parent_of]->(boris),

    (petr)-[:parent_of]->(dmitry), 
    (petr)-[:parent_of]->(elena), 
    (petr)-[:parent_of]->(maksim),
    (olga)-[:parent_of]->(dmitry), 
    (olga)-[:parent_of]->(elena), 
    (olga)-[:parent_of]->(maksim),

    (dmitry)-[:parent_of]->(kirill), 
    (anna)-[:parent_of]->(kirill),

    (boris)-[:parent_of]->(svetlana), 
    (elena)-[:parent_of]->(svetlana);

match (wife:Person {name: 'anna'})<-[:married_to]-(husband:Person)<-[:parent_of]-(parent:Person)-[:parent_of]->(dever:Person {gender: 'male'})
where husband <> dever
return distinct dever.name as Dever

match (wife:Person {name: 'anna'})<-[:married_to]-(husband:Person)<-[:parent_of]-(parent:Person)-[:parent_of]->(zolovka:Person {gender: 'female'})
where wife <> zolovka
return distinct zolovka.name as Zolovka

match (husband:Person {name: 'boris'})-[:married_to]->(wife:Person)<-[:parent_of]-(tyosha:Person {gender: 'female'})
return tyosha.name as Tyosha