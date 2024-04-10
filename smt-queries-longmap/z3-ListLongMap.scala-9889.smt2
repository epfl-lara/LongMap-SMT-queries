; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117080 () Bool)

(assert start!117080)

(declare-fun res!920791 () Bool)

(declare-fun e!780760 () Bool)

(assert (=> start!117080 (=> (not res!920791) (not e!780760))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93697 0))(
  ( (array!93698 (arr!45249 (Array (_ BitVec 32) (_ BitVec 64))) (size!45799 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93697)

(assert (=> start!117080 (= res!920791 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45799 a!4094))))))

(assert (=> start!117080 e!780760))

(assert (=> start!117080 true))

(declare-fun array_inv!34277 (array!93697) Bool)

(assert (=> start!117080 (array_inv!34277 a!4094)))

(declare-fun b!1378253 () Bool)

(declare-fun res!920790 () Bool)

(assert (=> b!1378253 (=> (not res!920790) (not e!780760))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378253 (= res!920790 (and (bvslt (size!45799 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45799 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378254 () Bool)

(declare-fun res!920789 () Bool)

(assert (=> b!1378254 (=> (not res!920789) (not e!780760))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378254 (= res!920789 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378255 () Bool)

(declare-fun res!920787 () Bool)

(assert (=> b!1378255 (=> (not res!920787) (not e!780760))))

(assert (=> b!1378255 (= res!920787 (validKeyInArray!0 (select (arr!45249 a!4094) i!1451)))))

(declare-fun b!1378256 () Bool)

(declare-fun e!780759 () Bool)

(assert (=> b!1378256 (= e!780760 e!780759)))

(declare-fun res!920788 () Bool)

(assert (=> b!1378256 (=> (not res!920788) (not e!780759))))

(declare-fun lt!606403 () (_ BitVec 32))

(declare-fun lt!606405 () (_ BitVec 32))

(assert (=> b!1378256 (= res!920788 (and (= lt!606403 (bvsub lt!606405 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606401 () array!93697)

(declare-fun arrayCountValidKeys!0 (array!93697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378256 (= lt!606403 (arrayCountValidKeys!0 lt!606401 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378256 (= lt!606405 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378256 (= lt!606401 (array!93698 (store (arr!45249 a!4094) i!1451 k0!2953) (size!45799 a!4094)))))

(declare-fun b!1378257 () Bool)

(assert (=> b!1378257 (= e!780759 (not true))))

(assert (=> b!1378257 (= (bvadd (arrayCountValidKeys!0 lt!606401 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606403) (arrayCountValidKeys!0 lt!606401 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45761 0))(
  ( (Unit!45762) )
))
(declare-fun lt!606402 () Unit!45761)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45761)

(assert (=> b!1378257 (= lt!606402 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606401 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378257 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606405) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606404 () Unit!45761)

(assert (=> b!1378257 (= lt!606404 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117080 res!920791) b!1378255))

(assert (= (and b!1378255 res!920787) b!1378254))

(assert (= (and b!1378254 res!920789) b!1378253))

(assert (= (and b!1378253 res!920790) b!1378256))

(assert (= (and b!1378256 res!920788) b!1378257))

(declare-fun m!1262747 () Bool)

(assert (=> start!117080 m!1262747))

(declare-fun m!1262749 () Bool)

(assert (=> b!1378257 m!1262749))

(declare-fun m!1262751 () Bool)

(assert (=> b!1378257 m!1262751))

(declare-fun m!1262753 () Bool)

(assert (=> b!1378257 m!1262753))

(declare-fun m!1262755 () Bool)

(assert (=> b!1378257 m!1262755))

(declare-fun m!1262757 () Bool)

(assert (=> b!1378257 m!1262757))

(declare-fun m!1262759 () Bool)

(assert (=> b!1378257 m!1262759))

(declare-fun m!1262761 () Bool)

(assert (=> b!1378255 m!1262761))

(assert (=> b!1378255 m!1262761))

(declare-fun m!1262763 () Bool)

(assert (=> b!1378255 m!1262763))

(declare-fun m!1262765 () Bool)

(assert (=> b!1378256 m!1262765))

(declare-fun m!1262767 () Bool)

(assert (=> b!1378256 m!1262767))

(declare-fun m!1262769 () Bool)

(assert (=> b!1378256 m!1262769))

(declare-fun m!1262771 () Bool)

(assert (=> b!1378254 m!1262771))

(check-sat (not b!1378254) (not b!1378257) (not start!117080) (not b!1378256) (not b!1378255))
