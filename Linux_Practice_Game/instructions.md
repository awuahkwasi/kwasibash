# Dungeons and Dragons Linux Command Practice Game

Author: Kwasi Amankwah Awuah

## Purpose

The Dungeons and Dragons Linux Command Practice Game is an interactive bash script designed to help users practice and improve their Linux command line skills. The game guides the user through a series of tasks by navigating a fictional Dungeons and Dragons world using various Linux commands.

## Script Overview

The script consists of several functions, each responsible for different parts of the game. The main sections include setting up the environment, introducing the game, guiding the player through tasks, and cleaning up the environment at the end.

## Script Sections

### 1. Setting Up the Environment

This section creates the necessary directories and files for the game in the `/tmp` directory.

```bash
# Function to create temporary files and directories
setup_environment() {
    mkdir -p /tmp/dnd_game/castle/treasury
    mkdir -p /tmp/dnd_game/forest/grove
    touch /tmp/dnd_game/castle/treasury/gold.txt
    touch /tmp/dnd_game/forest/grove/magic_stone.txt
    echo "100 gold coins" > /tmp/dnd_game/castle/treasury/gold.txt
    echo "A mysterious glowing stone" > /tmp/dnd_game/forest/grove/magic_stone.txt
}
```

### 2. Cleaning Up the Environment

This section removes the temporary directories and files created for the game.

```bash
# Function to clean up the environment
cleanup_environment() {
    echo "Cleaning up the environment..."
    if [ -d /tmp/dnd_game ]; then
        rm -rf /tmp/dnd_game
        if [ $? -eq 0 ]; then
            echo "Cleanup successful."
        else
            echo "Cleanup failed."
        fi
    else
        echo "/tmp/dnd_game does not exist, nothing to clean up."
    fi
}
```

### 3. Introducing the Game

This section provides an introduction to the game and displays the current directory.

```bash
# Function to introduce the game
intro() {
    echo "Welcome to the Dungeons and Dragons Linux Command Practice Game!"
    echo "You are a brave adventurer exploring a mysterious land."
    echo "Use your Linux command skills to navigate and complete tasks."
    echo "If you need a hint, type 'echo \"hint\"'."
    echo "Your current location is: $(pwd)"
}
```

### 4. Prompting the User

This section prompts the user to enter the correct command to proceed with the game. It also provides hints if the user types `echo "hint"`.

```bash
# Function to prompt the user until they enter the correct command
prompt_command() {
    local correct_cmd1="$1"
    local correct_cmd2="$2"
    local hint="$3"
    local cmd
    while true; do
        read -p "> " cmd
        if [ "$cmd" = "$correct_cmd1" ] || [ "$cmd" = "$correct_cmd2" ]; then
            eval "$cmd"
            break
        elif [ "$cmd" = 'echo "hint"' ]; then
            echo "Hint: $hint"
        elif [[ "$cmd" == ls* ]]; then
            eval "$cmd"
        else
            echo "Incorrect command. Try again or type 'echo \"hint\"' for help."
        fi
    done
}
```

### 5. Guiding the Player

This section guides the player through a series of tasks, each requiring the use of specific Linux commands. The player must use the correct commands to progress through the game.

```bash
# Function to guide the player through the tasks
guide_player() {
    echo
    echo "You find yourself at the entrance of a grand castle."
    echo "List the contents of the current directory to see where you are."
    prompt_command "ls" "" "Use 'ls' to list the contents of the current directory."

    echo "Great! Now enter the castle."
    prompt_command "cd castle" "" "Use 'cd castle' to enter the castle."

    echo "See all contents, including hidden ones."
    prompt_command "ls -la" "ls -a" "Use 'ls -la' or 'ls -a' to list all files, including hidden ones."

    echo "Enter the treasury."
    prompt_command "cd treasury" "" "Use 'cd treasury' to enter the treasury."

    echo "Read the contents of the gold.txt file."
    prompt_command "cat gold.txt" "" "Use 'cat gold.txt' to read the contents of the gold.txt file."

    echo "Let's create a new directory called 'inventory'."
    prompt_command "mkdir /tmp/dnd_game/inventory" "" "Use 'mkdir /tmp/dnd_game/inventory' to create a new directory."

    echo "Copy gold.txt to the inventory."
    prompt_command "cp gold.txt /tmp/dnd_game/inventory/" "" "Use 'cp gold.txt /tmp/dnd_game/inventory/' to copy gold.txt to the inventory."

    echo "Move the magic_stone.txt from the forest grove to the inventory."
    prompt_command "mv /tmp/dnd_game/forest/grove/magic_stone.txt /tmp/dnd_game/inventory/" "" "Use 'mv /tmp/dnd_game/forest/grove/magic_stone.txt /tmp/dnd_game/inventory/' to move magic_stone.txt to the inventory."

    echo "Verify the files in the inventory."
    prompt_command "ls -l /tmp/dnd_game/inventory" "" "Use 'ls -l /tmp/dnd_game/inventory' to verify the files in the inventory."

    echo "Find the word 'gold' in the gold.txt file."
    prompt_command "grep gold /tmp/dnd_game/inventory/gold.txt" "" "Use 'grep gold /tmp/dnd_game/inventory/gold.txt' to find the word 'gold' in the gold.txt file."

    echo "Locate the magic_stone.txt file."
    prompt_command "find /tmp/dnd_game -name magic_stone.txt" "" "Use 'find /tmp/dnd_game -name magic_stone.txt' to locate the magic_stone.txt file."

    echo "Remove gold.txt from the inventory."
    prompt_command "rm -i /tmp/dnd_game/inventory/gold.txt" "" "Use 'rm -i /tmp/dnd_game/inventory/gold.txt' to remove gold.txt from the inventory."

    echo "Remove the inventory directory."
    prompt_command "rm -r /tmp/dnd_game/inventory" "" "Use 'rm -r /tmp/dnd_game/inventory' to remove the inventory directory."

    echo "Congratulations, brave adventurer! You have completed the tasks."
}
```

### 6. Main Game Function

The main function that runs the entire game by calling the introduction, setup, guiding, and cleanup functions in sequence.

```bash
# Main game function
main() {
    intro
    setup_environment
    cd /tmp/dnd_game
    guide_player
    cleanup_environment
}

# Run the main function
main
```

### How to Run the Script

1. Save the script to a file, for example, `dnd_game.sh`.
2. Make the script executable:
    ```bash
    chmod +x dnd_game.sh
    ```
3. Run the script:
    ```bash
    ./dnd_game.sh
    ```

This will start the interactive Dungeons and Dragons Linux Command Practice Game.