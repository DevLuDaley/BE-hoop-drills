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
