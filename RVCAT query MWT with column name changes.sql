
/*mtr.op file for EchoNet2Fish*/   
SELECT 
        year "Year", lake "Lake", vessel "Vessel", cruise "Cruise", op.op_id "Op_Id", op.port "Port", port_name "Port_Name", transect "Transect", target "Target", 
        tr_design "Tr_Design", type_set "Type_Set", serial "Serial", fishing_depth "Fishing_Depth", fishing_temp "Fishing_Temp", beg_depth "Beg_Depth", 
        end_depth "End_Depth", distance "Disance", tow_time "Tow_Time", beg_latitude_dd "Latitude", beg_longitude_dd "Longitude"
FROM    rvcat.op, rvcat.tr_op t, rvcat.op_target g, rvcat.port p
WHERE   op.op_id=t.op_id and op.op_id=g.op_id(+)and op.port=p.port and lake = 3 and sample_type = 1 and vessel in (88,35) and target in (119, 210) and year = 2021;
      
/*Huron.mtr.catch file for EchoNet2Fish*/

SELECT
         v.year "Year", v.lake "Lake", v.vessel "Vessel", v.cruise "Cruise", v.op_id "Op_Id", op_date "Op_Date",  c.N, v.serial "Serial", v.sample_Type "Sample_Type", 
         c.species "Species", c.weight "Weight", c.life_Stage "Life_Stage"
FROM     rvcat.op_view v join rvcat.tr_catch c on v.op_id = c.op_id
WHERE    v.lake = 3 and v.sample_type = 1 and v.vessel IN (88, 35) and v.cruise in (2,6) and v.year = 2021;

/*Huron.mtr.tr_lf file for EchoNet2Fish*/
SELECT 
        v.op_id "Op_Id", v.year "Year", v.lake "Lake", v.vessel "Vessel", v.cruise "Cruise", v.port "Port", v.OP_DATE "Op_Date", v.transect "Transect", v.serial "Serial",
        v.sample_type "Sample_Type", lf.species "Species", lf.length "Length", lf.N "N", lf.life_stage "Life_Stage"
FROM    rvcat.op_view v JOIN rvcat.tr_lf lf on v.OP_ID = lf.OP_ID
WHERE   v.year = 2021 and v.lake = 3  and v.vessel in( 35, 88) and v.cruise in (2,6);
