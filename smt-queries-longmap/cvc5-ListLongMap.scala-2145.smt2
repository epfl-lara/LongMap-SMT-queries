; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36152 () Bool)

(assert start!36152)

(declare-fun b!362364 () Bool)

(declare-fun e!221918 () Bool)

(declare-fun e!221919 () Bool)

(assert (=> b!362364 (= e!221918 (not e!221919))))

(declare-fun res!201798 () Bool)

(assert (=> b!362364 (=> res!201798 e!221919)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362364 (= res!201798 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-datatypes ((array!20464 0))(
  ( (array!20465 (arr!9714 (Array (_ BitVec 32) (_ BitVec 64))) (size!10067 (_ BitVec 32))) )
))
(declare-fun lt!166649 () array!20464)

(declare-fun a!4337 () array!20464)

(declare-fun arrayCountValidKeys!0 (array!20464 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362364 (= (arrayCountValidKeys!0 lt!166649 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362364 (= lt!166649 (array!20465 (store (arr!9714 a!4337) i!1478 k!2980) (size!10067 a!4337)))))

(declare-datatypes ((Unit!11124 0))(
  ( (Unit!11125) )
))
(declare-fun lt!166646 () Unit!11124)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11124)

(assert (=> b!362364 (= lt!166646 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362365 () Bool)

(assert (=> b!362365 (= e!221919 true)))

(declare-fun lt!166647 () (_ BitVec 32))

(assert (=> b!362365 (= lt!166647 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166648 () (_ BitVec 32))

(assert (=> b!362365 (= lt!166648 (arrayCountValidKeys!0 lt!166649 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362366 () Bool)

(declare-fun res!201799 () Bool)

(assert (=> b!362366 (=> (not res!201799) (not e!221918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362366 (= res!201799 (validKeyInArray!0 k!2980))))

(declare-fun res!201795 () Bool)

(assert (=> start!36152 (=> (not res!201795) (not e!221918))))

(assert (=> start!36152 (= res!201795 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10067 a!4337))))))

(assert (=> start!36152 e!221918))

(assert (=> start!36152 true))

(declare-fun array_inv!7163 (array!20464) Bool)

(assert (=> start!36152 (array_inv!7163 a!4337)))

(declare-fun b!362367 () Bool)

(declare-fun res!201796 () Bool)

(assert (=> b!362367 (=> (not res!201796) (not e!221918))))

(assert (=> b!362367 (= res!201796 (bvslt (size!10067 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362368 () Bool)

(declare-fun res!201797 () Bool)

(assert (=> b!362368 (=> (not res!201797) (not e!221918))))

(assert (=> b!362368 (= res!201797 (not (validKeyInArray!0 (select (arr!9714 a!4337) i!1478))))))

(assert (= (and start!36152 res!201795) b!362368))

(assert (= (and b!362368 res!201797) b!362366))

(assert (= (and b!362366 res!201799) b!362367))

(assert (= (and b!362367 res!201796) b!362364))

(assert (= (and b!362364 (not res!201798)) b!362365))

(declare-fun m!358505 () Bool)

(assert (=> b!362365 m!358505))

(declare-fun m!358507 () Bool)

(assert (=> b!362365 m!358507))

(declare-fun m!358509 () Bool)

(assert (=> start!36152 m!358509))

(declare-fun m!358511 () Bool)

(assert (=> b!362366 m!358511))

(declare-fun m!358513 () Bool)

(assert (=> b!362368 m!358513))

(assert (=> b!362368 m!358513))

(declare-fun m!358515 () Bool)

(assert (=> b!362368 m!358515))

(declare-fun m!358517 () Bool)

(assert (=> b!362364 m!358517))

(declare-fun m!358519 () Bool)

(assert (=> b!362364 m!358519))

(declare-fun m!358521 () Bool)

(assert (=> b!362364 m!358521))

(declare-fun m!358523 () Bool)

(assert (=> b!362364 m!358523))

(push 1)

(assert (not b!362364))

(assert (not start!36152))

(assert (not b!362368))

(assert (not b!362365))

(assert (not b!362366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

