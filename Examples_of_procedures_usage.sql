call insert_patient(NULL,'Ewa','Adams','90110310908','1990-11-03','PL','Lodz','91-150 Lodz','Konstytucyjna 120','608934008','female',NULL,'2016-04-09');
call insert_patient(NULL,'Robert','Lewis','84121013749','1984-12-10','IT','Warsaw','00-001 Warsaw','Wilcza 123/12','723998063','male',NULL,'2017-04-23');

call insert_doctor(NULL,'Michal','Peterson','84092411985','1984-09-14','IE','Dublin','Dublin 1','Abbey St 15','678090223','male','1205249', 'Neuropathologist','2013-05-15');
call insert_doctor(NULL,'Joanna','Parker','66051013335','1966-05-10','PL','Lodz','90-056 Lodz','Politechniki 45','678090223','female','6487572', 'Neurosurgeon','2013-05-25');

call insert_support_staff(NULL,'Lia','Clark','90101711575','1990-10-17','MT','Warsaw','93-006 Lodz','Olimpijska 33/10','606507170','female',NULL, 'Nurse','2015-04-01');
call insert_support_staff(NULL,'Daniel','Mak','91111311095','1991-11-13','PL','Lodz','62-800 Lodz','Tatrzanska 24','660500340','male',NULL, 'Lab Technician','2016-07-01');

call insert_appointment_with_muscle_reflexes(NULL, '1205249', 1, '2017-04-23', 'Back problems, backache', 'X-ray referral ', NULL, 'present', 'present', 'present', 'present', 'weak', 'present');
call insert_appointment_with_muscle_reflexes(NULL, '6487572', 2, '2016-01-01', 'Splitting headache, vomiting', 'CT scan', NULL, 'present', 'weak', 'present', 'present', 'lack', 'present');

call insert_result_from_referral(NULL, 1,  '2017-03-12', 'G95.0', 'Backache, Syringomyelia suspicion', 'Medical Center SWISS MEDICUS', 'Albert Wood', '8448726');
call insert_result_from_referral(NULL, 2, '2017-04-12', 'G95.0', 'bóle głowy', 'Medical Magnus Clinic', 'Frank Reed', '2649283');

call insert_examination_result_with_referral_to_test(NULL, 1, 'G95.0', 'Backache, high blood presure', 'Referral to scan the thoracic spine', NULL, 'Sharp back pain for several days', 'priority');
call insert_examination_result_with_referral_to_test(NULL, 2, 'G96.-', 'Splitting headaches', 'Referral to CT scan, Blood Biochemical analysis', NULL, 'Splitting Migraine Headache, Photophobia', 'priority');

call insert_results(NULL, 1, '2017-05-10', 'Lab Technician', 'Alexander Brot', '-', 'X-ray scan', 'CD with images');
call insert_results(NULL, 2, '2017-06-02', 'Doctor', 'Max Cooper', '5688326', 'CT scan', 'CD with images');

call insert_appointment(NULL, '1205249', 1, '2017-06-10', 'Sharp backache', '-', 1);
call insert_appointment(NULL, '6487572', 2, '2017-06-05', 'Splitting headache, vomiting', '-', 2);

call insert_prescription_medicine(NULL, 1, 'Agapurin', '1x1', 'After meal for 30 days', '1 package', '50','Asclepius Neurology Clinic', '05');
call insert_prescription_medicine(NULL, 1, 'Alpragen', '3x1', 'On an empty stomach', '1 opak', '30','Asclepius Neurology Clinic', '05');
call insert_no_prescription_medicine(NULL, 2, 'Neurex 600', '2x1', 'After breakfast');
call insert_no_prescription_medicine(NULL, 2, 'Tetmodis', '3x2', 'With meal');