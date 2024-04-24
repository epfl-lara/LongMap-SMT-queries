; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36122 () Bool)

(assert start!36122)

(declare-fun b!362371 () Bool)

(declare-fun res!201709 () Bool)

(declare-fun e!221935 () Bool)

(assert (=> b!362371 (=> (not res!201709) (not e!221935))))

(declare-datatypes ((array!20433 0))(
  ( (array!20434 (arr!9698 (Array (_ BitVec 32) (_ BitVec 64))) (size!10050 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20433)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362371 (= res!201709 (not (validKeyInArray!0 (select (arr!9698 a!4337) i!1478))))))

(declare-fun res!201708 () Bool)

(assert (=> start!36122 (=> (not res!201708) (not e!221935))))

(assert (=> start!36122 (= res!201708 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10050 a!4337))))))

(assert (=> start!36122 e!221935))

(assert (=> start!36122 true))

(declare-fun array_inv!7170 (array!20433) Bool)

(assert (=> start!36122 (array_inv!7170 a!4337)))

(declare-fun b!362374 () Bool)

(assert (=> b!362374 (= e!221935 false)))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!166740 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20433 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362374 (= lt!166740 (arrayCountValidKeys!0 (array!20434 (store (arr!9698 a!4337) i!1478 k!2980) (size!10050 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166739 () (_ BitVec 32))

(assert (=> b!362374 (= lt!166739 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362372 () Bool)

(declare-fun res!201707 () Bool)

(assert (=> b!362372 (=> (not res!201707) (not e!221935))))

(assert (=> b!362372 (= res!201707 (validKeyInArray!0 k!2980))))

(declare-fun b!362373 () Bool)

(declare-fun res!201706 () Bool)

(assert (=> b!362373 (=> (not res!201706) (not e!221935))))

(assert (=> b!362373 (= res!201706 (and (bvslt (size!10050 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10050 a!4337))))))

(assert (= (and start!36122 res!201708) b!362371))

(assert (= (and b!362371 res!201709) b!362372))

(assert (= (and b!362372 res!201707) b!362373))

(assert (= (and b!362373 res!201706) b!362374))

(declare-fun m!359183 () Bool)

(assert (=> b!362371 m!359183))

(assert (=> b!362371 m!359183))

(declare-fun m!359185 () Bool)

(assert (=> b!362371 m!359185))

(declare-fun m!359187 () Bool)

(assert (=> start!36122 m!359187))

(declare-fun m!359189 () Bool)

(assert (=> b!362374 m!359189))

(declare-fun m!359191 () Bool)

(assert (=> b!362374 m!359191))

(declare-fun m!359193 () Bool)

(assert (=> b!362374 m!359193))

(declare-fun m!359195 () Bool)

(assert (=> b!362372 m!359195))

(push 1)

(assert (not b!362372))

(assert (not b!362371))

(assert (not start!36122))

(assert (not b!362374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

