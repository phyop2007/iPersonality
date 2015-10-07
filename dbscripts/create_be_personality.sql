create table [dbo].[be_personality](
	[personality_id] [int] identity(1,1) not for replication not null,
	[personality_name] [varchar](500) not null,
	[personality_description] [varchar] (5000) null,
	[personality_cat_id] [int] ,
	[personality_enabled] [bit] not null constraint [df_be_personality__enabled]  default ((1)),
	[personality_deleted] [bit] not null constraint [df_be_personality__deleted]  default ((0)),
	[personality_sequence] [int] null,
 constraint [pk_be_personality] primary key clustered 
(
	[personality_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go

alter table be_personality 
	add constraint fk_personality__personality_cat 
	foreign key (personality_cat_id)
	references be_personality_cat(personality_cat_id)
go


insert into be_personality (personality_name, personality_description, personality_cat_id, personality_sequence)
values ('INFP','The Mediator', 1,1);
go

