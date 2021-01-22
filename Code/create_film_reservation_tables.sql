drop database if exists film_reservation;
create database film_reservation;
use film_reservation;

create table customer (
  id INT NOT NULL auto_increment,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL UNIQUE,

  PRIMARY KEY(id)
);

create table film (
  id INT NOT NULL auto_increment,
  film_name VARCHAR(255) NOT NULL UNIQUE,
  film_length TIME NOT NULL,

  PRIMARY KEY(id)
);

create table cinema (
  id INT NOT NULL auto_increment,
  capacity TINYINT NOT NULL,

  PRIMARY KEY(id)
);

create table row (
  id INT NOT NULL auto_increment,
  row_number TINYINT NOT NULL,
  cinema_id INT NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(cinema_id) REFERENCES cinema(id) ON UPDATE cascade ON DELETE cascade
);

create table seat (
  id INT NOT NULL auto_increment,
  row_id INT NOT NULL,
  seat_number TINYINT NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(row_id) REFERENCES row(id) ON UPDATE cascade ON DELETE cascade
);

create table employee (
  id INT NOT NULL auto_increment,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,

  PRIMARY KEY(id)
);

create table schedule (
  id INT NOT NULL auto_increment,
  film_id INT NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  cinema_id INT NOT NULL,
  ticket_price DECIMAL(5,2) NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(film_id) REFERENCES film(id) ON UPDATE cascade ON DELETE cascade,
  FOREIGN KEY(cinema_id) REFERENCES cinema(id) ON UPDATE cascade ON DELETE cascade
);

create table work_schedule (
  id INT NOT NULL auto_increment,
  employee_id INT NOT NULL,
  schedule_id INT NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(employee_id) REFERENCES employee(id) ON UPDATE cascade ON DELETE cascade,
  FOREIGN KEY(schedule_id) REFERENCES schedule(id) ON UPDATE cascade ON DELETE cascade
);

create table reservation (
  id INT NOT NULL auto_increment,
  seat_id INT NOT NULL,
  customer_id INT NOT NULL,
  schedule_id INT NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(seat_id) REFERENCES seat(id) ON UPDATE cascade ON DELETE cascade,
  FOREIGN KEY(customer_id) REFERENCES customer(id) ON UPDATE cascade ON DELETE cascade,
  FOREIGN KEY(schedule_id) REFERENCES schedule(id) ON UPDATE cascade ON DELETE cascade
);
