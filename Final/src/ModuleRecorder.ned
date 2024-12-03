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

simple ModuleRecorder
{
    parameters:
        string outputFile = default("wifi6_analysis_log.txt");

    @signal[throughput](type=double);
    @signal[latency](type=double);
    @signal[currentMcs](type=long);

    @statistic[throughput](title="Throughput"; unit="Mbps"; record=vector);
    @statistic[latency](title="Latency"; unit="ms"; record=vector);
    @statistic[currentMcs](title="MCS"; record=vector);

    @display("i=block/app");
}