default basedir = FLUX_DIR;

basedir|
read-dir|
filter-strings(".*\\.beacon", passmatches="true")|
open-file|
read-beacon(metadatafilter="name|linkname|category")|
stream-to-triples|
sort-triples(by="subject")|
collect-triples|
morph(basedir + "morph-test.xml")|
encode-json|
write(basedir+"combinedBeacons.JSON", separator=",\n", header="{\"beaconMappings\":[", footer="]}");
