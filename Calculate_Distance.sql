
set @varLat_Center='_lat1' ;
set @varLong_Center='_Lon1' ; 



set @varLat_Branches='_Lat2'  ;
set @varLong_Branches='_Lon2'; 


select 
   @varLat_Center 	as Center_lat
	,@varLong_Center as Center_long
	,@varLat_Branches 	as Branch_lat
	,@varLong_Branches as Branch_long
	,(
		6371 * acos(
								cos(radians(@varLat_Branches)) * 
								cos(radians(@varLat_Center)) * 
								cos(radians(@varLong_Branches) - radians(@varLong_Center)) + 
								sin(radians(@varLat_Branches)) * 
								sin(radians(@varLat_Center))
								)
		) as distance_KM,
		
				
		111.111 *
			DEGREES(ACOS(LEAST(1.0, COS(RADIANS(@varLat_Branches))
					 * COS(RADIANS(@varLat_Center))
					 * COS(RADIANS(@varLong_Branches - @varLong_Center))
					 + SIN(RADIANS(@varLat_Branches))
					 * SIN(RADIANS(@varLat_Center))))) AS distance_in_km;
				
-- 				---------------------------------------------------------------------------------------
           -- Returns distance in meters.

				  select ST_Distance_Sphere(
								point(@varLong_Branches, @varLat_Branches),
								point( @varLong_Center, @varLat_Center)) distance_meter;
								
								

