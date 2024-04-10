; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36170 () Bool)

(assert start!36170)

(declare-fun b!362665 () Bool)

(declare-fun res!201957 () Bool)

(declare-fun e!222111 () Bool)

(assert (=> b!362665 (=> (not res!201957) (not e!222111))))

(declare-datatypes ((array!20486 0))(
  ( (array!20487 (arr!9725 (Array (_ BitVec 32) (_ BitVec 64))) (size!10077 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20486)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362665 (= res!201957 (not (validKeyInArray!0 (select (arr!9725 a!4337) i!1478))))))

(declare-fun b!362666 () Bool)

(declare-fun e!222109 () Bool)

(assert (=> b!362666 (= e!222111 (not e!222109))))

(declare-fun res!201954 () Bool)

(assert (=> b!362666 (=> res!201954 e!222109)))

(assert (=> b!362666 (= res!201954 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166907 () array!20486)

(declare-fun arrayCountValidKeys!0 (array!20486 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362666 (= (arrayCountValidKeys!0 lt!166907 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362666 (= lt!166907 (array!20487 (store (arr!9725 a!4337) i!1478 k0!2980) (size!10077 a!4337)))))

(declare-datatypes ((Unit!11150 0))(
  ( (Unit!11151) )
))
(declare-fun lt!166904 () Unit!11150)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11150)

(assert (=> b!362666 (= lt!166904 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362667 () Bool)

(declare-fun res!201958 () Bool)

(assert (=> b!362667 (=> (not res!201958) (not e!222111))))

(assert (=> b!362667 (= res!201958 (validKeyInArray!0 k0!2980))))

(declare-fun res!201956 () Bool)

(assert (=> start!36170 (=> (not res!201956) (not e!222111))))

(assert (=> start!36170 (= res!201956 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10077 a!4337))))))

(assert (=> start!36170 e!222111))

(assert (=> start!36170 true))

(declare-fun array_inv!7167 (array!20486) Bool)

(assert (=> start!36170 (array_inv!7167 a!4337)))

(declare-fun b!362668 () Bool)

(assert (=> b!362668 (= e!222109 true)))

(declare-fun lt!166905 () (_ BitVec 32))

(assert (=> b!362668 (= lt!166905 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166906 () (_ BitVec 32))

(assert (=> b!362668 (= lt!166906 (arrayCountValidKeys!0 lt!166907 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362669 () Bool)

(declare-fun res!201955 () Bool)

(assert (=> b!362669 (=> (not res!201955) (not e!222111))))

(assert (=> b!362669 (= res!201955 (bvslt (size!10077 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36170 res!201956) b!362665))

(assert (= (and b!362665 res!201957) b!362667))

(assert (= (and b!362667 res!201958) b!362669))

(assert (= (and b!362669 res!201955) b!362666))

(assert (= (and b!362666 (not res!201954)) b!362668))

(declare-fun m!359269 () Bool)

(assert (=> b!362668 m!359269))

(declare-fun m!359271 () Bool)

(assert (=> b!362668 m!359271))

(declare-fun m!359273 () Bool)

(assert (=> b!362665 m!359273))

(assert (=> b!362665 m!359273))

(declare-fun m!359275 () Bool)

(assert (=> b!362665 m!359275))

(declare-fun m!359277 () Bool)

(assert (=> start!36170 m!359277))

(declare-fun m!359279 () Bool)

(assert (=> b!362667 m!359279))

(declare-fun m!359281 () Bool)

(assert (=> b!362666 m!359281))

(declare-fun m!359283 () Bool)

(assert (=> b!362666 m!359283))

(declare-fun m!359285 () Bool)

(assert (=> b!362666 m!359285))

(declare-fun m!359287 () Bool)

(assert (=> b!362666 m!359287))

(check-sat (not b!362666) (not b!362665) (not b!362667) (not b!362668) (not start!36170))
