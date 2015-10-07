create table [dbo].[be_personality_job](
	[personality_cat_id] [int] not null,
	[personality_id] [int] not null,
	[job_cat_id] [int] not null,
 constraint [pk_be_personality_job] primary key clustered 
(
	[personality_cat_id] asc,
	[personality_id] asc,
	[job_cat_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go
