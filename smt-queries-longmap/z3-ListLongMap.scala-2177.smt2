; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36382 () Bool)

(assert start!36382)

(declare-fun b!364009 () Bool)

(declare-fun res!203220 () Bool)

(declare-fun e!222875 () Bool)

(assert (=> b!364009 (=> (not res!203220) (not e!222875))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364009 (= res!203220 (validKeyInArray!0 k0!2974))))

(declare-fun b!364010 () Bool)

(declare-fun res!203217 () Bool)

(assert (=> b!364010 (=> (not res!203217) (not e!222875))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20657 0))(
  ( (array!20658 (arr!9807 (Array (_ BitVec 32) (_ BitVec 64))) (size!10159 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20657)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364010 (= res!203217 (and (bvslt (size!10159 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10159 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203221 () Bool)

(assert (=> start!36382 (=> (not res!203221) (not e!222875))))

(assert (=> start!36382 (= res!203221 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10159 a!4289))))))

(assert (=> start!36382 e!222875))

(assert (=> start!36382 true))

(declare-fun array_inv!7279 (array!20657) Bool)

(assert (=> start!36382 (array_inv!7279 a!4289)))

(declare-fun b!364011 () Bool)

(declare-fun e!222874 () Bool)

(assert (=> b!364011 (= e!222874 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168293 () array!20657)

(declare-fun arrayCountValidKeys!0 (array!20657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364011 (= (arrayCountValidKeys!0 lt!168293 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11293 0))(
  ( (Unit!11294) )
))
(declare-fun lt!168296 () Unit!11293)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11293)

(assert (=> b!364011 (= lt!168296 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364012 () Bool)

(declare-fun res!203218 () Bool)

(assert (=> b!364012 (=> (not res!203218) (not e!222875))))

(assert (=> b!364012 (= res!203218 (not (validKeyInArray!0 (select (arr!9807 a!4289) i!1472))))))

(declare-fun b!364013 () Bool)

(declare-fun e!222872 () Bool)

(assert (=> b!364013 (= e!222872 (not e!222874))))

(declare-fun res!203219 () Bool)

(assert (=> b!364013 (=> res!203219 e!222874)))

(declare-fun lt!168294 () (_ BitVec 32))

(declare-fun lt!168292 () (_ BitVec 32))

(assert (=> b!364013 (= res!203219 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10159 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168294 (bvadd #b00000000000000000000000000000001 lt!168292)))))))

(declare-fun lt!168287 () (_ BitVec 32))

(declare-fun lt!168289 () (_ BitVec 32))

(assert (=> b!364013 (= (bvadd lt!168287 lt!168289) lt!168294)))

(assert (=> b!364013 (= lt!168294 (arrayCountValidKeys!0 lt!168293 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364013 (= lt!168287 (arrayCountValidKeys!0 lt!168293 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168291 () Unit!11293)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11293)

(assert (=> b!364013 (= lt!168291 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168293 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168288 () (_ BitVec 32))

(declare-fun lt!168290 () (_ BitVec 32))

(assert (=> b!364013 (= (bvadd lt!168288 lt!168290) lt!168292)))

(assert (=> b!364013 (= lt!168292 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364013 (= lt!168288 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168295 () Unit!11293)

(assert (=> b!364013 (= lt!168295 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364014 () Bool)

(assert (=> b!364014 (= e!222875 e!222872)))

(declare-fun res!203216 () Bool)

(assert (=> b!364014 (=> (not res!203216) (not e!222872))))

(assert (=> b!364014 (= res!203216 (and (= lt!168289 (bvadd #b00000000000000000000000000000001 lt!168290)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364014 (= lt!168289 (arrayCountValidKeys!0 lt!168293 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364014 (= lt!168290 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364014 (= lt!168293 (array!20658 (store (arr!9807 a!4289) i!1472 k0!2974) (size!10159 a!4289)))))

(assert (= (and start!36382 res!203221) b!364012))

(assert (= (and b!364012 res!203218) b!364009))

(assert (= (and b!364009 res!203220) b!364010))

(assert (= (and b!364010 res!203217) b!364014))

(assert (= (and b!364014 res!203216) b!364013))

(assert (= (and b!364013 (not res!203219)) b!364011))

(declare-fun m!361699 () Bool)

(assert (=> start!36382 m!361699))

(declare-fun m!361701 () Bool)

(assert (=> b!364013 m!361701))

(declare-fun m!361703 () Bool)

(assert (=> b!364013 m!361703))

(declare-fun m!361705 () Bool)

(assert (=> b!364013 m!361705))

(declare-fun m!361707 () Bool)

(assert (=> b!364013 m!361707))

(declare-fun m!361709 () Bool)

(assert (=> b!364013 m!361709))

(declare-fun m!361711 () Bool)

(assert (=> b!364013 m!361711))

(declare-fun m!361713 () Bool)

(assert (=> b!364014 m!361713))

(declare-fun m!361715 () Bool)

(assert (=> b!364014 m!361715))

(declare-fun m!361717 () Bool)

(assert (=> b!364014 m!361717))

(declare-fun m!361719 () Bool)

(assert (=> b!364012 m!361719))

(assert (=> b!364012 m!361719))

(declare-fun m!361721 () Bool)

(assert (=> b!364012 m!361721))

(declare-fun m!361723 () Bool)

(assert (=> b!364009 m!361723))

(declare-fun m!361725 () Bool)

(assert (=> b!364011 m!361725))

(declare-fun m!361727 () Bool)

(assert (=> b!364011 m!361727))

(declare-fun m!361729 () Bool)

(assert (=> b!364011 m!361729))

(check-sat (not b!364013) (not b!364012) (not b!364014) (not b!364009) (not start!36382) (not b!364011))
(check-sat)
