# Math Practice Game in Bash

This Bash script creates a simple terminal-based math practice game. The game generates random math problems, asks the user to solve them, checks the user's answers, and keeps track of the score.

## Algorithm Explanation

### Steps of the Algorithm

1. **Generate Two Random Numbers**
   - Use `$((RANDOM % 10 + 1))` to generate numbers between 1 and 10.

2. **Check the Random Maths Operation Generated**
### Here I learnt that arrays in Bash don't need commas
   - Use an array of operators: `('+' '-' '*' '/')`.
   - Select a random operator using `local operator=${operators[$((RANDOM % 4))]}`.

3. **Execute the Operands and the Operation**
   - Form the math problem as a string: `question="$num1 $operator $num2"`.
   - Calculate the correct answer:
   ### Learnt here that I can pipe an echo to the BC-basic calculator and specify decimal points with the 'scale'
     - For division: `correct_answer=$(echo "scale=2; $num1 $operator $num2" | bc)` to handle floating-point arithmetic and set the precision to two decimal places.
     - For other operations: `correct_answer=$(($num1 $operator $num2))` using arithmetic expansion.

4. **Store the Answer as a Number**
   - The answer is stored in the `correct_answer` variable as a number.

5. **Present the Operands and Operation as a String Question to the User**
   - Display the question using `echo "Solve: $question"`.
   - I added a prompt for the answer format for divisions `echo "Remember to put your answers for a division question to 2 decimal places"`

6. **Take User Input and Compare it to the Answer**
   - Read the user's answer: `read -p "Your answer: " user_answer`.
   - Compare the user's answer with the correct answer using `if [ "$user_answer" == "$correct_answer" ];`.

7. **Determine if the Answer is Right or Wrong**
   - Print "Correct!" if the answers match and increment the score.
   - Print "Incorrect. The correct answer is $correct_answer." if the answers don't match.

8. **Add the Loop and Final Score**
   - Use a `while true` loop to continually ask questions until the user decides to quit.
   - Print the final score at the end.

## Running the Script

1. Make the script executable:
   ```bash
   chmod +x math_game.sh
