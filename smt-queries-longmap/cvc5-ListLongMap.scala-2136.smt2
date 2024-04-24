; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36098 () Bool)

(assert start!36098)

(declare-fun res!201564 () Bool)

(declare-fun e!221863 () Bool)

(assert (=> start!36098 (=> (not res!201564) (not e!221863))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20409 0))(
  ( (array!20410 (arr!9686 (Array (_ BitVec 32) (_ BitVec 64))) (size!10038 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20409)

(assert (=> start!36098 (= res!201564 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10038 a!4337))))))

(assert (=> start!36098 e!221863))

(assert (=> start!36098 true))

(declare-fun array_inv!7158 (array!20409) Bool)

(assert (=> start!36098 (array_inv!7158 a!4337)))

(declare-fun b!362228 () Bool)

(declare-fun res!201565 () Bool)

(assert (=> b!362228 (=> (not res!201565) (not e!221863))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362228 (= res!201565 (validKeyInArray!0 k!2980))))

(declare-fun b!362230 () Bool)

(assert (=> b!362230 (= e!221863 false)))

(declare-fun lt!166668 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362230 (= lt!166668 (arrayCountValidKeys!0 (array!20410 (store (arr!9686 a!4337) i!1478 k!2980) (size!10038 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166667 () (_ BitVec 32))

(assert (=> b!362230 (= lt!166667 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362229 () Bool)

(declare-fun res!201562 () Bool)

(assert (=> b!362229 (=> (not res!201562) (not e!221863))))

(assert (=> b!362229 (= res!201562 (and (bvslt (size!10038 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10038 a!4337))))))

(declare-fun b!362227 () Bool)

(declare-fun res!201563 () Bool)

(assert (=> b!362227 (=> (not res!201563) (not e!221863))))

(assert (=> b!362227 (= res!201563 (not (validKeyInArray!0 (select (arr!9686 a!4337) i!1478))))))

(assert (= (and start!36098 res!201564) b!362227))

(assert (= (and b!362227 res!201563) b!362228))

(assert (= (and b!362228 res!201565) b!362229))

(assert (= (and b!362229 res!201562) b!362230))

(declare-fun m!359015 () Bool)

(assert (=> start!36098 m!359015))

(declare-fun m!359017 () Bool)

(assert (=> b!362228 m!359017))

(declare-fun m!359019 () Bool)

(assert (=> b!362230 m!359019))

(declare-fun m!359021 () Bool)

(assert (=> b!362230 m!359021))

(declare-fun m!359023 () Bool)

(assert (=> b!362230 m!359023))

(declare-fun m!359025 () Bool)

(assert (=> b!362227 m!359025))

(assert (=> b!362227 m!359025))

(declare-fun m!359027 () Bool)

(assert (=> b!362227 m!359027))

(push 1)

(assert (not start!36098))

(assert (not b!362227))

(assert (not b!362228))

(assert (not b!362230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

