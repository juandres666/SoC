<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="rst" />
        <signal name="en_can" />
        <signal name="ican_spi_sck" />
        <signal name="en_amp" />
        <signal name="iamp_spi_mosi" />
        <signal name="iamp_spi_sck" />
        <signal name="fin_amp" />
        <signal name="fin_can" />
        <signal name="fin_cna" />
        <signal name="icna_spi_sck" />
        <signal name="icna_spi_mosi" />
        <signal name="en_cna" />
        <signal name="fpga_init_b" />
        <signal name="sf_ce0" />
        <signal name="spi_mosi" />
        <signal name="spi_sck" />
        <signal name="spi_ss_b" />
        <signal name="XLXN_139" />
        <signal name="XLXN_140" />
        <signal name="amp_cs" />
        <signal name="amp_shdn" />
        <signal name="spi_miso" />
        <signal name="spi_miso_signal" />
        <signal name="ad_conv" />
        <signal name="can0(13:0)" />
        <signal name="dac_cs" />
        <signal name="dac_clr" />
        <signal name="can_on" />
        <signal name="cna_on" />
        <signal name="cna0(11:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="fin_can" />
        <port polarity="Output" name="fin_cna" />
        <port polarity="Output" name="fpga_init_b" />
        <port polarity="Output" name="sf_ce0" />
        <port polarity="Output" name="spi_mosi" />
        <port polarity="Output" name="spi_sck" />
        <port polarity="Output" name="spi_ss_b" />
        <port polarity="Output" name="amp_cs" />
        <port polarity="Output" name="amp_shdn" />
        <port polarity="Input" name="spi_miso" />
        <port polarity="Output" name="spi_miso_signal" />
        <port polarity="Output" name="ad_conv" />
        <port polarity="Output" name="can0(13:0)" />
        <port polarity="Output" name="dac_cs" />
        <port polarity="Output" name="dac_clr" />
        <port polarity="Input" name="can_on" />
        <port polarity="Input" name="cna_on" />
        <port polarity="Input" name="cna0(11:0)" />
        <blockdef name="can_cna_commande">
            <timestamp>2014-6-16T14:39:28</timestamp>
            <rect width="288" x="64" y="-960" height="960" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="416" y1="-928" y2="-928" x1="352" />
            <line x2="416" y1="-800" y2="-800" x1="352" />
            <line x2="416" y1="-672" y2="-672" x1="352" />
            <line x2="416" y1="-544" y2="-544" x1="352" />
            <line x2="416" y1="-416" y2="-416" x1="352" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
        </blockdef>
        <blockdef name="amplificateurs">
            <timestamp>2014-6-16T14:39:34</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="can">
            <timestamp>2014-7-23T8:37:55</timestamp>
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-384" height="384" />
        </blockdef>
        <blockdef name="cna">
            <timestamp>2014-7-23T8:35:16</timestamp>
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-320" height="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="can_cna_commande" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_140" name="ispi_ss_b" />
            <blockpin signalname="XLXN_140" name="isf_ce0" />
            <blockpin signalname="XLXN_139" name="ifpga_init_b" />
            <blockpin signalname="fin_amp" name="fin_amp" />
            <blockpin signalname="fin_can" name="fin_can" />
            <blockpin signalname="fin_cna" name="fin_cna" />
            <blockpin signalname="iamp_spi_sck" name="iamp_spi_sck" />
            <blockpin signalname="ican_spi_sck" name="ican_spi_sck" />
            <blockpin signalname="icna_spi_sck" name="icna_spi_sck" />
            <blockpin signalname="iamp_spi_mosi" name="iamp_spi_mosi" />
            <blockpin signalname="icna_spi_mosi" name="icna_spi_mosi" />
            <blockpin signalname="can_on" name="can_on" />
            <blockpin signalname="cna_on" name="cna_on" />
            <blockpin signalname="spi_mosi" name="spi_mosi" />
            <blockpin signalname="spi_sck" name="spi_sck" />
            <blockpin signalname="spi_ss_b" name="spi_ss_b" />
            <blockpin signalname="sf_ce0" name="sf_ce0" />
            <blockpin signalname="en_can" name="en_can" />
            <blockpin signalname="en_cna" name="en_cna" />
            <blockpin signalname="en_amp" name="en_amp" />
            <blockpin signalname="fpga_init_b" name="fpga_init_b" />
        </block>
        <block symbolname="vcc" name="XLXI_12">
            <blockpin signalname="XLXN_140" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="XLXN_139" name="G" />
        </block>
        <block symbolname="amplificateurs" name="XLXI_2">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="en_amp" name="en_amp" />
            <blockpin signalname="iamp_spi_mosi" name="spi_mosi" />
            <blockpin signalname="amp_cs" name="amp_cs" />
            <blockpin signalname="iamp_spi_sck" name="spi_sck" />
            <blockpin signalname="amp_shdn" name="amp_shdn" />
            <blockpin signalname="fin_amp" name="fin_amp" />
        </block>
        <block symbolname="can" name="XLXI_3">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="spi_miso" name="spi_miso" />
            <blockpin signalname="en_can" name="en_can" />
            <blockpin signalname="spi_miso_signal" name="spi_miso_signal" />
            <blockpin signalname="ican_spi_sck" name="spi_sck" />
            <blockpin signalname="ad_conv" name="ad_conv" />
            <blockpin signalname="fin_can" name="fin_can" />
            <blockpin signalname="can0(13:0)" name="can0(13:0)" />
            <blockpin name="can1(13:0)" />
        </block>
        <block symbolname="cna" name="XLXI_4">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="en_cna" name="en_cna" />
            <blockpin signalname="cna0(11:0)" name="data(11:0)" />
            <blockpin signalname="icna_spi_mosi" name="spi_mosi" />
            <blockpin signalname="dac_cs" name="dac_cs" />
            <blockpin signalname="icna_spi_sck" name="spi_sck" />
            <blockpin signalname="dac_clr" name="dac_clr" />
            <blockpin signalname="fin_cna" name="fin_cna" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="448" y="1744" name="XLXI_1" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="448" y1="816" y2="816" x1="336" />
        </branch>
        <branch name="rst">
            <wire x2="448" y1="880" y2="880" x1="336" />
        </branch>
        <instance x="96" y="880" name="XLXI_12" orien="R0" />
        <instance x="96" y="1344" name="XLXI_13" orien="R0" />
        <branch name="fpga_init_b">
            <wire x2="896" y1="1712" y2="1712" x1="864" />
        </branch>
        <branch name="en_can">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="896" y="1328" type="branch" />
            <wire x2="896" y1="1328" y2="1328" x1="864" />
        </branch>
        <branch name="sf_ce0">
            <wire x2="896" y1="1200" y2="1200" x1="864" />
        </branch>
        <branch name="spi_mosi">
            <wire x2="896" y1="816" y2="816" x1="864" />
        </branch>
        <branch name="spi_sck">
            <wire x2="896" y1="944" y2="944" x1="864" />
        </branch>
        <branch name="spi_ss_b">
            <wire x2="896" y1="1072" y2="1072" x1="864" />
        </branch>
        <branch name="fin_amp">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1136" type="branch" />
            <wire x2="448" y1="1136" y2="1136" x1="416" />
        </branch>
        <branch name="fin_can">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1200" type="branch" />
            <wire x2="448" y1="1200" y2="1200" x1="416" />
        </branch>
        <branch name="fin_cna">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1264" type="branch" />
            <wire x2="448" y1="1264" y2="1264" x1="416" />
        </branch>
        <branch name="iamp_spi_sck">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1328" type="branch" />
            <wire x2="448" y1="1328" y2="1328" x1="416" />
        </branch>
        <branch name="ican_spi_sck">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1392" type="branch" />
            <wire x2="448" y1="1392" y2="1392" x1="416" />
        </branch>
        <branch name="icna_spi_sck">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1456" type="branch" />
            <wire x2="448" y1="1456" y2="1456" x1="416" />
        </branch>
        <branch name="iamp_spi_mosi">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1520" type="branch" />
            <wire x2="448" y1="1520" y2="1520" x1="416" />
        </branch>
        <branch name="icna_spi_mosi">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="416" y="1584" type="branch" />
            <wire x2="448" y1="1584" y2="1584" x1="416" />
        </branch>
        <branch name="en_amp">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="896" y="1584" type="branch" />
            <wire x2="896" y1="1584" y2="1584" x1="864" />
        </branch>
        <branch name="en_cna">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="896" y="1456" type="branch" />
            <wire x2="896" y1="1456" y2="1456" x1="864" />
        </branch>
        <branch name="XLXN_139">
            <wire x2="448" y1="1072" y2="1072" x1="160" />
            <wire x2="160" y1="1072" y2="1216" x1="160" />
        </branch>
        <branch name="XLXN_140">
            <wire x2="160" y1="880" y2="944" x1="160" />
            <wire x2="160" y1="944" y2="1008" x1="160" />
            <wire x2="448" y1="1008" y2="1008" x1="160" />
            <wire x2="448" y1="944" y2="944" x1="160" />
        </branch>
        <iomarker fontsize="28" x="336" y="816" name="clk" orien="R180" />
        <iomarker fontsize="28" x="336" y="880" name="rst" orien="R180" />
        <iomarker fontsize="28" x="896" y="1712" name="fpga_init_b" orien="R0" />
        <iomarker fontsize="28" x="896" y="1200" name="sf_ce0" orien="R0" />
        <iomarker fontsize="28" x="896" y="944" name="spi_sck" orien="R0" />
        <iomarker fontsize="28" x="896" y="1072" name="spi_ss_b" orien="R0" />
        <iomarker fontsize="28" x="896" y="816" name="spi_mosi" orien="R0" />
        <instance x="1136" y="1040" name="XLXI_2" orien="R0">
        </instance>
        <branch name="clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1120" y="752" type="branch" />
            <wire x2="1136" y1="752" y2="752" x1="1120" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1120" y="880" type="branch" />
            <wire x2="1136" y1="880" y2="880" x1="1120" />
        </branch>
        <branch name="en_amp">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1120" y="1008" type="branch" />
            <wire x2="1136" y1="1008" y2="1008" x1="1120" />
        </branch>
        <branch name="iamp_spi_mosi">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1536" y="752" type="branch" />
            <wire x2="1536" y1="752" y2="752" x1="1520" />
        </branch>
        <branch name="amp_cs">
            <wire x2="1552" y1="816" y2="816" x1="1520" />
        </branch>
        <branch name="amp_shdn">
            <wire x2="1552" y1="944" y2="944" x1="1520" />
        </branch>
        <branch name="iamp_spi_sck">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1536" y="880" type="branch" />
            <wire x2="1536" y1="880" y2="880" x1="1520" />
        </branch>
        <branch name="fin_amp">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1536" y="1008" type="branch" />
            <wire x2="1536" y1="1008" y2="1008" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1552" y="816" name="amp_cs" orien="R0" />
        <iomarker fontsize="28" x="1552" y="944" name="amp_shdn" orien="R0" />
        <branch name="clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1136" type="branch" />
            <wire x2="1216" y1="1136" y2="1136" x1="1200" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1232" type="branch" />
            <wire x2="1216" y1="1232" y2="1232" x1="1200" />
        </branch>
        <branch name="spi_miso">
            <wire x2="1200" y1="1328" y2="1328" x1="1184" />
            <wire x2="1216" y1="1328" y2="1328" x1="1200" />
        </branch>
        <branch name="en_can">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1424" type="branch" />
            <wire x2="1216" y1="1424" y2="1424" x1="1200" />
        </branch>
        <branch name="spi_miso_signal">
            <wire x2="1616" y1="1136" y2="1136" x1="1600" />
            <wire x2="1632" y1="1136" y2="1136" x1="1616" />
        </branch>
        <branch name="ican_spi_sck">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1616" y="1200" type="branch" />
            <wire x2="1616" y1="1200" y2="1200" x1="1600" />
        </branch>
        <branch name="ad_conv">
            <wire x2="1616" y1="1264" y2="1264" x1="1600" />
            <wire x2="1632" y1="1264" y2="1264" x1="1616" />
        </branch>
        <branch name="can0(13:0)">
            <wire x2="1616" y1="1392" y2="1392" x1="1600" />
            <wire x2="1632" y1="1392" y2="1392" x1="1616" />
        </branch>
        <branch name="fin_can">
            <wire x2="1616" y1="1328" y2="1328" x1="1600" />
        </branch>
        <instance x="1216" y="1488" name="XLXI_3" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1184" y="1328" name="spi_miso" orien="R180" />
        <iomarker fontsize="28" x="1632" y="1136" name="spi_miso_signal" orien="R0" />
        <iomarker fontsize="28" x="1632" y="1264" name="ad_conv" orien="R0" />
        <iomarker fontsize="28" x="1632" y="1392" name="can0(13:0)" orien="R0" />
        <iomarker fontsize="28" x="1616" y="1328" name="fin_can" orien="R0" />
        <branch name="clk">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1600" type="branch" />
            <wire x2="1216" y1="1600" y2="1600" x1="1200" />
            <wire x2="1232" y1="1600" y2="1600" x1="1216" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1680" type="branch" />
            <wire x2="1216" y1="1680" y2="1680" x1="1200" />
            <wire x2="1232" y1="1680" y2="1680" x1="1216" />
        </branch>
        <branch name="en_cna">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1200" y="1760" type="branch" />
            <wire x2="1216" y1="1760" y2="1760" x1="1200" />
            <wire x2="1232" y1="1760" y2="1760" x1="1216" />
        </branch>
        <branch name="icna_spi_mosi">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1648" y="1600" type="branch" />
            <wire x2="1632" y1="1600" y2="1600" x1="1616" />
            <wire x2="1648" y1="1600" y2="1600" x1="1632" />
        </branch>
        <branch name="icna_spi_sck">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1648" y="1728" type="branch" />
            <wire x2="1632" y1="1728" y2="1728" x1="1616" />
            <wire x2="1648" y1="1728" y2="1728" x1="1632" />
        </branch>
        <branch name="fin_cna">
            <wire x2="1632" y1="1856" y2="1856" x1="1616" />
            <wire x2="1648" y1="1856" y2="1856" x1="1632" />
        </branch>
        <branch name="dac_cs">
            <wire x2="1632" y1="1664" y2="1664" x1="1616" />
            <wire x2="1648" y1="1664" y2="1664" x1="1632" />
        </branch>
        <branch name="dac_clr">
            <wire x2="1632" y1="1792" y2="1792" x1="1616" />
            <wire x2="1648" y1="1792" y2="1792" x1="1632" />
        </branch>
        <instance x="1232" y="1888" name="XLXI_4" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1648" y="1664" name="dac_cs" orien="R0" />
        <iomarker fontsize="28" x="1648" y="1792" name="dac_clr" orien="R0" />
        <iomarker fontsize="28" x="1648" y="1856" name="fin_cna" orien="R0" />
        <branch name="can_on">
            <wire x2="448" y1="1648" y2="1648" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="1648" name="can_on" orien="R180" />
        <branch name="cna_on">
            <wire x2="448" y1="1712" y2="1712" x1="416" />
        </branch>
        <iomarker fontsize="28" x="416" y="1712" name="cna_on" orien="R180" />
        <branch name="cna0(11:0)">
            <wire x2="1216" y1="1840" y2="1840" x1="1200" />
            <wire x2="1232" y1="1840" y2="1840" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1840" name="cna0(11:0)" orien="R180" />
    </sheet>
</drawing>