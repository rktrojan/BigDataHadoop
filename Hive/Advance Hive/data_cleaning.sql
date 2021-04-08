create table pokemon_clean1 as 
select 
month(date) as mnt,
year(date) as yr
,trim(name)     
,trim(type1)    
,case 
when type2='' or type2=' ' then "missing"
when type2='Flying' then "Fly"

else type2 
end 
as type2,    
total    
,hp       
,attack    
,defense   
,spatk     
,spdef     
,speed     
,stage     
,case 
when legendary=FALSE then 1
else 0 
 end 
 as legendary
 
 from pokemon;
 
 
 
 