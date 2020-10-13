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
r1.drills.create(drill_type: 'General', drill_name: 'Free-Throws', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r1.drills.create(drill_type: 'Forward', drill_name: 'Drop-Step-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r1.drills.create(drill_type: 'Guard', drill_name: 'Floater-Jump-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r1.drills.create(drill_type: 'General', drill_name: 'Mican-Drill', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r2 = Routine.all[1]
r2.drills.create(drill_type: 'General', drill_name: 'Post-Fade-Away-Jump-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r2.drills.create(drill_type: 'Guard', drill_name: 'Gears', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r3 = Routine.all[2]
r3.drills.create(drill_type: 'Guard', drill_name: 'elliptical', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r4 = Routine.all[4]
r4.drills.create(drill_type: 'Guard', drill_name: 'suicides', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r4.drills.create(drill_type: 'Guard', drill_name: 'mican drill', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r5 = Routine.all[4]
r5.drills.create(drill_type: 'Guard', drill_name: 'bear crawls', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
r5.drills.create(drill_type: 'Guard', drill_name: 'pull-ups', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
