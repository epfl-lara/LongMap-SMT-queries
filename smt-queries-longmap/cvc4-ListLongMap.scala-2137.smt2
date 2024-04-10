; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36118 () Bool)

(assert start!36118)

(declare-fun b!362314 () Bool)

(declare-fun res!201603 () Bool)

(declare-fun e!221913 () Bool)

(assert (=> b!362314 (=> (not res!201603) (not e!221913))))

(declare-datatypes ((array!20434 0))(
  ( (array!20435 (arr!9699 (Array (_ BitVec 32) (_ BitVec 64))) (size!10051 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20434)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362314 (= res!201603 (and (bvslt (size!10051 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10051 a!4337))))))

(declare-fun b!362315 () Bool)

(assert (=> b!362315 (= e!221913 false)))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!166666 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20434 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362315 (= lt!166666 (arrayCountValidKeys!0 (array!20435 (store (arr!9699 a!4337) i!1478 k!2980) (size!10051 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166667 () (_ BitVec 32))

(assert (=> b!362315 (= lt!166667 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362313 () Bool)

(declare-fun res!201602 () Bool)

(assert (=> b!362313 (=> (not res!201602) (not e!221913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362313 (= res!201602 (validKeyInArray!0 k!2980))))

(declare-fun res!201601 () Bool)

(assert (=> start!36118 (=> (not res!201601) (not e!221913))))

(assert (=> start!36118 (= res!201601 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10051 a!4337))))))

(assert (=> start!36118 e!221913))

(assert (=> start!36118 true))

(declare-fun array_inv!7141 (array!20434) Bool)

(assert (=> start!36118 (array_inv!7141 a!4337)))

(declare-fun b!362312 () Bool)

(declare-fun res!201604 () Bool)

(assert (=> b!362312 (=> (not res!201604) (not e!221913))))

(assert (=> b!362312 (= res!201604 (not (validKeyInArray!0 (select (arr!9699 a!4337) i!1478))))))

(assert (= (and start!36118 res!201601) b!362312))

(assert (= (and b!362312 res!201604) b!362313))

(assert (= (and b!362313 res!201602) b!362314))

(assert (= (and b!362314 res!201603) b!362315))

(declare-fun m!358827 () Bool)

(assert (=> b!362315 m!358827))

(declare-fun m!358829 () Bool)

(assert (=> b!362315 m!358829))

(declare-fun m!358831 () Bool)

(assert (=> b!362315 m!358831))

(declare-fun m!358833 () Bool)

(assert (=> b!362313 m!358833))

(declare-fun m!358835 () Bool)

(assert (=> start!36118 m!358835))

(declare-fun m!358837 () Bool)

(assert (=> b!362312 m!358837))

(assert (=> b!362312 m!358837))

(declare-fun m!358839 () Bool)

(assert (=> b!362312 m!358839))

(push 1)

(assert (not b!362313))

(assert (not b!362312))

(assert (not start!36118))

(assert (not b!362315))

(check-sat)

