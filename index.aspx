<%@ Page Title="Montgomery County Public Schools, Rockville, MD" Language="VB" MasterPageFile="mcps.master" AutoEventWireup="false" %>
<%@OutputCache Duration="60" VaryByParam="none" %>
<%@ Register Src="~/MCPSWebUserControls/2011/tronContentBlockDetail.ascx" TagName="ContentDetail" TagPrefix="Tron" %>
<%@ Register Src="~/MCPSWebUserControls/2011/homePageStories.ascx" TagName="HomeStories" TagPrefix="Tron" %>
<%@ Register Src="~/MCPSWebUserControls/RememberanceCalendar.ascx" TagName="RememberCalendar" TagPrefix="Tron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script>

var rotateSpeed = 12000; // Milliseconds to wait until switching tabs.
var currentTab = 0; // Set to a different number to start on a different tab.
var numTabs;
var autoRotate;

function openTab(clickedTab) {
   var thisTab = $("#news #storyselector li a").index(clickedTab);
   $("#news #storyselector li").removeClass("selected");
   $("#news #storyselector li:eq("+thisTab+")").addClass("selected");
   $("#news .tabbed-content").hide();
   $("#news .tabbed-content:eq("+thisTab+")").show();
   currentTab = thisTab;
}

function rotateTabs() {
   var nextTab = (currentTab == (numTabs - 1)) ? 0 : currentTab + 1;
   openTab($("#news #storyselector li a:eq("+nextTab+")"));
}

$(document).ready(function() {
  $("#storylist").attr('id', 'storyselector');
  $("#tabs-1").addClass('tabbed-content');
  $("#tabs-2").addClass('tabbed-content');
  $("#tabs-3").addClass('tabbed-content');
  $("#tabs-4").addClass('tabbed-content');
  $("hr").hide();

  $(".equal").equalHeights();
	$(".equal2").equalHeights();
	
	$(".tabbed-content").equalHeights();
  numTabs = $("#news #storyselector li a").length;
   
  $("#news #storyselector li a").click(function() { 
    openTab($(this)); return false; 
  });
   
  autoRotate = setInterval("rotateTabs()", rotateSpeed);   
  $("#news #storyselector li a:eq("+currentTab+")").click()   
});
</script>

<!-- <p class="padded"><strong>For staff:</strong> <a href="migration.html">View status and availability of online systems.</a></p>  -->

 <Tron:HomeStories ID="topNews"  runat="server" ContentID="17762"/>  
<!-- /#news -->
 <Tron:ContentDetail ID="MiddleBar" ContentID ="165466" runat="server" /> 
 <div class="clear"></div>
 <Tron:ContentDetail ID="ThreeColumns" ContentID ="165467" runat="server" /> 
 <div class="clear"></div>
<div class="full capped box boxes" id="events">
	<Tron:RememberCalendar ID="homeClendar"  runat="server" ContentID="17762"/> 
</div>
<div class="clear"></div>
</asp:Content>