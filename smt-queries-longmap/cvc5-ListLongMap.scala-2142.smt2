; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36134 () Bool)

(assert start!36134)

(declare-fun b!362451 () Bool)

(declare-fun res!201790 () Bool)

(declare-fun e!221979 () Bool)

(assert (=> b!362451 (=> (not res!201790) (not e!221979))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362451 (= res!201790 (validKeyInArray!0 k!2980))))

(declare-fun res!201787 () Bool)

(assert (=> start!36134 (=> (not res!201787) (not e!221979))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20445 0))(
  ( (array!20446 (arr!9704 (Array (_ BitVec 32) (_ BitVec 64))) (size!10056 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20445)

(assert (=> start!36134 (= res!201787 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10056 a!4337))))))

(assert (=> start!36134 e!221979))

(assert (=> start!36134 true))

(declare-fun array_inv!7176 (array!20445) Bool)

(assert (=> start!36134 (array_inv!7176 a!4337)))

(declare-fun b!362452 () Bool)

(declare-fun res!201786 () Bool)

(assert (=> b!362452 (=> (not res!201786) (not e!221979))))

(assert (=> b!362452 (= res!201786 (not (validKeyInArray!0 (select (arr!9704 a!4337) i!1478))))))

(declare-fun b!362453 () Bool)

(declare-fun e!221978 () Bool)

(assert (=> b!362453 (= e!221978 true)))

(declare-fun lt!166792 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362453 (= lt!166792 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166793 () (_ BitVec 32))

(declare-fun lt!166794 () array!20445)

(assert (=> b!362453 (= lt!166793 (arrayCountValidKeys!0 lt!166794 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362454 () Bool)

(assert (=> b!362454 (= e!221979 (not e!221978))))

(declare-fun res!201788 () Bool)

(assert (=> b!362454 (=> res!201788 e!221978)))

(assert (=> b!362454 (= res!201788 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362454 (= (arrayCountValidKeys!0 lt!166794 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362454 (= lt!166794 (array!20446 (store (arr!9704 a!4337) i!1478 k!2980) (size!10056 a!4337)))))

(declare-datatypes ((Unit!11117 0))(
  ( (Unit!11118) )
))
(declare-fun lt!166791 () Unit!11117)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11117)

(assert (=> b!362454 (= lt!166791 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362455 () Bool)

(declare-fun res!201789 () Bool)

(assert (=> b!362455 (=> (not res!201789) (not e!221979))))

(assert (=> b!362455 (= res!201789 (bvslt (size!10056 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36134 res!201787) b!362452))

(assert (= (and b!362452 res!201786) b!362451))

(assert (= (and b!362451 res!201790) b!362455))

(assert (= (and b!362455 res!201789) b!362454))

(assert (= (and b!362454 (not res!201788)) b!362453))

(declare-fun m!359279 () Bool)

(assert (=> b!362451 m!359279))

(declare-fun m!359281 () Bool)

(assert (=> b!362453 m!359281))

(declare-fun m!359283 () Bool)

(assert (=> b!362453 m!359283))

(declare-fun m!359285 () Bool)

(assert (=> b!362452 m!359285))

(assert (=> b!362452 m!359285))

(declare-fun m!359287 () Bool)

(assert (=> b!362452 m!359287))

(declare-fun m!359289 () Bool)

(assert (=> start!36134 m!359289))

(declare-fun m!359291 () Bool)

(assert (=> b!362454 m!359291))

(declare-fun m!359293 () Bool)

(assert (=> b!362454 m!359293))

(declare-fun m!359295 () Bool)

(assert (=> b!362454 m!359295))

(declare-fun m!359297 () Bool)

(assert (=> b!362454 m!359297))

(push 1)

(assert (not b!362451))

(assert (not b!362454))

(assert (not start!36134))

(assert (not b!362453))

(assert (not b!362452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

