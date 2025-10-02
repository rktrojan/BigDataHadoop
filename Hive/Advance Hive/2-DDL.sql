-- Create the Titanic table to store passenger data
-- Each column represents an attribute from the Titanic dataset
-- The table is delimited by commas and expects a header row in the data file
create table titanic (Survived  string, Pclass string, 
Name string, Sex string, Age string, SiblingsSpousesAboard string, ParentsChildrenAboard string, Fare string) row format delimited 
fields terminated by ',' 
table properties("header"=true);

-- Create the Pokemon table to store Pokemon attributes
-- Each column represents a feature of a Pokemon
-- The table is delimited by commas
create table pokemon (
ID string, Name string, Type1 string, Type2 string, Total string, HP string, Attack string, Defense string, SpAtk string, SpDef string, Speed string, Stage string, Legendary string
)  row format delimited 
fields terminated by ',' ;


