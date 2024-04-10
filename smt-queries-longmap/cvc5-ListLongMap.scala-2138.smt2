; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36120 () Bool)

(assert start!36120)

(declare-fun res!201615 () Bool)

(declare-fun e!221918 () Bool)

(assert (=> start!36120 (=> (not res!201615) (not e!221918))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20436 0))(
  ( (array!20437 (arr!9700 (Array (_ BitVec 32) (_ BitVec 64))) (size!10052 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20436)

(assert (=> start!36120 (= res!201615 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10052 a!4337))))))

(assert (=> start!36120 e!221918))

(assert (=> start!36120 true))

(declare-fun array_inv!7142 (array!20436) Bool)

(assert (=> start!36120 (array_inv!7142 a!4337)))

(declare-fun b!362326 () Bool)

(declare-fun res!201613 () Bool)

(assert (=> b!362326 (=> (not res!201613) (not e!221918))))

(assert (=> b!362326 (= res!201613 (and (bvslt (size!10052 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10052 a!4337))))))

(declare-fun b!362327 () Bool)

(assert (=> b!362327 (= e!221918 false)))

(declare-fun lt!166673 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20436 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362327 (= lt!166673 (arrayCountValidKeys!0 (array!20437 (store (arr!9700 a!4337) i!1478 k!2980) (size!10052 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166672 () (_ BitVec 32))

(assert (=> b!362327 (= lt!166672 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362324 () Bool)

(declare-fun res!201616 () Bool)

(assert (=> b!362324 (=> (not res!201616) (not e!221918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362324 (= res!201616 (not (validKeyInArray!0 (select (arr!9700 a!4337) i!1478))))))

(declare-fun b!362325 () Bool)

(declare-fun res!201614 () Bool)

(assert (=> b!362325 (=> (not res!201614) (not e!221918))))

(assert (=> b!362325 (= res!201614 (validKeyInArray!0 k!2980))))

(assert (= (and start!36120 res!201615) b!362324))

(assert (= (and b!362324 res!201616) b!362325))

(assert (= (and b!362325 res!201614) b!362326))

(assert (= (and b!362326 res!201613) b!362327))

(declare-fun m!358841 () Bool)

(assert (=> start!36120 m!358841))

(declare-fun m!358843 () Bool)

(assert (=> b!362327 m!358843))

(declare-fun m!358845 () Bool)

(assert (=> b!362327 m!358845))

(declare-fun m!358847 () Bool)

(assert (=> b!362327 m!358847))

(declare-fun m!358849 () Bool)

(assert (=> b!362324 m!358849))

(assert (=> b!362324 m!358849))

(declare-fun m!358851 () Bool)

(assert (=> b!362324 m!358851))

(declare-fun m!358853 () Bool)

(assert (=> b!362325 m!358853))

(push 1)

(assert (not b!362327))

(assert (not b!362325))

(assert (not b!362324))

(assert (not start!36120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

