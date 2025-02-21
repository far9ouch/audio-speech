import os
import shutil

def build_static():
    """Build static files for GitHub Pages"""
    # Ensure static directory exists
    if not os.path.exists('static'):
        os.makedirs('static')

    # Copy static files
    shutil.copytree('static', 'build/static', dirs_exist_ok=True)
    shutil.copy2('templates/index.html', 'build/index.html')

if __name__ == "__main__":
    build_static() 