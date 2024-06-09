#!/bin/bash

# Initialize score
score=0
total_questions=0

# Function to generate a random math problem
generate_problem() {
    # Array of operators without commas
    local operators=('+' '-' '*' '/')
    # Generate two random numbers between 1 and 10
    local num1=$((RANDOM % 10 + 1))
    local num2=$((RANDOM % 10 + 1))
    # Select a random operator
    local operator=${operators[$((RANDOM % 4))]}

    # Generate the question
    question="$num1 $operator $num2"
    
    # Calculate the correct answer
    if [ "$operator" == "/" ]; then
        # Use bc for division to handle floating-point arithmetic
        correct_answer=$(echo "scale=2; $num1 $operator $num2" | bc)
    else
        # Use arithmetic expansion for other operations
        correct_answer=$(($num1 $operator $num2))
    fi
}

# Function to ask a math question
ask_question() {
    generate_problem

    echo "Solve: $question"
    echo "Remember to put your answers for a division question to 2 decimal places"
    read -p "Your answer: " user_answer

    # Check if the user's answer is correct
    if [ "$user_answer" == "$correct_answer" ]; then
        echo "Correct!"
        ((score++))
    else
        echo "Incorrect. The correct answer is $correct_answer."
    fi
    ((total_questions++))
}

# Main game loop
while true; do
    ask_question

    read -p "Do you want to continue? (y/n): " choice
    if [ "$choice" != "y" ]; then
        break
    fi
done

# Print final score
echo "You answered $score out of $total_questions questions correctly."
