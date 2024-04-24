; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36104 () Bool)

(assert start!36104)

(declare-fun b!362263 () Bool)

(declare-fun res!201598 () Bool)

(declare-fun e!221881 () Bool)

(assert (=> b!362263 (=> (not res!201598) (not e!221881))))

(declare-datatypes ((array!20415 0))(
  ( (array!20416 (arr!9689 (Array (_ BitVec 32) (_ BitVec 64))) (size!10041 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20415)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362263 (= res!201598 (not (validKeyInArray!0 (select (arr!9689 a!4337) i!1478))))))

(declare-fun b!362264 () Bool)

(declare-fun res!201601 () Bool)

(assert (=> b!362264 (=> (not res!201601) (not e!221881))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362264 (= res!201601 (validKeyInArray!0 k!2980))))

(declare-fun b!362265 () Bool)

(declare-fun res!201600 () Bool)

(assert (=> b!362265 (=> (not res!201600) (not e!221881))))

(assert (=> b!362265 (= res!201600 (and (bvslt (size!10041 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10041 a!4337))))))

(declare-fun res!201599 () Bool)

(assert (=> start!36104 (=> (not res!201599) (not e!221881))))

(assert (=> start!36104 (= res!201599 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10041 a!4337))))))

(assert (=> start!36104 e!221881))

(assert (=> start!36104 true))

(declare-fun array_inv!7161 (array!20415) Bool)

(assert (=> start!36104 (array_inv!7161 a!4337)))

(declare-fun b!362266 () Bool)

(assert (=> b!362266 (= e!221881 false)))

(declare-fun lt!166686 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20415 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362266 (= lt!166686 (arrayCountValidKeys!0 (array!20416 (store (arr!9689 a!4337) i!1478 k!2980) (size!10041 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166685 () (_ BitVec 32))

(assert (=> b!362266 (= lt!166685 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36104 res!201599) b!362263))

(assert (= (and b!362263 res!201598) b!362264))

(assert (= (and b!362264 res!201601) b!362265))

(assert (= (and b!362265 res!201600) b!362266))

(declare-fun m!359057 () Bool)

(assert (=> b!362263 m!359057))

(assert (=> b!362263 m!359057))

(declare-fun m!359059 () Bool)

(assert (=> b!362263 m!359059))

(declare-fun m!359061 () Bool)

(assert (=> b!362264 m!359061))

(declare-fun m!359063 () Bool)

(assert (=> start!36104 m!359063))

(declare-fun m!359065 () Bool)

(assert (=> b!362266 m!359065))

(declare-fun m!359067 () Bool)

(assert (=> b!362266 m!359067))

(declare-fun m!359069 () Bool)

(assert (=> b!362266 m!359069))

(push 1)

(assert (not b!362266))

(assert (not start!36104))

(assert (not b!362263))

(assert (not b!362264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

