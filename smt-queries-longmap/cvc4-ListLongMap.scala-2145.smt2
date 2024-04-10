; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36166 () Bool)

(assert start!36166)

(declare-fun b!362635 () Bool)

(declare-fun res!201928 () Bool)

(declare-fun e!222092 () Bool)

(assert (=> b!362635 (=> (not res!201928) (not e!222092))))

(declare-datatypes ((array!20482 0))(
  ( (array!20483 (arr!9723 (Array (_ BitVec 32) (_ BitVec 64))) (size!10075 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20482)

(assert (=> b!362635 (= res!201928 (bvslt (size!10075 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362637 () Bool)

(declare-fun e!222093 () Bool)

(assert (=> b!362637 (= e!222092 (not e!222093))))

(declare-fun res!201925 () Bool)

(assert (=> b!362637 (=> res!201925 e!222093)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362637 (= res!201925 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166881 () array!20482)

(declare-fun arrayCountValidKeys!0 (array!20482 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362637 (= (arrayCountValidKeys!0 lt!166881 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362637 (= lt!166881 (array!20483 (store (arr!9723 a!4337) i!1478 k!2980) (size!10075 a!4337)))))

(declare-datatypes ((Unit!11146 0))(
  ( (Unit!11147) )
))
(declare-fun lt!166883 () Unit!11146)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11146)

(assert (=> b!362637 (= lt!166883 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362638 () Bool)

(declare-fun res!201924 () Bool)

(assert (=> b!362638 (=> (not res!201924) (not e!222092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362638 (= res!201924 (not (validKeyInArray!0 (select (arr!9723 a!4337) i!1478))))))

(declare-fun b!362639 () Bool)

(declare-fun res!201927 () Bool)

(assert (=> b!362639 (=> (not res!201927) (not e!222092))))

(assert (=> b!362639 (= res!201927 (validKeyInArray!0 k!2980))))

(declare-fun b!362636 () Bool)

(assert (=> b!362636 (= e!222093 true)))

(declare-fun lt!166882 () (_ BitVec 32))

(assert (=> b!362636 (= lt!166882 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166880 () (_ BitVec 32))

(assert (=> b!362636 (= lt!166880 (arrayCountValidKeys!0 lt!166881 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201926 () Bool)

(assert (=> start!36166 (=> (not res!201926) (not e!222092))))

(assert (=> start!36166 (= res!201926 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10075 a!4337))))))

(assert (=> start!36166 e!222092))

(assert (=> start!36166 true))

(declare-fun array_inv!7165 (array!20482) Bool)

(assert (=> start!36166 (array_inv!7165 a!4337)))

(assert (= (and start!36166 res!201926) b!362638))

(assert (= (and b!362638 res!201924) b!362639))

(assert (= (and b!362639 res!201927) b!362635))

(assert (= (and b!362635 res!201928) b!362637))

(assert (= (and b!362637 (not res!201925)) b!362636))

(declare-fun m!359229 () Bool)

(assert (=> b!362636 m!359229))

(declare-fun m!359231 () Bool)

(assert (=> b!362636 m!359231))

(declare-fun m!359233 () Bool)

(assert (=> b!362638 m!359233))

(assert (=> b!362638 m!359233))

(declare-fun m!359235 () Bool)

(assert (=> b!362638 m!359235))

(declare-fun m!359237 () Bool)

(assert (=> b!362637 m!359237))

(declare-fun m!359239 () Bool)

(assert (=> b!362637 m!359239))

(declare-fun m!359241 () Bool)

(assert (=> b!362637 m!359241))

(declare-fun m!359243 () Bool)

(assert (=> b!362637 m!359243))

(declare-fun m!359245 () Bool)

(assert (=> start!36166 m!359245))

(declare-fun m!359247 () Bool)

(assert (=> b!362639 m!359247))

(push 1)

(assert (not b!362639))

(assert (not b!362636))

(assert (not b!362637))

(assert (not b!362638))

(assert (not start!36166))

(check-sat)

