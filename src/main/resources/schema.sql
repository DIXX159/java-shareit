create table IF NOT EXISTS bookings
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL
        constraint bookings_pk
            primary key,
    start_date varchar,
    end_date   varchar,
    item_id    integer,
    booker_id  integer,
    status     varchar DEFAULT 'WAITING'
);

create table IF NOT EXISTS comments
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL
        constraint comments_pk
            primary key,
    text      varchar not null,
    item_id   integer not null,
    author_id integer not null,
    created varchar
);

create table IF NOT EXISTS items
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name         varchar not null,
    description  varchar not null,
    is_available varchar not null,
    owner_id     integer not null,
    request_id   integer,
    CONSTRAINT pk_item PRIMARY KEY (id)
);

create table IF NOT EXISTS requests
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL
        constraint requests_pk
            primary key,
    description  varchar not null,
    requestor_id varchar not null
);

create table IF NOT EXISTS users
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name  varchar(255) not null,
    email varchar(512) not null,
        CONSTRAINT pk_user PRIMARY KEY (id),
        CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);