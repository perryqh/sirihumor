jQuery(document).ready(function($) {
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");

  jQuery.getScript(gaJsHost + "google-analytics.com/ga.js", function(){
    _gaq.push(['_setAccount', 'UA-26482258-1']);
    _gaq.push(['_trackPageview']);
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  });
});

