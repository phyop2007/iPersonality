create table [dbo].[be_menu_group](
	[menu_group_id] [int] identity(1,1) not for replication not null,
	[menu_group_name] [varchar](500) not null,
	[menu_group_description] [varchar] (5000) null,
	[menu_group_enabled] [bit] not null constraint [df_menu_group__menu_group_enabled]  default ((1)),
	[menu_group_deleted] [bit] not null constraint [df_menu_group__menu_group_deleted]  default ((0)),
	[menu_group_link] [varchar](5000) not null,
	[menu_group_sequence] [int] null,
 constraint [pk_be_menu_group] primary key clustered 
(
	[menu_group_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go


insert into be_menu_group (menu_group_name, menu_group_description, menu_group_link, menu_group_sequence)
values ('Jobs','Available job types', 'index.cfm?p_action=work', 1);
go


insert into be_menu_group (menu_group_name, menu_group_description, menu_group_link, menu_group_sequence)
values ('Personality Tests','Available personality tests', 'index.cfm?p_action=per', 2);
go

