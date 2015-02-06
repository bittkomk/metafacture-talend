default basedir = FLUX_DIR;

basedir|
read-dir|
filter-strings(".*\\.beacon", passmatches="true")|
open-file|
read-beacon(metadatafilter="name|isil")|
stream-to-triples|
sort-triples(by="subject")|
collect-triples|
morph(basedir + "morph-test.xml")|
encode-json|
write("stdout", separator=",\n", header="{\"beaconMappings\":[", footer="]}");
