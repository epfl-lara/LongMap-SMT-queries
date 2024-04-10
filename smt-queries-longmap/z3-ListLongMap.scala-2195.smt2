; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36530 () Bool)

(assert start!36530)

(declare-fun b!365000 () Bool)

(declare-fun res!204069 () Bool)

(declare-fun e!223424 () Bool)

(assert (=> b!365000 (=> (not res!204069) (not e!223424))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20789 0))(
  ( (array!20790 (arr!9872 (Array (_ BitVec 32) (_ BitVec 64))) (size!10224 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20789)

(assert (=> b!365000 (= res!204069 (and (bvslt (size!10224 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10224 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365001 () Bool)

(declare-fun res!204068 () Bool)

(assert (=> b!365001 (=> (not res!204068) (not e!223424))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365001 (= res!204068 (validKeyInArray!0 k0!2974))))

(declare-fun b!365003 () Bool)

(declare-fun e!223425 () Bool)

(declare-fun e!223423 () Bool)

(assert (=> b!365003 (= e!223425 (not e!223423))))

(declare-fun res!204066 () Bool)

(assert (=> b!365003 (=> res!204066 e!223423)))

(declare-fun lt!169090 () (_ BitVec 32))

(declare-fun lt!169083 () (_ BitVec 32))

(assert (=> b!365003 (= res!204066 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10224 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169090 (bvadd #b00000000000000000000000000000001 lt!169083)))))))

(declare-fun lt!169086 () (_ BitVec 32))

(declare-fun lt!169089 () (_ BitVec 32))

(assert (=> b!365003 (= (bvadd lt!169086 lt!169089) lt!169090)))

(declare-fun lt!169082 () array!20789)

(declare-fun arrayCountValidKeys!0 (array!20789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365003 (= lt!169090 (arrayCountValidKeys!0 lt!169082 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365003 (= lt!169086 (arrayCountValidKeys!0 lt!169082 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11378 0))(
  ( (Unit!11379) )
))
(declare-fun lt!169088 () Unit!11378)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11378)

(assert (=> b!365003 (= lt!169088 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169082 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169085 () (_ BitVec 32))

(declare-fun lt!169087 () (_ BitVec 32))

(assert (=> b!365003 (= (bvadd lt!169085 lt!169087) lt!169083)))

(assert (=> b!365003 (= lt!169083 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365003 (= lt!169085 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169084 () Unit!11378)

(assert (=> b!365003 (= lt!169084 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!365004 () Bool)

(assert (=> b!365004 (= e!223423 true)))

(assert (=> b!365004 (= (arrayCountValidKeys!0 lt!169082 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!169081 () Unit!11378)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11378)

(assert (=> b!365004 (= lt!169081 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!365005 () Bool)

(assert (=> b!365005 (= e!223424 e!223425)))

(declare-fun res!204065 () Bool)

(assert (=> b!365005 (=> (not res!204065) (not e!223425))))

(assert (=> b!365005 (= res!204065 (and (= lt!169089 (bvadd #b00000000000000000000000000000001 lt!169087)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!365005 (= lt!169089 (arrayCountValidKeys!0 lt!169082 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365005 (= lt!169087 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365005 (= lt!169082 (array!20790 (store (arr!9872 a!4289) i!1472 k0!2974) (size!10224 a!4289)))))

(declare-fun b!365002 () Bool)

(declare-fun res!204067 () Bool)

(assert (=> b!365002 (=> (not res!204067) (not e!223424))))

(assert (=> b!365002 (= res!204067 (not (validKeyInArray!0 (select (arr!9872 a!4289) i!1472))))))

(declare-fun res!204070 () Bool)

(assert (=> start!36530 (=> (not res!204070) (not e!223424))))

(assert (=> start!36530 (= res!204070 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10224 a!4289))))))

(assert (=> start!36530 e!223424))

(assert (=> start!36530 true))

(declare-fun array_inv!7314 (array!20789) Bool)

(assert (=> start!36530 (array_inv!7314 a!4289)))

(assert (= (and start!36530 res!204070) b!365002))

(assert (= (and b!365002 res!204067) b!365001))

(assert (= (and b!365001 res!204068) b!365000))

(assert (= (and b!365000 res!204069) b!365005))

(assert (= (and b!365005 res!204065) b!365003))

(assert (= (and b!365003 (not res!204066)) b!365004))

(declare-fun m!362803 () Bool)

(assert (=> b!365004 m!362803))

(declare-fun m!362805 () Bool)

(assert (=> b!365004 m!362805))

(declare-fun m!362807 () Bool)

(assert (=> b!365004 m!362807))

(declare-fun m!362809 () Bool)

(assert (=> b!365001 m!362809))

(declare-fun m!362811 () Bool)

(assert (=> b!365002 m!362811))

(assert (=> b!365002 m!362811))

(declare-fun m!362813 () Bool)

(assert (=> b!365002 m!362813))

(declare-fun m!362815 () Bool)

(assert (=> b!365003 m!362815))

(declare-fun m!362817 () Bool)

(assert (=> b!365003 m!362817))

(declare-fun m!362819 () Bool)

(assert (=> b!365003 m!362819))

(declare-fun m!362821 () Bool)

(assert (=> b!365003 m!362821))

(declare-fun m!362823 () Bool)

(assert (=> b!365003 m!362823))

(declare-fun m!362825 () Bool)

(assert (=> b!365003 m!362825))

(declare-fun m!362827 () Bool)

(assert (=> start!36530 m!362827))

(declare-fun m!362829 () Bool)

(assert (=> b!365005 m!362829))

(declare-fun m!362831 () Bool)

(assert (=> b!365005 m!362831))

(declare-fun m!362833 () Bool)

(assert (=> b!365005 m!362833))

(check-sat (not start!36530) (not b!365004) (not b!365002) (not b!365001) (not b!365003) (not b!365005))
