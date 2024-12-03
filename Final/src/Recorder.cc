/*
 * Recorder.cc
 *
 *  Created on: Nov 25, 2024
 *      Author: MacBook
 */

#include <omnetpp.h>

using namespace omnetpp;

class ModuleRecorder : public cSimpleModule, public cListener
{
  private:
    double throughput = 0;
    double latency = 0;
    long currentMcs = 0;

  protected:
    virtual void initialize() override {
        // Subscribe ke sinyal throughput, latency, dan currentMcs
        getSimulation()->getSystemModule()->subscribe("throughput", this);
        getSimulation()->getSystemModule()->subscribe("latency", this);
        getSimulation()->getSystemModule()->subscribe("currentMcs", this);

        EV << "Subscribed to throughput, latency, and MCS signals.\n";
    }

    // Overload untuk sinyal tipe double
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, double value, cObject *details) override {
        if (strcmp(getSignalName(signalID), "throughput") == 0) {
            throughput = value;
            getParentModule()->par("throughput") = throughput;  // Perbarui parameter
        } else if (strcmp(getSignalName(signalID), "latency") == 0) {
            latency = value;
            getParentModule()->par("latency") = latency;  // Perbarui parameter
        }

        EV << "Received double signal: " << getSignalName(signalID) << " = " << value << "\n";
    }

    // Overload untuk sinyal tipe long
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, long value, cObject *details) override {
        if (strcmp(getSignalName(signalID), "currentMcs") == 0) {
            currentMcs = value;
            getParentModule()->par("currentMcs") = currentMcs;  // Perbarui parameter
        }

        EV << "Received long signal: " << getSignalName(signalID) << " = " << value << "\n";
    }

    virtual void handleMessage(cMessage *msg) override {
        EV << "Current Values - Throughput: " << throughput
           << ", Latency: " << latency
           << ", Current MCS: " << currentMcs << "\n";
        delete msg;
    }
};

Define_Module(ModuleRecorder);
