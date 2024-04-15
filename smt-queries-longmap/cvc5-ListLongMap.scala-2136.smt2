; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36098 () Bool)

(assert start!36098)

(declare-fun b!362006 () Bool)

(declare-fun res!201437 () Bool)

(declare-fun e!221721 () Bool)

(assert (=> b!362006 (=> (not res!201437) (not e!221721))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362006 (= res!201437 (validKeyInArray!0 k!2980))))

(declare-fun b!362005 () Bool)

(declare-fun res!201438 () Bool)

(assert (=> b!362005 (=> (not res!201438) (not e!221721))))

(declare-datatypes ((array!20410 0))(
  ( (array!20411 (arr!9687 (Array (_ BitVec 32) (_ BitVec 64))) (size!10040 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20410)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362005 (= res!201438 (not (validKeyInArray!0 (select (arr!9687 a!4337) i!1478))))))

(declare-fun b!362008 () Bool)

(assert (=> b!362008 (= e!221721 false)))

(declare-fun lt!166415 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20410 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362008 (= lt!166415 (arrayCountValidKeys!0 (array!20411 (store (arr!9687 a!4337) i!1478 k!2980) (size!10040 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166414 () (_ BitVec 32))

(assert (=> b!362008 (= lt!166414 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201439 () Bool)

(assert (=> start!36098 (=> (not res!201439) (not e!221721))))

(assert (=> start!36098 (= res!201439 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10040 a!4337))))))

(assert (=> start!36098 e!221721))

(assert (=> start!36098 true))

(declare-fun array_inv!7136 (array!20410) Bool)

(assert (=> start!36098 (array_inv!7136 a!4337)))

(declare-fun b!362007 () Bool)

(declare-fun res!201436 () Bool)

(assert (=> b!362007 (=> (not res!201436) (not e!221721))))

(assert (=> b!362007 (= res!201436 (and (bvslt (size!10040 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10040 a!4337))))))

(assert (= (and start!36098 res!201439) b!362005))

(assert (= (and b!362005 res!201438) b!362006))

(assert (= (and b!362006 res!201437) b!362007))

(assert (= (and b!362007 res!201436) b!362008))

(declare-fun m!358061 () Bool)

(assert (=> b!362006 m!358061))

(declare-fun m!358063 () Bool)

(assert (=> b!362005 m!358063))

(assert (=> b!362005 m!358063))

(declare-fun m!358065 () Bool)

(assert (=> b!362005 m!358065))

(declare-fun m!358067 () Bool)

(assert (=> b!362008 m!358067))

(declare-fun m!358069 () Bool)

(assert (=> b!362008 m!358069))

(declare-fun m!358071 () Bool)

(assert (=> b!362008 m!358071))

(declare-fun m!358073 () Bool)

(assert (=> start!36098 m!358073))

(push 1)

(assert (not b!362008))

(assert (not start!36098))

(assert (not b!362005))

(assert (not b!362006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

