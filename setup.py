from setuptools import setup, find_packages

setup(
    name="audaa",
    version="1.0.0",
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'flask==2.0.1',
        'zyphra',
        'gunicorn'
    ],
) 