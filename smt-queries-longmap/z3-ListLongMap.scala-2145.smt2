; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36164 () Bool)

(assert start!36164)

(declare-fun b!362620 () Bool)

(declare-fun res!201910 () Bool)

(declare-fun e!222083 () Bool)

(assert (=> b!362620 (=> (not res!201910) (not e!222083))))

(declare-datatypes ((array!20480 0))(
  ( (array!20481 (arr!9722 (Array (_ BitVec 32) (_ BitVec 64))) (size!10074 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20480)

(assert (=> b!362620 (= res!201910 (bvslt (size!10074 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362621 () Bool)

(declare-fun e!222082 () Bool)

(assert (=> b!362621 (= e!222083 (not e!222082))))

(declare-fun res!201913 () Bool)

(assert (=> b!362621 (=> res!201913 e!222082)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362621 (= res!201913 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166868 () array!20480)

(declare-fun arrayCountValidKeys!0 (array!20480 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362621 (= (arrayCountValidKeys!0 lt!166868 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362621 (= lt!166868 (array!20481 (store (arr!9722 a!4337) i!1478 k0!2980) (size!10074 a!4337)))))

(declare-datatypes ((Unit!11144 0))(
  ( (Unit!11145) )
))
(declare-fun lt!166871 () Unit!11144)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11144)

(assert (=> b!362621 (= lt!166871 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362622 () Bool)

(declare-fun res!201912 () Bool)

(assert (=> b!362622 (=> (not res!201912) (not e!222083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362622 (= res!201912 (validKeyInArray!0 k0!2980))))

(declare-fun res!201909 () Bool)

(assert (=> start!36164 (=> (not res!201909) (not e!222083))))

(assert (=> start!36164 (= res!201909 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10074 a!4337))))))

(assert (=> start!36164 e!222083))

(assert (=> start!36164 true))

(declare-fun array_inv!7164 (array!20480) Bool)

(assert (=> start!36164 (array_inv!7164 a!4337)))

(declare-fun b!362623 () Bool)

(assert (=> b!362623 (= e!222082 true)))

(declare-fun lt!166870 () (_ BitVec 32))

(assert (=> b!362623 (= lt!166870 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166869 () (_ BitVec 32))

(assert (=> b!362623 (= lt!166869 (arrayCountValidKeys!0 lt!166868 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362624 () Bool)

(declare-fun res!201911 () Bool)

(assert (=> b!362624 (=> (not res!201911) (not e!222083))))

(assert (=> b!362624 (= res!201911 (not (validKeyInArray!0 (select (arr!9722 a!4337) i!1478))))))

(assert (= (and start!36164 res!201909) b!362624))

(assert (= (and b!362624 res!201911) b!362622))

(assert (= (and b!362622 res!201912) b!362620))

(assert (= (and b!362620 res!201910) b!362621))

(assert (= (and b!362621 (not res!201913)) b!362623))

(declare-fun m!359209 () Bool)

(assert (=> start!36164 m!359209))

(declare-fun m!359211 () Bool)

(assert (=> b!362623 m!359211))

(declare-fun m!359213 () Bool)

(assert (=> b!362623 m!359213))

(declare-fun m!359215 () Bool)

(assert (=> b!362624 m!359215))

(assert (=> b!362624 m!359215))

(declare-fun m!359217 () Bool)

(assert (=> b!362624 m!359217))

(declare-fun m!359219 () Bool)

(assert (=> b!362622 m!359219))

(declare-fun m!359221 () Bool)

(assert (=> b!362621 m!359221))

(declare-fun m!359223 () Bool)

(assert (=> b!362621 m!359223))

(declare-fun m!359225 () Bool)

(assert (=> b!362621 m!359225))

(declare-fun m!359227 () Bool)

(assert (=> b!362621 m!359227))

(check-sat (not b!362622) (not start!36164) (not b!362621) (not b!362623) (not b!362624))
