create table [dbo].[be_personality_cat](
	[personality_cat_id] [int] identity(1,1) not for replication not null,
	[personality_cat_name] [varchar](500) not null,
	[personality_cat_description] [varchar] (5000) null,
	[personality_cat_enabled] [bit] not null constraint [df_be_personality_cat__enabled]  default ((1)),
	[personality_cat_deleted] [bit] not null constraint [df_be_personality_cat__deleted]  default ((0)),
	[personality_cat_sequence] [int] null,
 constraint [pk_be_personality_cat] primary key clustered 
(
	[personality_cat_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go


insert into be_personality_cat (personality_cat_name, personality_cat_description, personality_cat_sequence)
values ('Myers Briggs','Myers Briggs Personlaity Test (MBTI)', 1);
go

insert into be_personality_cat (personality_cat_name, personality_cat_description, personality_cat_sequence)
values ('DiSc','Disc Assessment', 2);
go
