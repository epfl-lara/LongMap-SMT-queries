; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36136 () Bool)

(assert start!36136)

(declare-fun b!362421 () Bool)

(declare-fun res!201710 () Bool)

(declare-fun e!221966 () Bool)

(assert (=> b!362421 (=> (not res!201710) (not e!221966))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362421 (= res!201710 (validKeyInArray!0 k!2980))))

(declare-fun b!362423 () Bool)

(assert (=> b!362423 (= e!221966 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166721 () (_ BitVec 32))

(declare-datatypes ((array!20452 0))(
  ( (array!20453 (arr!9708 (Array (_ BitVec 32) (_ BitVec 64))) (size!10060 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20452)

(declare-fun arrayCountValidKeys!0 (array!20452 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362423 (= lt!166721 (arrayCountValidKeys!0 (array!20453 (store (arr!9708 a!4337) i!1478 k!2980) (size!10060 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166720 () (_ BitVec 32))

(assert (=> b!362423 (= lt!166720 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201712 () Bool)

(assert (=> start!36136 (=> (not res!201712) (not e!221966))))

(assert (=> start!36136 (= res!201712 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10060 a!4337))))))

(assert (=> start!36136 e!221966))

(assert (=> start!36136 true))

(declare-fun array_inv!7150 (array!20452) Bool)

(assert (=> start!36136 (array_inv!7150 a!4337)))

(declare-fun b!362422 () Bool)

(declare-fun res!201711 () Bool)

(assert (=> b!362422 (=> (not res!201711) (not e!221966))))

(assert (=> b!362422 (= res!201711 (and (bvslt (size!10060 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10060 a!4337))))))

(declare-fun b!362420 () Bool)

(declare-fun res!201709 () Bool)

(assert (=> b!362420 (=> (not res!201709) (not e!221966))))

(assert (=> b!362420 (= res!201709 (not (validKeyInArray!0 (select (arr!9708 a!4337) i!1478))))))

(assert (= (and start!36136 res!201712) b!362420))

(assert (= (and b!362420 res!201709) b!362421))

(assert (= (and b!362421 res!201710) b!362422))

(assert (= (and b!362422 res!201711) b!362423))

(declare-fun m!358953 () Bool)

(assert (=> b!362421 m!358953))

(declare-fun m!358955 () Bool)

(assert (=> b!362423 m!358955))

(declare-fun m!358957 () Bool)

(assert (=> b!362423 m!358957))

(declare-fun m!358959 () Bool)

(assert (=> b!362423 m!358959))

(declare-fun m!358961 () Bool)

(assert (=> start!36136 m!358961))

(declare-fun m!358963 () Bool)

(assert (=> b!362420 m!358963))

(assert (=> b!362420 m!358963))

(declare-fun m!358965 () Bool)

(assert (=> b!362420 m!358965))

(push 1)

(assert (not b!362423))

(assert (not b!362421))

(assert (not b!362420))

(assert (not start!36136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

