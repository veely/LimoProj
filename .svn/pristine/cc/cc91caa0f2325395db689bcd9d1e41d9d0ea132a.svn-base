-- Eunhye Chae
create or replace PROCEDURE BOOK_LIMOUSINE
(
	 pClient_phone_number IN  VARCHAR2,
	 pVin IN VARCHAR2, 
	 pPickup_date IN DATE, 
	 pDropoff_date IN DATE, 
	 pBooking_id OUT NUMBER
)
IS
BEGIN
  SELECT servicebooking_sequence.NEXTVAL
  INTO pBooking_id 
  FROM dual; -- creates a virtual table with only one row, therefore it can insert one by one sequence
 
  INSERT INTO service_booking (booking_id, client_phone_number, vin, pickup_date, dropoff_date) 
  VALUES (pBooking_id, pClient_phone_number, pVin, pPickup_date, pDropoff_date);
END;
/

--Vincent Ly
create or replace PROCEDURE DELETE_LIMOUSINE
(
  vin_param IN VARCHAR2,
  success_status OUT NUMBER
)
IS
  booking_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO booking_count FROM service_booking WHERE vin = vin_param;
  IF booking_count = 0 THEN
    DELETE FROM limousine WHERE vin = vin_param;
    success_status := 1;
  ELSE
    success_status := 0;
  END IF;
END;
/

--jeha kwon
create or replace PROCEDURE SAVE_CLIENT
(
	phoneNumber IN VARCHAR2,	
	firstName IN VARCHAR2,
	lastName IN VARCHAR2
)
IS
  number_of_clients INTEGER;
BEGIN
	SELECT COUNT(*) INTO number_of_clients FROM limo_client WHERE phone_number = phoneNumber;
	IF number_of_clients = 0 THEN
		INSERT INTO limo_client (phone_number, first_name, last_name) VALUES (phoneNumber,firstName,lastName);
	ELSE
    UPDATE limo_client SET first_name = firstName, last_name = lastName WHERE phone_number = phoneNumber;
	END IF;
END;
/