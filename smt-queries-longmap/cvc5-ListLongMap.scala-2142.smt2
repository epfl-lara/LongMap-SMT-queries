; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36144 () Bool)

(assert start!36144)

(declare-fun b!362470 () Bool)

(declare-fun e!221993 () Bool)

(assert (=> b!362470 (= e!221993 true)))

(declare-fun lt!166749 () (_ BitVec 32))

(declare-datatypes ((array!20460 0))(
  ( (array!20461 (arr!9712 (Array (_ BitVec 32) (_ BitVec 64))) (size!10064 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20460)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20460 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362470 (= lt!166749 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166748 () (_ BitVec 32))

(declare-fun lt!166750 () array!20460)

(assert (=> b!362470 (= lt!166748 (arrayCountValidKeys!0 lt!166750 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362471 () Bool)

(declare-fun res!201760 () Bool)

(declare-fun e!221992 () Bool)

(assert (=> b!362471 (=> (not res!201760) (not e!221992))))

(assert (=> b!362471 (= res!201760 (bvslt (size!10064 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!201763 () Bool)

(assert (=> start!36144 (=> (not res!201763) (not e!221992))))

(assert (=> start!36144 (= res!201763 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10064 a!4337))))))

(assert (=> start!36144 e!221992))

(assert (=> start!36144 true))

(declare-fun array_inv!7154 (array!20460) Bool)

(assert (=> start!36144 (array_inv!7154 a!4337)))

(declare-fun b!362472 () Bool)

(assert (=> b!362472 (= e!221992 (not e!221993))))

(declare-fun res!201762 () Bool)

(assert (=> b!362472 (=> res!201762 e!221993)))

(assert (=> b!362472 (= res!201762 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362472 (= (arrayCountValidKeys!0 lt!166750 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362472 (= lt!166750 (array!20461 (store (arr!9712 a!4337) i!1478 k!2980) (size!10064 a!4337)))))

(declare-datatypes ((Unit!11124 0))(
  ( (Unit!11125) )
))
(declare-fun lt!166751 () Unit!11124)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11124)

(assert (=> b!362472 (= lt!166751 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362473 () Bool)

(declare-fun res!201759 () Bool)

(assert (=> b!362473 (=> (not res!201759) (not e!221992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362473 (= res!201759 (not (validKeyInArray!0 (select (arr!9712 a!4337) i!1478))))))

(declare-fun b!362474 () Bool)

(declare-fun res!201761 () Bool)

(assert (=> b!362474 (=> (not res!201761) (not e!221992))))

(assert (=> b!362474 (= res!201761 (validKeyInArray!0 k!2980))))

(assert (= (and start!36144 res!201763) b!362473))

(assert (= (and b!362473 res!201759) b!362474))

(assert (= (and b!362474 res!201761) b!362471))

(assert (= (and b!362471 res!201760) b!362472))

(assert (= (and b!362472 (not res!201762)) b!362470))

(declare-fun m!359009 () Bool)

(assert (=> b!362472 m!359009))

(declare-fun m!359011 () Bool)

(assert (=> b!362472 m!359011))

(declare-fun m!359013 () Bool)

(assert (=> b!362472 m!359013))

(declare-fun m!359015 () Bool)

(assert (=> b!362472 m!359015))

(declare-fun m!359017 () Bool)

(assert (=> start!36144 m!359017))

(declare-fun m!359019 () Bool)

(assert (=> b!362474 m!359019))

(declare-fun m!359021 () Bool)

(assert (=> b!362473 m!359021))

(assert (=> b!362473 m!359021))

(declare-fun m!359023 () Bool)

(assert (=> b!362473 m!359023))

(declare-fun m!359025 () Bool)

(assert (=> b!362470 m!359025))

(declare-fun m!359027 () Bool)

(assert (=> b!362470 m!359027))

(push 1)

(assert (not b!362472))

(assert (not b!362470))

(assert (not start!36144))

(assert (not b!362474))

(assert (not b!362473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

