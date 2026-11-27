<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.4.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.05" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.005" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="off" color="4" fill="1" visible="no" active="no"/>
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
<layer number="100" name="SUN" color="14" fill="1" visible="yes" active="yes"/>
<layer number="101" name="SKY" color="11" fill="1" visible="yes" active="yes"/>
<layer number="102" name="GRASS" color="2" fill="1" visible="yes" active="yes"/>
<layer number="103" name="EARTH" color="4" fill="1" visible="yes" active="yes"/>
<layer number="104" name="PANEL" color="12" fill="1" visible="yes" active="yes"/>
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
<package name="ASSMAN-RJ45_VERT">
<wire x1="-7.9373" y1="14.9958" x2="7.9627" y2="14.9958" width="0.4064" layer="21"/>
<wire x1="7.9627" y1="14.9958" x2="7.9627" y2="0.0058" width="0.4064" layer="21"/>
<wire x1="7.9627" y1="0.0058" x2="-7.9373" y2="0.0058" width="0.4064" layer="21"/>
<wire x1="-7.9373" y1="0.0058" x2="-7.9373" y2="14.9958" width="0.4064" layer="21"/>
<pad name="P$1" x="-4.4323" y="10.8458" drill="1.1" shape="square"/>
<pad name="P$2" x="-3.1623" y="13.3858" drill="1.1"/>
<pad name="P$3" x="-1.8923" y="10.8458" drill="1.1"/>
<pad name="P$4" x="-0.6223" y="13.3858" drill="1.1"/>
<pad name="P$5" x="0.6477" y="10.8458" drill="1.1"/>
<pad name="P$6" x="1.9177" y="13.3858" drill="1.1"/>
<pad name="P$7" x="3.1877" y="10.8458" drill="1.1"/>
<pad name="P$8" x="4.4577" y="13.3858" drill="1.1"/>
<pad name="P$9" x="-7.6073" y="1.3208" drill="1.5"/>
<pad name="P$10" x="7.6327" y="1.3208" drill="1.5"/>
<hole x="-5.7023" y="4.4958" drill="3.2"/>
<hole x="-5.7023" y="4.4958" drill="3.175"/>
<hole x="5.7277" y="4.4958" drill="3.2"/>
<wire x1="-5.7023" y1="0.0508" x2="-5.7023" y2="6.4008" width="0.4064" layer="21"/>
<wire x1="-5.7023" y1="6.4008" x2="-1.8923" y2="6.4008" width="0.4064" layer="21"/>
<wire x1="-1.8923" y1="6.4008" x2="-1.8923" y2="7.6708" width="0.4064" layer="21"/>
<wire x1="-1.8923" y1="7.6708" x2="1.9177" y2="7.6708" width="0.4064" layer="21"/>
<wire x1="1.9177" y1="7.6708" x2="1.9177" y2="6.4008" width="0.4064" layer="21"/>
<wire x1="1.9177" y1="6.4008" x2="5.7277" y2="6.4008" width="0.4064" layer="21"/>
<wire x1="5.7277" y1="6.4008" x2="5.7277" y2="0.0508" width="0.4064" layer="21"/>
<circle x="5.7277" y="4.49071875" radius="1.6" width="0.001" layer="20"/>
<circle x="-5.7023" y="4.49071875" radius="1.6" width="0.001" layer="20"/>
<pad name="P$11" x="-7.744459375" y="7.53871875" drill="1.5"/>
<pad name="P$12" x="7.76731875" y="7.53871875" drill="1.5"/>
<text x="-6.35" y="11.43" size="1.27" layer="21">1</text>
<text x="-1.27" y="5.08" size="1.27" layer="21">UP</text>
<text x="-1.27" y="5.08" size="1.27" layer="21">UP</text>
<text x="-2.54" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.953" y="8.9154" size="0.254" layer="21">PAIR 1-</text>
<text x="-2.413" y="8.9154" size="0.254" layer="21">PAIR 3-</text>
<text x="0.127" y="8.9154" size="0.254" layer="21">PAIR 2-</text>
<text x="2.667" y="8.9154" size="0.254" layer="21">PAIR 4-</text>
<text x="-3.683" y="15.2654" size="0.254" layer="21">PAIR 1+</text>
<text x="-1.143" y="15.2654" size="0.254" layer="21">PAIR 2+</text>
<text x="1.397" y="15.2654" size="0.254" layer="21">PAIR 3+</text>
<text x="3.937" y="15.2654" size="0.254" layer="21">PAIR 4+</text>
</package>
<package name="CON-WBS-LOCKING-0.1-3">
<pad name="P$1" x="2.54" y="0" drill="1" diameter="1.778" shape="square"/>
<pad name="P$2" x="0" y="0" drill="1" diameter="1.778"/>
<pad name="P$3" x="-2.54" y="0" drill="1" diameter="1.778"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="3.81" width="0.127" layer="21"/>
<wire x1="-3.81" y1="3.81" x2="3.81" y2="3.81" width="0.127" layer="21"/>
<wire x1="3.81" y1="3.81" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.54" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<text x="-3.81" y="4.445" size="1.016" layer="25">&gt;NAME</text>
</package>
<package name="CON-WBS-LOCKING-0.1-4">
<pad name="P$1" x="5.08" y="0" drill="1" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="1"/>
<pad name="P$3" x="0" y="0" drill="1"/>
<pad name="P$4" x="-2.54" y="0" drill="1"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="3.81" width="0.127" layer="21"/>
<wire x1="-3.81" y1="3.81" x2="6.35" y2="3.81" width="0.127" layer="21"/>
<wire x1="6.35" y1="3.81" x2="6.35" y2="2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="2.54" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="6.35" y2="-2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="-2.54" x2="6.35" y2="2.54" width="0.127" layer="21"/>
<text x="-3.81" y="4.445" size="1.016" layer="25">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="CON-RJ45">
<pin name="PAIR-1" x="-5.08" y="27.94" visible="pin" length="middle"/>
<pin name="PAIR+1_SUN" x="-5.08" y="30.48" visible="pin" length="middle"/>
<pin name="PAIR+2_SKY" x="-5.08" y="22.86" visible="pin" length="middle"/>
<pin name="PAIR-2" x="-5.08" y="20.32" visible="pin" length="middle"/>
<pin name="PAIR+3_GRASS" x="-5.08" y="15.24" visible="pin" length="middle"/>
<pin name="PAIR-3" x="-5.08" y="12.7" visible="pin" length="middle"/>
<pin name="PAIR+4_EARTH" x="-5.08" y="7.62" visible="pin" length="middle"/>
<pin name="PAIR-4" x="-5.08" y="5.08" visible="pin" length="middle"/>
<pin name="GROUND" x="25.4" y="2.54" visible="pin" length="middle" rot="R180"/>
<wire x1="0" y1="27.94" x2="0" y2="30.48" width="0.254" layer="97"/>
<wire x1="0" y1="30.48" x2="0" y2="33.02" width="0.254" layer="97"/>
<wire x1="0" y1="33.02" x2="20.32" y2="33.02" width="0.254" layer="97"/>
<wire x1="20.32" y1="33.02" x2="20.32" y2="0" width="0.254" layer="97"/>
<wire x1="20.32" y1="0" x2="0" y2="0" width="0.254" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="30.48" width="0.254" layer="97"/>
<text x="22.86" y="12.7" size="1.9304" layer="95" rot="R90">&gt;NAME</text>
<text x="22.86" y="5.08" size="1.778" layer="97" rot="R90">QTP</text>
</symbol>
<symbol name="CON-WBS-LOCKING-0.1-3">
<pin name="P$1" x="5.08" y="2.54" visible="off" length="short" rot="R180"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
<pin name="P$3" x="5.08" y="-2.54" visible="off" length="short" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.016" layer="94" align="center">1</text>
<text x="0" y="0" size="1.016" layer="94" align="center">2</text>
<text x="0" y="-2.54" size="1.016" layer="94" align="center">3</text>
<text x="-2.54" y="5.334" size="1.778" layer="96">&gt;NAME</text>
</symbol>
<symbol name="CON-WBS-LOCKING-0.1-4">
<pin name="P$1" x="5.08" y="2.54" visible="off" length="short" rot="R180"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
<pin name="P$3" x="5.08" y="-2.54" visible="off" length="short" rot="R180"/>
<pin name="P$4" x="5.08" y="-5.08" visible="off" length="short" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.016" layer="94" align="center">1</text>
<text x="0" y="0" size="1.016" layer="94" align="center">2</text>
<text x="0" y="-2.54" size="1.016" layer="94" align="center">3</text>
<text x="0" y="-5.08" size="1.016" layer="94" align="center">4</text>
<text x="-2.54" y="5.334" size="1.778" layer="96">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CON-QTP_VERT">
<gates>
<gate name="G$1" symbol="CON-RJ45" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ASSMAN-RJ45_VERT">
<connects>
<connect gate="G$1" pin="GROUND" pad="P$9 P$10 P$11 P$12"/>
<connect gate="G$1" pin="PAIR+1_SUN" pad="P$2"/>
<connect gate="G$1" pin="PAIR+2_SKY" pad="P$4"/>
<connect gate="G$1" pin="PAIR+3_GRASS" pad="P$6"/>
<connect gate="G$1" pin="PAIR+4_EARTH" pad="P$8"/>
<connect gate="G$1" pin="PAIR-1" pad="P$1"/>
<connect gate="G$1" pin="PAIR-2" pad="P$5"/>
<connect gate="G$1" pin="PAIR-3" pad="P$3"/>
<connect gate="G$1" pin="PAIR-4" pad="P$7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON-WBS-LOCKING-0.1-3" uservalue="yes">
<gates>
<gate name="G$1" symbol="CON-WBS-LOCKING-0.1-3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CON-WBS-LOCKING-0.1-3">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON-WBS-LOCKING-0.1-4">
<gates>
<gate name="G$1" symbol="CON-WBS-LOCKING-0.1-4" x="5.08" y="-7.62"/>
</gates>
<devices>
<device name="" package="CON-WBS-LOCKING-0.1-4">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
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
<part name="U$1" library="APK - PARTS" deviceset="CON-QTP_VERT" device=""/>
<part name="SUN" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-3" device=""/>
<part name="SKY" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-3" device=""/>
<part name="GRASS" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-3" device=""/>
<part name="EARTH" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-3" device=""/>
<part name="U$2" library="APK - PARTS" deviceset="CON-QTP_VERT" device=""/>
<part name="SUN-SKY" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-4" device=""/>
<part name="GRASS-EARTH" library="APK - PARTS" deviceset="CON-WBS-LOCKING-0.1-4" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="76.2" y="43.18"/>
<instance part="SUN" gate="G$1" x="-20.32" y="71.12"/>
<instance part="SKY" gate="G$1" x="-5.08" y="63.5"/>
<instance part="GRASS" gate="G$1" x="15.24" y="55.88"/>
<instance part="EARTH" gate="G$1" x="33.02" y="48.26"/>
<instance part="U$2" gate="G$1" x="76.2" y="-5.08"/>
<instance part="SUN-SKY" gate="G$1" x="-20.32" y="22.86"/>
<instance part="GRASS-EARTH" gate="G$1" x="15.24" y="7.62"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR+1_SUN"/>
<pinref part="SUN" gate="G$1" pin="P$1"/>
<wire x1="-15.24" y1="73.66" x2="71.12" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR-1"/>
<pinref part="SUN" gate="G$1" pin="P$2"/>
<wire x1="-15.24" y1="71.12" x2="71.12" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR+2_SKY"/>
<pinref part="SKY" gate="G$1" pin="P$1"/>
<wire x1="0" y1="66.04" x2="71.12" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SUN_N" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR-2"/>
<pinref part="SKY" gate="G$1" pin="P$2"/>
<wire x1="0" y1="63.5" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR+3_GRASS"/>
<pinref part="GRASS" gate="G$1" pin="P$1"/>
<wire x1="20.32" y1="58.42" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR-3"/>
<pinref part="GRASS" gate="G$1" pin="P$2"/>
<wire x1="20.32" y1="55.88" x2="71.12" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR+4_EARTH"/>
<pinref part="EARTH" gate="G$1" pin="P$1"/>
<wire x1="38.1" y1="50.8" x2="71.12" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PAIR-4"/>
<pinref part="EARTH" gate="G$1" pin="P$2"/>
<wire x1="38.1" y1="48.26" x2="71.12" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="SUN" gate="G$1" pin="P$3"/>
<wire x1="-15.24" y1="68.58" x2="-15.24" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GROUND"/>
<wire x1="-15.24" y1="35.56" x2="0" y2="35.56" width="0.1524" layer="91"/>
<wire x1="0" y1="35.56" x2="20.32" y2="35.56" width="0.1524" layer="91"/>
<wire x1="20.32" y1="35.56" x2="38.1" y2="35.56" width="0.1524" layer="91"/>
<wire x1="38.1" y1="35.56" x2="101.6" y2="35.56" width="0.1524" layer="91"/>
<wire x1="101.6" y1="35.56" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<pinref part="EARTH" gate="G$1" pin="P$3"/>
<wire x1="38.1" y1="45.72" x2="38.1" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GRASS" gate="G$1" pin="P$3"/>
<wire x1="20.32" y1="53.34" x2="20.32" y2="35.56" width="0.1524" layer="91"/>
<pinref part="SKY" gate="G$1" pin="P$3"/>
<wire x1="0" y1="60.96" x2="0" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GROUND"/>
<wire x1="-15.24" y1="-12.7" x2="101.6" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="101.6" y1="-12.7" x2="101.6" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR+1_SUN"/>
<wire x1="-15.24" y1="25.4" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<pinref part="SUN-SKY" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR-1"/>
<wire x1="-15.24" y1="22.86" x2="71.12" y2="22.86" width="0.1524" layer="91"/>
<pinref part="SUN-SKY" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR+2_SKY"/>
<wire x1="0" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<pinref part="SUN-SKY" gate="G$1" pin="P$3"/>
<wire x1="-15.24" y1="20.32" x2="0" y2="20.32" width="0.1524" layer="91"/>
<wire x1="0" y1="20.32" x2="0" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SUN_N1" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR-2"/>
<wire x1="-2.54" y1="15.24" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="15.24" x2="-2.54" y2="17.78" width="0.1524" layer="91"/>
<pinref part="SUN-SKY" gate="G$1" pin="P$4"/>
<wire x1="-2.54" y1="17.78" x2="-15.24" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR+3_GRASS"/>
<wire x1="20.32" y1="10.16" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<pinref part="GRASS-EARTH" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR-3"/>
<wire x1="20.32" y1="7.62" x2="71.12" y2="7.62" width="0.1524" layer="91"/>
<pinref part="GRASS-EARTH" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR+4_EARTH"/>
<wire x1="38.1" y1="2.54" x2="71.12" y2="2.54" width="0.1524" layer="91"/>
<pinref part="GRASS-EARTH" gate="G$1" pin="P$3"/>
<wire x1="20.32" y1="5.08" x2="38.1" y2="5.08" width="0.1524" layer="91"/>
<wire x1="38.1" y1="5.08" x2="38.1" y2="2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="PAIR-4"/>
<wire x1="35.56" y1="0" x2="71.12" y2="0" width="0.1524" layer="91"/>
<wire x1="35.56" y1="0" x2="35.56" y2="2.54" width="0.1524" layer="91"/>
<pinref part="GRASS-EARTH" gate="G$1" pin="P$4"/>
<wire x1="35.56" y1="2.54" x2="20.32" y2="2.54" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
