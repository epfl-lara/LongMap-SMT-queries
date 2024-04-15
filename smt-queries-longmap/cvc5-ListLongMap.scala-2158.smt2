; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36248 () Bool)

(assert start!36248)

(declare-fun b!362928 () Bool)

(declare-fun e!222225 () Bool)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362928 (= e!222225 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1478) i!1478))))))

(declare-datatypes ((array!20545 0))(
  ( (array!20546 (arr!9753 (Array (_ BitVec 32) (_ BitVec 64))) (size!10106 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20545)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362928 (= (arrayCountValidKeys!0 (array!20546 (store (arr!9753 a!4337) i!1478 k!2980) (size!10106 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11190 0))(
  ( (Unit!11191) )
))
(declare-fun lt!167149 () Unit!11190)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11190)

(assert (=> b!362928 (= lt!167149 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202300 () Bool)

(assert (=> start!36248 (=> (not res!202300) (not e!222225))))

(assert (=> start!36248 (= res!202300 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10106 a!4337))))))

(assert (=> start!36248 e!222225))

(assert (=> start!36248 true))

(declare-fun array_inv!7202 (array!20545) Bool)

(assert (=> start!36248 (array_inv!7202 a!4337)))

(declare-fun b!362925 () Bool)

(declare-fun res!202302 () Bool)

(assert (=> b!362925 (=> (not res!202302) (not e!222225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362925 (= res!202302 (not (validKeyInArray!0 (select (arr!9753 a!4337) i!1478))))))

(declare-fun b!362926 () Bool)

(declare-fun res!202303 () Bool)

(assert (=> b!362926 (=> (not res!202303) (not e!222225))))

(assert (=> b!362926 (= res!202303 (validKeyInArray!0 k!2980))))

(declare-fun b!362927 () Bool)

(declare-fun res!202301 () Bool)

(assert (=> b!362927 (=> (not res!202301) (not e!222225))))

(assert (=> b!362927 (= res!202301 (bvslt (size!10106 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36248 res!202300) b!362925))

(assert (= (and b!362925 res!202302) b!362926))

(assert (= (and b!362926 res!202303) b!362927))

(assert (= (and b!362927 res!202301) b!362928))

(declare-fun m!359367 () Bool)

(assert (=> b!362928 m!359367))

(declare-fun m!359369 () Bool)

(assert (=> b!362928 m!359369))

(declare-fun m!359371 () Bool)

(assert (=> b!362928 m!359371))

(declare-fun m!359373 () Bool)

(assert (=> b!362928 m!359373))

(declare-fun m!359375 () Bool)

(assert (=> start!36248 m!359375))

(declare-fun m!359377 () Bool)

(assert (=> b!362925 m!359377))

(assert (=> b!362925 m!359377))

(declare-fun m!359379 () Bool)

(assert (=> b!362925 m!359379))

(declare-fun m!359381 () Bool)

(assert (=> b!362926 m!359381))

(push 1)

(assert (not b!362928))

(assert (not start!36248))

(assert (not b!362925))

(assert (not b!362926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

