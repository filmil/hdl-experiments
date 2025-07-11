-- ex3

entity thermostat is
    port (
        desired_temp, actual_temp: in integer;
        heater_on: out boolean
    );
end entity thermostat;

architecture example of thermostat is

    -- The hysteresis temperature
    constant diff_temp: integer := 2;
    
begin
    controller: process(desired_temp, actual_temp)
    begin
        if actual_temp < desired_temp - diff_temp then
            heater_on <= true;
        elsif actual_temp > desired_temp + diff_temp then
            heater_on <= false;
        end if;
    end process controller;
    
end architecture example;
