# frozen_string_literal: true

require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Drill.create([
               { drill_type: 'Guard', drill_name: 'Cross-Over-Dribble', reps: '1', sets: '1' },
               { drill_type: 'General', drill_name: 'Suicides', reps: '2', sets: '1' },
               { drill_type: 'Forward', drill_name: 'Pass-&-Cut-Away', reps: '1', sets: '1.5' },
               { drill_type: 'Forward', drill_name: 'Drop-Step', reps: '1', sets: '1.5' },
               { drill_type: 'Center', drill_name: 'Post-Moves', reps: '1', sets: '1' },
               { drill_type: 'Guard', drill_name: 'Sucide-Free-Throws', reps: '1', sets: '2.5' },
               { drill_type: 'General', drill_name: 'Mican-Drill', reps: '1', sets: '1.5' },
               { drill_type: 'Guard', drill_name: 'Cross-Over-Dribble', reps: '1', sets: '1.5' },
               { drill_type: 'General', drill_name: 'Sucide-Free-Throws', reps: '1', sets: '2.5' },
               { drill_type: 'General', drill_name: 'Mican-Drill', reps: '2', sets: '3.5' }
             ])

Routine.create([
                 { routine_name: 'Off Hand Drills' },
                 { routine_name: 'For the Bigs' },
                 { routine_name: 'Hops' },
                 { routine_name: 'Play-Making-Drills' },
                 { routine_name: 'Situational Hoops' }
               ])

r1 = Routine.all[0]
r1.drills.create(drill_type: 'General', drill_name: 'Free-Throws', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r1.drills.create(drill_type: 'Forward', drill_name: 'Drop-Step-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r1.drills.create(drill_type: 'Guard', drill_name: 'Floater-Jump-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r1.drills.create(drill_type: 'General', drill_name: 'Mican-Drill', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r2 = Routine.all[1]
# r2.drills.create(drill_type: 'General', drill_name: 'Post-Fade-Away-Jump-Shot', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r2.drills.create(drill_type: 'Guard', drill_name: 'Gears', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r3 = Routine.all[2]
# r3.drills.create(drill_type: 'Guard', drill_name: 'Elliptical', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r4 = Routine.all[4]
# r4.drills.create(drill_type: 'General', drill_name: 'Suicides', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r4.drills.create(drill_type: 'General', drill_name: 'Taps', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r5 = Routine.all[4]
# r5.drills.create(drill_type: 'Center', drill_name: 'Backboard-Taps', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
# r5.drills.create(drill_type: 'Guard', drill_name: 'Off-Handed-In-And-Outs', reps: Faker::Number.between(from: 1, to: 8), sets: Faker::Number.between(from: 1, to: 4))
