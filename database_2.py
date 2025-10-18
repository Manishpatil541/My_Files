import psycopg2
import json
import time
from datetime import datetime, timedelta

#Establishing the connection
conn = psycopg2.connect(database="SEM_Test", user='postgres', password='SEM@123', host='localhost', port= '5432')
#Setting auto commit false
conn.autocommit = True

#Creating a cursor object using the cursor() method
cursor = conn.cursor()

f = open('Modbus.json')
data = json.load(f)
list1=[]
list2=[]
for i in data:
    list1.append(i)
    list2.append(data[i])
#     print(i)
    print("%s:%s" % (i,data[i]))

# Preparing SQL queries to INSERT a record into the database.
"""
cursor.execute('''INSERT INTO sem_controller(Alarm_Option,High_Temp_Alarm_Threshold,Low_Temp_Alarm_Threshold,Alarm_Hystersis,Alarm_Delay,Startup_Alarm_Delay,Dischargr_Air_Sensor_Failure,Sensor_3_Failure,Condensing_Unit_Sensor_Failure,High_Temp_Alarm,Low_Temp_Alarm,External_Alarm,Pressure_Switches_Trip,Door_Open_Status, Condensing_Unit_High_Temp_Alarm,Condensing_Unit_Low_Temp_Alarm,Auxillary_Relay_Action,Auxillary_Relay_Setpoint,Auxillary_Relay_Differential,Auxillary_Relay_Probe_Selection,Auxillary_Relay_Switched_Off_During_Defrost,Defrost_Mode,Defrost_Termination_Setpoint,Defrost_Interval,Max_Defrost_Duration,Defrost_Delay,Drip_Time,Defrost_Delay_After_Fast_Freezing,Fan_Mode,Fan_Delay_After_Defrost,Fan_Temp_Hystersis,Fan_Stop_Temp_Setpoint,Fan_Ontime,fan_offtime,Compressor_Fan_Status_When_Door_Open,Probe_Sensor_Type,Discharge_Air_Temp,Defrost_Temp_Read,Probe_3_Value,Probe_4_Value,DI1_Status,DI2_Status,Defrost_Status,Alarm_Status,Light_Status,Fan_Status,Aux_Relay_Status,Compressor_Status,Buzzer_Status,Device_Override,Defrost_Override,Pulldown_Override,Keyboard_LOCK_OR_UN_LOCK_Status,Mute_Alarm_Override,Light_Override,auxiliary_relay_override,Differential_For_Cut_In,Minimum_Setpoint_Limit,Maximum_Setpoint_Limit,Compressor_Startup_Dalay,Minimum_Compressor_Off_Time,Pulldown_Duration,Pulldown_Setpoint,Failsafe_Compressor_ON_Time,Failsafe_Compressor_OFF_Time,Temp_Measurement_Unit,Active_Setpoint,Control_Setpoint,Modbus_Slave_Address,Controller_Enable,Control_Status,Neutral_Zone_Status,Energy_Saving_Status) VALUES (list2[0],list2[1],list2[2],list2[3],list2[4],list2[5],list2[6],list2[7],list2[8],list2[9],list2[10],list2[11],list2[12],
                list2[13],list2[14],list2[15],list2[16],list2[17],list2[18],list2[19],list2[20],list2[21],list2[22],list2[23],list2[24],list2[24],list2[25],list2[26],list2[27],list2[28],list2[29],list2[30],list2[31],list2[32],list2[33],list2[34],list2[35],list2[36],list2[37],list2[38],list2[39],list2[40],list2[41],list2[42],list2[43],list2[44],list2[45],list2[46],list2[47],list2[48],list2[49],list2[50],list2[51],list2[52],list2[53],list2[54],list2[55],list2[56],list2[57],list2[58],list2[59],list2[60],llist2[61],list2[62],list2[63],list2[64],list2[65],list2[66],list2[67],list2[68],list2[69],list2[70],list2[71],list2[72],list2[73],list2[74])''')

'''

buf = '''INSERT INTO sem_controller (alaram_option,High_Temp_Alarm_Threshold,Low_Temp_Alarm_Threshold,alarm_hysteresis,Alarm_Delay,Startup_Alarm_Delay,discharge_air_sensor_failure,defrost_temp_sensor_failure,Sensor_3_Failure,Condensing_Unit_Sensor_Failure,High_Temp_Alarm,Low_Temp_Alarm,External_Alarm,Pressure_Switches_Trip,Door_Open_Status, Condensing_Unit_High_Temp_Alarm,Condensing_Unit_Low_Temp_Alarm,auxiliary_relay_action,auxiliary_relay_setpoint,auxiliary_relay_differential,auxiliary_relay_probe_selection ,auxiliary_relay_switched_off_during_defrost,defrost_mode,defrost_termination_setpoint,Defrost_Interval,Max_Defrost_Duration,Defrost_Delay,Drip_Time,Defrost_Delay_After_Fast_Freezing,Fan_Mode,Fan_Delay_After_Defrost,Fan_Temp_Hystersis,Fan_Stop_Temp_Setpoint,Fan_Ontime,fan_offtime,Compressor_Fan_Status_When_Door_Open,Probe_Sensor_Type,Discharge_Air_Temp,Defrost_Temp_Read,Probe_3_Value,Probe_4_Value, dl1_status,dl2_status,defrost_status,alarm_status,Light_Status,Fan_Status,Aux_Relay_Status,Compressor_Status,Buzzer_Status,Device_Override,Defrost_Override,Pulldown_Override,keyboard_lock_unlock_status,Mute_Alarm_Override,Light_Override,auxiliary_relay_override,Differential_For_Cut_In,Minimum_Setpoint_Limit,Maximum_Setpoint_Limit,compressor_startup_delay,Minimum_Compressor_Off_Time,Pulldown_Duration,Pulldown_Setpoint,Failsafe_Compressor_ON_Time,Failsafe_Compressor_OFF_Time,Temp_Measurement_Unit,Active_Setpoint,Control_Setpoint,Modbus_Slave_Address,Controller_Enable,controller_status,Neutral_Zone_Status,energy_saving_status,created_on,modified_on)
  VALUES ('true',100,75,56,123,23,'false','true','false','false','false','false','false','false','false','false','false',1,1,67,20,'true','true',100,67,200,34,55,12,2,67,35,111,12,10,2,'true',212,23,100,19,'true','true','true','true','true','true','false','false','false','false','false','false','false','false','false','true',34,-45,-34,125,25,14,-12,67,76,"true",-20,187,213,1,1,'false','false','2022-04-06T07:58:50.297247Z','2022-04-06T07:58:50.297364Z')'''
"""
#cursor.execute('''INSERT INTO sem_controller (alaram_option,High_Temp_Alarm_Threshold,Low_Temp_Alarm_Threshold,alarm_hysteresis,Alarm_Delay,Startup_Alarm_Delay,discharge_air_sensor_failure,defrost_temp_sensor_failure,Sensor_3_Failure,Condensing_Unit_Sensor_Failure,High_Temp_Alarm,Low_Temp_Alarm,External_Alarm,Pressure_Switches_Trip,Door_Open_Status, Condensing_Unit_High_Temp_Alarm,Condensing_Unit_Low_Temp_Alarm,auxiliary_relay_action,auxiliary_relay_setpoint,auxiliary_relay_differential,auxiliary_relay_probe_selection ,auxiliary_relay_switched_off_during_defrost,defrost_mode,defrost_termination_setpoint,Defrost_Interval,Max_Defrost_Duration,Defrost_Delay,Drip_Time,Defrost_Delay_After_Fast_Freezing,Fan_Mode,Fan_Delay_After_Defrost,Fan_Temp_Hystersis,Fan_Stop_Temp_Setpoint,Fan_Ontime,fan_offtime,Compressor_Fan_Status_When_Door_Open,Probe_Sensor_Type,Discharge_Air_Temp,Defrost_Temp_Read,Probe_3_Value,Probe_4_Value, dl1_status,dl2_status,defrost_status,alarm_status,Light_Status,Fan_Status,Aux_Relay_Status,Compressor_Status,Buzzer_Status,Device_Override,Defrost_Override,Pulldown_Override,keyboard_lock_unlock_status,Mute_Alarm_Override,Light_Override,auxiliary_relay_override,Differential_For_Cut_In,Minimum_Setpoint_Limit,Maximum_Setpoint_Limit,compressor_startup_delay,Minimum_Compressor_Off_Time,Pulldown_Duration,Pulldown_Setpoint,Failsafe_Compressor_ON_Time,Failsafe_Compressor_OFF_Time,Temp_Measurement_Unit,Active_Setpoint,Control_Setpoint,Modbus_Slave_Address,Controller_Enable,controller_status,Neutral_Zone_Status,energy_saving_status,created_on,modified_on)
 #  VALUES ('true',100,75,56,123,23,'false','true','false','false','false','false','false','false','false','false','false',1,67,20,2,1,1,100,67,200,34,55,12,2,67,35,111,12,10,2,'true',212,23,100,19,'true','true','true','true','true','false','false','false','false','false','false','false','false','false','false','true',-45,-34,125,25,14,-12,67,76,1,-20,187,213,1,1,1,'false','false','2022-04-06T07:58:50.297247Z','2022-04-06T07:58:50.297364Z')''')

