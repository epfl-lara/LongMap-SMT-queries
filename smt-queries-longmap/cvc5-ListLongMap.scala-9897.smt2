; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117126 () Bool)

(assert start!117126)

(declare-fun b!1378594 () Bool)

(declare-fun res!921174 () Bool)

(declare-fun e!780988 () Bool)

(assert (=> b!1378594 (=> (not res!921174) (not e!780988))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378594 (= res!921174 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378595 () Bool)

(declare-fun res!921172 () Bool)

(assert (=> b!1378595 (=> (not res!921172) (not e!780988))))

(declare-datatypes ((array!93697 0))(
  ( (array!93698 (arr!45249 (Array (_ BitVec 32) (_ BitVec 64))) (size!45801 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93697)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378595 (= res!921172 (and (bvslt (size!45801 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45801 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378596 () Bool)

(declare-fun e!780990 () Bool)

(declare-fun e!780991 () Bool)

(assert (=> b!1378596 (= e!780990 (not e!780991))))

(declare-fun res!921173 () Bool)

(assert (=> b!1378596 (=> res!921173 e!780991)))

(declare-fun lt!606773 () (_ BitVec 32))

(declare-fun lt!606769 () (_ BitVec 32))

(assert (=> b!1378596 (= res!921173 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45801 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606769 (bvsub lt!606773 #b00000000000000000000000000000001)))))))

(declare-fun lt!606776 () (_ BitVec 32))

(declare-fun lt!606774 () (_ BitVec 32))

(assert (=> b!1378596 (= (bvadd lt!606776 lt!606774) lt!606769)))

(declare-fun lt!606772 () array!93697)

(declare-fun arrayCountValidKeys!0 (array!93697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378596 (= lt!606769 (arrayCountValidKeys!0 lt!606772 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378596 (= lt!606776 (arrayCountValidKeys!0 lt!606772 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45652 0))(
  ( (Unit!45653) )
))
(declare-fun lt!606768 () Unit!45652)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45652)

(assert (=> b!1378596 (= lt!606768 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606772 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606770 () (_ BitVec 32))

(declare-fun lt!606771 () (_ BitVec 32))

(assert (=> b!1378596 (= (bvadd lt!606770 lt!606771) lt!606773)))

(assert (=> b!1378596 (= lt!606773 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378596 (= lt!606770 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606775 () Unit!45652)

(assert (=> b!1378596 (= lt!606775 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921171 () Bool)

(assert (=> start!117126 (=> (not res!921171) (not e!780988))))

(assert (=> start!117126 (= res!921171 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45801 a!4094))))))

(assert (=> start!117126 e!780988))

(assert (=> start!117126 true))

(declare-fun array_inv!34482 (array!93697) Bool)

(assert (=> start!117126 (array_inv!34482 a!4094)))

(declare-fun b!1378597 () Bool)

(assert (=> b!1378597 (= e!780988 e!780990)))

(declare-fun res!921176 () Bool)

(assert (=> b!1378597 (=> (not res!921176) (not e!780990))))

(assert (=> b!1378597 (= res!921176 (and (= lt!606774 (bvsub lt!606771 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378597 (= lt!606774 (arrayCountValidKeys!0 lt!606772 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378597 (= lt!606771 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378597 (= lt!606772 (array!93698 (store (arr!45249 a!4094) i!1451 k!2953) (size!45801 a!4094)))))

(declare-fun b!1378598 () Bool)

(declare-fun res!921175 () Bool)

(assert (=> b!1378598 (=> (not res!921175) (not e!780988))))

(assert (=> b!1378598 (= res!921175 (validKeyInArray!0 (select (arr!45249 a!4094) i!1451)))))

(declare-fun b!1378599 () Bool)

(assert (=> b!1378599 (= e!780991 true)))

(assert (=> b!1378599 (= (arrayCountValidKeys!0 lt!606772 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606767 () Unit!45652)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45652)

(assert (=> b!1378599 (= lt!606767 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(assert (= (and start!117126 res!921171) b!1378598))

(assert (= (and b!1378598 res!921175) b!1378594))

(assert (= (and b!1378594 res!921174) b!1378595))

(assert (= (and b!1378595 res!921172) b!1378597))

(assert (= (and b!1378597 res!921176) b!1378596))

(assert (= (and b!1378596 (not res!921173)) b!1378599))

(declare-fun m!1262959 () Bool)

(assert (=> b!1378599 m!1262959))

(declare-fun m!1262961 () Bool)

(assert (=> b!1378599 m!1262961))

(declare-fun m!1262963 () Bool)

(assert (=> b!1378599 m!1262963))

(declare-fun m!1262965 () Bool)

(assert (=> b!1378594 m!1262965))

(declare-fun m!1262967 () Bool)

(assert (=> start!117126 m!1262967))

(declare-fun m!1262969 () Bool)

(assert (=> b!1378598 m!1262969))

(assert (=> b!1378598 m!1262969))

(declare-fun m!1262971 () Bool)

(assert (=> b!1378598 m!1262971))

(declare-fun m!1262973 () Bool)

(assert (=> b!1378597 m!1262973))

(declare-fun m!1262975 () Bool)

(assert (=> b!1378597 m!1262975))

(declare-fun m!1262977 () Bool)

(assert (=> b!1378597 m!1262977))

(declare-fun m!1262979 () Bool)

(assert (=> b!1378596 m!1262979))

(declare-fun m!1262981 () Bool)

(assert (=> b!1378596 m!1262981))

(declare-fun m!1262983 () Bool)

(assert (=> b!1378596 m!1262983))

(declare-fun m!1262985 () Bool)

(assert (=> b!1378596 m!1262985))

(declare-fun m!1262987 () Bool)

(assert (=> b!1378596 m!1262987))

(declare-fun m!1262989 () Bool)

(assert (=> b!1378596 m!1262989))

(push 1)

(assert (not start!117126))

(assert (not b!1378599))

(assert (not b!1378597))

(assert (not b!1378594))

(assert (not b!1378596))

(assert (not b!1378598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

