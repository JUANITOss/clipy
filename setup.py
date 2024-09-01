from setuptools import setup, find_packages

setup(
    name='clipy',
    version='0.2',
    packages=find_packages(),
    description='A utility module for copying to and pasting from the clipboard using xclip.',
    author='Juan Suazo',
    author_email='0juansuazo0@gmail.com',
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: POSIX :: Linux',
    ],
    python_requires='>=3.6',
)
