; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36110 () Bool)

(assert start!36110)

(declare-fun b!362302 () Bool)

(declare-fun e!221899 () Bool)

(assert (=> b!362302 (= e!221899 false)))

(declare-fun lt!166704 () (_ BitVec 32))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20421 0))(
  ( (array!20422 (arr!9692 (Array (_ BitVec 32) (_ BitVec 64))) (size!10044 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20421)

(declare-fun arrayCountValidKeys!0 (array!20421 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362302 (= lt!166704 (arrayCountValidKeys!0 (array!20422 (store (arr!9692 a!4337) i!1478 k!2980) (size!10044 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166703 () (_ BitVec 32))

(assert (=> b!362302 (= lt!166703 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362301 () Bool)

(declare-fun res!201636 () Bool)

(assert (=> b!362301 (=> (not res!201636) (not e!221899))))

(assert (=> b!362301 (= res!201636 (and (bvslt (size!10044 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10044 a!4337))))))

(declare-fun b!362299 () Bool)

(declare-fun res!201634 () Bool)

(assert (=> b!362299 (=> (not res!201634) (not e!221899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362299 (= res!201634 (not (validKeyInArray!0 (select (arr!9692 a!4337) i!1478))))))

(declare-fun res!201635 () Bool)

(assert (=> start!36110 (=> (not res!201635) (not e!221899))))

(assert (=> start!36110 (= res!201635 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10044 a!4337))))))

(assert (=> start!36110 e!221899))

(assert (=> start!36110 true))

(declare-fun array_inv!7164 (array!20421) Bool)

(assert (=> start!36110 (array_inv!7164 a!4337)))

(declare-fun b!362300 () Bool)

(declare-fun res!201637 () Bool)

(assert (=> b!362300 (=> (not res!201637) (not e!221899))))

(assert (=> b!362300 (= res!201637 (validKeyInArray!0 k!2980))))

(assert (= (and start!36110 res!201635) b!362299))

(assert (= (and b!362299 res!201634) b!362300))

(assert (= (and b!362300 res!201637) b!362301))

(assert (= (and b!362301 res!201636) b!362302))

(declare-fun m!359099 () Bool)

(assert (=> b!362302 m!359099))

(declare-fun m!359101 () Bool)

(assert (=> b!362302 m!359101))

(declare-fun m!359103 () Bool)

(assert (=> b!362302 m!359103))

(declare-fun m!359105 () Bool)

(assert (=> b!362299 m!359105))

(assert (=> b!362299 m!359105))

(declare-fun m!359107 () Bool)

(assert (=> b!362299 m!359107))

(declare-fun m!359109 () Bool)

(assert (=> start!36110 m!359109))

(declare-fun m!359111 () Bool)

(assert (=> b!362300 m!359111))

(push 1)

(assert (not b!362300))

(assert (not b!362302))

(assert (not start!36110))

(assert (not b!362299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

