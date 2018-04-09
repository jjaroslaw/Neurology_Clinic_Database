delimiter $$
create procedure insert_appointment_with_muscle_reflexes(
  appointment_id int(11),
  licence_number varchar(7),
  patient_id int(11),
  appointment_date date,
  general_description varchar(150),
  refferal_to_tests varchar(150),
  results_id int(11),
  two_headed_reflex varchar(20),
  adductor_muscles_reflex varchar(20),
  knee_reflex varchar(20),
  brachioradialis_reflex varchar(20),
  jaw_reflex varchar(20),
  ankle_reflex varchar(20))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Appointment with muscle reflex examination insertion error.';
end;
    start transaction;
    insert into appointments values(appointment_id, licence_number, patient_id, appointment_date, general_description, refferal_to_tests, results_id);
    insert into muscle_reflexes values(LAST_INSERT_ID(), two_headed_reflex, adductor_muscles_reflex, knee_reflex, brachioradialis_reflex, jaw_reflex, ankle_reflex);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_doctor(
  p_id int(11),
  p_name varchar(14),
  p_surname varchar(14),
  personal_number varchar(11),
  date_of_birth date,
  country_of_birth varchar(2),
  city varchar(15),
  postal_code varchar(20),
  street_and_house_number varchar(30),
  phone varchar(9),
  sex varchar(7),
  licence_number varchar(7),
  specialty varchar(50),
  date_of_employment date)
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Doctor insertion error.';
end;
    start transaction;
    insert into people values(p_id, p_name, p_surname, personal_number, date_of_birth, country_of_birth, city, postal_code, street_and_house_number, phone, sex);
    insert into doctors values(LAST_INSERT_ID(), licence_number, specialty, date_of_employment);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_patient(
  p_id int(11),
  p_name varchar(14),
  p_surname varchar(14),
  personal_number varchar(11),
  date_of_birth date,
  country_of_birth varchar(2),
  city varchar(15),
  postal_code varchar(20),
  street_and_house_number varchar(30),
  phone varchar(9),
  sex varchar(7),
  patient_id int(11),
  date_of_registration date)
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Patient insertion error.';
end;
    start transaction;
    insert into people values(p_id, p_name, p_surname, personal_number, date_of_birth, country_of_birth, city, postal_code, street_and_house_number, phone, sex);
    insert into patients values(LAST_INSERT_ID(), patient_id, date_of_registration);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_support_staff(
  p_id int(11),
  p_name varchar(14),
  p_surname varchar(14),
  personal_number varchar(11),
  date_of_birth date,
  country_of_birth varchar(2),
  city varchar(15),
  postal_code varchar(20),
  street_and_house_number varchar(30),
  phone varchar(9),
  sex varchar(7),
  support_staff_id int(11),
  profession varchar(15),
  date_of_employment date)
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Support staff insertion error.';
end;
    start transaction;
    insert into people values(p_id, p_name, p_surname, personal_number, date_of_birth, country_of_birth, city, postal_code, street_and_house_number, phone, sex);
    insert into support_staff values(LAST_INSERT_ID(), support_staff_id, profession, date_of_employment);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_result_from_referral(
  internal_result_id int(11),
  patient_id int(11),
  referral_date date,
  icd10 varchar(30),
  substantiation varchar(150),
  name_of_health_clinic varchar(60),
  gp_data varchar(45),
  gp_licence_number varchar(7))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Result from referral insertion error.';
end;
    start transaction;
    insert into result_from_referral values(internal_result_id, patient_id, referral_date, icd10, substantiation, name_of_health_clinic, gp_data, gp_licence_number);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_examination_result_with_referral_to_test(
  examination_result_id int(11),
  appointment_id int(11),
  icd10 varchar(30),
  symptoms varchar(150),
  medical_examination_referral varchar(150),
  referral_id int(11),
  substantiation varchar(150),
  attention varchar(15))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Examination result with referral to test insertion error.';
end;
    start transaction;
    insert into examination_result values(examination_result_id, appointment_id, icd10, symptoms, medical_examination_referral);
    insert into referral_to_test values(LAST_INSERT_ID(), referral_id, substantiation, attention);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_appointment(
  appointment_id int(11),
  licence_number varchar(7),
  patient_id int(11),
  appointment_date date,
  general_description varchar(150),
  referral_to_tests varchar(150),
  results_id int(11))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Appointment insertion error.';
end;
    start transaction;
    insert into appointments values(appointment_id, licence_number, patient_id, appointment_date, general_description, referral_to_tests, results_id);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_results(
  results_id int(11),
  referral_id int(11),
  examination_date date,
  profession varchar(20),
  staff_data varchar(30),
  staff_licence_number varchar(7),
  examination_description varchar(150),
  attachment varchar(45))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Results insertion problem.';
end;
    start transaction;
    insert into results values(results_id, referral_id, examination_date, profession, staff_data, staff_licence_number, examination_description, attachment);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_no_prescription_medicine(
  medicine_id int(11),
  appointment_id int(11),
  medicine_name varchar(100),
  dosage varchar(40),
  other_comments varchar(150))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'No prescription medicine insertion error.';
end;
    start transaction;
    insert into medicines values(medicine_id, appointment_id, medicine_name, dosage, other_comments);
    commit;
    end $$ 
delimiter ;

delimiter $$
create procedure insert_prescription_medicine(
  medicine_id int(11),
  appointment_id int(11),
  medicine_name varchar(100),
  dosage varchar(40),
  other_comments varchar(150),
  name_of_clinic varchar(60),
  nfz_ward varchar(60),
  quantity varchar(60),
  refund varchar(10))
  begin
  declare exit handler for sqlexception 
  begin
  rollback;
  select 'Prescription medicine insertion error.';
end;
    start transaction;
    insert into medicines values(medicine_id, appointment_id, medicine_name, dosage, other_comments);
    insert into prescription values(LAST_INSERT_ID(), quantity, refund, name_of_clinic, nfz_ward);
    commit;
    end $$ 
delimiter ;