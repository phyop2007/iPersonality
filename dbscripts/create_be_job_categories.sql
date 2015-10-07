create table [dbo].[be_job_cat](
	[job_cat_id] [int] identity(1,1) not for replication not null,
	[job_cat_name] [varchar](500) not null,
	[job_cat_description] [varchar] (5000) null,
	[job_cat_enabled] [bit] not null constraint [df_be_job_cat__enabled]  default ((1)),
	[job_cat_deleted] [bit] not null constraint [df_be_job_cat__deleted]  default ((0)),
	[job_cat_sequence] [int] null,
 constraint [pk_be_job_cat] primary key clustered 
(
	[job_cat_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go


insert into be_job_cat (job_cat_name, job_cat_description, job_cat_sequence)
values ('Accounting & Finance','Accounting, Banking, Finance and Payroll', 1);
go

insert into be_job_cat (job_cat_name, job_cat_description, job_cat_sequence)
values ('Information Technology','IT, Hardware, Software & Computer Engineering', 2);
go