# a='2022-04-06T07:58:50.297247Z'
# b='2022-04-06T07:58:50.297247Z'

"""
buf = '''INSERT INTO sem_controller (alaram_option,High_Temp_Alarm_Threshold,Low_Temp_Alarm_Threshold,alarm_hysteresis,Alarm_Delay,Startup_Alarm_Delay,discharge_air_sensor_failure,defrost_temp_sensor_failure,Sensor_3_Failure,Condensing_Unit_Sensor_Failure,High_Temp_Alarm,Low_Temp_Alarm,External_Alarm,Pressure_Switches_Trip,Door_Open_Status, Condensing_Unit_High_Temp_Alarm,Condensing_Unit_Low_Temp_Alarm,auxiliary_relay_action,auxiliary_relay_setpoint,auxiliary_relay_differential,auxiliary_relay_probe_selection ,auxiliary_relay_switched_off_during_defrost,defrost_mode,defrost_termination_setpoint,Defrost_Interval,Max_Defrost_Duration,Defrost_Delay,Drip_Time,Defrost_Delay_After_Fast_Freezing,Fan_Mode,Fan_Delay_After_Defrost,Fan_Temp_Hystersis,Fan_Stop_Temp_Setpoint,Fan_Ontime,fan_offtime,Compressor_Fan_Status_When_Door_Open,Probe_Sensor_Type,Discharge_Air_Temp,Defrost_Temp_Read,Probe_3_Value,Probe_4_Value, dl1_status,dl2_status,defrost_status,alarm_status,Light_Status,Fan_Status,Aux_Relay_Status,Compressor_Status,Buzzer_Status,Device_Override,Defrost_Override,Pulldown_Override,keyboard_lock_unlock_status,Mute_Alarm_Override,Light_Override,auxiliary_relay_override,Differential_For_Cut_In,Minimum_Setpoint_Limit,Maximum_Setpoint_Limit,compressor_startup_delay,Minimum_Compressor_Off_Time,Pulldown_Duration,Pulldown_Setpoint,Failsafe_Compressor_ON_Time,Failsafe_Compressor_OFF_Time,Temp_Measurement_Unit,Active_Setpoint,Control_Setpoint,Modbus_Slave_Address,Controller_Enable,controller_status,Neutral_Zone_Status,energy_saving_status,created_on,modified_on)
  VALUES (%s,%s,%s,%s,%s,%s,bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),%s,%s,%s,bool(%s),bool(%s),%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,bool(%s),%s,%s,%s,bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),bool(%s),%s,%s,%s,%s,%s,%s,%s,%s,bool(%s),%s,%s,%s,%s,%s,%s,bool(%s),bool(%s),'2022-04-06T07:58:50.297247Z','2022-04-06T07:58:50.297364Z')'''% (list2[0],list2[1],list2[2],list2[3],list2[4],list2[5],list2[6],list2[7],list2[8],list2[9],list2[10],list2[11],list2[12],list2[13],list2[14],list2[15],list2[16],list2[17],list2[18],list2[19],list2[20],list2[21],list2[22],list2[23],list2[24],list2[24],list2[25],list2[26],list2[27],list2[28],list2[29],list2[30],list2[31],list2[32],list2[33],list2[34],list2[35],list2[36],list2[37],list2[38],list2[39],list2[40],list2[41],list2[42],list2[43],list2[44],list2[45],list2[46],list2[47],list2[48],list2[49],list2[50],list2[51],list2[52],list2[53],list2[54],list2[55],list2[56],list2[57],list2[58],list2[59],list2[60],list2[61],list2[62],list2[63],list2[64],list2[65],list2[66],list2[67],list2[68],list2[69],list2[72],a,b)
"""

