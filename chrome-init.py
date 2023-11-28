import subprocess
import os
import sys

def open_chrome_with_user_data():
    # Define the user data directory
    user_data_dir = os.path.join(os.getcwd(), 'data')

    # Check the operating system
    if os.name == 'nt':  # Windows
        chrome_path = r'C:\Program Files\Google\Chrome\Application\chrome.exe'
        if not os.path.isfile(chrome_path):
            print("Chrome executable not found at", chrome_path)
            sys.exit(1)
        subprocess.run([chrome_path, f'--user-data-dir={user_data_dir}'])
    else:  # macOS and Linux
        subprocess.run(['google-chrome', f'--user-data-dir={user_data_dir}'])

if __name__ == "__main__":
    open_chrome_with_user_data()

