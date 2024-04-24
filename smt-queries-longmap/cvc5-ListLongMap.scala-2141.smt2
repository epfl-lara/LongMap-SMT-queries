; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36128 () Bool)

(assert start!36128)

(declare-fun b!362410 () Bool)

(declare-fun e!221952 () Bool)

(assert (=> b!362410 (= e!221952 false)))

(declare-fun lt!166757 () (_ BitVec 32))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20439 0))(
  ( (array!20440 (arr!9701 (Array (_ BitVec 32) (_ BitVec 64))) (size!10053 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20439)

(declare-fun arrayCountValidKeys!0 (array!20439 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362410 (= lt!166757 (arrayCountValidKeys!0 (array!20440 (store (arr!9701 a!4337) i!1478 k!2980) (size!10053 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166758 () (_ BitVec 32))

(assert (=> b!362410 (= lt!166758 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362408 () Bool)

(declare-fun res!201743 () Bool)

(assert (=> b!362408 (=> (not res!201743) (not e!221952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362408 (= res!201743 (validKeyInArray!0 k!2980))))

(declare-fun res!201744 () Bool)

(assert (=> start!36128 (=> (not res!201744) (not e!221952))))

(assert (=> start!36128 (= res!201744 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10053 a!4337))))))

(assert (=> start!36128 e!221952))

(assert (=> start!36128 true))

(declare-fun array_inv!7173 (array!20439) Bool)

(assert (=> start!36128 (array_inv!7173 a!4337)))

(declare-fun b!362407 () Bool)

(declare-fun res!201745 () Bool)

(assert (=> b!362407 (=> (not res!201745) (not e!221952))))

(assert (=> b!362407 (= res!201745 (not (validKeyInArray!0 (select (arr!9701 a!4337) i!1478))))))

(declare-fun b!362409 () Bool)

(declare-fun res!201742 () Bool)

(assert (=> b!362409 (=> (not res!201742) (not e!221952))))

(assert (=> b!362409 (= res!201742 (and (bvslt (size!10053 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10053 a!4337))))))

(assert (= (and start!36128 res!201744) b!362407))

(assert (= (and b!362407 res!201745) b!362408))

(assert (= (and b!362408 res!201743) b!362409))

(assert (= (and b!362409 res!201742) b!362410))

(declare-fun m!359225 () Bool)

(assert (=> b!362410 m!359225))

(declare-fun m!359227 () Bool)

(assert (=> b!362410 m!359227))

(declare-fun m!359229 () Bool)

(assert (=> b!362410 m!359229))

(declare-fun m!359231 () Bool)

(assert (=> b!362408 m!359231))

(declare-fun m!359233 () Bool)

(assert (=> start!36128 m!359233))

(declare-fun m!359235 () Bool)

(assert (=> b!362407 m!359235))

(assert (=> b!362407 m!359235))

(declare-fun m!359237 () Bool)

(assert (=> b!362407 m!359237))

(push 1)

(assert (not b!362407))

(assert (not start!36128))

(assert (not b!362410))

(assert (not b!362408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

