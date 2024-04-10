; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117140 () Bool)

(assert start!117140)

(declare-fun b!1378736 () Bool)

(declare-fun res!921270 () Bool)

(declare-fun e!781052 () Bool)

(assert (=> b!1378736 (=> (not res!921270) (not e!781052))))

(declare-datatypes ((array!93757 0))(
  ( (array!93758 (arr!45279 (Array (_ BitVec 32) (_ BitVec 64))) (size!45829 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93757)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378736 (= res!921270 (and (bvslt (size!45829 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45829 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921269 () Bool)

(assert (=> start!117140 (=> (not res!921269) (not e!781052))))

(assert (=> start!117140 (= res!921269 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45829 a!4094))))))

(assert (=> start!117140 e!781052))

(assert (=> start!117140 true))

(declare-fun array_inv!34307 (array!93757) Bool)

(assert (=> start!117140 (array_inv!34307 a!4094)))

(declare-fun b!1378734 () Bool)

(declare-fun res!921268 () Bool)

(assert (=> b!1378734 (=> (not res!921268) (not e!781052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378734 (= res!921268 (validKeyInArray!0 (select (arr!45279 a!4094) i!1451)))))

(declare-fun b!1378737 () Bool)

(assert (=> b!1378737 (= e!781052 false)))

(declare-fun lt!606971 () (_ BitVec 32))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93757 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378737 (= lt!606971 (arrayCountValidKeys!0 (array!93758 (store (arr!45279 a!4094) i!1451 k0!2953) (size!45829 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606972 () (_ BitVec 32))

(assert (=> b!1378737 (= lt!606972 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378735 () Bool)

(declare-fun res!921271 () Bool)

(assert (=> b!1378735 (=> (not res!921271) (not e!781052))))

(assert (=> b!1378735 (= res!921271 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117140 res!921269) b!1378734))

(assert (= (and b!1378734 res!921268) b!1378735))

(assert (= (and b!1378735 res!921271) b!1378736))

(assert (= (and b!1378736 res!921270) b!1378737))

(declare-fun m!1263551 () Bool)

(assert (=> start!117140 m!1263551))

(declare-fun m!1263553 () Bool)

(assert (=> b!1378734 m!1263553))

(assert (=> b!1378734 m!1263553))

(declare-fun m!1263555 () Bool)

(assert (=> b!1378734 m!1263555))

(declare-fun m!1263557 () Bool)

(assert (=> b!1378737 m!1263557))

(declare-fun m!1263559 () Bool)

(assert (=> b!1378737 m!1263559))

(declare-fun m!1263561 () Bool)

(assert (=> b!1378737 m!1263561))

(declare-fun m!1263563 () Bool)

(assert (=> b!1378735 m!1263563))

(check-sat (not b!1378737) (not b!1378735) (not b!1378734) (not start!117140))
