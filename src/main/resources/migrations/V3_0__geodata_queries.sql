select _cities.title, _regions.title, _countries.title from _cities
  left join (_regions, _countries) on (_cities.region_id = _regions.id and _cities.country_id = _countries.id);

select * from _cities where region_id = 1053480;
