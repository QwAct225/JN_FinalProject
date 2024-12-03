//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package final;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.node.inet.Router;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;

network Wifi6McsAnalysis
{
    parameters:
        @display("bgb=800,600");
        int currentMcs = default(0) @mutable;
        double throughput = default(0) @mutable;
        double latency = default(0) @mutable;

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=50,50");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,150");
            config = xml("<config><interface hosts='accessPoint' address='192.168.1.1' netmask='255.255.255.0'/><interface hosts='client0' address='192.168.1.2' netmask='255.255.255.0'/><interface hosts='client1' address='192.168.1.3' netmask='255.255.255.0'/><interface hosts='client2' address='192.168.1.4' netmask='255.255.255.0'/><interface hosts='client3' address='192.168.1.5' netmask='255.255.255.0'/><interface hosts='client4' address='192.168.1.6' netmask='255.255.255.0'/><interface hosts='client5' address='192.168.1.7' netmask='255.255.255.0'/><interface hosts='client6' address='192.168.1.8' netmask='255.255.255.0'/><interface hosts='client7' address='192.168.1.9' netmask='255.255.255.0'/><interface hosts='client8' address='192.168.1.10' netmask='255.255.255.0'/><interface hosts='client9' address='192.168.1.11' netmask='255.255.255.0'/><route hosts='client[*]' destination='0.0.0.0' netmask='0.0.0.0' gateway='192.168.1.1'/></config>");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=200,250");
        }
        router: Router {
            @display("p=400,200");
        }
        accessPoint: AccessPoint {
            @display("p=300,300");
        }
        client0: WirelessHost {
            @display("p=200,400");
        }
        client1: WirelessHost {
            @display("p=300,400");
        }
        client2: WirelessHost {
            @display("p=400,400");
        }
        client3: WirelessHost {
            @display("p=500,400");
        }
        client4: WirelessHost {
            @display("p=600,400");
        }
        client5: WirelessHost {
            @display("p=200,500");
        }
        client6: WirelessHost {
            @display("p=300,500");
        }
        client7: WirelessHost {
            @display("p=400,500");
        }
        client8: WirelessHost {
            @display("p=500,500");
        }
        client9: WirelessHost {
            @display("p=600,500");
        }
		metricGenerator: MetricGenerator {
            @display("p=500,100");
        }
        recorder: ModuleRecorder {
            @display("p=700,500");
            outputFile = "wifi6_analysis_log.txt";
        }
}
