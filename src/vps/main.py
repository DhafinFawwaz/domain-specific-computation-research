from Bio import SeqIO

# ['_AnnotationsDict', '_AnnotationsDictValue', '__add__', '__annotations__', '__bool__', '__bytes__', '__class__', '__contains__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__firstlineno__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getstate__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__module__', '__ne__', '__new__', '__radd__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__static_attributes__', '__str__', '__subclasshook__', '__weakref__', '_from_validated', '_per_letter_annotations', '_seq', 'annotations', 'count', 'dbxrefs', 'description', 'features', 'format', 'id', 'islower', 'isupper', 'letter_annotations', 'lower', 'name', 'reverse_complement', 'seq', 'translate', 'upper']

# for record in SeqIO.parse("extract/SRR32507895.fasta", "fasta"):
#     print("="*40)
#     # print(dir(record))
#     # print("id:",record.id)
#     # print("name:", record.name)
#     # print("desc:", record.description)
#     # print("seq:", record.seq)

#     print("annotations:",record.annotations)
#     # print(record.count)
#     print("dbxrefs", record.dbxrefs)
#     print("description",record.description)
#     print("features",record.features)
#     # print(record.format)
#     print("id",record.id)
#     # print(record.islower)
#     # print(record.isupper)
#     print("letter_annotations",record.letter_annotations)
#     # print(record.lower)
#     print("name",record.name)
#     # print(record.reverse_complement)
#     print("seq",record.seq)
#     # print(record.translate)
#     # print(record.upper)

# import os
# for root, dirs, files in os.walk("extract"):
#     count = 0
#     for file in files:
#         if file.endswith(".fasta"):
#             try:
#                 print("Reading file", file)
#                 for record in SeqIO.parse("extract/"+file, "fasta"):
#                     count += 1
#             except Exception as e:
#                 print("Error reading file", file)
#                 print(e)
# print(count)



for record in SeqIO.parse("extract/SRR32507895.fasta", "fasta"):
    print("="*40)
    print("id",record.id)
    print("description",record.description)
    print("seq",record.seq)