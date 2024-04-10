; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36134 () Bool)

(assert start!36134)

(declare-fun b!362408 () Bool)

(declare-fun res!201698 () Bool)

(declare-fun e!221961 () Bool)

(assert (=> b!362408 (=> (not res!201698) (not e!221961))))

(declare-datatypes ((array!20450 0))(
  ( (array!20451 (arr!9707 (Array (_ BitVec 32) (_ BitVec 64))) (size!10059 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20450)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362408 (= res!201698 (not (validKeyInArray!0 (select (arr!9707 a!4337) i!1478))))))

(declare-fun b!362409 () Bool)

(declare-fun res!201697 () Bool)

(assert (=> b!362409 (=> (not res!201697) (not e!221961))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362409 (= res!201697 (validKeyInArray!0 k0!2980))))

(declare-fun res!201700 () Bool)

(assert (=> start!36134 (=> (not res!201700) (not e!221961))))

(assert (=> start!36134 (= res!201700 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10059 a!4337))))))

(assert (=> start!36134 e!221961))

(assert (=> start!36134 true))

(declare-fun array_inv!7149 (array!20450) Bool)

(assert (=> start!36134 (array_inv!7149 a!4337)))

(declare-fun b!362411 () Bool)

(assert (=> b!362411 (= e!221961 false)))

(declare-fun lt!166715 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20450 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362411 (= lt!166715 (arrayCountValidKeys!0 (array!20451 (store (arr!9707 a!4337) i!1478 k0!2980) (size!10059 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166714 () (_ BitVec 32))

(assert (=> b!362411 (= lt!166714 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362410 () Bool)

(declare-fun res!201699 () Bool)

(assert (=> b!362410 (=> (not res!201699) (not e!221961))))

(assert (=> b!362410 (= res!201699 (and (bvslt (size!10059 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10059 a!4337))))))

(assert (= (and start!36134 res!201700) b!362408))

(assert (= (and b!362408 res!201698) b!362409))

(assert (= (and b!362409 res!201697) b!362410))

(assert (= (and b!362410 res!201699) b!362411))

(declare-fun m!358939 () Bool)

(assert (=> b!362408 m!358939))

(assert (=> b!362408 m!358939))

(declare-fun m!358941 () Bool)

(assert (=> b!362408 m!358941))

(declare-fun m!358943 () Bool)

(assert (=> b!362409 m!358943))

(declare-fun m!358945 () Bool)

(assert (=> start!36134 m!358945))

(declare-fun m!358947 () Bool)

(assert (=> b!362411 m!358947))

(declare-fun m!358949 () Bool)

(assert (=> b!362411 m!358949))

(declare-fun m!358951 () Bool)

(assert (=> b!362411 m!358951))

(check-sat (not b!362409) (not b!362408) (not start!36134) (not b!362411))
