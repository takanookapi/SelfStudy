// const password = document.getElementById('user_password');
// const passwordCheck = document.getElementById('user_password_reveal');
// console.log(password);
// try{
//   alert(password.value);
// }
// catch(e){
//   alert(e.messasge);
// }

document.addEventListener("DOMContentLoaded", function(){
  const password = document.getElementById('user_password');
  const passwordCheck = document.getElementById('user_password_reveal');
    passwordCheck.addEventListener('change', function() {
      if (passwordCheck.checked) {
        password.setAttribute('type', 'text');
      } else {
        password.setAttribute('type', 'password');
      }
  });
}, false);

// // $(document).on('turbolinks:load', 
// $("user_password_reveal").change(function(){
//   if($(this).prop('checked')){
//     $('user_password').attr('type','text');
//   }else{
//     $('user_password').attr('type','password');
//   }
// });
// });