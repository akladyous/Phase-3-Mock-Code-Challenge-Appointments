# Phase 3 Code Challenge: Appointments

For this challenge, we'll be working with three models: `Doctor`, `Appointment`, and `Patient`.

Relationships are: a `Doctor` has many `Appointment`s, a `Patient` has many `Appointment`s,
and a `Appointment` belongs to a `Doctor` and to a `Patient`.

`Doctor` - `Patient` is a many to many relationship.

## Topics

- Active Record Migrations
- Active Record Associations
- Class and Instance Methods
- Active Record Querying

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

## What You Already Have

The starter code has migrations and models for the initial `Doctor` and `Patient` models, and seed data for some `Doctor`s and `Patient`s. The schema currently looks like this:

### `doctors` table

| Column    | Type   |
| --------- | ------ |
| name      | String |
| location  | String |

### `patients` table

| Column    | Type    |
| --------- | ------- |
| name      | String  |
| location  | String  |
| age       | Integer |


You will need to create the migration for the `appointments` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

First you need to create a migration for the `appointments` table.  
- An `Appointment` belongs to a `Doctor`, and to a `Patient`. Be sure to include any columns in your table necessary to establish these relationships
- The `appointments` table should also have a `date` column that stores a string, and a  `time` column that stores a string.

Once you have created the `appointments` table, use the `seeds.rb` file to create instances of the `Appointment` class to test your code.

### Object Relationship Methods

Use the Active Record association macros where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Doctor
- `Doctor#appointments`
    - should return a collection of all the `appointments` that the instance of that `Doctor` has scheduled
- `Doctor#patients` 
    - should return an array of all `patients` that are associated with this `Doctor`

#### Patient
- `Patient#appointments` 
    - should return a list of all the `appointments` that are scheduled for this `Patient`
- `Patient#doctors`
    - should return a collection of all the `doctors` this `Patient` has scheudled `appointments` with

#### Appointment
- `Appointment#doctor` 
    - should return the instance of the `Doctor` the `Appointment` belongs to
- `Appointment#patient` 
    - should return the `Patient` instance for this `Appointment`

Use the rake console to check that all of these methods work before proceeding. If they do not work, check that your migrations have been run and that you have seed data for each of the models.  If all of this has been done, check the relationships established between the models to make sure everything is correct.

### Aggregate and Association Methods

#### Appointment

- `Appointment#reminder`
    - returns a string with a reminder for the patient of their appointment: `"Hello, {insert patient name}. You have an appointment on {insert appointment date} at {insert appointment time} with Dr. {insert doctor name}."`
- `Appointment#senior_citizen` 
    - returns a boolean value, `true` if the associated Patient is older than 65 years of age, otherwise it returns `false` 

#### Doctor
- `Doctor#patient_list` 
    - returns a unique array of all the `Patient` names this `Doctor` has `apppointments` with
- `Doctor#schedule_appointment(patient, date, time)` 
    - takes a `Patient` instance and two strings for `date` and `time` as arguments
    - creates a new instance of an `Appointment` with that `date`, `time`, and `Patient`
    - returns the new `Appointment` instance
- `Doctor.least_patients`
    - returns the instance of `Doctor` with the least patients
    - **Note**: solving this using only Active Record methods is possible, but difficult. Feel free to use regular Ruby enumerable methods here.

#### Patient
- `Patient#reminders` 
    - should return an array of strings, all the reminders for the `appointments` associated with this `Patient`
- `Patient#introduction` 
    - should return a string: `"Hello my name is {insert patient name}, I am {insert patient age} years old and I live in {insert patient location}."`
- `Patient.most_appointments` 
    - returns the `Patient` with the most `appointments` scheduled