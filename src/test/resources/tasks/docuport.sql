select id from identity.users;

select distinct id from identity.users;

select * from document.users where first_name = 'Batch1' and last_name = 'Group1';

-- When the user gets all the leads information based on "Full name" and "Email address" and "Phone number"

select concat(owner_first_name,owner_last_name) as owner_full_name,contact_email_address,contact_phone_number from document.leads where deletion_time is null;

select concat(owner_first_name,owner_last_name) as "Full name",contact_email_address as "Email address",contact_phone_number as "Phone number" from document.leads where deletion_time is null order by "Phone number" desc ;