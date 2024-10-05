#!/usr/bin/env python
import yaml
import re
import argparse

# Function to modify the package versions by removing the build strings
def clean_version(version_str):
    # Match version strings like `1.0.8=h10d778d_5` and remove everything after the first '='
    return re.sub(r'=.+$', '', version_str)

# Function to process the conversion from input YAML to output YAML
def convert_env_file(input_file, output_file):
    # Load the input file
    with open(input_file, 'r') as infile:
        dev_env = yaml.safe_load(infile)

    # Process the dependencies
    processed_dependencies = []
    for dep in dev_env['dependencies']:
        if isinstance(dep, str):
            # If it's a string, clean the version if necessary
            processed_dependencies.append(clean_version(dep))
        elif isinstance(dep, dict) and 'pip' in dep:
            # For pip dependencies, leave them as is
            processed_dependencies.append(dep)

    # Update the dependencies in the new environment
    dev_env['dependencies'] = processed_dependencies

    # Save the updated environment to the output file
    with open(output_file, 'w') as outfile:
        yaml.safe_dump(dev_env, outfile, default_flow_style=False)

    print(f"Converted {input_file} to {output_file}")

# Main function with argparse to handle input and output files
def main():
    parser = argparse.ArgumentParser(description="Convert a Conda environment file to remove build strings.")
    parser.add_argument('input_file', type=str, help="Path to the input YAML file (e.g., dev.yml)")
    parser.add_argument('output_file', type=str, help="Path to the output YAML file (e.g., dev2.yml)")

    args = parser.parse_args()

    # Convert the environment YAML file
    convert_env_file(args.input_file, args.output_file)

if __name__ == "__main__":
    main()
