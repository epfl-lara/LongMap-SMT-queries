; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36236 () Bool)

(assert start!36236)

(declare-fun b!362856 () Bool)

(declare-fun e!222189 () Bool)

(assert (=> b!362856 (= e!222189 (not true))))

(declare-datatypes ((array!20533 0))(
  ( (array!20534 (arr!9747 (Array (_ BitVec 32) (_ BitVec 64))) (size!10100 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20533)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362856 (= (arrayCountValidKeys!0 (array!20534 (store (arr!9747 a!4337) i!1478 k!2980) (size!10100 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11178 0))(
  ( (Unit!11179) )
))
(declare-fun lt!167131 () Unit!11178)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11178)

(assert (=> b!362856 (= lt!167131 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362854 () Bool)

(declare-fun res!202231 () Bool)

(assert (=> b!362854 (=> (not res!202231) (not e!222189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362854 (= res!202231 (validKeyInArray!0 k!2980))))

(declare-fun b!362855 () Bool)

(declare-fun res!202228 () Bool)

(assert (=> b!362855 (=> (not res!202228) (not e!222189))))

(assert (=> b!362855 (= res!202228 (bvslt (size!10100 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362853 () Bool)

(declare-fun res!202229 () Bool)

(assert (=> b!362853 (=> (not res!202229) (not e!222189))))

(assert (=> b!362853 (= res!202229 (not (validKeyInArray!0 (select (arr!9747 a!4337) i!1478))))))

(declare-fun res!202230 () Bool)

(assert (=> start!36236 (=> (not res!202230) (not e!222189))))

(assert (=> start!36236 (= res!202230 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10100 a!4337))))))

(assert (=> start!36236 e!222189))

(assert (=> start!36236 true))

(declare-fun array_inv!7196 (array!20533) Bool)

(assert (=> start!36236 (array_inv!7196 a!4337)))

(assert (= (and start!36236 res!202230) b!362853))

(assert (= (and b!362853 res!202229) b!362854))

(assert (= (and b!362854 res!202231) b!362855))

(assert (= (and b!362855 res!202228) b!362856))

(declare-fun m!359271 () Bool)

(assert (=> b!362856 m!359271))

(declare-fun m!359273 () Bool)

(assert (=> b!362856 m!359273))

(declare-fun m!359275 () Bool)

(assert (=> b!362856 m!359275))

(declare-fun m!359277 () Bool)

(assert (=> b!362856 m!359277))

(declare-fun m!359279 () Bool)

(assert (=> b!362854 m!359279))

(declare-fun m!359281 () Bool)

(assert (=> b!362853 m!359281))

(assert (=> b!362853 m!359281))

(declare-fun m!359283 () Bool)

(assert (=> b!362853 m!359283))

(declare-fun m!359285 () Bool)

(assert (=> start!36236 m!359285))

(push 1)

(assert (not b!362854))

(assert (not b!362853))

(assert (not start!36236))

(assert (not b!362856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

