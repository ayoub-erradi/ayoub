library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rsa is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        message_in : in integer;  
        public_key_e : in integer; 
        private_key_d : in integer; 
        modulus_n : in integer; 
        encrypted_out : out integer; 
        decrypted_out : out integer  
    );
end rsa;

architecture Behavioral of rsa is

    signal temp_encrypted : integer := 0;
    signal temp_decrypted : integer := 0;

    function mod_exp(base : integer; exp : integer; mod : integer) return integer is
        variable result : integer := 1;
        variable b : integer := base;
        variable e : integer := exp;
    begin
        while e > 0 loop
            if (e mod 2) = 1 then
                result := (result * b) mod mod;
            end if;
            e := e / 2;
            b := (b * b) mod mod;
        end loop;
        return result;
    end function;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            temp_encrypted <= 0;
            temp_decrypted <= 0;
        elsif rising_edge(clk) the
            temp_encrypted <= mod_exp(message_in, public_key_e, modulus_n);

            temp_decrypted <= mod_exp(temp_encrypted, private_key_d, modulus_n);
        end if;
    end process;

    encrypted_out <= temp_encrypted;
    decrypted_out <= temp_decrypted;

end Behavioral;
