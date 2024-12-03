#include <omnetpp.h>

using namespace omnetpp;

class MetricGenerator : public cSimpleModule
{
  private:
    simsignal_t throughputSignal;
    simsignal_t latencySignal;
    simsignal_t mcsSignal;

  protected:
    virtual void initialize() override {
        throughputSignal = registerSignal("throughput");
        latencySignal = registerSignal("latency");
        mcsSignal = registerSignal("currentMcs");

        scheduleAt(simTime() + 1, new cMessage("generateData"));
    }

    virtual void handleMessage(cMessage *msg) override {
        double throughput = uniform(10, 100);  // Throughput dalam Mbps
        double latency = uniform(1, 50);       // Latency dalam ms
        long currentMcs = intuniform(0, 11);   // MCS dalam rentang [0, 11]

        // Emit nilai
        emit(throughputSignal, throughput);
        emit(latencySignal, latency);
        emit(mcsSignal, currentMcs);

        EV << "Generated Throughput: " << throughput << " Mbps, Latency: " << latency
           << " ms, MCS: " << currentMcs << "\n";

        // Jadwalkan untuk mengirim data lagi
        scheduleAt(simTime() + 1, msg); // Generate data setiap detik
    }
};

Define_Module(MetricGenerator);
