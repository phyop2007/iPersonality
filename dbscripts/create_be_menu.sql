create table [dbo].[be_menu](
	[menu_id] [int] identity(1,1) not for replication not null,
	[menu_name] [varchar](500) not null,
	[menu_description] [varchar] (5000) null,
	[menu_group_id] [int] not null constraint [df_be_menu__menu_group_id]  default ((1)),
	[menu_enabled] [bit] not null constraint [df_be_menu__menu_enabled]  default ((1)),
	[menu_deleted] [bit] not null constraint [df_be_menu__menu_deleted]  default ((0)),
	[menu_link] [varchar](5000) not null,
	[menu_sequence] [int] null,
 constraint [pk_be_menu] primary key clustered 
(
	[menu_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go

alter table be_menu 
	add constraint fk_menu__menu_group 
	foreign key (menu_group_id)
	references be_menu_group(menu_group_id)
go


insert into be_menu (menu_name, menu_description, menu_link, menu_group_id, menu_sequence)
values ('Jobs','Available Job Types', 'index.cfm?p_action=work', 1, 1);
go

insert into be_menu (menu_name, menu_description, menu_link, menu_group_id, menu_sequence)
values ('Personality','Available personality tests', 'index.cfm?p_action=per', 2, 2);
go

insert into be_menu (menu_name, menu_description, menu_link, menu_group_id, menu_sequence)
values ('Personality->Jobs','Matching jobs to personalities', 'index.cfm?p_action=per_work', 2, 3);
go
