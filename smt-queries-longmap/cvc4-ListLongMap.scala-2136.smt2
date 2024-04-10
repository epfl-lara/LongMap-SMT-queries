; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36112 () Bool)

(assert start!36112)

(declare-fun b!362279 () Bool)

(declare-fun e!221894 () Bool)

(assert (=> b!362279 (= e!221894 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20428 0))(
  ( (array!20429 (arr!9696 (Array (_ BitVec 32) (_ BitVec 64))) (size!10048 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20428)

(declare-fun lt!166649 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20428 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362279 (= lt!166649 (arrayCountValidKeys!0 (array!20429 (store (arr!9696 a!4337) i!1478 k!2980) (size!10048 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166648 () (_ BitVec 32))

(assert (=> b!362279 (= lt!166648 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201565 () Bool)

(assert (=> start!36112 (=> (not res!201565) (not e!221894))))

(assert (=> start!36112 (= res!201565 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10048 a!4337))))))

(assert (=> start!36112 e!221894))

(assert (=> start!36112 true))

(declare-fun array_inv!7138 (array!20428) Bool)

(assert (=> start!36112 (array_inv!7138 a!4337)))

(declare-fun b!362278 () Bool)

(declare-fun res!201568 () Bool)

(assert (=> b!362278 (=> (not res!201568) (not e!221894))))

(assert (=> b!362278 (= res!201568 (and (bvslt (size!10048 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10048 a!4337))))))

(declare-fun b!362276 () Bool)

(declare-fun res!201566 () Bool)

(assert (=> b!362276 (=> (not res!201566) (not e!221894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362276 (= res!201566 (not (validKeyInArray!0 (select (arr!9696 a!4337) i!1478))))))

(declare-fun b!362277 () Bool)

(declare-fun res!201567 () Bool)

(assert (=> b!362277 (=> (not res!201567) (not e!221894))))

(assert (=> b!362277 (= res!201567 (validKeyInArray!0 k!2980))))

(assert (= (and start!36112 res!201565) b!362276))

(assert (= (and b!362276 res!201566) b!362277))

(assert (= (and b!362277 res!201567) b!362278))

(assert (= (and b!362278 res!201568) b!362279))

(declare-fun m!358785 () Bool)

(assert (=> b!362279 m!358785))

(declare-fun m!358787 () Bool)

(assert (=> b!362279 m!358787))

(declare-fun m!358789 () Bool)

(assert (=> b!362279 m!358789))

(declare-fun m!358791 () Bool)

(assert (=> start!36112 m!358791))

(declare-fun m!358793 () Bool)

(assert (=> b!362276 m!358793))

(assert (=> b!362276 m!358793))

(declare-fun m!358795 () Bool)

(assert (=> b!362276 m!358795))

(declare-fun m!358797 () Bool)

(assert (=> b!362277 m!358797))

(push 1)

(assert (not start!36112))

(assert (not b!362279))

(assert (not b!362277))

(assert (not b!362276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

