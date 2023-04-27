create or replace view city_info
as select _cities.title as city, _regions.title as region, _countries.title as country from _cities
  left join (_regions, _countries) on (_cities.region_id = _regions.id and _cities.country_id = _countries.id);

create or replace view moscow_region
as select * from _cities where region_id = 1053480;
