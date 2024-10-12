## Creating Identity Provider (IdP) and Trust policies for GitHub Actions to access AWS

- Create an Identity Provider in AWS IAM

  - Navigate to IAM: Go to the AWS Management Console, then to the IAM service.

  - Add Identity Provider:

  - Select Identity providers from the sidebar.

  - Click on Add provider.

  - Choose OpenID Connect as the provider type.

  - Enter GitHub as the provider name and use the following URL for the provider URL: https://token.actions.githubusercontent.com

  - Set the audience (optional): sts.amazonaws.com

- Create a Role with Trust Policy

  - In IAM, select Roles and click Create role.

  - Choose Web identity as the trusted entity type.

  - Select the Identity Provider you just created.

  - Enter the audience as sts.amazonaws.com.

  - Trust Policy: You’ll need to define a trust policy for this role that allows GitHub Actions to assume the role. Here’s an example of a basic trust policy:

```markdown
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": {
"Federated": "arn:aws:iam::<YOUR_ACCOUNT_ID>:oidc-provider/token.actions.githubusercontent.com"
},
"Action": "sts:AssumeRoleWithWebIdentity",
"Condition": {
"StringEquals": {
"token.actions.githubusercontent.com:sub": "repo:<YOUR_GITHUB_ORG>/<YOUR_REPO>:ref:refs/heads/<YOUR_BRANCH>"
}
}
}
]
}
```

_Replace `<YOUR_ACCOUNT_ID>`, `<YOUR_GITHUB_ORG>`, `<YOUR_REPO>`, and `<YOUR_BRANCH>` with your specific values._

- Attach Permissions Policy

  - Define Permissions: Attach a permissions policy to the role that grants the necessary permissions for the actions your GitHub workflows will perform (e.g., access to S3, Lambda, etc.).

- Configure GitHub Actions Workflow

  - In your GitHub Actions workflow file (e.g., .github/workflows/your-workflow.yml), use the aws-actions/configure-aws-credentials action to assume the role:

```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
          role-to-assume: arn:aws:iam::<YOUR_ACCOUNT_ID>:role/<YOUR_ROLE_NAME>`

```
