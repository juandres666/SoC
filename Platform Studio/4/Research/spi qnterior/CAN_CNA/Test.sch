<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ad_conv" />
        <signal name="sig_ad_conv" />
        <signal name="clk" />
        <signal name="can0(13:2)" />
        <signal name="XLXN_8" />
        <signal name="dac_cs" />
        <signal name="can0(13:0)" />
        <signal name="rst" />
        <signal name="XLXN_234" />
        <signal name="XLXN_236(13:0)" />
        <signal name="XLXN_237(13:0)" />
        <signal name="XLXN_238(13:0)" />
        <signal name="fin_cna" />
        <signal name="fpga_init_b" />
        <signal name="sf_ce0" />
        <signal name="spi_mosi" />
        <signal name="spi_miso" />
        <signal name="spi_ss_b" />
        <signal name="amp_cs" />
        <signal name="amp_shdn" />
        <signal name="dac_clr" />
        <signal name="XLXN_240" />
        <signal name="XLXN_59" />
        <signal name="XLXN_243" />
        <signal name="XLXN_244" />
        <signal name="XLXN_246" />
        <signal name="spi_miso_signal" />
        <signal name="XLXN_248" />
        <signal name="XLXN_249" />
        <signal name="spi_sck" />
        <signal name="XLXN_251" />
        <signal name="XLXN_252" />
        <signal name="XLXN_253" />
        <signal name="XLXN_254" />
        <signal name="fin_can" />
        <port polarity="Output" name="ad_conv" />
        <port polarity="Output" name="sig_ad_conv" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="dac_cs" />
        <port polarity="Output" name="can0(13:0)" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="fin_cna" />
        <port polarity="Output" name="fpga_init_b" />
        <port polarity="Output" name="sf_ce0" />
        <port polarity="Output" name="spi_mosi" />
        <port polarity="Input" name="spi_miso" />
        <port polarity="Output" name="spi_ss_b" />
        <port polarity="Output" name="amp_cs" />
        <port polarity="Output" name="amp_shdn" />
        <port polarity="Output" name="dac_clr" />
        <port polarity="Output" name="spi_miso_signal" />
        <port polarity="Output" name="spi_sck" />
        <port polarity="Output" name="fin_can" />
        <blockdef name="convertisseurs">
            <timestamp>2014-7-23T8:38:11</timestamp>
            <rect width="304" x="64" y="-960" height="960" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-752" y2="-752" x1="64" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="432" y1="-928" y2="-928" x1="368" />
            <line x2="432" y1="-864" y2="-864" x1="368" />
            <line x2="432" y1="-800" y2="-800" x1="368" />
            <line x2="432" y1="-736" y2="-736" x1="368" />
            <line x2="432" y1="-672" y2="-672" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="clk_management">
            <timestamp>2014-6-23T13:35:41</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-256" height="320" />
        </blockdef>
        <blockdef name="bascule">
            <timestamp>2014-6-26T7:47:27</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="signed_unsigned_converter">
            <timestamp>2014-6-26T8:58:31</timestamp>
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
            <rect width="432" x="64" y="-64" height="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="ad_conv" name="I" />
            <blockpin signalname="sig_ad_conv" name="O" />
        </block>
        <block symbolname="clk_management" name="XLXI_56">
            <blockpin signalname="rst" name="RST_IN" />
            <blockpin signalname="clk" name="CLKIN_IN" />
            <blockpin signalname="XLXN_234" name="CLK2X_OUT" />
            <blockpin name="CLKFX_OUT" />
            <blockpin name="CLK2X180_OUT" />
            <blockpin name="CLKIN_IBUFG_OUT" />
            <blockpin name="CLK0_OUT" />
        </block>
        <block symbolname="vcc" name="XLXI_91">
            <blockpin signalname="XLXN_8" name="P" />
        </block>
        <block symbolname="bascule" name="XLXI_100">
            <blockpin signalname="XLXN_234" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_237(13:0)" name="entree(13:0)" />
            <blockpin signalname="XLXN_236(13:0)" name="sortie(13:0)" />
        </block>
        <block symbolname="bascule" name="XLXI_101">
            <blockpin signalname="XLXN_234" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_238(13:0)" name="entree(13:0)" />
            <blockpin signalname="can0(13:0)" name="sortie(13:0)" />
        </block>
        <block symbolname="signed_unsigned_converter" name="XLXI_102">
            <blockpin signalname="XLXN_236(13:0)" name="input_signed(13:0)" />
            <blockpin signalname="XLXN_238(13:0)" name="output_unsigned(13:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_58">
            <blockpin signalname="XLXN_59" name="P" />
        </block>
        <block symbolname="convertisseurs" name="XLXI_1">
            <blockpin signalname="XLXN_234" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="spi_miso" name="spi_miso" />
            <blockpin signalname="XLXN_59" name="can_on" />
            <blockpin signalname="XLXN_8" name="cna_on" />
            <blockpin signalname="can0(13:2)" name="cna0(11:0)" />
            <blockpin signalname="fin_can" name="fin_can" />
            <blockpin signalname="fin_cna" name="fin_cna" />
            <blockpin signalname="fpga_init_b" name="fpga_init_b" />
            <blockpin signalname="sf_ce0" name="sf_ce0" />
            <blockpin signalname="spi_mosi" name="spi_mosi" />
            <blockpin signalname="spi_sck" name="spi_sck" />
            <blockpin signalname="spi_ss_b" name="spi_ss_b" />
            <blockpin signalname="amp_cs" name="amp_cs" />
            <blockpin signalname="amp_shdn" name="amp_shdn" />
            <blockpin signalname="spi_miso_signal" name="spi_miso_signal" />
            <blockpin signalname="ad_conv" name="ad_conv" />
            <blockpin signalname="XLXN_237(13:0)" name="can0(13:0)" />
            <blockpin signalname="dac_cs" name="dac_cs" />
            <blockpin signalname="dac_clr" name="dac_clr" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="sig_ad_conv">
            <wire x2="3136" y1="720" y2="720" x1="3072" />
        </branch>
        <branch name="clk">
            <wire x2="304" y1="624" y2="624" x1="176" />
        </branch>
        <instance x="304" y="848" name="XLXI_56" orien="R0">
        </instance>
        <iomarker fontsize="28" x="176" y="816" name="rst" orien="R180" />
        <iomarker fontsize="28" x="176" y="624" name="clk" orien="R180" />
        <branch name="XLXN_8">
            <wire x2="1456" y1="1360" y2="1360" x1="1424" />
        </branch>
        <bustap x2="3216" y1="1728" y2="1824" x1="3216" />
        <branch name="can0(13:2)">
            <attrtext style="alignment:SOFT-VRIGHT;fontsize:28;fontname:Arial" attrname="Name" x="3216" y="1904" type="branch" />
            <wire x2="3216" y1="1824" y2="1904" x1="3216" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1728" name="can0(13:0)" orien="R0" />
        <instance x="1360" y="1360" name="XLXI_91" orien="R0" />
        <instance x="2848" y="752" name="XLXI_10" orien="R0" />
        <iomarker fontsize="28" x="3136" y="720" name="sig_ad_conv" orien="R0" />
        <branch name="ad_conv">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2768" y="720" type="branch" />
            <wire x2="2848" y1="720" y2="720" x1="2768" />
        </branch>
        <branch name="XLXN_234">
            <wire x2="816" y1="816" y2="816" x1="768" />
            <wire x2="816" y1="816" y2="1648" x1="816" />
            <wire x2="2192" y1="1648" y2="1648" x1="816" />
            <wire x2="816" y1="656" y2="816" x1="816" />
            <wire x2="1456" y1="656" y2="656" x1="816" />
            <wire x2="2224" y1="1424" y2="1424" x1="2192" />
            <wire x2="2192" y1="1424" y2="1632" x1="2192" />
            <wire x2="2192" y1="1632" y2="1648" x1="2192" />
            <wire x2="2736" y1="1632" y2="1632" x1="2192" />
        </branch>
        <branch name="rst">
            <wire x2="256" y1="816" y2="816" x1="176" />
            <wire x2="304" y1="816" y2="816" x1="256" />
            <wire x2="256" y1="816" y2="1696" x1="256" />
            <wire x2="2208" y1="1696" y2="1696" x1="256" />
            <wire x2="2736" y1="1696" y2="1696" x1="2208" />
            <wire x2="256" y1="528" y2="816" x1="256" />
            <wire x2="832" y1="528" y2="528" x1="256" />
            <wire x2="832" y1="528" y2="832" x1="832" />
            <wire x2="1456" y1="832" y2="832" x1="832" />
            <wire x2="2208" y1="1488" y2="1696" x1="2208" />
            <wire x2="2224" y1="1488" y2="1488" x1="2208" />
        </branch>
        <branch name="XLXN_236(13:0)">
            <wire x2="2672" y1="1424" y2="1424" x1="2608" />
        </branch>
        <instance x="2224" y="1584" name="XLXI_100" orien="R0">
        </instance>
        <branch name="can0(13:0)">
            <wire x2="3200" y1="1632" y2="1632" x1="3120" />
            <wire x2="3200" y1="1632" y2="1728" x1="3200" />
            <wire x2="3216" y1="1728" y2="1728" x1="3200" />
            <wire x2="3312" y1="1728" y2="1728" x1="3216" />
        </branch>
        <instance x="2736" y="1792" name="XLXI_101" orien="R0">
        </instance>
        <branch name="XLXN_238(13:0)">
            <wire x2="3248" y1="1520" y2="1520" x1="2720" />
            <wire x2="2720" y1="1520" y2="1760" x1="2720" />
            <wire x2="2736" y1="1760" y2="1760" x1="2720" />
            <wire x2="3248" y1="1424" y2="1424" x1="3232" />
            <wire x2="3248" y1="1424" y2="1520" x1="3248" />
        </branch>
        <instance x="2672" y="1456" name="XLXI_102" orien="R0">
        </instance>
        <instance x="1280" y="1168" name="XLXI_58" orien="R0" />
        <branch name="spi_miso">
            <wire x2="1456" y1="1008" y2="1008" x1="992" />
        </branch>
        <iomarker fontsize="28" x="992" y="1008" name="spi_miso" orien="R180" />
        <branch name="XLXN_59">
            <wire x2="1344" y1="1168" y2="1184" x1="1344" />
            <wire x2="1456" y1="1184" y2="1184" x1="1344" />
        </branch>
        <branch name="can0(13:2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="1536" type="branch" />
            <wire x2="1456" y1="1536" y2="1536" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1488" name="dac_clr" orien="R0" />
        <iomarker fontsize="28" x="2000" y="1424" name="dac_cs" orien="R0" />
        <branch name="dac_cs">
            <wire x2="2000" y1="1424" y2="1424" x1="1888" />
        </branch>
        <branch name="dac_clr">
            <wire x2="1968" y1="1488" y2="1488" x1="1888" />
        </branch>
        <branch name="XLXN_237(13:0)">
            <wire x2="2144" y1="1360" y2="1360" x1="1888" />
            <wire x2="2144" y1="1360" y2="1552" x1="2144" />
            <wire x2="2224" y1="1552" y2="1552" x1="2144" />
        </branch>
        <branch name="ad_conv">
            <wire x2="1968" y1="1296" y2="1296" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1296" name="ad_conv" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1232" name="spi_miso_signal" orien="R0" />
        <branch name="spi_miso_signal">
            <wire x2="1968" y1="1232" y2="1232" x1="1888" />
        </branch>
        <branch name="amp_shdn">
            <wire x2="1968" y1="1168" y2="1168" x1="1888" />
        </branch>
        <branch name="amp_cs">
            <wire x2="1968" y1="1104" y2="1104" x1="1888" />
        </branch>
        <branch name="spi_ss_b">
            <wire x2="1968" y1="1040" y2="1040" x1="1888" />
        </branch>
        <branch name="spi_sck">
            <wire x2="1968" y1="976" y2="976" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1968" y="912" name="spi_mosi" orien="R0" />
        <branch name="spi_mosi">
            <wire x2="1968" y1="912" y2="912" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1968" y="848" name="sf_ce0" orien="R0" />
        <iomarker fontsize="28" x="1968" y="976" name="spi_sck" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1040" name="spi_ss_b" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1104" name="amp_cs" orien="R0" />
        <iomarker fontsize="28" x="1968" y="1168" name="amp_shdn" orien="R0" />
        <branch name="sf_ce0">
            <wire x2="1968" y1="848" y2="848" x1="1888" />
        </branch>
        <instance x="1456" y="1584" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1968" y="784" name="fpga_init_b" orien="R0" />
        <branch name="fpga_init_b">
            <wire x2="1968" y1="784" y2="784" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1968" y="720" name="fin_cna" orien="R0" />
        <branch name="fin_cna">
            <wire x2="1968" y1="720" y2="720" x1="1888" />
        </branch>
        <branch name="fin_can">
            <wire x2="2064" y1="656" y2="656" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="2064" y="656" name="fin_can" orien="R0" />
    </sheet>
</drawing>