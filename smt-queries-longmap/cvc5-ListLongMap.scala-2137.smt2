; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36114 () Bool)

(assert start!36114)

(declare-fun b!362291 () Bool)

(declare-fun e!221900 () Bool)

(assert (=> b!362291 (= e!221900 false)))

(declare-fun lt!166654 () (_ BitVec 32))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20430 0))(
  ( (array!20431 (arr!9697 (Array (_ BitVec 32) (_ BitVec 64))) (size!10049 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20430)

(declare-fun arrayCountValidKeys!0 (array!20430 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362291 (= lt!166654 (arrayCountValidKeys!0 (array!20431 (store (arr!9697 a!4337) i!1478 k!2980) (size!10049 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166655 () (_ BitVec 32))

(assert (=> b!362291 (= lt!166655 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362290 () Bool)

(declare-fun res!201577 () Bool)

(assert (=> b!362290 (=> (not res!201577) (not e!221900))))

(assert (=> b!362290 (= res!201577 (and (bvslt (size!10049 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10049 a!4337))))))

(declare-fun b!362288 () Bool)

(declare-fun res!201580 () Bool)

(assert (=> b!362288 (=> (not res!201580) (not e!221900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362288 (= res!201580 (not (validKeyInArray!0 (select (arr!9697 a!4337) i!1478))))))

(declare-fun b!362289 () Bool)

(declare-fun res!201578 () Bool)

(assert (=> b!362289 (=> (not res!201578) (not e!221900))))

(assert (=> b!362289 (= res!201578 (validKeyInArray!0 k!2980))))

(declare-fun res!201579 () Bool)

(assert (=> start!36114 (=> (not res!201579) (not e!221900))))

(assert (=> start!36114 (= res!201579 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10049 a!4337))))))

(assert (=> start!36114 e!221900))

(assert (=> start!36114 true))

(declare-fun array_inv!7139 (array!20430) Bool)

(assert (=> start!36114 (array_inv!7139 a!4337)))

(assert (= (and start!36114 res!201579) b!362288))

(assert (= (and b!362288 res!201580) b!362289))

(assert (= (and b!362289 res!201578) b!362290))

(assert (= (and b!362290 res!201577) b!362291))

(declare-fun m!358799 () Bool)

(assert (=> b!362291 m!358799))

(declare-fun m!358801 () Bool)

(assert (=> b!362291 m!358801))

(declare-fun m!358803 () Bool)

(assert (=> b!362291 m!358803))

(declare-fun m!358805 () Bool)

(assert (=> b!362288 m!358805))

(assert (=> b!362288 m!358805))

(declare-fun m!358807 () Bool)

(assert (=> b!362288 m!358807))

(declare-fun m!358809 () Bool)

(assert (=> b!362289 m!358809))

(declare-fun m!358811 () Bool)

(assert (=> start!36114 m!358811))

(push 1)

(assert (not start!36114))

(assert (not b!362291))

(assert (not b!362289))

(assert (not b!362288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

