; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36120 () Bool)

(assert start!36120)

(declare-fun b!362140 () Bool)

(declare-fun e!221786 () Bool)

(assert (=> b!362140 (= e!221786 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166481 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20432 0))(
  ( (array!20433 (arr!9698 (Array (_ BitVec 32) (_ BitVec 64))) (size!10051 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20432)

(declare-fun arrayCountValidKeys!0 (array!20432 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362140 (= lt!166481 (arrayCountValidKeys!0 (array!20433 (store (arr!9698 a!4337) i!1478 k!2980) (size!10051 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166480 () (_ BitVec 32))

(assert (=> b!362140 (= lt!166480 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362139 () Bool)

(declare-fun res!201570 () Bool)

(assert (=> b!362139 (=> (not res!201570) (not e!221786))))

(assert (=> b!362139 (= res!201570 (and (bvslt (size!10051 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10051 a!4337))))))

(declare-fun res!201568 () Bool)

(assert (=> start!36120 (=> (not res!201568) (not e!221786))))

(assert (=> start!36120 (= res!201568 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10051 a!4337))))))

(assert (=> start!36120 e!221786))

(assert (=> start!36120 true))

(declare-fun array_inv!7147 (array!20432) Bool)

(assert (=> start!36120 (array_inv!7147 a!4337)))

(declare-fun b!362138 () Bool)

(declare-fun res!201569 () Bool)

(assert (=> b!362138 (=> (not res!201569) (not e!221786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362138 (= res!201569 (validKeyInArray!0 k!2980))))

(declare-fun b!362137 () Bool)

(declare-fun res!201571 () Bool)

(assert (=> b!362137 (=> (not res!201571) (not e!221786))))

(assert (=> b!362137 (= res!201571 (not (validKeyInArray!0 (select (arr!9698 a!4337) i!1478))))))

(assert (= (and start!36120 res!201568) b!362137))

(assert (= (and b!362137 res!201571) b!362138))

(assert (= (and b!362138 res!201569) b!362139))

(assert (= (and b!362139 res!201570) b!362140))

(declare-fun m!358215 () Bool)

(assert (=> b!362140 m!358215))

(declare-fun m!358217 () Bool)

(assert (=> b!362140 m!358217))

(declare-fun m!358219 () Bool)

(assert (=> b!362140 m!358219))

(declare-fun m!358221 () Bool)

(assert (=> start!36120 m!358221))

(declare-fun m!358223 () Bool)

(assert (=> b!362138 m!358223))

(declare-fun m!358225 () Bool)

(assert (=> b!362137 m!358225))

(assert (=> b!362137 m!358225))

(declare-fun m!358227 () Bool)

(assert (=> b!362137 m!358227))

(push 1)

(assert (not start!36120))

(assert (not b!362137))

(assert (not b!362138))

(assert (not b!362140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

