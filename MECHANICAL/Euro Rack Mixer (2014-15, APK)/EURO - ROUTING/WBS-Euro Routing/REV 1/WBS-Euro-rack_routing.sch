<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.6.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="APK - PARTS">
<description>&lt;b&gt;Neosid Chokes and Transformers&lt;/b&gt;&lt;p&gt;

Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Electronic Component Book, Part 2 : Chokes, Fixed Value Inductors
&lt;li&gt;Part 3 : Filters, Coil Assemblies, Thermoplastic Parts
&lt;li&gt;Part 4 : SMD Filters, Coils, Fixed Value Inductors
&lt;li&gt;www.neosid.de
&lt;/ul&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="WBS_079">
<pad name="P$2" x="0" y="0" drill="0.8" shape="offset"/>
<pad name="P$1" x="0" y="2.5" drill="0.8" shape="offset"/>
<pad name="P$3" x="0" y="-2.5" drill="0.8" shape="offset"/>
<pad name="P$6" x="-2.5" y="-2.5" drill="0.8" shape="offset" rot="R180"/>
<pad name="P$5" x="-2.5" y="0" drill="0.8" shape="offset" rot="R180"/>
<pad name="P$4" x="-2.5" y="2.5" drill="0.8" shape="offset" rot="R180"/>
<wire x1="-5.5" y1="-4.75" x2="3.5" y2="-4.75" width="0.127" layer="21"/>
<wire x1="3.5" y1="-4.75" x2="3.5" y2="-3" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3" x2="3.5" y2="3" width="0.127" layer="21"/>
<wire x1="3.5" y1="3" x2="3.5" y2="4.75" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-4.75" x2="-5.5" y2="4.5" width="0.127" layer="21"/>
<wire x1="-5.5" y1="4.5" x2="-5.5" y2="4.75" width="0.127" layer="21"/>
<wire x1="-5.5" y1="4.75" x2="-5.5" y2="4.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="4.75" x2="-5.5" y2="4.75" width="0.127" layer="21"/>
<wire x1="8.5" y1="-3" x2="8.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="8.5" y1="-1.5" x2="8.5" y2="0" width="0.127" layer="21"/>
<wire x1="8.5" y1="0" x2="8.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="8.5" y1="1.5" x2="8.5" y2="3" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3" x2="4.5" y2="-3" width="0.127" layer="21"/>
<wire x1="4.5" y1="-3" x2="5.5" y2="-3" width="0.127" layer="21"/>
<wire x1="5.5" y1="-3" x2="6.5" y2="-3" width="0.127" layer="21"/>
<wire x1="6.5" y1="-3" x2="7.5" y2="-3" width="0.127" layer="21"/>
<wire x1="7.5" y1="-3" x2="8.5" y2="-3" width="0.127" layer="21"/>
<wire x1="8.5" y1="3" x2="7.5" y2="3" width="0.127" layer="21"/>
<wire x1="7.5" y1="3" x2="6.5" y2="3" width="0.127" layer="21"/>
<wire x1="6.5" y1="3" x2="5.5" y2="3" width="0.127" layer="21"/>
<wire x1="5.5" y1="3" x2="4.5" y2="3" width="0.127" layer="21"/>
<wire x1="4.5" y1="3" x2="3.5" y2="3" width="0.127" layer="21"/>
<wire x1="4.5" y1="-3" x2="3.5" y2="3" width="0.127" layer="21"/>
<wire x1="5.5" y1="-3" x2="4.5" y2="3" width="0.127" layer="21"/>
<wire x1="6.5" y1="-3" x2="5.5" y2="3" width="0.127" layer="21"/>
<wire x1="7.5" y1="-3" x2="6.5" y2="3" width="0.127" layer="21"/>
<wire x1="8.5" y1="-3" x2="7.5" y2="3" width="0.127" layer="21"/>
<wire x1="8.5" y1="1.5" x2="23.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="8.5" y1="-1.5" x2="23.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="23.5" y1="-1.5" x2="23.5" y2="1.5" width="0.127" layer="21"/>
<text x="-5.08" y="3.81" size="0.635" layer="25">&gt;NAME</text>
</package>
<package name="WBS_10-081">
<pad name="P$3" x="0" y="-2.5" drill="0.8" shape="offset"/>
<pad name="P$2" x="0" y="0" drill="0.8" shape="offset"/>
<pad name="P$1" x="0" y="2.5" drill="0.8" shape="offset"/>
<pad name="P$4" x="-2.5" y="2.5" drill="0.8" shape="offset" rot="R180"/>
<pad name="P$5" x="-2.5" y="0" drill="0.8" shape="offset" rot="R180"/>
<pad name="P$6" x="-2.5" y="-2.5" drill="0.8" shape="offset" rot="R180"/>
<pad name="P$8" x="-9" y="-2.5" drill="0.8" shape="square"/>
<pad name="P$7" x="-9" y="2.5" drill="0.8" shape="square"/>
<pad name="P$10" x="-15.5" y="-2.5" drill="0.8" shape="square"/>
<pad name="P$9" x="-15.5" y="2.5" drill="0.8" shape="square"/>
<wire x1="-17" y1="-4.75" x2="-17" y2="4.75" width="0.127" layer="21"/>
<wire x1="-17" y1="-4.75" x2="5" y2="-4.75" width="0.127" layer="21"/>
<wire x1="5" y1="-4.75" x2="5" y2="-3" width="0.127" layer="21"/>
<wire x1="5" y1="-3" x2="5" y2="3" width="0.127" layer="21"/>
<wire x1="5" y1="3" x2="5" y2="4.75" width="0.127" layer="21"/>
<wire x1="5" y1="4.75" x2="-17" y2="4.75" width="0.127" layer="21"/>
<wire x1="6" y1="-3" x2="5.5" y2="3" width="0.127" layer="21"/>
<wire x1="5" y1="-3" x2="6" y2="-3" width="0.127" layer="21"/>
<wire x1="6" y1="-3" x2="7" y2="-3" width="0.127" layer="21"/>
<wire x1="7" y1="-3" x2="8" y2="-3" width="0.127" layer="21"/>
<wire x1="8" y1="-3" x2="9" y2="-3" width="0.127" layer="21"/>
<wire x1="9" y1="-3" x2="10" y2="-3" width="0.127" layer="21"/>
<wire x1="5" y1="3" x2="5.5" y2="3" width="0.127" layer="21"/>
<wire x1="5.5" y1="3" x2="6.5" y2="3" width="0.127" layer="21"/>
<wire x1="6.5" y1="3" x2="7.5" y2="3" width="0.127" layer="21"/>
<wire x1="7.5" y1="3" x2="8.5" y2="3" width="0.127" layer="21"/>
<wire x1="8.5" y1="3" x2="9.5" y2="3" width="0.127" layer="21"/>
<wire x1="9.5" y1="3" x2="10" y2="3" width="0.127" layer="21"/>
<wire x1="10" y1="-3" x2="10" y2="-1.25" width="0.127" layer="21"/>
<wire x1="10" y1="-1.25" x2="10" y2="1.25" width="0.127" layer="21"/>
<wire x1="10" y1="1.25" x2="10" y2="3" width="0.127" layer="21"/>
<wire x1="7" y1="-3" x2="6.5" y2="3" width="0.127" layer="21"/>
<wire x1="8" y1="-3" x2="7.5" y2="3" width="0.127" layer="21"/>
<wire x1="9" y1="-3" x2="8.5" y2="3" width="0.127" layer="21"/>
<wire x1="10" y1="-3" x2="9.5" y2="3" width="0.127" layer="21"/>
<wire x1="10" y1="-1.25" x2="25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="10" y1="1.25" x2="25" y2="1.25" width="0.127" layer="21"/>
<wire x1="25" y1="1.25" x2="25" y2="-1.25" width="0.127" layer="21"/>
<text x="-15.24" y="0" size="0.635" layer="25">&gt;NAME</text>
</package>
<package name="WBS_DPDT_SWITCH">
<pad name="P$1" x="1.25" y="2.5" drill="0.8" shape="octagon"/>
<pad name="P$2" x="1.25" y="0" drill="0.8" shape="octagon"/>
<pad name="P$3" x="1.25" y="-2.5" drill="0.8" shape="octagon"/>
<pad name="P$4" x="-1.25" y="2.5" drill="0.8" shape="octagon"/>
<pad name="P$5" x="-1.25" y="0" drill="0.8" shape="octagon"/>
<pad name="P$6" x="-1.25" y="-2.5" drill="0.8" shape="octagon"/>
<wire x1="3.75" y1="4.5" x2="3.75" y2="-8.5" width="0.127" layer="21"/>
<wire x1="3.75" y1="6.5" x2="3.75" y2="4.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="6.5" x2="3.75" y2="6.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="6.5" x2="-3.75" y2="4.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="4.5" x2="-3.75" y2="-8.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="-8.5" x2="-1.5" y2="-8.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-8.5" x2="2" y2="-8.5" width="0.127" layer="21"/>
<wire x1="2" y1="-8.5" x2="3.75" y2="-8.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-8.5" x2="-1.5" y2="-18.5" width="0.127" layer="21"/>
<wire x1="2" y1="-8.5" x2="2" y2="-18.5" width="0.127" layer="21"/>
<wire x1="2" y1="-18.5" x2="-1.5" y2="-18.5" width="0.127" layer="21"/>
<text x="2.54" y="5.08" size="0.635" layer="25" rot="SR270">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="WBS_010_081_DUAL_SWITCH">
<pin name="CCW" x="-12.7" y="2.54" visible="off" length="middle"/>
<pin name="CW" x="10.16" y="2.54" visible="off" length="middle" rot="R180"/>
<pin name="WIPER" x="0" y="-5.08" visible="off" length="middle" rot="R90"/>
<wire x1="-6.35" y1="2.54" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="-3.81" y2="0" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="0" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="5.08" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="3.81" y2="0" width="0.254" layer="94"/>
<wire x1="3.81" y1="0" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.35" y2="2.54" width="0.254" layer="94"/>
<text x="-12.7" y="7.62" size="1.778" layer="95">&gt;NAME</text>
</symbol>
<symbol name="SWITCH">
<pin name="P$1" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="P$2" x="7.62" y="0" visible="pad" length="middle" rot="R180"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="-5.08" size="1.778" layer="95">&gt;NAME</text>
</symbol>
<symbol name="DPD_SWITCH">
<pin name="W" x="-5.08" y="0" visible="off" length="middle"/>
<pin name="O" x="10.16" y="5.08" visible="off" length="middle" rot="R180"/>
<pin name="C" x="10.16" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="0" y1="0" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-5.08" y="-2.54" size="1.27" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="WBS_10-079_POT">
<gates>
<gate name="G$1" symbol="WBS_010_081_DUAL_SWITCH" x="0" y="0"/>
<gate name="G$2" symbol="WBS_010_081_DUAL_SWITCH" x="0" y="-17.78"/>
</gates>
<devices>
<device name="" package="WBS_079">
<connects>
<connect gate="G$1" pin="CCW" pad="P$1"/>
<connect gate="G$1" pin="CW" pad="P$3"/>
<connect gate="G$1" pin="WIPER" pad="P$2"/>
<connect gate="G$2" pin="CCW" pad="P$4"/>
<connect gate="G$2" pin="CW" pad="P$6"/>
<connect gate="G$2" pin="WIPER" pad="P$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="WBS_10-081_DUALPOT+DUALSWITCH">
<gates>
<gate name="G$1" symbol="WBS_010_081_DUAL_SWITCH" x="0" y="25.4"/>
<gate name="G$2" symbol="WBS_010_081_DUAL_SWITCH" x="0" y="7.62"/>
<gate name="G$3" symbol="SWITCH" x="17.78" y="-10.16"/>
<gate name="G$4" symbol="SWITCH" x="17.78" y="-20.32"/>
</gates>
<devices>
<device name="" package="WBS_10-081">
<connects>
<connect gate="G$1" pin="CCW" pad="P$1"/>
<connect gate="G$1" pin="CW" pad="P$3"/>
<connect gate="G$1" pin="WIPER" pad="P$2"/>
<connect gate="G$2" pin="CCW" pad="P$4"/>
<connect gate="G$2" pin="CW" pad="P$6"/>
<connect gate="G$2" pin="WIPER" pad="P$5"/>
<connect gate="G$3" pin="P$1" pad="P$7"/>
<connect gate="G$3" pin="P$2" pad="P$8"/>
<connect gate="G$4" pin="P$1" pad="P$9"/>
<connect gate="G$4" pin="P$2" pad="P$10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="WBS_DPDT">
<gates>
<gate name="G$1" symbol="DPD_SWITCH" x="0" y="0"/>
<gate name="G$2" symbol="DPD_SWITCH" x="0" y="-12.7"/>
</gates>
<devices>
<device name="" package="WBS_DPDT_SWITCH">
<connects>
<connect gate="G$1" pin="C" pad="P$3"/>
<connect gate="G$1" pin="O" pad="P$1"/>
<connect gate="G$1" pin="W" pad="P$2"/>
<connect gate="G$2" pin="C" pad="P$6"/>
<connect gate="G$2" pin="O" pad="P$4"/>
<connect gate="G$2" pin="W" pad="P$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lsta">
<description>&lt;b&gt;Female Headers etc.&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
FE = female&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="FE13-2">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<wire x1="-16.51" y1="-2.413" x2="-16.51" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="2.413" x2="-15.875" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.51" y1="-2.413" x2="-15.875" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.875" y1="3.048" x2="15.875" y2="3.048" width="0.1524" layer="21"/>
<wire x1="16.51" y1="-2.413" x2="16.51" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-3.048" x2="15.875" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="15.875" y1="3.048" x2="16.51" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.875" y1="-3.048" x2="16.51" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<circle x="-15.24" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-15.24" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-12.7" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-12.7" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-10.16" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-10.16" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-7.62" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-7.62" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-5.08" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-5.08" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-15.24" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-15.24" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-12.7" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-10.16" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-7.62" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-5.08" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-12.7" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-10.16" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-7.62" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-5.08" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-2.54" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-2.54" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="0" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="0" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="2.54" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="2.54" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="5.08" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="5.08" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="7.62" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="7.62" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-2.54" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-2.54" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="0" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="2.54" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="5.08" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="7.62" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="0" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="2.54" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="5.08" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="7.62" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="10.16" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="10.16" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="12.7" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="12.7" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="15.24" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="15.24" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="10.16" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="10.16" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="12.7" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="15.24" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="12.7" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="15.24" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<pad name="1" x="-15.24" y="1.27" drill="0.9144"/>
<pad name="2" x="-15.24" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-12.7" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-12.7" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="-10.16" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="-10.16" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="-7.62" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="-7.62" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="-5.08" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="-5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="11" x="-2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="12" x="-2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="13" x="0" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="14" x="0" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="15" x="2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="16" x="2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="17" x="5.08" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="18" x="5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="19" x="7.62" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="20" x="7.62" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="21" x="10.16" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="22" x="10.16" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="23" x="12.7" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="24" x="12.7" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="25" x="15.24" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="26" x="15.24" y="-1.27" drill="0.9144" shape="octagon"/>
<text x="-10.16" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-15.621" y="3.429" size="1.27" layer="21" ratio="10">1</text>
<text x="14.351" y="-4.699" size="1.27" layer="21" ratio="10">26</text>
<text x="-16.51" y="-4.699" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="FE08-2">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-2.413" x2="-10.16" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.413" x2="-9.525" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-10.16" y1="-2.413" x2="-9.525" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.525" y1="3.048" x2="9.525" y2="3.048" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-2.413" x2="10.16" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-3.048" x2="9.525" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="9.525" y1="3.048" x2="10.16" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="9.525" y1="-3.048" x2="10.16" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<circle x="-8.89" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-8.89" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-6.35" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-6.35" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-3.81" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-3.81" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-1.27" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-1.27" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="1.27" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="1.27" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-8.89" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-8.89" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-6.35" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-3.81" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="1.27" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-6.35" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-3.81" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="1.27" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="3.81" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="3.81" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="6.35" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="6.35" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="8.89" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="8.89" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="3.81" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="3.81" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="6.35" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="8.89" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="6.35" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="8.89" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<pad name="1" x="-8.89" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="2" x="-8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="-3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="-3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="-1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="-1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="11" x="3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="12" x="3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="13" x="6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="14" x="6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="15" x="8.89" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="16" x="8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-9.271" y="3.429" size="1.27" layer="21" ratio="10">1</text>
<text x="8.001" y="-4.699" size="1.27" layer="21" ratio="10">16</text>
<text x="-10.16" y="-4.699" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="FE13-2">
<wire x1="3.81" y1="-17.78" x2="-3.81" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="-1.905" y1="-10.795" x2="-1.905" y2="-9.525" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-13.335" x2="-1.905" y2="-12.065" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-15.875" x2="-1.905" y2="-14.605" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-9.525" x2="1.905" y2="-10.795" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-12.065" x2="1.905" y2="-13.335" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-14.605" x2="1.905" y2="-15.875" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-5.715" x2="-1.905" y2="-4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-8.255" x2="-1.905" y2="-6.985" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-6.985" x2="1.905" y2="-8.255" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-0.635" x2="-1.905" y2="0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-3.175" x2="-1.905" y2="-1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="3.175" x2="1.905" y2="1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="-3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="6.985" x2="-1.905" y2="8.255" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="4.445" x2="-1.905" y2="5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="8.255" x2="1.905" y2="6.985" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="5.715" x2="1.905" y2="4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="14.605" x2="-1.905" y2="15.875" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="12.065" x2="-1.905" y2="13.335" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="9.525" x2="-1.905" y2="10.795" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="15.875" x2="1.905" y2="14.605" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="13.335" x2="1.905" y2="12.065" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="10.795" x2="1.905" y2="9.525" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-3.81" y1="17.78" x2="-3.81" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-17.78" x2="3.81" y2="17.78" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="17.78" x2="3.81" y2="17.78" width="0.4064" layer="94"/>
<text x="-3.81" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="18.542" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-7.62" y="-15.24" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="3" x="-7.62" y="-12.7" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="5" x="-7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="2" x="7.62" y="-15.24" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="-12.7" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="9" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="8" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="10" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="11" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="13" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="15" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="12" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="14" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="16" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="17" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="19" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="18" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="20" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="21" x="-7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="23" x="-7.62" y="12.7" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="25" x="-7.62" y="15.24" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="22" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="24" x="7.62" y="12.7" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="26" x="7.62" y="15.24" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="FE08-2">
<wire x1="3.81" y1="-10.16" x2="-3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-1.905" y1="-3.175" x2="-1.905" y2="-1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-5.715" x2="-1.905" y2="-4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-8.255" x2="-1.905" y2="-6.985" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="-3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-6.985" x2="1.905" y2="-8.255" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-0.635" x2="-1.905" y2="0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="3.175" x2="1.905" y2="1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="9.525" x2="-1.905" y2="10.795" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="6.985" x2="-1.905" y2="8.255" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="4.445" x2="-1.905" y2="5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="10.795" x2="1.905" y2="9.525" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="8.255" x2="1.905" y2="6.985" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="5.715" x2="1.905" y2="4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-3.81" y1="12.7" x2="-3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-10.16" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="12.7" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<text x="-3.81" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="13.462" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="3" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="5" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="2" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="9" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="8" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="10" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="11" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="13" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="15" x="-7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="12" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="14" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="16" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FE13-2" prefix="SV" uservalue="yes">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="FE13-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FE13-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FE08-2" prefix="SV" uservalue="yes">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="FE08-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FE08-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-tycoelectronics">
<description>&lt;b&gt;Tyco Electronics Connector&lt;/b&gt;&lt;p&gt;
http://catalog.tycoelectronics.com&lt;br&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="RJ45-SHIELD2">
<description>&lt;b&gt;RJ45 Low Profile&lt;/b&gt; Shield Type 2&lt;p&gt;
For all RJ45 L, LC, LCT and X Series Models&lt;br&gt;
Source: www.tycoelectronics.com .. ENG_DS_1654001_1099_RJ_L_0507.pdf</description>
<wire x1="8.777" y1="-3.151" x2="8.777" y2="-7.147" width="0.2032" layer="51"/>
<wire x1="-8.777" y1="-7.147" x2="-8.777" y2="-3.151" width="0.2032" layer="51"/>
<wire x1="-8.777" y1="10.819" x2="8.777" y2="10.819" width="0.2032" layer="21"/>
<wire x1="9.7155" y1="-8.18" x2="-9.7155" y2="-8.18" width="0.01" layer="20"/>
<wire x1="8.777" y1="-10.322" x2="-8.777" y2="-10.322" width="0.2032" layer="21"/>
<wire x1="-8.777" y1="-10.322" x2="-8.777" y2="-6.961" width="0.2032" layer="21"/>
<wire x1="8.777" y1="-6.961" x2="8.777" y2="-10.322" width="0.2032" layer="21"/>
<wire x1="-8.777" y1="6.823" x2="-8.777" y2="10.819" width="0.2032" layer="51"/>
<wire x1="8.777" y1="10.819" x2="8.777" y2="6.823" width="0.2032" layer="51"/>
<wire x1="-8.777" y1="-3.337" x2="-8.777" y2="7.009" width="0.2032" layer="21"/>
<wire x1="8.777" y1="7.009" x2="8.777" y2="-3.337" width="0.2032" layer="21"/>
<pad name="4" x="-0.635" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="3" x="-1.905" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="2" x="-3.175" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="5" x="0.635" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="1" x="-4.445" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="6" x="1.905" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="S1" x="-8.128" y="-5.33" drill="1.9" diameter="2.5"/>
<pad name="S2" x="8.128" y="-5.33" drill="1.9" diameter="2.5"/>
<pad name="7" x="3.175" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="8" x="4.445" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="S3" x="-8.128" y="8.76" drill="1.9" diameter="2.5"/>
<pad name="S4" x="8.128" y="8.76" drill="1.9" diameter="2.5"/>
<text x="-9.525" y="-0.635" size="1.778" layer="25" rot="R90">&gt;NAME</text>
<text x="-5.715" y="2.54" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="8.85" y1="-8.175" x2="9.775" y2="-7.032" layer="21"/>
<rectangle x1="-9.775" y1="-8.175" x2="-8.85" y2="-7.032" layer="21"/>
<hole x="-5.715" y="0" drill="3.2512"/>
<hole x="5.715" y="0" drill="3.2512"/>
</package>
<package name="RJ45-SHIELD1">
<description>&lt;b&gt;RJ45 Low Profile&lt;/b&gt; Shield Type 1&lt;p&gt;
For all RJ45 N and Z Series Models&lt;br&gt;
Source: www.tycoelectronics.com .. ENG_DS_1654001_1099_RJ_L_0507.pdf</description>
<wire x1="7.777" y1="-0.611" x2="7.777" y2="-5.242" width="0.2032" layer="51"/>
<wire x1="-7.777" y1="-5.242" x2="-7.777" y2="-0.611" width="0.2032" layer="51"/>
<wire x1="-7.777" y1="10.819" x2="7.777" y2="10.819" width="0.2032" layer="21"/>
<wire x1="8.4455" y1="-5.5118" x2="-8.4455" y2="-5.5118" width="0.01" layer="20"/>
<wire x1="7.777" y1="-7.782" x2="-7.777" y2="-7.782" width="0.2032" layer="21"/>
<wire x1="-7.777" y1="-7.782" x2="-7.777" y2="-5.056" width="0.2032" layer="21"/>
<wire x1="7.777" y1="-5.056" x2="7.777" y2="-7.782" width="0.2032" layer="21"/>
<wire x1="-7.777" y1="6.823" x2="-7.777" y2="10.819" width="0.2032" layer="51"/>
<wire x1="7.777" y1="10.819" x2="7.777" y2="6.823" width="0.2032" layer="51"/>
<wire x1="-7.777" y1="-0.797" x2="-7.777" y2="7.009" width="0.2032" layer="21"/>
<wire x1="7.777" y1="7.009" x2="7.777" y2="-0.797" width="0.2032" layer="21"/>
<pad name="4" x="-0.635" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="3" x="-1.905" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="2" x="-3.175" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="5" x="0.635" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="1" x="-4.445" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="6" x="1.905" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="S1" x="-8.128" y="-3.048" drill="1.9" diameter="2.5"/>
<pad name="S2" x="8.128" y="-3.048" drill="1.9" diameter="2.5"/>
<pad name="7" x="3.175" y="6.35" drill="0.9" diameter="1.4"/>
<pad name="8" x="4.445" y="8.89" drill="0.9" diameter="1.4"/>
<pad name="S3" x="-8.128" y="8.76" drill="1.9" diameter="2.5"/>
<pad name="S4" x="8.128" y="8.76" drill="1.9" diameter="2.5"/>
<text x="-9.525" y="-0.635" size="1.778" layer="25" rot="R90">&gt;NAME</text>
<text x="-5.715" y="2.54" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="7.85" y1="-5.485" x2="8.775" y2="-4.342" layer="51"/>
<rectangle x1="-8.775" y1="-5.485" x2="-7.85" y2="-4.342" layer="51"/>
<hole x="-5.715" y="0" drill="3.2512"/>
<hole x="5.715" y="0" drill="3.2512"/>
</package>
</packages>
<symbols>
<symbol name="JACK8SHILED4">
<wire x1="-5.461" y1="-10.16" x2="-4.826" y2="-10.16" width="0.127" layer="94"/>
<wire x1="-4.064" y1="-10.16" x2="-3.556" y2="-10.16" width="0.127" layer="94"/>
<wire x1="-2.794" y1="-10.16" x2="-2.286" y2="-10.16" width="0.127" layer="94"/>
<wire x1="4.318" y1="-10.16" x2="4.572" y2="-10.16" width="0.127" layer="94"/>
<wire x1="4.572" y1="-10.16" x2="4.572" y2="-9.652" width="0.127" layer="94"/>
<wire x1="4.572" y1="9.906" x2="4.572" y2="10.414" width="0.127" layer="94"/>
<wire x1="4.572" y1="10.922" x2="4.572" y2="11.43" width="0.127" layer="94"/>
<wire x1="-4.826" y1="11.43" x2="-5.461" y2="11.43" width="0.127" layer="94"/>
<wire x1="-5.461" y1="11.43" x2="-5.461" y2="10.668" width="0.127" layer="94"/>
<wire x1="-5.461" y1="9.652" x2="-5.461" y2="8.128" width="0.127" layer="94"/>
<wire x1="-5.461" y1="7.112" x2="-5.461" y2="5.588" width="0.127" layer="94"/>
<wire x1="-5.461" y1="4.572" x2="-5.461" y2="3.048" width="0.127" layer="94"/>
<wire x1="-5.461" y1="2.032" x2="-5.461" y2="0.508" width="0.127" layer="94"/>
<wire x1="-5.461" y1="-0.508" x2="-5.461" y2="-2.032" width="0.127" layer="94"/>
<wire x1="-5.461" y1="-8.128" x2="-5.461" y2="-10.16" width="0.127" layer="94"/>
<wire x1="4.572" y1="8.636" x2="4.572" y2="9.144" width="0.127" layer="94"/>
<wire x1="4.572" y1="7.366" x2="4.572" y2="7.874" width="0.127" layer="94"/>
<wire x1="4.572" y1="6.096" x2="4.572" y2="6.604" width="0.127" layer="94"/>
<wire x1="4.572" y1="4.826" x2="4.572" y2="5.334" width="0.127" layer="94"/>
<wire x1="4.572" y1="3.556" x2="4.572" y2="4.064" width="0.127" layer="94"/>
<wire x1="4.572" y1="2.286" x2="4.572" y2="2.794" width="0.127" layer="94"/>
<wire x1="4.572" y1="1.016" x2="4.572" y2="1.524" width="0.127" layer="94"/>
<wire x1="4.572" y1="-0.254" x2="4.572" y2="0.254" width="0.127" layer="94"/>
<wire x1="4.572" y1="-1.524" x2="4.572" y2="-1.016" width="0.127" layer="94"/>
<wire x1="-1.016" y1="-10.16" x2="-1.651" y2="-10.16" width="0.127" layer="94"/>
<wire x1="0.254" y1="-10.16" x2="-0.381" y2="-10.16" width="0.127" layer="94"/>
<wire x1="1.524" y1="-10.16" x2="0.889" y2="-10.16" width="0.127" layer="94"/>
<wire x1="2.794" y1="-10.16" x2="2.159" y2="-10.16" width="0.127" layer="94"/>
<wire x1="4.064" y1="-10.16" x2="3.429" y2="-10.16" width="0.127" layer="94"/>
<wire x1="-3.556" y1="11.43" x2="-4.191" y2="11.43" width="0.127" layer="94"/>
<wire x1="-2.286" y1="11.43" x2="-2.921" y2="11.43" width="0.127" layer="94"/>
<wire x1="-1.016" y1="11.43" x2="-1.651" y2="11.43" width="0.127" layer="94"/>
<wire x1="0.254" y1="11.43" x2="-0.381" y2="11.43" width="0.127" layer="94"/>
<wire x1="1.524" y1="11.43" x2="0.889" y2="11.43" width="0.127" layer="94"/>
<wire x1="2.794" y1="11.43" x2="2.159" y2="11.43" width="0.127" layer="94"/>
<wire x1="3.556" y1="11.43" x2="4.191" y2="11.43" width="0.127" layer="94"/>
<wire x1="-3.556" y1="10.668" x2="-5.08" y2="10.668" width="0.254" layer="94"/>
<wire x1="-5.08" y1="10.668" x2="-5.08" y2="9.652" width="0.254" layer="94"/>
<wire x1="-5.08" y1="9.652" x2="-3.556" y2="9.652" width="0.254" layer="94"/>
<wire x1="-3.556" y1="8.128" x2="-5.08" y2="8.128" width="0.254" layer="94"/>
<wire x1="-5.08" y1="8.128" x2="-5.08" y2="7.112" width="0.254" layer="94"/>
<wire x1="-5.08" y1="7.112" x2="-3.556" y2="7.112" width="0.254" layer="94"/>
<wire x1="-3.556" y1="5.588" x2="-5.08" y2="5.588" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.588" x2="-5.08" y2="4.572" width="0.254" layer="94"/>
<wire x1="-5.08" y1="4.572" x2="-3.556" y2="4.572" width="0.254" layer="94"/>
<wire x1="-3.556" y1="3.048" x2="-5.08" y2="3.048" width="0.254" layer="94"/>
<wire x1="-5.08" y1="3.048" x2="-5.08" y2="2.032" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.032" x2="-3.556" y2="2.032" width="0.254" layer="94"/>
<wire x1="-3.556" y1="0.508" x2="-5.08" y2="0.508" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-0.508" x2="-3.556" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-3.556" y1="-2.032" x2="-5.08" y2="-2.032" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.032" x2="-5.08" y2="-3.048" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-3.048" x2="-3.556" y2="-3.048" width="0.254" layer="94"/>
<wire x1="-1.651" y1="-1.524" x2="0.889" y2="-1.524" width="0.1998" layer="94"/>
<wire x1="0.889" y1="-1.524" x2="0.889" y2="0.254" width="0.1998" layer="94"/>
<wire x1="0.889" y1="0.254" x2="1.905" y2="0.254" width="0.1998" layer="94"/>
<wire x1="1.905" y1="0.254" x2="1.905" y2="2.286" width="0.1998" layer="94"/>
<wire x1="1.905" y1="2.286" x2="0.889" y2="2.286" width="0.1998" layer="94"/>
<wire x1="0.889" y1="2.286" x2="0.889" y2="4.064" width="0.1998" layer="94"/>
<wire x1="0.889" y1="4.064" x2="-1.651" y2="4.064" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="4.064" x2="-1.651" y2="3.048" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="3.048" x2="-1.651" y2="2.54" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="2.54" x2="-1.651" y2="2.032" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="2.032" x2="-1.651" y2="1.524" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="1.524" x2="-1.651" y2="1.016" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="1.016" x2="-1.651" y2="0.508" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="0.508" x2="-1.651" y2="0" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="0" x2="-1.651" y2="-0.508" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="-0.508" x2="-1.651" y2="-1.524" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="3.048" x2="-0.889" y2="3.048" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="2.54" x2="-0.889" y2="2.54" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="2.032" x2="-0.889" y2="2.032" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="1.524" x2="-0.889" y2="1.524" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="1.016" x2="-0.889" y2="1.016" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="0.508" x2="-0.889" y2="0.508" width="0.1998" layer="94"/>
<wire x1="-3.556" y1="-4.572" x2="-5.08" y2="-4.572" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-4.572" x2="-5.08" y2="-5.588" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.588" x2="-3.556" y2="-5.588" width="0.254" layer="94"/>
<wire x1="-3.556" y1="-7.112" x2="-5.08" y2="-7.112" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.112" x2="-5.08" y2="-8.128" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-8.128" x2="-3.556" y2="-8.128" width="0.254" layer="94"/>
<wire x1="-1.651" y1="0" x2="-0.889" y2="0" width="0.1998" layer="94"/>
<wire x1="-1.651" y1="-0.508" x2="-0.889" y2="-0.508" width="0.1998" layer="94"/>
<wire x1="-5.461" y1="-3.048" x2="-5.461" y2="-4.572" width="0.127" layer="94"/>
<wire x1="-5.461" y1="-5.588" x2="-5.461" y2="-7.112" width="0.127" layer="94"/>
<wire x1="4.572" y1="-2.794" x2="4.572" y2="-2.286" width="0.127" layer="94"/>
<wire x1="4.572" y1="-4.064" x2="4.572" y2="-3.556" width="0.127" layer="94"/>
<wire x1="4.572" y1="-5.334" x2="4.572" y2="-4.826" width="0.127" layer="94"/>
<wire x1="4.572" y1="-6.604" x2="4.572" y2="-6.096" width="0.127" layer="94"/>
<wire x1="4.572" y1="-7.874" x2="4.572" y2="-7.366" width="0.127" layer="94"/>
<wire x1="4.572" y1="-9.144" x2="4.572" y2="-8.636" width="0.127" layer="94"/>
<text x="-5.08" y="11.684" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="-10.16" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="S@2" x="-2.54" y="-12.7" visible="off" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="S@1" x="-5.08" y="-12.7" visible="off" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="S@3" x="0" y="-12.7" visible="off" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="S@4" x="2.54" y="-12.7" visible="off" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="1" x="-7.62" y="10.16" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="-7.62" y="7.62" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="3" x="-7.62" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="4" x="-7.62" y="2.54" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="5" x="-7.62" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="6" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="7" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="8" x="-7.62" y="-7.62" visible="pad" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RJ45*2" prefix="X">
<description>&lt;b&gt;RJ45 Low Profile&lt;/b&gt; Shield Type 2&lt;p&gt;
For all RJ45 L, LC, LCT and X Series Models&lt;br&gt;
Source: www.tycoelectronics.com .. ENG_DS_1654001_1099_RJ_L_0507.pdf</description>
<gates>
<gate name="G$1" symbol="JACK8SHILED4" x="0" y="0"/>
</gates>
<devices>
<device name="-S" package="RJ45-SHIELD2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="S@1" pad="S1"/>
<connect gate="G$1" pin="S@2" pad="S2"/>
<connect gate="G$1" pin="S@3" pad="S3"/>
<connect gate="G$1" pin="S@4" pad="S4"/>
</connects>
<technologies>
<technology name="-6L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="RJ45-6L2-S" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="16R6097" constant="no"/>
</technology>
<technology name="-6LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="RJ45-6LC2-S" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="16R6095" constant="no"/>
</technology>
<technology name="-6LCT">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8L">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="RJ45-8L2-S" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="52K4446" constant="no"/>
</technology>
<technology name="-8LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="RJ45-8LC2-S" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="16R6099" constant="no"/>
</technology>
<technology name="-8LCT">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="RJ45-8LCT2-S" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="84K0524" constant="no"/>
</technology>
</technologies>
</device>
<device name="-B" package="RJ45-SHIELD2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="S@1" pad="S1"/>
<connect gate="G$1" pin="S@2" pad="S2"/>
<connect gate="G$1" pin="S@3" pad="S3"/>
<connect gate="G$1" pin="S@4" pad="S4"/>
</connects>
<technologies>
<technology name="-6L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="RJ45-6L2-B" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="16R6096" constant="no"/>
</technology>
<technology name="-6LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="RJ45-6LC2-B" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="16R6094" constant="no"/>
</technology>
<technology name="-8L">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="RJ45-8L2-B" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="52K3810" constant="no"/>
</technology>
<technology name="-8LC">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="RJ45-8LC2-B." constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="50F1338" constant="no"/>
</technology>
<technology name="-8LCT">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="RJ45-8LCT2-B" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="91F7263" constant="no"/>
</technology>
</technologies>
</device>
<device name="1-S" package="RJ45-SHIELD1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="S@1" pad="S1"/>
<connect gate="G$1" pin="S@2" pad="S2"/>
<connect gate="G$1" pin="S@3" pad="S3"/>
<connect gate="G$1" pin="S@4" pad="S4"/>
</connects>
<technologies>
<technology name="-6L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-6LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8LCT">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="1-B" package="RJ45-SHIELD1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="S@1" pad="S1"/>
<connect gate="G$1" pin="S@2" pad="S2"/>
<connect gate="G$1" pin="S@3" pad="S3"/>
<connect gate="G$1" pin="S@4" pad="S4"/>
</connects>
<technologies>
<technology name="-6L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-6LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8L">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8LC">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-8LCT">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lumberg">
<description>&lt;b&gt;Lumberg Connectors&lt;/b&gt;&lt;p&gt;
include con-mfs.lbr - 2001.03.22&lt;br&gt;
Jack connectors - 2005.11.23&lt;p&gt;
http://www.lumberg.de&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="KLBR2">
<description>&lt;b&gt;Jack connectors according to JISC 6560, 3.5 mm&lt;/b&gt;&lt;p&gt;
Klinkensteckverbinder nach JISC 6560, 3,5 mm&lt;br&gt;
Source: http://www.lumberg.com/Produkte/PDFs/KLBR2.pdf</description>
<wire x1="-1.5" y1="6.35" x2="-1" y2="6.85" width="0" layer="46" curve="-90"/>
<wire x1="-1" y1="6.85" x2="1" y2="6.85" width="0" layer="46"/>
<wire x1="1" y1="6.85" x2="1.5" y2="6.35" width="0" layer="46" curve="-90"/>
<wire x1="1.5" y1="6.35" x2="1" y2="5.85" width="0" layer="46" curve="-90"/>
<wire x1="1" y1="5.85" x2="-1" y2="5.85" width="0" layer="46"/>
<wire x1="-1" y1="5.85" x2="-1.5" y2="6.35" width="0" layer="46" curve="-90"/>
<wire x1="-1.5" y1="-6.35" x2="-1" y2="-5.85" width="0" layer="46" curve="-90"/>
<wire x1="-1" y1="-5.85" x2="1" y2="-5.85" width="0" layer="46"/>
<wire x1="1" y1="-5.85" x2="1.5" y2="-6.35" width="0" layer="46" curve="-90"/>
<wire x1="1.5" y1="-6.35" x2="1" y2="-6.85" width="0" layer="46" curve="-90"/>
<wire x1="1" y1="-6.85" x2="-1" y2="-6.85" width="0" layer="46"/>
<wire x1="-1" y1="-6.85" x2="-1.5" y2="-6.35" width="0" layer="46" curve="-90"/>
<wire x1="-5.3" y1="-5.85" x2="-5.8" y2="-5.35" width="0" layer="46" curve="-90"/>
<wire x1="-5.8" y1="-5.35" x2="-5.8" y2="-3.35" width="0" layer="46"/>
<wire x1="-5.8" y1="-3.35" x2="-5.3" y2="-2.85" width="0" layer="46" curve="-90"/>
<wire x1="-5.3" y1="-2.85" x2="-4.8" y2="-3.35" width="0" layer="46" curve="-90"/>
<wire x1="-4.8" y1="-3.35" x2="-4.8" y2="-5.35" width="0" layer="46"/>
<wire x1="-4.8" y1="-5.35" x2="-5.3" y2="-5.85" width="0" layer="46" curve="-90"/>
<wire x1="-2.9" y1="9.11" x2="-2.9" y2="10.38" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="11.65" x2="1.9" y2="11.65" width="0.2032" layer="21"/>
<wire x1="2.9" y1="10.38" x2="2.9" y2="9.11" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="8.45" x2="4.9" y2="8.45" width="0.2032" layer="21"/>
<wire x1="4.9" y1="8.45" x2="4.9" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="4.9" y1="-6.05" x2="2.25" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="2.25" y1="-6.05" x2="-2.25" y2="-6.05" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-6.05" x2="-4.1" y2="-6.05" width="0.2032" layer="25"/>
<wire x1="-4.1" y1="-6.05" x2="-4.9" y2="-6.05" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-6.05" x2="-4.9" y2="-2.05" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-2.05" x2="-4.9" y2="8.45" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="10.38" x2="-1.9" y2="10.38" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="10.38" x2="1.9" y2="10.38" width="0.2032" layer="21"/>
<wire x1="1.9" y1="10.38" x2="2.9" y2="10.38" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="9.11" x2="-1.9" y2="9.11" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="9.11" x2="1.9" y2="9.11" width="0.2032" layer="21"/>
<wire x1="1.9" y1="9.11" x2="2.9" y2="9.11" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="10.38" x2="-1.9" y2="11.65" width="0.2032" layer="21"/>
<wire x1="1.9" y1="11.65" x2="1.9" y2="10.38" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="8.55" x2="-1.9" y2="9.11" width="0.2032" layer="21"/>
<wire x1="1.9" y1="9.11" x2="1.9" y2="8.55" width="0.2032" layer="21"/>
<pad name="3" x="0" y="-6.35" drill="1" diameter="1.8" shape="long"/>
<pad name="5" x="0" y="6.35" drill="1" diameter="1.8" shape="long"/>
<pad name="4" x="-5.3" y="-4.35" drill="1" diameter="1.8" shape="long" rot="R90"/>
<text x="-6.35" y="-6.35" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="7.62" y="-6.35" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="KLBR1">
<description>&lt;b&gt;Jack connectors according to JISC 6560, 2.5 mm&lt;/b&gt;&lt;p&gt;
Klinkensteckverbinder nach JISC 6560, 2,5 mm&lt;br&gt;
Source: http://www.lumberg.com/Produkte/PDFs/KLBR1.pdf</description>
<wire x1="-1.25" y1="4.7" x2="-0.75" y2="5.2" width="0" layer="46" curve="-90"/>
<wire x1="-0.75" y1="5.2" x2="0.75" y2="5.2" width="0" layer="46"/>
<wire x1="0.75" y1="5.2" x2="1.25" y2="4.7" width="0" layer="46" curve="-90"/>
<wire x1="1.25" y1="4.7" x2="0.75" y2="4.2" width="0" layer="46" curve="-90"/>
<wire x1="0.75" y1="4.2" x2="-0.75" y2="4.2" width="0" layer="46"/>
<wire x1="-0.75" y1="4.2" x2="-1.25" y2="4.7" width="0" layer="46" curve="-90"/>
<wire x1="-1.25" y1="-4.7" x2="-0.75" y2="-4.2" width="0" layer="46" curve="-90"/>
<wire x1="-0.75" y1="-4.2" x2="0.75" y2="-4.2" width="0" layer="46"/>
<wire x1="0.75" y1="-4.2" x2="1.25" y2="-4.7" width="0" layer="46" curve="-90"/>
<wire x1="1.25" y1="-4.7" x2="0.75" y2="-5.2" width="0" layer="46" curve="-90"/>
<wire x1="0.75" y1="-5.2" x2="-0.75" y2="-5.2" width="0" layer="46"/>
<wire x1="-0.75" y1="-5.2" x2="-1.25" y2="-4.7" width="0" layer="46" curve="-90"/>
<wire x1="-4" y1="-4.75" x2="-4.5" y2="-4.25" width="0" layer="46" curve="-90"/>
<wire x1="-4.5" y1="-4.25" x2="-4.5" y2="-2.75" width="0" layer="46"/>
<wire x1="-4.5" y1="-2.75" x2="-4" y2="-2.25" width="0" layer="46" curve="-90"/>
<wire x1="-4" y1="-2.25" x2="-3.5" y2="-2.75" width="0" layer="46" curve="-90"/>
<wire x1="-3.5" y1="-2.75" x2="-3.5" y2="-4.25" width="0" layer="46"/>
<wire x1="-3.5" y1="-4.25" x2="-4" y2="-4.75" width="0" layer="46" curve="-90"/>
<wire x1="-2.9" y1="7.725" x2="-2.9" y2="8.995" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="11.015" x2="1.9" y2="11.015" width="0.2032" layer="21"/>
<wire x1="2.9" y1="8.995" x2="2.9" y2="7.725" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="7.065" x2="2.4" y2="7.065" width="0.2032" layer="21"/>
<wire x1="4.9" y1="5.965" x2="4.9" y2="-4.35" width="0.2032" layer="21"/>
<wire x1="4.9" y1="-4.35" x2="2.25" y2="-4.35" width="0.2032" layer="21"/>
<wire x1="2.25" y1="-4.35" x2="-2.25" y2="-4.35" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-4.35" x2="-4.1" y2="-4.35" width="0.2032" layer="25"/>
<wire x1="-4.1" y1="-4.35" x2="-4.9" y2="-4.35" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-4.35" x2="-4.9" y2="-1.7" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-1.7" x2="-4.9" y2="5.965" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="8.995" x2="-1.9" y2="8.995" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="8.995" x2="1.9" y2="8.995" width="0.2032" layer="21"/>
<wire x1="1.9" y1="8.995" x2="2.9" y2="8.995" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="7.725" x2="-1.9" y2="7.725" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="7.725" x2="1.9" y2="7.725" width="0.2032" layer="21"/>
<wire x1="1.9" y1="7.725" x2="2.9" y2="7.725" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="8.995" x2="-1.9" y2="11.015" width="0.2032" layer="21"/>
<wire x1="1.9" y1="11.015" x2="1.9" y2="8.995" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="7.165" x2="-1.9" y2="7.725" width="0.2032" layer="21"/>
<wire x1="1.9" y1="7.725" x2="1.9" y2="7.165" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="5.965" x2="-2.4" y2="5.965" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="5.965" x2="2.4" y2="5.965" width="0.2032" layer="21"/>
<wire x1="2.4" y1="5.965" x2="4.9" y2="5.965" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="5.965" x2="-2.4" y2="7.065" width="0.2032" layer="21"/>
<wire x1="2.4" y1="7.065" x2="2.4" y2="5.965" width="0.2032" layer="21"/>
<pad name="3" x="0" y="-4.7" drill="1" diameter="1.8" shape="long"/>
<pad name="5" x="0" y="4.7" drill="1" diameter="1.8" shape="long"/>
<pad name="4" x="-4" y="-3.5" drill="1" diameter="1.8" shape="long" rot="R90"/>
<text x="-5.715" y="-4.445" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="JACK-SWITCH">
<wire x1="-2.54" y1="2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="1.524" y2="1.016" width="0.1524" layer="94"/>
<wire x1="1.524" y1="1.016" x2="2.286" y2="1.778" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="2.286" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="2.286" x2="-1.016" y2="1.524" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.524" x2="-0.508" y2="1.524" width="0.254" layer="94"/>
<wire x1="-0.508" y1="1.524" x2="-0.762" y2="2.286" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="4.572" y2="-2.54" width="0.1524" layer="94"/>
<text x="-2.54" y="4.064" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-6.096" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.508" x2="7.874" y2="0.508" layer="94" rot="R90"/>
<pin name="5" x="-5.08" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-5.08" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="KLBR?" prefix="X">
<description>&lt;b&gt;Jack connectors according to JISC 6560, 2.5mm / 3.5 mm&lt;/b&gt;&lt;p&gt;
Klinkensteckverbinder nach JISC 6560, 2.5mm / 3,5 mm&lt;br&gt;
Source: http://www.lumberg.com/Produkte/PDFs/KLBR2.pdf&lt;br&gt;
 www.lumberg.com/Produkte/PDFs/KLBR1.pdf</description>
