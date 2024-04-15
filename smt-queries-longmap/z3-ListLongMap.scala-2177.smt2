; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36382 () Bool)

(assert start!36382)

(declare-fun b!363787 () Bool)

(declare-fun res!203094 () Bool)

(declare-fun e!222731 () Bool)

(assert (=> b!363787 (=> (not res!203094) (not e!222731))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20658 0))(
  ( (array!20659 (arr!9808 (Array (_ BitVec 32) (_ BitVec 64))) (size!10161 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20658)

(assert (=> b!363787 (= res!203094 (and (bvslt (size!10161 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10161 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363788 () Bool)

(declare-fun e!222733 () Bool)

(assert (=> b!363788 (= e!222731 e!222733)))

(declare-fun res!203093 () Bool)

(assert (=> b!363788 (=> (not res!203093) (not e!222733))))

(declare-fun lt!168035 () (_ BitVec 32))

(declare-fun lt!168042 () (_ BitVec 32))

(assert (=> b!363788 (= res!203093 (and (= lt!168035 (bvadd #b00000000000000000000000000000001 lt!168042)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168038 () array!20658)

(declare-fun arrayCountValidKeys!0 (array!20658 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363788 (= lt!168035 (arrayCountValidKeys!0 lt!168038 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363788 (= lt!168042 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363788 (= lt!168038 (array!20659 (store (arr!9808 a!4289) i!1472 k0!2974) (size!10161 a!4289)))))

(declare-fun res!203092 () Bool)

(assert (=> start!36382 (=> (not res!203092) (not e!222731))))

(assert (=> start!36382 (= res!203092 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10161 a!4289))))))

(assert (=> start!36382 e!222731))

(assert (=> start!36382 true))

(declare-fun array_inv!7257 (array!20658) Bool)

(assert (=> start!36382 (array_inv!7257 a!4289)))

(declare-fun b!363789 () Bool)

(declare-fun res!203095 () Bool)

(assert (=> b!363789 (=> (not res!203095) (not e!222731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363789 (= res!203095 (validKeyInArray!0 k0!2974))))

(declare-fun b!363790 () Bool)

(declare-fun e!222732 () Bool)

(assert (=> b!363790 (= e!222732 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363790 (= (arrayCountValidKeys!0 lt!168038 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11282 0))(
  ( (Unit!11283) )
))
(declare-fun lt!168040 () Unit!11282)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11282)

(assert (=> b!363790 (= lt!168040 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!363791 () Bool)

(assert (=> b!363791 (= e!222733 (not e!222732))))

(declare-fun res!203090 () Bool)

(assert (=> b!363791 (=> res!203090 e!222732)))

(declare-fun lt!168036 () (_ BitVec 32))

(declare-fun lt!168039 () (_ BitVec 32))

(assert (=> b!363791 (= res!203090 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10161 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168036 (bvadd #b00000000000000000000000000000001 lt!168039)))))))

(declare-fun lt!168041 () (_ BitVec 32))

(assert (=> b!363791 (= (bvadd lt!168041 lt!168035) lt!168036)))

(assert (=> b!363791 (= lt!168036 (arrayCountValidKeys!0 lt!168038 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363791 (= lt!168041 (arrayCountValidKeys!0 lt!168038 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168043 () Unit!11282)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11282)

(assert (=> b!363791 (= lt!168043 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168038 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168034 () (_ BitVec 32))

(assert (=> b!363791 (= (bvadd lt!168034 lt!168042) lt!168039)))

(assert (=> b!363791 (= lt!168039 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363791 (= lt!168034 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168037 () Unit!11282)

(assert (=> b!363791 (= lt!168037 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363792 () Bool)

(declare-fun res!203091 () Bool)

(assert (=> b!363792 (=> (not res!203091) (not e!222731))))

(assert (=> b!363792 (= res!203091 (not (validKeyInArray!0 (select (arr!9808 a!4289) i!1472))))))

(assert (= (and start!36382 res!203092) b!363792))

(assert (= (and b!363792 res!203091) b!363789))

(assert (= (and b!363789 res!203095) b!363787))

(assert (= (and b!363787 res!203094) b!363788))

(assert (= (and b!363788 res!203093) b!363791))

(assert (= (and b!363791 (not res!203090)) b!363790))

(declare-fun m!360745 () Bool)

(assert (=> start!36382 m!360745))

(declare-fun m!360747 () Bool)

(assert (=> b!363790 m!360747))

(declare-fun m!360749 () Bool)

(assert (=> b!363790 m!360749))

(declare-fun m!360751 () Bool)

(assert (=> b!363790 m!360751))

(declare-fun m!360753 () Bool)

(assert (=> b!363788 m!360753))

(declare-fun m!360755 () Bool)

(assert (=> b!363788 m!360755))

(declare-fun m!360757 () Bool)

(assert (=> b!363788 m!360757))

(declare-fun m!360759 () Bool)

(assert (=> b!363791 m!360759))

(declare-fun m!360761 () Bool)

(assert (=> b!363791 m!360761))

(declare-fun m!360763 () Bool)

(assert (=> b!363791 m!360763))

(declare-fun m!360765 () Bool)

(assert (=> b!363791 m!360765))

(declare-fun m!360767 () Bool)

(assert (=> b!363791 m!360767))

(declare-fun m!360769 () Bool)

(assert (=> b!363791 m!360769))

(declare-fun m!360771 () Bool)

(assert (=> b!363789 m!360771))

(declare-fun m!360773 () Bool)

(assert (=> b!363792 m!360773))

(assert (=> b!363792 m!360773))

(declare-fun m!360775 () Bool)

(assert (=> b!363792 m!360775))

(check-sat (not b!363788) (not b!363792) (not b!363789) (not b!363790) (not start!36382) (not b!363791))
(check-sat)
