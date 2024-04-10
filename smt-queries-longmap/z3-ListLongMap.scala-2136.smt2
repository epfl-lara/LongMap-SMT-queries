; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36110 () Bool)

(assert start!36110)

(declare-fun b!362267 () Bool)

(declare-fun e!221889 () Bool)

(assert (=> b!362267 (= e!221889 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166643 () (_ BitVec 32))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-datatypes ((array!20426 0))(
  ( (array!20427 (arr!9695 (Array (_ BitVec 32) (_ BitVec 64))) (size!10047 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20426)

(declare-fun arrayCountValidKeys!0 (array!20426 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362267 (= lt!166643 (arrayCountValidKeys!0 (array!20427 (store (arr!9695 a!4337) i!1478 k0!2980) (size!10047 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166642 () (_ BitVec 32))

(assert (=> b!362267 (= lt!166642 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201555 () Bool)

(assert (=> start!36110 (=> (not res!201555) (not e!221889))))

(assert (=> start!36110 (= res!201555 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10047 a!4337))))))

(assert (=> start!36110 e!221889))

(assert (=> start!36110 true))

(declare-fun array_inv!7137 (array!20426) Bool)

(assert (=> start!36110 (array_inv!7137 a!4337)))

(declare-fun b!362266 () Bool)

(declare-fun res!201554 () Bool)

(assert (=> b!362266 (=> (not res!201554) (not e!221889))))

(assert (=> b!362266 (= res!201554 (and (bvslt (size!10047 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10047 a!4337))))))

(declare-fun b!362264 () Bool)

(declare-fun res!201556 () Bool)

(assert (=> b!362264 (=> (not res!201556) (not e!221889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362264 (= res!201556 (not (validKeyInArray!0 (select (arr!9695 a!4337) i!1478))))))

(declare-fun b!362265 () Bool)

(declare-fun res!201553 () Bool)

(assert (=> b!362265 (=> (not res!201553) (not e!221889))))

(assert (=> b!362265 (= res!201553 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36110 res!201555) b!362264))

(assert (= (and b!362264 res!201556) b!362265))

(assert (= (and b!362265 res!201553) b!362266))

(assert (= (and b!362266 res!201554) b!362267))

(declare-fun m!358771 () Bool)

(assert (=> b!362267 m!358771))

(declare-fun m!358773 () Bool)

(assert (=> b!362267 m!358773))

(declare-fun m!358775 () Bool)

(assert (=> b!362267 m!358775))

(declare-fun m!358777 () Bool)

(assert (=> start!36110 m!358777))

(declare-fun m!358779 () Bool)

(assert (=> b!362264 m!358779))

(assert (=> b!362264 m!358779))

(declare-fun m!358781 () Bool)

(assert (=> b!362264 m!358781))

(declare-fun m!358783 () Bool)

(assert (=> b!362265 m!358783))

(check-sat (not b!362265) (not b!362264) (not start!36110) (not b!362267))