"""
dt=datetime.datetime.now()
b=dt.strftime("%Y-%m-%d")
c=dt.strftime("%H:%M:%S")
# d=str(b)
# print("b=",dt.strftime("%Y-%m-%dT%H:%M:%S"))
dt1=datetime.datetime.now()
c=dt1.strftime("%Y-%m-%d/%H%M%S")
e=str(c)
# print("c=",dt1.strftime("%Y-%m-%dT%H:%M:%S"))
"""

"""
now = datetime.now()
b= now.strftime("%Y-%m-%d")
now = datetime.now()
c= now.strftime("%H-%M-%S.%f")
d=b+c

d="2022-04-06T07:58:50.297247Z"
e="2022-04-06T07:58:50.297247Z"


now = datetime.now()
e= now.strftime("%Y-%m-%d")
now = datetime.now()
f= now.strftime("%H:%M:%S.%f")
g=e+'T'+f+'Z'
list2[73]=g
"""


#d1 = datetime.datetime.strptime("2013-07-12T07:00:00Z","%Y-%m-%dT%H:%M:%SZ")
#d2 = datetime.datetime.strptime("2013-07-10T11:00:00.000Z","%Y-%m-%dT%H:%M:%S.%fZ")

#'2022-04-06T07:58:50.297247Z'
# print(d)
# d='2022-04-06T'

