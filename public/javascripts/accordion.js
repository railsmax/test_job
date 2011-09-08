//Structure of html should be like this: div(id=accordion)(p|div p|div .. etc.) p-header div class="content" - content
function Accordion(InitialState,Closable){
Jq(document).ready(function(){
  AllHeaders = Jq('div#accordion').find("p"); 

  AllHeaders.each(function(){    
    Jq(this).next().hide(); //hide all divs text     
    // add a into header tag p 
    text = Jq(this).text();
    Jq(this).empty();
    Jq(this).html('<a href ="#">'+text+'</a>');
   
    //enshure that width for accordion as accordion div
    CurrentWidth = Jq('#accordion').width();
    Jq(this).width(CurrentWidth); 
    // each header(p) onclick:     
    Jq(this).bind('click', function(){                  
      LastActiveElement = Jq('#activeSliderAccrodion') // this is open element            
      CurrentId = Jq(this).next().attr('id')
      
      if (LastActiveElement != undefined){CloseOpenElement(LastActiveElement,'close')};// we remove id from it and hide it      
      
      // if we need closable element so second param in function should be 'closable' else open tab would not collapse.
      if(Closable=='closable'){
        if (CurrentId != 'activeSliderAccrodion'){CloseOpenElement(Jq(this).next(),'open');} 
      }
      else{ CloseOpenElement(Jq(this).next(),'open'); };                    
    })             
    });
    
    if(InitialState == 'open'){
      ActiveElement = AllHeaders.first();
      ActiveElement.next().attr('id', 'activeSliderAccrodion');
      ActiveElement.next().show();   
    };
}); 
}
  
  function CloseOpenElement(Element,State){
    if (State == 'open'){
      Element.attr('id', 'activeSliderAccrodion'); // we set div, under clicked header id = activeSliderAccrodion            
      Element.slideDown('slow'); // And then show this element slowly        
    }
    if(State == 'close'){
      Element.removeAttr('id');
      Element.slideUp('slow');
    }      
  }
