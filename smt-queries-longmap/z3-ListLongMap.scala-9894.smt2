; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117340 () Bool)

(assert start!117340)

(declare-fun b!1379775 () Bool)

(declare-fun e!781739 () Bool)

(declare-fun e!781737 () Bool)

(assert (=> b!1379775 (= e!781739 e!781737)))

(declare-fun res!921521 () Bool)

(assert (=> b!1379775 (=> (not res!921521) (not e!781737))))

(declare-fun lt!607106 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607108 () (_ BitVec 32))

(assert (=> b!1379775 (= res!921521 (and (= lt!607108 (bvsub lt!607106 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93841 0))(
  ( (array!93842 (arr!45316 (Array (_ BitVec 32) (_ BitVec 64))) (size!45867 (_ BitVec 32))) )
))
(declare-fun lt!607105 () array!93841)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93841 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379775 (= lt!607108 (arrayCountValidKeys!0 lt!607105 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93841)

(assert (=> b!1379775 (= lt!607106 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379775 (= lt!607105 (array!93842 (store (arr!45316 a!4094) i!1451 k0!2953) (size!45867 a!4094)))))

(declare-fun b!1379776 () Bool)

(declare-fun res!921524 () Bool)

(assert (=> b!1379776 (=> (not res!921524) (not e!781739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379776 (= res!921524 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379777 () Bool)

(declare-fun res!921522 () Bool)

(assert (=> b!1379777 (=> (not res!921522) (not e!781739))))

(assert (=> b!1379777 (= res!921522 (and (bvslt (size!45867 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45867 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379778 () Bool)

(declare-fun e!781740 () Bool)

(assert (=> b!1379778 (= e!781740 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379778 (= (arrayCountValidKeys!0 lt!607105 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45728 0))(
  ( (Unit!45729) )
))
(declare-fun lt!607110 () Unit!45728)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45728)

(assert (=> b!1379778 (= lt!607110 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun res!921523 () Bool)

(assert (=> start!117340 (=> (not res!921523) (not e!781739))))

(assert (=> start!117340 (= res!921523 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45867 a!4094))))))

(assert (=> start!117340 e!781739))

(assert (=> start!117340 true))

(declare-fun array_inv!34597 (array!93841) Bool)

(assert (=> start!117340 (array_inv!34597 a!4094)))

(declare-fun b!1379779 () Bool)

(assert (=> b!1379779 (= e!781737 (not e!781740))))

(declare-fun res!921525 () Bool)

(assert (=> b!1379779 (=> res!921525 e!781740)))

(declare-fun lt!607103 () (_ BitVec 32))

(declare-fun lt!607107 () (_ BitVec 32))

(assert (=> b!1379779 (= res!921525 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45867 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607107 (bvsub lt!607103 #b00000000000000000000000000000001)))))))

(declare-fun lt!607111 () (_ BitVec 32))

(assert (=> b!1379779 (= (bvadd lt!607111 lt!607108) lt!607107)))

(assert (=> b!1379779 (= lt!607107 (arrayCountValidKeys!0 lt!607105 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379779 (= lt!607111 (arrayCountValidKeys!0 lt!607105 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607104 () Unit!45728)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45728)

(assert (=> b!1379779 (= lt!607104 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607105 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607102 () (_ BitVec 32))

(assert (=> b!1379779 (= (bvadd lt!607102 lt!607106) lt!607103)))

(assert (=> b!1379779 (= lt!607103 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379779 (= lt!607102 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607109 () Unit!45728)

(assert (=> b!1379779 (= lt!607109 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379780 () Bool)

(declare-fun res!921520 () Bool)

(assert (=> b!1379780 (=> (not res!921520) (not e!781739))))

(assert (=> b!1379780 (= res!921520 (validKeyInArray!0 (select (arr!45316 a!4094) i!1451)))))

(assert (= (and start!117340 res!921523) b!1379780))

(assert (= (and b!1379780 res!921520) b!1379776))

(assert (= (and b!1379776 res!921524) b!1379777))

(assert (= (and b!1379777 res!921522) b!1379775))

(assert (= (and b!1379775 res!921521) b!1379779))

(assert (= (and b!1379779 (not res!921525)) b!1379778))

(declare-fun m!1264747 () Bool)

(assert (=> b!1379778 m!1264747))

(declare-fun m!1264749 () Bool)

(assert (=> b!1379778 m!1264749))

(declare-fun m!1264751 () Bool)

(assert (=> b!1379778 m!1264751))

(declare-fun m!1264753 () Bool)

(assert (=> b!1379776 m!1264753))

(declare-fun m!1264755 () Bool)

(assert (=> b!1379779 m!1264755))

(declare-fun m!1264757 () Bool)

(assert (=> b!1379779 m!1264757))

(declare-fun m!1264759 () Bool)

(assert (=> b!1379779 m!1264759))

(declare-fun m!1264761 () Bool)

(assert (=> b!1379779 m!1264761))

(declare-fun m!1264763 () Bool)

(assert (=> b!1379779 m!1264763))

(declare-fun m!1264765 () Bool)

(assert (=> b!1379779 m!1264765))

(declare-fun m!1264767 () Bool)

(assert (=> start!117340 m!1264767))

(declare-fun m!1264769 () Bool)

(assert (=> b!1379775 m!1264769))

(declare-fun m!1264771 () Bool)

(assert (=> b!1379775 m!1264771))

(declare-fun m!1264773 () Bool)

(assert (=> b!1379775 m!1264773))

(declare-fun m!1264775 () Bool)

(assert (=> b!1379780 m!1264775))

(assert (=> b!1379780 m!1264775))

(declare-fun m!1264777 () Bool)

(assert (=> b!1379780 m!1264777))

(check-sat (not b!1379775) (not start!117340) (not b!1379779) (not b!1379778) (not b!1379776) (not b!1379780))
(check-sat)
