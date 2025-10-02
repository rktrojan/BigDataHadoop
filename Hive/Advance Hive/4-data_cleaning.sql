-- Create a cleaned version of the pokemon table with transformed and standardized columns
create table pokemon_clean1 as 
select 
	-- Extract month from the date column
month(date) as mnt,
	-- Extract year from the date column
year(date) as yr
	-- Remove leading/trailing spaces from name and type1
,trim(name)     
,trim(type1)    
	-- Clean type2: replace empty/blank with 'missing', 'Flying' with 'Fly', else keep original
,case 
when type2='' or type2=' ' then "missing"
when type2='Flying' then "Fly"

else type2 
end 
as type2,    
	-- Select numeric/stat columns as-is
total    
,hp       
,attack    
,defense   
,spatk     
,spdef     
,speed     
,stage     
	-- Convert legendary boolean: FALSE to 1, else 0
,case 
when legendary=FALSE then 1
else 0 
 end 
 as legendary
 
 from pokemon;
 
 
 
 