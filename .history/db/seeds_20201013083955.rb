# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Drill.create([
               { drill_type: 'cardio', drill_name: 'basketball', reps: '1', sets: '1' },
               { drill_type: 'cardio', drill_name: 'running', reps: '2', sets: '1' },
               { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
               { drill_type: 'cardio', drill_name: 'basketball', reps: '1', sets: '1.5' },
               { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
               { drill_type: 'cardio', drill_name: 'jogging', reps: '1', sets: '1' },
               { drill_type: 'cardio', drill_name: 'sprinting', reps: '1', sets: '2.5' },
               { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
               { drill_type: 'cardio', drill_name: 'sprinting', reps: '1', sets: '2.5' },
               { drill_type: 'cardio', drill_name: 'bike_riding', reps: '2', sets: '3.5' }
             ])

Routine.create([
                 { routine_name: 'Weight Training' },
                 { routine_name: 'Cardio Rush' },
                 { routine_name: 'Hoops' },
                 { routine_name: 'Batman Chest' },
                 { routine_name: 'Gym Glutes' }
               ])

r1 = Routine.all[0]
r1.workouts.create(workout_type: 'Cardio', workout_name: 'squats', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r1.workouts.create(workout_type: 'Cardio', workout_name: 'boogie board', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r1.workouts.create(workout_type: 'Cardio', workout_name: 'one-legged-squats', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r1.workouts.create(workout_type: 'Cardio', workout_name: 'floor calf stretch', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r2 = Routine.all[1]
r2.workouts.create(workout_type: 'Cardio', workout_name: 'floor clam shells', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r2.workouts.create(workout_type: 'Cardio', workout_name: 'tke\'s', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r3 = Routine.all[2]
r3.workouts.create(workout_type: 'Cardio', workout_name: 'elliptical', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r4 = Routine.all[3]
r4.workouts.create(workout_type: 'Cardio', workout_name: 'suicides', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r4.workouts.create(workout_type: 'Cardio', workout_name: 'mican drill', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r5 = Routine.all[4]
r5.workouts.create(workout_type: 'Cardio', workout_name: 'bear crawls', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
r5.workouts.create(workout_type: 'Cardio', workout_name: 'pull-ups', distance: Faker::Number.between(from: 1, to: 8), duration: Faker::Number.between(from: 1, to: 10))
