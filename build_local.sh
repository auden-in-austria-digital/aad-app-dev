# bin/bash

echo "download app"
./fetch_data_app.sh

echo "download data"
./fetch_data_data_dev.sh

echo "download entities data"
./build_app/shell/fetch_data_entities.sh

echo "install saxon ..."
./build_app/shell/script.sh

echo "sort data"
ant -f ./build_app/ant/copy-task.xml

echo "run acdh tei pyutils"
source env/bin/activate
pip install -r ./build_app/python/requirements.txt
./build_app/shell/attributes.sh
./build_app/shell/denormalize.sh

echo "build app"
ant -f ./build_app/ant/build.xml

echo "done"