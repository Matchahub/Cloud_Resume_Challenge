const api_url = "https://o6qugfooia.execute-api.us-east-1.amazonaws.com/dev";

fetch(api_url)
  .then((response) => {
    return response.json();
  })
  .then((data) => {
    // Update the page with the visitor count from DynamoDB
    document.getElementById("count").innerHTML = "Resume views: " + data;
  })
  .catch(function (error) {
    // Handle any errors that occur during the request
    console.log(error);
  });

// const countElement = document.getElementById('count');

// function updateVisitorCount() {
//   fetch('https://o6qugfooia.execute-api.us-east-1.amazonaws.com/dev')
//     .then(res => res.json())
//     .then(res => {
//       // Update the page with visitor count from DynamoDB
//       countElement.innerHTML = "Resume Views: " + res.count;
//     })
//     .catch(function (error) {
//      // Handle any errors that occur during the request
//      console.log(error);   
//     })
// };

// updateVisitorCount();