import json
import os
import subprocess

def load_config():
    with open('C:\Program Files\devTools\devToolsConfig.json', 'r') as f:
        return json.load(f)

def save_config(config):
    with open('C:\Program Files\devTools\devToolsConfig.json', 'w') as f:
        json.dump(config, f, indent=4)

def open_explorer(path):
    try:
        subprocess.run(['explorer', path], check=True)
    except subprocess.CalledProcessError:
        print("Failed to open the folder in Windows Explorer.")

def change_path(config):
    new_path = input("Enter new path: ")
    config['path'] = new_path
    save_config(config)
    print(f"Path updated to {new_path}")

def menu():
    config = load_config()
    while True:
        print("\nCurrent Path:", config['path'])
        print("1. Open Windows Explorer at this path")
        print("2. Change the stored path")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            open_explorer(config['path'])
        elif choice == '2':
            change_path(config)
        elif choice == '3':
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    menu()
