create table receipt_status(
id int NOT NULL,
items_count int,
rewardReceiptsstatus char(100),
PRIMARY KEY (id)
);


insert into receipt_status (id,items_count,rewardReceiptsstatus) values(1,3,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(2,4,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(3,1,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(4,5,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(5,6,'Rejected');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(6,1,'Rejected');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(7,1,'Rejected');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(8,1,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(9,10,'Accepted');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(10,11,'Rejected');
insert into receipt_status (id,items_count,rewardReceiptsstatus) values(11,1,'Accepted');

select * from receipt_status;


/*When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’,
 which is greater?*/
WITH receipt_CTE (acount,rewardReceiptsstatus)  
AS   
(  
    select sum(items_count) as acount,rewardReceiptsstatus from receipt_status
	where rewardReceiptsstatus='Accepted'
	group by rewardReceiptsstatus
	union
	select sum(items_count) as acount,rewardReceiptsstatus from receipt_status
	where rewardReceiptsstatus='Rejected'
	group by rewardReceiptsstatus
)  
SELECT acount,rewardReceiptsstatus  from receipt_CTE where acount IN(select max(acount) from receipt_CTE);



