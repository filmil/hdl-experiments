-- ex3

--! @entity thermostat
--! @brief A simple thermostat entity.
entity thermostat is
    port (
        --! @in desired_temp : integer
        --! @brief The desired temperature.
        desired_temp,
        --! @in actual_temp : integer
        --! @brief The actual temperature.
        actual_temp: in integer;
        --! @out heater_on : boolean
        --! @brief Indicates if the heater is on.
        heater_on: out boolean
    );
end entity thermostat;

--! @architecture example of thermostat
--! @brief An example architecture for the thermostat entity.
architecture example of thermostat is

    -- The hysteresis temperature
    --! @constant diff_temp
    --! @brief The temperature difference for hysteresis.
    constant diff_temp: integer := 2;
    
begin
    --! @process controller
    --! @brief Controls the heater based on desired and actual temperatures.
    --! @sensitivity desired_temp, actual_temp
    controller: process(desired_temp, actual_temp)
    begin
        if actual_temp < desired_temp - diff_temp then
            heater_on <= true;
        elsif actual_temp > desired_temp + diff_temp then
            heater_on <= false;
        end if;
    end process controller;
    
end architecture example;
