# Ubuntu Custom ISO Builder - GbrlSouza

Este repositório automatiza a criação de uma **ISO personalizada baseada no Ubuntu** com o nome **"GbrlSouza-Ubuntu.iso"**, usando o **GitHub Actions** para construção e o **TeraBox** para armazenamento do arquivo gerado.

## Descrição

O objetivo deste repositório é fornecer uma maneira simples e automatizada de gerar uma ISO personalizada do Ubuntu, incluindo um arquivo Kickstart para configuração personalizada. Após a construção da ISO, ela é automaticamente carregada para o **TeraBox**, permitindo que você baixe a ISO de qualquer lugar, sem se preocupar com os limites de armazenamento do GitHub.

## Funcionalidades

- Criação automatizada da ISO personalizada do Ubuntu via GitHub Actions.
- Nome da ISO gerada: `GbrlSouza-Ubuntu.iso`.
- Armazenamento da ISO no **TeraBox**, proporcionando maior espaço de armazenamento.
- Personalização do Ubuntu por meio de arquivos **Kickstart**.

## Como Funciona

### Fluxo do Processo

1. **Configuração do GitHub Actions**:
   - O arquivo `.github/workflows/build-iso.yml` é configurado para automatizar a criação da ISO e o upload para o TeraBox.
   
2. **Arquivo Kickstart**:
   - O arquivo `your-kickstart-file.ks` define a personalização do Ubuntu, incluindo pacotes, configurações de rede e usuário.
   
3. **GitHub Actions**:
   - O pipeline do GitHub Actions compila a ISO com base no arquivo Kickstart e depois envia o arquivo gerado para o TeraBox usando **Rclone**.

### Tecnologias Usadas

- **GitHub Actions**: Para automação da criação da ISO e upload para o TeraBox.
- **Ubuntu**: Sistema base para a ISO personalizada.
- **Rclone**: Para sincronização e upload da ISO para o TeraBox.
- **TeraBox**: Armazenamento da ISO gerada.

## Configuração e Uso

### 1. Configuração do Repositório

1. Clone este repositório para seu ambiente local:
   ```bash
   git clone https://github.com/GbrlSouza/ubuntu-custom-iso.git
   ```

2. **Personalize o arquivo Kickstart** (`your-kickstart-file.ks`):
   - Edite o arquivo Kickstart para atender às suas necessidades de personalização.
   - Abaixo está um exemplo básico de arquivo Kickstart:
     ```bash
     #version=RHEL7
     install
     cdrom
     lang en_US.UTF-8
     keyboard us
     timezone --utc America/Sao_Paulo
     rootpw --iscrypted $6$rounds=656000$S8LmDzhs9vCO7.xm$...
     user --name=gbrlsouza --password=...
     reboot
     %packages
     @core
     %end
     ```

3. **Adicione suas credenciais do Rclone ao GitHub**:
   - Gere uma configuração do **Rclone** para acessar o TeraBox.
   - Adicione o conteúdo do arquivo `rclone.conf` como um **secret** no GitHub:
     - Vá até **Settings > Secrets and variables > Actions**.
     - Crie uma variável chamada `RCLONE_CONFIG` e cole o conteúdo do seu arquivo `rclone.conf`.

### 2. Executando o Workflow

1. **Push para o Repositório**:
   - Após configurar o arquivo Kickstart e as credenciais do Rclone, faça um **push** para o repositório.

   ```bash
   git add .
   git commit -m "Initial commit with Kickstart file and GitHub Actions workflow"
   git push origin main
   ```

2. **Acompanhe o Workflow**:
   - Acesse a aba **Actions** no GitHub para monitorar a execução do workflow.
   - O GitHub Actions irá gerar a ISO personalizada com o nome `GbrlSouza-Ubuntu.iso`.

### 3. Baixando a ISO

- Após a conclusão da execução do workflow, a ISO será carregada no **TeraBox** no diretório `my-folder/`.
- Acesse sua conta TeraBox e baixe a ISO diretamente.

## Personalização

Você pode personalizar a criação da ISO da seguinte maneira:

- **Pacotes**: No arquivo Kickstart, adicione ou remova pacotes conforme necessário.
- **Configurações de Sistema**: Ajuste as configurações de idioma, teclado, rede e usuário no arquivo Kickstart.
- **TeraBox**: Se desejar, pode alterar o diretório onde a ISO será armazenada no TeraBox, editando a configuração do Rclone no workflow.

## Limitações

- O GitHub Actions tem um **limite de 6 horas por execução**, então o processo de criação da ISO deve ser concluído dentro desse tempo.
- A ISO não deve exceder **10 GB**, que é o limite de armazenamento por artefato no GitHub Actions.

## Contribuições

Se você deseja contribuir para este projeto, sinta-se à vontade para abrir **issues** ou **pull requests**. Fique à vontade para melhorar o processo de criação da ISO ou adicionar novas funcionalidades!

---

**Licença**: Este projeto é licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para mais detalhes.