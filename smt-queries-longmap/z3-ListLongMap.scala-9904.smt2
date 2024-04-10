; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117170 () Bool)

(assert start!117170)

(declare-fun b!1378942 () Bool)

(declare-fun e!781146 () Bool)

(declare-fun e!781148 () Bool)

(assert (=> b!1378942 (= e!781146 e!781148)))

(declare-fun res!921478 () Bool)

(assert (=> b!1378942 (=> (not res!921478) (not e!781148))))

(declare-datatypes ((array!93787 0))(
  ( (array!93788 (arr!45294 (Array (_ BitVec 32) (_ BitVec 64))) (size!45844 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93787)

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!607025 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378942 (= res!921478 (= (arrayCountValidKeys!0 (array!93788 (store (arr!45294 a!4094) i!1451 k0!2953) (size!45844 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607025 #b00000000000000000000000000000001)))))

(assert (=> b!1378942 (= lt!607025 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378943 () Bool)

(assert (=> b!1378943 (= e!781148 (not true))))

(assert (=> b!1378943 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607025) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45815 0))(
  ( (Unit!45816) )
))
(declare-fun lt!607026 () Unit!45815)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45815)

(assert (=> b!1378943 (= lt!607026 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378944 () Bool)

(declare-fun res!921479 () Bool)

(assert (=> b!1378944 (=> (not res!921479) (not e!781148))))

(assert (=> b!1378944 (= res!921479 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun res!921476 () Bool)

(assert (=> start!117170 (=> (not res!921476) (not e!781146))))

(assert (=> start!117170 (= res!921476 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45844 a!4094))))))

(assert (=> start!117170 e!781146))

(assert (=> start!117170 true))

(declare-fun array_inv!34322 (array!93787) Bool)

(assert (=> start!117170 (array_inv!34322 a!4094)))

(declare-fun b!1378945 () Bool)

(declare-fun res!921481 () Bool)

(assert (=> b!1378945 (=> (not res!921481) (not e!781146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378945 (= res!921481 (validKeyInArray!0 (select (arr!45294 a!4094) i!1451)))))

(declare-fun b!1378946 () Bool)

(declare-fun res!921477 () Bool)

(assert (=> b!1378946 (=> (not res!921477) (not e!781146))))

(assert (=> b!1378946 (= res!921477 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378947 () Bool)

(declare-fun res!921480 () Bool)

(assert (=> b!1378947 (=> (not res!921480) (not e!781146))))

(assert (=> b!1378947 (= res!921480 (and (bvslt (size!45844 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45844 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117170 res!921476) b!1378945))

(assert (= (and b!1378945 res!921481) b!1378946))

(assert (= (and b!1378946 res!921477) b!1378947))

(assert (= (and b!1378947 res!921480) b!1378942))

(assert (= (and b!1378942 res!921478) b!1378944))

(assert (= (and b!1378944 res!921479) b!1378943))

(declare-fun m!1263767 () Bool)

(assert (=> b!1378943 m!1263767))

(declare-fun m!1263769 () Bool)

(assert (=> b!1378943 m!1263769))

(declare-fun m!1263771 () Bool)

(assert (=> b!1378943 m!1263771))

(declare-fun m!1263773 () Bool)

(assert (=> b!1378942 m!1263773))

(declare-fun m!1263775 () Bool)

(assert (=> b!1378942 m!1263775))

(declare-fun m!1263777 () Bool)

(assert (=> b!1378942 m!1263777))

(declare-fun m!1263779 () Bool)

(assert (=> start!117170 m!1263779))

(declare-fun m!1263781 () Bool)

(assert (=> b!1378945 m!1263781))

(assert (=> b!1378945 m!1263781))

(declare-fun m!1263783 () Bool)

(assert (=> b!1378945 m!1263783))

(declare-fun m!1263785 () Bool)

(assert (=> b!1378946 m!1263785))

(check-sat (not start!117170) (not b!1378942) (not b!1378943) (not b!1378945) (not b!1378946))
