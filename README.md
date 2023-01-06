# Cloud_Resume_Challenge
My CV built using AWS services (from the Cloud Resume Challenge)

1. Found a simple HTML template with CSS online to create the look of my resume website.

2. Created AWS root account and IAM account to host all the infrastructure for the project.

3. Created an S3 bucket via CLI and configured the bucket such that static web hosting was enabled.

4. Created Cloudfront distribution for HTTPS and set the S3 bucket as the origin. Enabled Origin Access Control (OAC) settings in order to restrict bucket access via only the cloudfront endpoint. Bucket policy was subsequently updated to allow only the cloudfront service principal to access the bucket contents (i.e. any request for content is allowed if the request is on behalf of the Cloudfront distribution). Ultimately, these steps achieve keeping the bucket as private, whilst still allowing public access to content.

5. Purchased the cloudcheung.co.uk domain name and created a hosted zone in Route53. Added NS servers from DNS records in Route53 to the domain registrar associated with cloudcheung.co.uk. Subsequently used AWS Certificate Manager (ACM) to request and obtain an SSL certificate via DNS validation (created in us-east-1 as only this region supports certificates being used with Cloudfront)

6. Created a DynamoDB table, which is used to store a count of the number of times that the resume site has been visited on the internet. A partition key and attribute called counter_value was created and initialised at zero.

7. A lambda function was created using Python as the runtime alongside the Boto3 SDK. Every time the function is invoked, it will retrieve the value of counter_value from DynamoDB and then increments the value by 1. 

8. API Gateway was used to integrate the DynamoDB table and Lambda function (API Gateway is the Lambda trigger in this case). Created an API endpoint that enables a POST request to be made from the frontend everytime the webpage is loaded or refreshed. The API endpoint is referenced in a Javascript file on the frontend hosted on S3. CORS was enabled before deploying the API.

9. A simple Cypress test was written that checks if the API endpoint returns a response (so-called hearbeat check).

10. CICD (In progress)

Future improvements: Configure the entire infrastructure using Infrastructure as Code (Terraform)
