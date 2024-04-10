; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117118 () Bool)

(assert start!117118)

(declare-fun res!921089 () Bool)

(declare-fun e!780947 () Bool)

(assert (=> start!117118 (=> (not res!921089) (not e!780947))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93735 0))(
  ( (array!93736 (arr!45268 (Array (_ BitVec 32) (_ BitVec 64))) (size!45818 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93735)

(assert (=> start!117118 (= res!921089 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45818 a!4094))))))

(assert (=> start!117118 e!780947))

(assert (=> start!117118 true))

(declare-fun array_inv!34296 (array!93735) Bool)

(assert (=> start!117118 (array_inv!34296 a!4094)))

(declare-fun b!1378555 () Bool)

(declare-fun res!921090 () Bool)

(assert (=> b!1378555 (=> (not res!921090) (not e!780947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378555 (= res!921090 (validKeyInArray!0 (select (arr!45268 a!4094) i!1451)))))

(declare-fun b!1378556 () Bool)

(declare-fun e!780949 () Bool)

(assert (=> b!1378556 (= e!780947 e!780949)))

(declare-fun res!921094 () Bool)

(assert (=> b!1378556 (=> (not res!921094) (not e!780949))))

(declare-fun lt!606772 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606775 () (_ BitVec 32))

(assert (=> b!1378556 (= res!921094 (and (= lt!606775 (bvsub lt!606772 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606778 () array!93735)

(declare-fun arrayCountValidKeys!0 (array!93735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378556 (= lt!606775 (arrayCountValidKeys!0 lt!606778 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378556 (= lt!606772 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378556 (= lt!606778 (array!93736 (store (arr!45268 a!4094) i!1451 k!2953) (size!45818 a!4094)))))

(declare-fun b!1378557 () Bool)

(declare-fun res!921092 () Bool)

(assert (=> b!1378557 (=> (not res!921092) (not e!780947))))

(assert (=> b!1378557 (= res!921092 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378558 () Bool)

(declare-fun e!780950 () Bool)

(assert (=> b!1378558 (= e!780950 true)))

(assert (=> b!1378558 (= (arrayCountValidKeys!0 lt!606778 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45799 0))(
  ( (Unit!45800) )
))
(declare-fun lt!606774 () Unit!45799)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93735 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45799)

(assert (=> b!1378558 (= lt!606774 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378559 () Bool)

(declare-fun res!921091 () Bool)

(assert (=> b!1378559 (=> (not res!921091) (not e!780947))))

(assert (=> b!1378559 (= res!921091 (and (bvslt (size!45818 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45818 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378560 () Bool)

(assert (=> b!1378560 (= e!780949 (not e!780950))))

(declare-fun res!921093 () Bool)

(assert (=> b!1378560 (=> res!921093 e!780950)))

(declare-fun lt!606779 () (_ BitVec 32))

(declare-fun lt!606771 () (_ BitVec 32))

(assert (=> b!1378560 (= res!921093 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45818 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606771 (bvsub lt!606779 #b00000000000000000000000000000001)))))))

(declare-fun lt!606780 () (_ BitVec 32))

(assert (=> b!1378560 (= (bvadd lt!606780 lt!606775) lt!606771)))

(assert (=> b!1378560 (= lt!606771 (arrayCountValidKeys!0 lt!606778 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378560 (= lt!606780 (arrayCountValidKeys!0 lt!606778 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606776 () Unit!45799)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45799)

(assert (=> b!1378560 (= lt!606776 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606778 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606773 () (_ BitVec 32))

(assert (=> b!1378560 (= (bvadd lt!606773 lt!606772) lt!606779)))

(assert (=> b!1378560 (= lt!606779 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378560 (= lt!606773 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606777 () Unit!45799)

(assert (=> b!1378560 (= lt!606777 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117118 res!921089) b!1378555))

(assert (= (and b!1378555 res!921090) b!1378557))

(assert (= (and b!1378557 res!921092) b!1378559))

(assert (= (and b!1378559 res!921091) b!1378556))

(assert (= (and b!1378556 res!921094) b!1378560))

(assert (= (and b!1378560 (not res!921093)) b!1378558))

(declare-fun m!1263271 () Bool)

(assert (=> b!1378555 m!1263271))

(assert (=> b!1378555 m!1263271))

(declare-fun m!1263273 () Bool)

(assert (=> b!1378555 m!1263273))

(declare-fun m!1263275 () Bool)

(assert (=> start!117118 m!1263275))

(declare-fun m!1263277 () Bool)

(assert (=> b!1378558 m!1263277))

(declare-fun m!1263279 () Bool)

(assert (=> b!1378558 m!1263279))

(declare-fun m!1263281 () Bool)

(assert (=> b!1378558 m!1263281))

(declare-fun m!1263283 () Bool)

(assert (=> b!1378556 m!1263283))

(declare-fun m!1263285 () Bool)

(assert (=> b!1378556 m!1263285))

(declare-fun m!1263287 () Bool)

(assert (=> b!1378556 m!1263287))

(declare-fun m!1263289 () Bool)

(assert (=> b!1378557 m!1263289))

(declare-fun m!1263291 () Bool)

(assert (=> b!1378560 m!1263291))

(declare-fun m!1263293 () Bool)

(assert (=> b!1378560 m!1263293))

(declare-fun m!1263295 () Bool)

(assert (=> b!1378560 m!1263295))

(declare-fun m!1263297 () Bool)

(assert (=> b!1378560 m!1263297))

(declare-fun m!1263299 () Bool)

(assert (=> b!1378560 m!1263299))

(declare-fun m!1263301 () Bool)

(assert (=> b!1378560 m!1263301))

(push 1)

(assert (not b!1378560))

(assert (not b!1378558))

(assert (not b!1378557))

(assert (not b!1378555))

(assert (not start!117118))

(assert (not b!1378556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

