fetch('http://backend-service:3000/tasks')
  .then(res => res.json())
  .then(data => {
    console.log(data);
  });