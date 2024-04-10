; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36124 () Bool)

(assert start!36124)

(declare-fun res!201639 () Bool)

(declare-fun e!221931 () Bool)

(assert (=> start!36124 (=> (not res!201639) (not e!221931))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20440 0))(
  ( (array!20441 (arr!9702 (Array (_ BitVec 32) (_ BitVec 64))) (size!10054 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20440)

(assert (=> start!36124 (= res!201639 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10054 a!4337))))))

(assert (=> start!36124 e!221931))

(assert (=> start!36124 true))

(declare-fun array_inv!7144 (array!20440) Bool)

(assert (=> start!36124 (array_inv!7144 a!4337)))

(declare-fun b!362349 () Bool)

(declare-fun res!201637 () Bool)

(assert (=> b!362349 (=> (not res!201637) (not e!221931))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362349 (= res!201637 (validKeyInArray!0 k!2980))))

(declare-fun b!362348 () Bool)

(declare-fun res!201638 () Bool)

(assert (=> b!362348 (=> (not res!201638) (not e!221931))))

(assert (=> b!362348 (= res!201638 (not (validKeyInArray!0 (select (arr!9702 a!4337) i!1478))))))

(declare-fun b!362351 () Bool)

(assert (=> b!362351 (= e!221931 false)))

(declare-fun lt!166684 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20440 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362351 (= lt!166684 (arrayCountValidKeys!0 (array!20441 (store (arr!9702 a!4337) i!1478 k!2980) (size!10054 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166685 () (_ BitVec 32))

(assert (=> b!362351 (= lt!166685 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362350 () Bool)

(declare-fun res!201640 () Bool)

(assert (=> b!362350 (=> (not res!201640) (not e!221931))))

(assert (=> b!362350 (= res!201640 (and (bvslt (size!10054 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10054 a!4337))))))

(assert (= (and start!36124 res!201639) b!362348))

(assert (= (and b!362348 res!201638) b!362349))

(assert (= (and b!362349 res!201637) b!362350))

(assert (= (and b!362350 res!201640) b!362351))

(declare-fun m!358869 () Bool)

(assert (=> start!36124 m!358869))

(declare-fun m!358871 () Bool)

(assert (=> b!362349 m!358871))

(declare-fun m!358873 () Bool)

(assert (=> b!362348 m!358873))

(assert (=> b!362348 m!358873))

(declare-fun m!358875 () Bool)

(assert (=> b!362348 m!358875))

(declare-fun m!358877 () Bool)

(assert (=> b!362351 m!358877))

(declare-fun m!358879 () Bool)

(assert (=> b!362351 m!358879))

(declare-fun m!358881 () Bool)

(assert (=> b!362351 m!358881))

(push 1)

(assert (not b!362349))

(assert (not b!362348))

(assert (not start!36124))

(assert (not b!362351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

