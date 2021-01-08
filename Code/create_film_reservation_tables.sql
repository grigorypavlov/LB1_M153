drop database if exists film_reservation;
create database film_reservation;
use film_reservation;

create table customer (
  id SERIAL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL UNIQUE,

  PRIMARY KEY(id)
);

create table film (
  id SERIAL,
  film_name VARCHAR(255) NOT NULL UNIQUE,
  film_length TIME NOT NULL,

  PRIMARY KEY(id)
);

create table cinema (
  id SERIAL,
  capacity TINYINT NOT NULL UNSIGNED,

  PRIMARY KEY(id)
);

create table row (
  id SERIAL,
  cinema_id BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(cinema_id)
    REFERENCES cinema(id)
    ON DELETE CASCADE
);

create table seat (
  id SERIAL,
  row_id BIGINT UNSIGNED NOT NULL,
  seat_number TINYINT UNSIGNED NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(row_id)
    REFERENCES row(id)
    ON DELETE CASCADE
);

create table employee (
  id SERIAL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,

  PRIMARY KEY(id)
);

create table schedule (
  id SERIAL,
  film_id BIGINT UNSIGNED NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  cinema_id BIGINT UNSIGNED NOT NULL,
  ticket_price DECIMAL(5,2) NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(film_id)
    REFERENCES film(id)
    ON DELETE CASCADE,
  FOREIGN KEY(cinema_id)
    REFERENCES cinema(id)
    ON DELETE CASCADE
);

create table work_schedule (
  id SERIAL,
  employee_id BIGINT UNSIGNED NOT NULL,
  schedule_id BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(id)
    ON DELETE CASCADE,
  FOREIGN KEY(schedule_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE
);
