
  $(document).ready(function(){
    $('.linkSignUp').click(function(){
      event.preventDefault();
      $('#exampleModal2').modal('hide');
      $('#exampleModal1').modal('show')
    });
    $('.linkLogIn').click(function(){
      event.preventDefault();
      $('#exampleModal1').modal('hide');
      $('#exampleModal2').modal('show')
    });
  });
 
  