<gates>
<gate name="G$1" symbol="JACK-SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="2" package="KLBR2">
<connects>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="1" package="KLBR1">
<connects>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="KLBR 1" constant="no"/>
<attribute name="OC_FARNELL" value="1200140" constant="no"/>
<attribute name="OC_NEWARK" value="97K2707" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="MAIN-PAN" library="APK - PARTS" deviceset="WBS_10-079_POT" device=""/>
<part name="CUE1-PAN" library="APK - PARTS" deviceset="WBS_10-079_POT" device=""/>
<part name="AUX3" library="APK - PARTS" deviceset="WBS_10-081_DUALPOT+DUALSWITCH" device=""/>
<part name="M-ASSIGN" library="APK - PARTS" deviceset="WBS_DPDT" device=""/>
<part name="INSERT-EN" library="APK - PARTS" deviceset="WBS_DPDT" device=""/>
<part name="AUX2" library="APK - PARTS" deviceset="WBS_10-081_DUALPOT+DUALSWITCH" device=""/>
<part name="AUX1" library="APK - PARTS" deviceset="WBS_10-081_DUALPOT+DUALSWITCH" device=""/>
<part name="AUX4" library="APK - PARTS" deviceset="WBS_10-081_DUALPOT+DUALSWITCH" device=""/>
<part name="CUE1-VOL" library="APK - PARTS" deviceset="WBS_10-081_DUALPOT+DUALSWITCH" device=""/>
<part name="SENS" library="APK - PARTS" deviceset="WBS_10-079_POT" device=""/>
<part name="BUSS" library="con-lsta" deviceset="FE13-2" device=""/>
<part name="POWER" library="con-lsta" deviceset="FE08-2" device=""/>
<part name="X1" library="con-tycoelectronics" deviceset="RJ45*2" device="-B" technology="-6L"/>
<part name="EUROINPUT" library="con-lumberg" deviceset="KLBR?" device="2"/>
<part name="X2" library="con-tycoelectronics" deviceset="RJ45*2" device="-B" technology="-6L"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="MAIN-PAN" gate="G$1" x="38.1" y="76.2"/>
<instance part="MAIN-PAN" gate="G$2" x="38.1" y="58.42"/>
<instance part="CUE1-PAN" gate="G$1" x="88.9" y="30.48" rot="R270"/>
<instance part="CUE1-PAN" gate="G$2" x="88.9" y="-2.54" rot="R270"/>
<instance part="AUX3" gate="G$1" x="137.16" y="83.82"/>
<instance part="AUX3" gate="G$2" x="142.24" y="68.58"/>
<instance part="AUX3" gate="G$3" x="134.62" y="55.88"/>
<instance part="AUX3" gate="G$4" x="134.62" y="45.72"/>
<instance part="M-ASSIGN" gate="G$1" x="-81.28" y="66.04"/>
<instance part="M-ASSIGN" gate="G$2" x="-78.74" y="48.26"/>
<instance part="INSERT-EN" gate="G$1" x="-35.56" y="68.58"/>
<instance part="INSERT-EN" gate="G$2" x="-33.02" y="50.8"/>
<instance part="AUX2" gate="G$1" x="22.86" y="-86.36"/>
<instance part="AUX2" gate="G$2" x="22.86" y="-109.22"/>
<instance part="AUX2" gate="G$3" x="22.86" y="-129.54"/>
<instance part="AUX2" gate="G$4" x="25.4" y="-147.32"/>
<instance part="AUX1" gate="G$1" x="109.22" y="-86.36"/>
<instance part="AUX1" gate="G$2" x="106.68" y="-106.68"/>
<instance part="AUX1" gate="G$3" x="111.76" y="-127"/>
<instance part="AUX1" gate="G$4" x="109.22" y="-142.24"/>
<instance part="AUX4" gate="G$1" x="187.96" y="-88.9"/>
<instance part="AUX4" gate="G$2" x="187.96" y="-106.68"/>
<instance part="AUX4" gate="G$3" x="187.96" y="-121.92"/>
<instance part="AUX4" gate="G$4" x="190.5" y="-144.78"/>
<instance part="CUE1-VOL" gate="G$1" x="256.54" y="-86.36"/>
<instance part="CUE1-VOL" gate="G$2" x="254" y="-109.22"/>
<instance part="CUE1-VOL" gate="G$3" x="254" y="-129.54"/>
<instance part="CUE1-VOL" gate="G$4" x="251.46" y="-147.32"/>
<instance part="SENS" gate="G$1" x="-167.64" y="73.66"/>
<instance part="SENS" gate="G$2" x="-175.26" y="53.34"/>
<instance part="BUSS" gate="G$1" x="-170.18" y="-63.5"/>
<instance part="POWER" gate="G$1" x="-238.76" y="63.5"/>
<instance part="X1" gate="G$1" x="-119.38" y="-5.08"/>
<instance part="EUROINPUT" gate="G$1" x="-223.52" y="-2.54" rot="R180"/>
<instance part="X2" gate="G$1" x="-88.9" y="-205.74"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="MAIN-PAN" gate="G$2" pin="WIPER"/>
<wire x1="38.1" y1="53.34" x2="55.88" y2="53.34" width="0.1524" layer="91"/>
<wire x1="55.88" y1="53.34" x2="55.88" y2="78.74" width="0.1524" layer="91"/>
<pinref part="MAIN-PAN" gate="G$1" pin="CW"/>
<wire x1="55.88" y1="78.74" x2="48.26" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="MAIN-PAN" gate="G$2" pin="CW"/>
<wire x1="48.26" y1="60.96" x2="48.26" y2="71.12" width="0.1524" layer="91"/>
<pinref part="MAIN-PAN" gate="G$1" pin="WIPER"/>
<wire x1="48.26" y1="71.12" x2="38.1" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="127" y1="55.88" x2="127" y2="45.72" width="0.1524" layer="91"/>
<pinref part="AUX3" gate="G$4" pin="P$1"/>
<pinref part="AUX3" gate="G$3" pin="P$1"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="AUX3" gate="G$4" pin="P$2"/>
<pinref part="AUX3" gate="G$3" pin="P$2"/>
<wire x1="142.24" y1="45.72" x2="142.24" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="AUX1" gate="G$1" pin="CW"/>
<pinref part="AUX1" gate="G$2" pin="CW"/>
<wire x1="119.38" y1="-83.82" x2="116.84" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-83.82" x2="116.84" y2="-104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="AUX1" gate="G$1" pin="CCW"/>
<pinref part="AUX1" gate="G$2" pin="CCW"/>
<wire x1="96.52" y1="-83.82" x2="93.98" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-83.82" x2="93.98" y2="-104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="AUX1" gate="G$2" pin="WIPER"/>
<wire x1="106.68" y1="-111.76" x2="114.3" y2="-111.76" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-111.76" x2="114.3" y2="-91.44" width="0.1524" layer="91"/>
<pinref part="AUX1" gate="G$1" pin="WIPER"/>
<wire x1="114.3" y1="-91.44" x2="109.22" y2="-91.44" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