"""
utc_current_datetime = datetime.now(timezone.utc)
b=utc_current_datetime
c=utc_current_datetime
"""



"""
now = datetime.now()
c=now
d=now
"""
"""
c=time.ctime(time.time())
d=time.ctime(time.time())
"""
print(len(list2))
#print(len(list2))
"""
# Getting the current date and time
dt =datetime.now()
list2[73]=dt
# getting the timestamp
# ts = datetime.timestamp(dt)
# print(ts)
"""
# e= datetime.datetime.now()
# a='false'
# b='false'

# e = datetime.datetime.now()
# f = datetime.datetime.now()
#dt = datetime.now(timezone.utc)


# e=datetime.datetime.utcnow().isoformat() + "Z"
# now = datetime.now()
# e=print (now.strftime("%Y-%m-%d %H:%M:%S"))

# d="2022-04-06T07-58-0.297247"
# e="2022-04-06/07-58-50.297247"


# my_date = datetime.now()
# d=my_date.isoformat()
# e=my_date.isoformat()
j=0

"""
date_str = '2020-04-06'
date_object = datetime.strptime(date_str, '%Y-%m-%d').date()
print(type(date_object))
print(date_object)  # printed in default formatting
"""

#futuredate = datetime.now() 
#day = "TIMESTAMP '2020-04-06 07:58:50.297247'"
#print(day)
#print('TIMESTAMP'+' '+"\'%s\'" %futuredate)

buf = '''INSERT INTO sem_controller(alaram_option,High_Temp_Alarm_Threshold,Low_Temp_Alarm_Threshold,alarm_hysteresis,Alarm_Delay,Startup_Alarm_Delay,discharge_air_sensor_failure,defrost_temp_sensor_failure,Sensor_3_Failure,Condensing_Unit_Sensor_Failure,High_Temp_Alarm,Low_Temp_Alarm,External_Alarm,Pressure_Switches_Trip,Door_Open_Status,Condensing_Unit_High_Temp_Alarm,Condensing_Unit_Low_Temp_Alarm,auxiliary_relay_action,auxiliary_relay_setpoint,auxiliary_relay_differential,auxiliary_relay_probe_selection ,auxiliary_relay_switched_off_during_defrost,defrost_mode,defrost_termination_setpoint,Defrost_Interval,Max_Defrost_Duration,Defrost_Delay,Drip_Time,Defrost_Delay_After_Fast_Freezing,Fan_Mode,Fan_Delay_After_Defrost,Fan_Temp_Hystersis,Fan_Stop_Temp_Setpoint,Fan_Ontime,fan_offtime,Compressor_Fan_Status_When_Door_Open,Probe_Sensor_Type,Discharge_Air_Temp,Defrost_Temp_Read,Probe_3_Value,Probe_4_Value,dl1_status,dl2_status,defrost_status,alarm_status,Light_Status,Fan_Status,Aux_Relay_Status,Compressor_Status,Buzzer_Status,Device_Override,Defrost_Override,Pulldown_Override,keyboard_lock_unlock_status,Mute_Alarm_Override,Light_Override,auxiliary_relay_override,Differential_For_Cut_In,Minimum_Setpoint_Limit,Maximum_Setpoint_Limit,compressor_startup_delay,Minimum_Compressor_Off_Time,Pulldown_Duration,Pulldown_Setpoint,Failsafe_Compressor_ON_Time,Failsafe_Compressor_OFF_Time,Temp_Measurement_Unit,Active_Setpoint,Control_Setpoint,Modbus_Slave_Address,Controller_Enable,controller_status,Neutral_Zone_Status,Energy_Saving_Status,created_on,modified_on)
          VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)''' % (list2[0],list2[1],list2[2],list2[3],list2[4],list2[5],list2[6],list2[7],list2[8],list2[9],list2[10],list2[11],list2[12],list2[13],list2[14],list2[15],list2[16],list2[17],list2[18],list2[19],list2[20],list2[21],list2[22],list2[23],list2[24],list2[25],list2[26],list2[27],list2[28],list2[29],list2[30],list2[31],list2[32],list2[33],list2[34],list2[35],list2[36],list2[37],list2[38],list2[39],list2[40],list2[41],list2[42],list2[43],list2[44],list2[45],list2[46],list2[47],list2[48],list2[49],list2[50],list2[51],list2[52],list2[53],list2[54],list2[55],list2[56],list2[57],list2[58],list2[59],list2[60],list2[61],list2[62],list2[63],list2[64],list2[65],list2[66],list2[67],list2[68],list2[69],list2[70],list2[71],list2[72],list2[73],list2[74],list2[75])
cursor.execute(buf)

# Commit your changes in the database
conn.commit()
print("Records inserted........")
# Closing the connection
conn.close()




                                                                                                                                                                                                                                                                                
