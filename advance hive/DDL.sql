create table titanic (Survived  string, Pclass string, 
Name string, Sex string, Age string, SiblingsSpousesAboard string, ParentsChildrenAboard string, Fare string) row format delimited 
fields terminated by ',' 
table properties("header"=true);

create table pokemon (
ID string, Name string, Type1 string, Type2 string, Total string, HP string, Attack string, Defense string, SpAtk string, SpDef string, Speed string, Stage string, Legendary string
)  row format delimited 
fields terminated by ',' ;
