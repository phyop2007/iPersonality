create table [dbo].[fe_menu](
	[menu_id] [int] identity(1,1) not for replication not null,
	[menu_name] [varchar](500) not null,
	[menu_description] [varchar] (5000) null,
	[menu_group_id] [int] not null constraint [df_menu__menu_group_id]  default ((1)),
	[menu_enabled] [bit] not null constraint [df_menu__menu_enabled]  default ((1)),
	[menu_deleted] [bit] not null constraint [df_menu__menu_deleted]  default ((0)),
	[menu_link] [varchar](5000) not null,
	[menu_sequence] [int] null,
 constraint [pk_fe_menu] primary key clustered 
(
	[menu_id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
) on [primary]

go


insert into fe_menu (menu_name, menu_description, menu_link, menu_sequence)
values ('Intro','Introduction to your personality', 'index.cfm?p_action=intro', 1);
go

insert into fe_menu (menu_name, menu_description, menu_link, menu_sequence)
values ('Personality','Different types of personality', 'index.cfm?p_action=per', 2);
go

insert into fe_menu (menu_name, menu_description, menu_link, menu_sequence)
values ('Dream Job','Different types of Jobs', 'index.cfm?p_action=work', 3);
go

insert into fe_menu (menu_name, menu_description, menu_link, menu_sequence)
values ('Results','Your Work & Play suitable with your personality', 'index.cfm?p_action=per_work', 4);
go

insert into fe_menu (menu_name, menu_description, menu_link, menu_sequence)
values ('Contact Us','About Us and Contact Info', 'index.cfm?p_action=contact', 5);
go