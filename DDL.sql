CREATE TABLE people (
  p_id int (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  p_name varchar(14),
  p_surname varchar(14),
  personal_number varchar(11),
  date_of_birth date,
  country_of_birth varchar(2),
  city varchar(15),
  postal_code varchar(20),
  street_and_house_number varchar(30),
  phone varchar(9),
  sex varchar(7) 
  );

CREATE TABLE doctors (
  p_id int(11),
  licence_number varchar(7) NOT NULL PRIMARY KEY,
  specialty varchar(50),
  date_of_employment date
  );

CREATE TABLE patients (
  p_id int(11),
  patient_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_of_registration date
  );

CREATE TABLE support_staff (
  p_id int(11),
  support_staff_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  profession varchar(15),
  date_of_employment date
  );

CREATE TABLE medicines (
  medicine_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  appointment_id int(11),
  medicine_name varchar(100),
  dosage varchar(40),
  other_comments varchar(150)
  );
  
CREATE TABLE prescription (
  medicine_id int(11),
  name_of_clinic varchar(60),
  nfz_ward varchar(60),
  quantity varchar(60),
  refund varchar(10)
  );
  
CREATE TABLE examination_result (
  examination_result_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  appointment_id int(11),
  icd10 varchar(30),
  symptoms varchar(150),
  medical_examination_referral varchar(150)
  );
  
CREATE TABLE result_from_referral (
  internal_result_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id int(11),
  referral_date date,
  icd10 varchar(30),
  substantiation varchar(150),
  name_of_health_clinic varchar(60),
  gp_data varchar(45),
  gp_licence_number varchar(7)
  );
  
CREATE TABLE referral_to_test (
  examination_result_id int(11),
  referral_id int(11) AUTO_INCREMENT PRIMARY KEY,
  substantiation varchar(150),
  attention varchar(15)
  );
  
CREATE TABLE appointments (
  appointment_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  licence_number varchar(7),
  patient_id int(11),
  appointment_date date,
  general_description varchar(150),
  referral_to_tests varchar(150),
  results_id int(11)
  );

CREATE TABLE muscle_reflexes (
  appointment_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  two_headed_reflex varchar(20),
  adductor_muscles_reflex varchar(20),
  knee_reflex varchar(20),
  brachioradialis_reflex varchar(20),
  jaw_reflex varchar(20),
  ankle_reflex varchar(20)
  );
  
CREATE TABLE results (
  results_id int(11) AUTO_INCREMENT PRIMARY KEY,
  referral_id int(11),
  examination_date date,
  profession varchar(15),
  staff_data varchar(30),
  staff_licence_number varchar(7),
  examination_description varchar(150),
  attachment varchar(45)
  );
  

#-----------------------------------------------

CREATE TABLE  icd10 (
icd10_code varchar(6) NOT NULL PRIMARY KEY,
problem_or_disease varchar(185)
);

CREATE TABLE sex (
sex varchar(9) NOT NULL PRIMARY KEY
);

CREATE TABLE profession_table (
profession varchar(15) NOT NULL PRIMARY KEY
);

CREATE TABLE country_of_birth (
country_code varchar(2) NOT NULL PRIMARY KEY,
country_name varchar(100)
); 

CREATE TABLE specialty_table (
specialty varchar(30) NOT NULL PRIMARY KEY
);

CREATE TABLE attention_table (
attention varchar(8) PRIMARY KEY
);

#---------------------------

alter table people add constraint people_fk1 foreign key (sex) references sex(sex);
alter table people add constraint people_fk2 foreign key (country_of_birth) references country_of_birth(country_code);

alter table doctors add constraint doctors_fk1 foreign key (p_id) references people(p_id);
alter table doctors add constraint doctors_fk2 foreign key (specialty) references specialty_table(specialty);

alter table patients add constraint patients foreign key (p_id) references people(p_id);

alter table support_staff add constraint support_staff_fk1 foreign key (p_id) references people(p_id);
alter table support_staff add constraint support_staff_fk2 foreign key (profession) references profession_table(profession);

alter table result_from_referral add constraint result_from_referral_fk1 foreign key (patient_id) references patients(patient_id);
alter table result_from_referral add constraint result_from_referral_fk2 foreign key (icd10) references icd10(icd10_code);

alter table appointments add constraint appointments_fk1 foreign key (licence_number) references doctors(licence_number);
alter table appointments add constraint appointments_fk2 foreign key (results_id) references examination_result(examination_result_id);
alter table appointments add constraint appointments_fk3 foreign key (patient_id) references patients(patient_id);

alter table examination_result add constraint examination_result_fk1 foreign key (appointment_id) references appointments(appointment_id);
alter table examination_result add constraint examination_result_fk2 foreign key (icd10) references icd10(icd10_code);

alter table referral_to_test add constraint referral_to_test_fk1 foreign key (examination_result_id) references examination_result(examination_result_id);
alter table referral_to_test add constraint referral_to_test_fk2 foreign key (attention) references attention_table(attention);


alter table results add constraint results_fk1 foreign key (referral_id) references referral_to_test(referral_id);
alter table results add constraint results_fk2 foreign key (profession) references profession_table(profession);

alter table medicines add constraint medicines_fk foreign key (appointment_id) references appointments(appointment_id);

alter table prescription add constraint prescription_fk foreign key (medicine_id) references medicines(medicine_id);

alter table muscle_reflexes add constraint muscle_reflexes_fk foreign key (appointment_id) references appointments(appointment_id);