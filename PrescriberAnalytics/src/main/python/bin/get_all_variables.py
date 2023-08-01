import os

### Set Environment Variables
os.environ['envn'] = 'PROD'
os.environ['header'] = 'True'
os.environ['inferSchema'] = 'True'
os.environ['user'] = 'sparkuser93'
os.environ['password'] = 'rangers93'

### Get Environment Variables
envn = os.environ['envn']
header = os.environ['header']
inferSchema = os.environ['inferSchema']
user = os.environ['user']
password = os.environ['password']

### Set Other Variables
appName="USA Prescriber Research Report"
current_path =  os.getcwd()
#staging_dim_city = current_path + '\..\staging\dimension_city'
#staging_fact = current_path + '\..\staging\\fact'

staging_dim_city="PrescriberAnalytics/staging/dimension_city"
staging_fact = "PrescriberAnalytics/staging/fact"

output_city="PresPipeline/output/dimension_city"
output_fact="PresPipeline/output/fact"

