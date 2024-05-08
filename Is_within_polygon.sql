
-- -------------------------------------------------------------------------------------------------
set  @polygon= 'POLYGON((
41.05116390424234 28.915080809455258,
41.047163277193505 28.919898471614978,
41.04338014759552 28.917047570411846,
41.044659359638004 28.909144439228484,
41.049340519361074 28.910317278331036,
41.05116390424234 28.915080809455258
))';
-- select @polygon;
set @latitude= 41.0475  ;
set @longitude= 28.9125; 


-- ----------------------------------------------------------------------------------------
SELECT @latitude, @longitude
, ST_Within(ST_GEOMFROMTEXT(CONCAT('POINT(',CAST(@longitude AS DECIMAL(10, 8)),' ',CAST(@latitude AS DECIMAL(10, 8)),')')), ST_GEOMFROMTEXT(@polygon)) is_located ;

-- ----------------------------------------------------------------------------------------
SELECT @latitude, @longitude
, ST_Within(ST_GEOMFROMTEXT(CONCAT('POINT(',@longitude,' ',@latitude ,')')), ST_GEOMFROMTEXT(@polygon)) is_located ;


-- ----------------------------------------------------------------------------------------
 SELECT @latitude, @longitude
,ST_Contains(ST_GEOMFROMTEXT(CONCAT('POINT(',@longitude,' ',@latitude ,')')), ST_GEOMFROMTEXT(@polygon)) is_located ;

