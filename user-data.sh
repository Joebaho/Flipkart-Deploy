#!/bin/bash

# Update and install Nginx
sudo apt update
sudo apt install -y nginx

# Create basic HTML page
sudo cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>CodeDeploy Project - CodePipeline</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { background: #232f3e; color: white; padding: 20px; border-radius: 5px; }
        .content { background: #f5f5f5; padding: 20px; border-radius: 5px; margin-top: 20px; }
        .success { color: #008000; }
        .info { color: #0066cc; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🚀 AWS & Terraform & Nginx Deployment</h1>
        </div>
        <div class="content">
            <h2 class="success">✅ Deployment Successful!</h2>
            <p>This application was deployed using:</p>
            <ul>
                <li><strong>NGINX</strong> - Web Page</li>
                <li><strong>Terraform</strong> - Infrastructure as Code</li>
            </ul>
            <p class="info">Deployment triggered automatically on code changes to the GitHub repository.</p>
            <hr>
            <p><strong>Region:</strong> ${AWS_REGION}</p>
            <p><strong>Deployment Time:</strong> <span id="datetime"></span></p>
        </div>
    </div>
    
    <script>
        document.getElementById('datetime').textContent = new Date().toLocaleString();
    </script>
</body>
</html>
EOF

# Start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Nginx installation completed"