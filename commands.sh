echo 'Here are some executing commands using jq form the sample file on the js site here https://stedolan.github.io/jq/tutorial/.'

sleep 1 && echo 'First we will get some JSON to work with using a curl command. To make it easily accessible, I have it appended to a local file called `file-of-json-stuff.json`'

sleep 2

curl 'https://api.github.com/repos/Adron/jq-tests-samples-errata/commits?per_page=5' > file-of-json-stuff.json

sleep 1 && echo 'Alright, we should have JSON in the file now. Time for some command query execution!\nThis first example takes the first commit from the Github JSON example.'

sleep 2 && echo 'The . means take the content, and the [0] extracts the first element of content.'

cat file-of-json-stuff.json | jq '.[0]'

sleep 2 && echo 'Next command provides a filtered result from the JSON array.'

cat file-of-json-stuff.json | jq '.[] | {message: .commit.message, name: .commit.committer.name}'

cat file-of-json-stuff.json | jq '.[] | {name: .commit.committer.name}'

sleep 2 && echo 'Next is an example to get specific nested information from the JSON file.'

cat file-of-json-stuff.json | jq '[.[] | {message: .commit.message, name: .commit.committer.name, parents: [.parents[].html_url]}]'

sleep 2 && echo 'Retrieving a specific record.'

cat file-of-json-stuff.json | jq '.[] | select(.author.login == "Adron")'

