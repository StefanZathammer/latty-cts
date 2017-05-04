(: CroALa Pelagios :)
(: List available CITE Body URNs :)
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace cp = "http://croala.ffzg.unizg.hr/croalapelagios" at "../../repo/croalapelagios.xqm";
import module namespace vit = "http://croala.ffzg.unizg.hr/vit" at "../../repo/vitezovic.xqm";


declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := 'LatTy: Latinitas Tyroliensis - CTS indiculus';
declare variable $content := "Display available CTS URNs in LatTy digital collection.";
declare variable $keywords := "Neo-Latin literature, CTS / CITE architecture, Tyrolean Latin texts, XML";



(:~
 : This function returns an XML response message.
 :)
declare
  %rest:path("lattycts/urnlist")
  %output:method(
  "xhtml"
)
  %output:omit-xml-declaration(
  "no"
)
  %output:doctype-public(
  "-//W3C//DTD XHTML 1.0 Transitional//EN"
)
  %output:doctype-system(
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
)
  function page:lattyctslisturn()
{
  (: HTML template starts here :)

<html>
{ vit:htmlheadserver($title, $content, $keywords) }
<body text="#000000">

<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span>{ $title }</h1>
<div class="container-fluid">
<div class="col-md-6">
<p>Locus in <a href="http://croala.ffzg.unizg.hr">CroALa</a> sub specie <a href="http://commons.pelagios.org/">Pelagii</a>, { current-date() }.</p>
<p><a href="http://orcid.org/0000-0002-9119-399X">Neven Jovanović</a></p>
<p>URN indiculi CITE corporum in collectione.</p>
<p>Functio nominatur: {rest:uri()}.</p>
</div>
<div class="col-md-6">
{croala:infodb('cp')}
</div>
</div>
</div>
<div class="container-fluid">
<blockquote class="croala">
	
	{cp:listcitebodies()}
  
  
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footerserver() }

</body>
</html>
};

return



