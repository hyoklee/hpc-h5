import json
import requests

# Fetch JSON
response = requests.get('https://my.cdash.org/api/v1/index.php?project=HDF5')
json_data = response.text

data = json.loads(json_data)

# Extract unique build names
build_names = set()
for group in data.get('buildgroups', []):
    for build in group.get('builds', []):
        build_names.add(build.get('buildname', ''))

# Sort for consistency
build_names = sorted(build_names)

# Print markdown table header
# print('| Build Name | Prefix | Middle | Suffix | Value1 | Value2 |')
# print('|------------|--------|--------|--------|--------|--------|')
print('| mpi | compiler | os | arch |')
print('|-----|----------|----|------|')

for name in build_names:
    # Original parsing logic
    first = name.find('-')
    if first == -1:
        prefix = ''
        rest = name
    else:
        prefix = name[:first]
        rest = name[first + 1:]

    first_double = rest.find('--')
    if first_double == -1:
        middle = ''
        rest_suffix = rest
    else:
        middle = rest[:first_double]
        rest_suffix = rest[first_double + 2:]

    second = rest_suffix.find('-')
    if second == -1:
        suffix = rest_suffix
    else:
        suffix = rest_suffix[:second]

    # New parsing logic
    value1 = ''
    value2 = ''
    if 'Linux' in name:
        parts_after_linux = name.split('Linux', 1)
        if len(parts_after_linux) > 1:
            after_linux_str = parts_after_linux[1]
            if '-' in after_linux_str:
                rsplit_parts = after_linux_str.rsplit('-', 1)
                value1 = 'Linux' + rsplit_parts[0]
                value2 = rsplit_parts[1]
            else:
                value1 = after_linux_str

#    print(f'| {name} | {prefix} | {middle} | {suffix} | {value1} | {value2} |')
    print(f'| {middle} | {suffix} | {value1} | {value2} |')
