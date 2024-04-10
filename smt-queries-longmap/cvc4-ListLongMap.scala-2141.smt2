; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36142 () Bool)

(assert start!36142)

(declare-fun b!362457 () Bool)

(declare-fun res!201746 () Bool)

(declare-fun e!221985 () Bool)

(assert (=> b!362457 (=> (not res!201746) (not e!221985))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362457 (= res!201746 (validKeyInArray!0 k!2980))))

(declare-fun b!362459 () Bool)

(assert (=> b!362459 (= e!221985 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166738 () (_ BitVec 32))

(declare-datatypes ((array!20458 0))(
  ( (array!20459 (arr!9711 (Array (_ BitVec 32) (_ BitVec 64))) (size!10063 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20458)

(declare-fun arrayCountValidKeys!0 (array!20458 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362459 (= lt!166738 (arrayCountValidKeys!0 (array!20459 (store (arr!9711 a!4337) i!1478 k!2980) (size!10063 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166739 () (_ BitVec 32))

(assert (=> b!362459 (= lt!166739 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362456 () Bool)

(declare-fun res!201747 () Bool)

(assert (=> b!362456 (=> (not res!201747) (not e!221985))))

(assert (=> b!362456 (= res!201747 (not (validKeyInArray!0 (select (arr!9711 a!4337) i!1478))))))

(declare-fun b!362458 () Bool)

(declare-fun res!201745 () Bool)

(assert (=> b!362458 (=> (not res!201745) (not e!221985))))

(assert (=> b!362458 (= res!201745 (and (bvslt (size!10063 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10063 a!4337))))))

(declare-fun res!201748 () Bool)

(assert (=> start!36142 (=> (not res!201748) (not e!221985))))

(assert (=> start!36142 (= res!201748 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10063 a!4337))))))

(assert (=> start!36142 e!221985))

(assert (=> start!36142 true))

(declare-fun array_inv!7153 (array!20458) Bool)

(assert (=> start!36142 (array_inv!7153 a!4337)))

(assert (= (and start!36142 res!201748) b!362456))

(assert (= (and b!362456 res!201747) b!362457))

(assert (= (and b!362457 res!201746) b!362458))

(assert (= (and b!362458 res!201745) b!362459))

(declare-fun m!358995 () Bool)

(assert (=> b!362457 m!358995))

(declare-fun m!358997 () Bool)

(assert (=> b!362459 m!358997))

(declare-fun m!358999 () Bool)

(assert (=> b!362459 m!358999))

(declare-fun m!359001 () Bool)

(assert (=> b!362459 m!359001))

(declare-fun m!359003 () Bool)

(assert (=> b!362456 m!359003))

(assert (=> b!362456 m!359003))

(declare-fun m!359005 () Bool)

(assert (=> b!362456 m!359005))

(declare-fun m!359007 () Bool)

(assert (=> start!36142 m!359007))

(push 1)

(assert (not b!362457))

(assert (not b!362456))

(assert (not start!36142))

(assert (not b!362459))

(check-sat)

(pop 1)

