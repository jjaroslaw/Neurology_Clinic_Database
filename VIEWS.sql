create view employees_list as
	select
        p.p_name as 'name' , 
        p.p_surname as 'surname', 
        p.personal_number as 'personal_number', 
        p.date_of_birth as 'date_of_birth', 
        p.country_of_birth as 'country_of_birth', 
        p.city as 'city', 
        p.postal_code as 'postal_code', 
        p.street_and_house_number as 'street_and_house_number', 
        p.phone 'phone', 
        p.sex 'sex',
        d.licence_number 'licence_number',
        d.specialty as 'specialty',  
        d.date_of_employment as 'date_of_doctor_employment',
        s.profession as 'profession',
        s.date_of_employment as 'date_of_support_staff_employment'
	from people p
	left join doctors d on p.p_id=d.p_id
    left join support_staff s on p.p_id=s.p_id
    where p.p_id in (select d2.p_id from doctors d2) or p.p_id in (select s2.p_id from support_staff s2)
    order by p.p_id;

create view story_of_appointments as
	select
		pat.patient_id as 'patient_id',
        p.p_name as 'name' , 
        p.p_surname as 'surname', 
        p.personal_number as 'personal_number', 
        p.date_of_birth as 'date_of_birth', 
        p.country_of_birth as 'country_of_birth', 
        p.city as 'city', 
        p.postal_code as 'postal_code', 
        p.street_and_house_number as 'street_and_house_number', 
        p.phone 'phone', 
        p.sex 'sex',
        a.appointment_id as 'appointment_id',
        a.appointment_date as 'appointment_date',
        a.licence_number as 'licence_number',
        a.general_description as 'general_description',
        a.referral_to_tests as 'referral_to_tests'
	from patients pat
    join appointments a on pat.patient_id = a.patient_id
    join people p on pat.p_id=p.p_id
    order by pat.patient_id;

create view results_view as
	select
		pat.patient_id as 'patient_id',
        p.p_name as 'p_name',
        p.p_surname as 'p_surname',
        p.personal_number as 'personal_number',
        rfr.icd10 as 'icd10_from_referral',
		a.appointment_id as 'appointment_id',
        m.two_headed_reflex as 'two_headed_reflex',
        m.adductor_muscles_reflex as 'adductor_muscles_reflex',
        m.knee_reflex as 'knee_reflex',
        m.brachioradialis_reflex as 'brachioradialis_reflex',
        m.jaw_reflex as 'jaw_reflex',
        m.ankle_reflex as 'ankle_reflex',
        a.appointment_date as 'appointment_date',
        e.icd10 as 'icd10_based_on_examination',
		a.general_description as 'general_description',
        a.licence_number as 'licence_number',
        a.referral_to_tests as 'referral_to_tests'
	from patients pat
    join appointments a on pat.patient_id = a.patient_id
    join people p on pat.p_id = p.p_id
    join result_from_referral rfr on rfr.patient_id = pat.patient_id
    left join muscle_reflexes m on m.appointment_id = a.appointment_id
    left join examination_result e on e.appointment_id = a.appointment_id
    order by pat.patient_id;

create view prescribed_medicines as
	select
		pat.patient_id as 'patient_id',
        p.p_name as 'p_name',
        p.p_surname as 'p_surname',
        p.personal_number as 'personal_number',
		a.appointment_id as 'appointment_id',
        a.appointment_date as 'appointment_date',
		a.licence_number as 'licence_number',
        a.general_description as 'general_description',
		m.medicine_name as 'medicine_name',
        m.dosage as 'dosage',
        m.other_comments as 'other_comments',
        pre.quantity as 'quantity'
	from patients pat
    join appointments a on pat.patient_id = a.patient_id
    join people p on pat.p_id = p.p_id
    left join medicines m on m.appointment_id = a.appointment_id
    left join prescription pre on pre.medicine_id = m.medicine_id
    where medicine_name is not null
    order by pat.patient_id;

create view examinations as
	select
		pat.patient_id as 'patient_id',
        p.p_name as 'p_name',
        p.p_surname as 'p_surname',
        p.personal_number as 'personal_number',
		a.appointment_id as 'appointment_id',
        a.appointment_date as 'appointment_date',
		a.licence_number as 'licence_number',
        a.general_description as 'general_description',
		e.icd10 as 'icd10',
        rt.examination_result_id as 'examination_result_id',
        e.medical_examination_referral as 'medical_examination_referral',
        rt.attention as 'attention',
        r.examination_date as 'examination_date',
        r.profession as 'profession',
        r.staff_data as 'staff_data',
        r.staff_licence_number as 'staff_licence_number',
        r.examination_description as 'examination_description',
        r.attachment as 'attachment'
	from patients pat
    join appointments a on pat.patient_id = a.patient_id
    join people p on pat.p_id = p.p_id
    left join examination_result e on e.appointment_id = a.appointment_id
    left join referral_to_test rt on rt.examination_result_id = e.examination_result_id
    left join results r on r.referral_id=rt.referral_id
    order by pat.patient_id;
