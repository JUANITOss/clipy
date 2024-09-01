# clipy.py
import subprocess

def copy(text):
    """Copy the provided text to the system clipboard."""
    process = subprocess.Popen(['xclip', '-selection', 'clipboard'], stdin=subprocess.PIPE)
    process.communicate(input=text.encode('utf-8'))

def paste():
    """Paste text from the system clipboard."""
    process = subprocess.Popen(['xclip', '-selection', 'clipboard', '-o'], stdout=subprocess.PIPE)
    output, _ = process.communicate()
    return output.decode('utf-8')
