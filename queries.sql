
select booking_id,u.name as customer_name ,v.name as vehicle_name,start_date,end_date,b.status
from bookings b inner join users u on b.user_id=u.user_id inner join vehicles v on b.vehicle_id=v.vehicle_id;


select * from vehicles v where not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
);


select * from vehicles where type ='car' and status = 'available';

select v.name as vehicle_name,count(b.booking_id) as total_bookings from vehicles v inner join bookings b on b.vehicle_id=v.vehicle_id group by v.name having count(b.booking_id)>2; 