; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36108 () Bool)

(assert start!36108)

(declare-fun b!362068 () Bool)

(declare-fun e!221751 () Bool)

(assert (=> b!362068 (= e!221751 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20420 0))(
  ( (array!20421 (arr!9692 (Array (_ BitVec 32) (_ BitVec 64))) (size!10045 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20420)

(declare-fun lt!166445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20420 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362068 (= lt!166445 (arrayCountValidKeys!0 (array!20421 (store (arr!9692 a!4337) i!1478 k!2980) (size!10045 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166444 () (_ BitVec 32))

(assert (=> b!362068 (= lt!166444 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362065 () Bool)

(declare-fun res!201499 () Bool)

(assert (=> b!362065 (=> (not res!201499) (not e!221751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362065 (= res!201499 (not (validKeyInArray!0 (select (arr!9692 a!4337) i!1478))))))

(declare-fun b!362066 () Bool)

(declare-fun res!201498 () Bool)

(assert (=> b!362066 (=> (not res!201498) (not e!221751))))

(assert (=> b!362066 (= res!201498 (validKeyInArray!0 k!2980))))

(declare-fun b!362067 () Bool)

(declare-fun res!201497 () Bool)

(assert (=> b!362067 (=> (not res!201497) (not e!221751))))

(assert (=> b!362067 (= res!201497 (and (bvslt (size!10045 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10045 a!4337))))))

(declare-fun res!201496 () Bool)

(assert (=> start!36108 (=> (not res!201496) (not e!221751))))

(assert (=> start!36108 (= res!201496 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10045 a!4337))))))

(assert (=> start!36108 e!221751))

(assert (=> start!36108 true))

(declare-fun array_inv!7141 (array!20420) Bool)

(assert (=> start!36108 (array_inv!7141 a!4337)))

(assert (= (and start!36108 res!201496) b!362065))

(assert (= (and b!362065 res!201499) b!362066))

(assert (= (and b!362066 res!201498) b!362067))

(assert (= (and b!362067 res!201497) b!362068))

(declare-fun m!358131 () Bool)

(assert (=> b!362068 m!358131))

(declare-fun m!358133 () Bool)

(assert (=> b!362068 m!358133))

(declare-fun m!358135 () Bool)

(assert (=> b!362068 m!358135))

(declare-fun m!358137 () Bool)

(assert (=> b!362065 m!358137))

(assert (=> b!362065 m!358137))

(declare-fun m!358139 () Bool)

(assert (=> b!362065 m!358139))

(declare-fun m!358141 () Bool)

(assert (=> b!362066 m!358141))

(declare-fun m!358143 () Bool)

(assert (=> start!36108 m!358143))

(push 1)

(assert (not b!362068))

(assert (not start!36108))

(assert (not b!362065))

(assert (not b!362066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

