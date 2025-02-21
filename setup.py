from setuptools import setup, find_packages

setup(
    name="audaa",
    version="1.0.0",
    packages=find_packages(),
    include_package_data=True,
    python_requires='>=3.9.16',
    install_requires=[
        'flask==2.0.1',
        'gunicorn==20.1.0',
        'python-dotenv==0.19.0',
        'requests==2.26.0',
        'zyphra'
    ],
) 