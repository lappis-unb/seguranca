from faker  import Faker
from random import choice

faker = Faker()
group_list = ['equipe-dev','equipe-infra','equipe-produto','equipe-dados','equipe-dex','equipe-pencil-labs','admin']
with open('../../user_list.txt','w') as file:
	for a in range(30):
		file.write(f"{faker.profile()['username']} PASS {faker.profile()['mail']} {choice(group_list)}\n")

print("[+] The mocked users was created sucessfully :-D")
