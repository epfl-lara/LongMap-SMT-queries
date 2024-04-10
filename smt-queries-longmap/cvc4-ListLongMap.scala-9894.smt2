; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117112 () Bool)

(assert start!117112)

(declare-fun res!921035 () Bool)

(declare-fun e!780914 () Bool)

(assert (=> start!117112 (=> (not res!921035) (not e!780914))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93729 0))(
  ( (array!93730 (arr!45265 (Array (_ BitVec 32) (_ BitVec 64))) (size!45815 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93729)

(assert (=> start!117112 (= res!921035 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45815 a!4094))))))

(assert (=> start!117112 e!780914))

(assert (=> start!117112 true))

(declare-fun array_inv!34293 (array!93729) Bool)

(assert (=> start!117112 (array_inv!34293 a!4094)))

(declare-fun b!1378501 () Bool)

(declare-fun res!921040 () Bool)

(assert (=> b!1378501 (=> (not res!921040) (not e!780914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378501 (= res!921040 (validKeyInArray!0 (select (arr!45265 a!4094) i!1451)))))

(declare-fun b!1378502 () Bool)

(declare-fun e!780913 () Bool)

(assert (=> b!1378502 (= e!780914 e!780913)))

(declare-fun res!921037 () Bool)

(assert (=> b!1378502 (=> (not res!921037) (not e!780913))))

(declare-fun lt!606681 () (_ BitVec 32))

(declare-fun lt!606684 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378502 (= res!921037 (and (= lt!606681 (bvsub lt!606684 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606685 () array!93729)

(declare-fun arrayCountValidKeys!0 (array!93729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378502 (= lt!606681 (arrayCountValidKeys!0 lt!606685 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378502 (= lt!606684 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378502 (= lt!606685 (array!93730 (store (arr!45265 a!4094) i!1451 k!2953) (size!45815 a!4094)))))

(declare-fun b!1378503 () Bool)

(declare-fun e!780912 () Bool)

(assert (=> b!1378503 (= e!780912 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378503 (= (arrayCountValidKeys!0 lt!606685 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45793 0))(
  ( (Unit!45794) )
))
(declare-fun lt!606690 () Unit!45793)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45793)

(assert (=> b!1378503 (= lt!606690 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378504 () Bool)

(declare-fun res!921036 () Bool)

(assert (=> b!1378504 (=> (not res!921036) (not e!780914))))

(assert (=> b!1378504 (= res!921036 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378505 () Bool)

(assert (=> b!1378505 (= e!780913 (not e!780912))))

(declare-fun res!921038 () Bool)

(assert (=> b!1378505 (=> res!921038 e!780912)))

(declare-fun lt!606682 () (_ BitVec 32))

(declare-fun lt!606686 () (_ BitVec 32))

(assert (=> b!1378505 (= res!921038 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45815 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606686 (bvsub lt!606682 #b00000000000000000000000000000001)))))))

(declare-fun lt!606683 () (_ BitVec 32))

(assert (=> b!1378505 (= (bvadd lt!606683 lt!606681) lt!606686)))

(assert (=> b!1378505 (= lt!606686 (arrayCountValidKeys!0 lt!606685 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378505 (= lt!606683 (arrayCountValidKeys!0 lt!606685 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606688 () Unit!45793)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45793)

(assert (=> b!1378505 (= lt!606688 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606685 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606687 () (_ BitVec 32))

(assert (=> b!1378505 (= (bvadd lt!606687 lt!606684) lt!606682)))

(assert (=> b!1378505 (= lt!606682 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378505 (= lt!606687 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606689 () Unit!45793)

(assert (=> b!1378505 (= lt!606689 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378506 () Bool)

(declare-fun res!921039 () Bool)

(assert (=> b!1378506 (=> (not res!921039) (not e!780914))))

(assert (=> b!1378506 (= res!921039 (and (bvslt (size!45815 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45815 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117112 res!921035) b!1378501))

(assert (= (and b!1378501 res!921040) b!1378504))

(assert (= (and b!1378504 res!921036) b!1378506))

(assert (= (and b!1378506 res!921039) b!1378502))

(assert (= (and b!1378502 res!921037) b!1378505))

(assert (= (and b!1378505 (not res!921038)) b!1378503))

(declare-fun m!1263175 () Bool)

(assert (=> b!1378505 m!1263175))

(declare-fun m!1263177 () Bool)

(assert (=> b!1378505 m!1263177))

(declare-fun m!1263179 () Bool)

(assert (=> b!1378505 m!1263179))

(declare-fun m!1263181 () Bool)

(assert (=> b!1378505 m!1263181))

(declare-fun m!1263183 () Bool)

(assert (=> b!1378505 m!1263183))

(declare-fun m!1263185 () Bool)

(assert (=> b!1378505 m!1263185))

(declare-fun m!1263187 () Bool)

(assert (=> start!117112 m!1263187))

(declare-fun m!1263189 () Bool)

(assert (=> b!1378502 m!1263189))

(declare-fun m!1263191 () Bool)

(assert (=> b!1378502 m!1263191))

(declare-fun m!1263193 () Bool)

(assert (=> b!1378502 m!1263193))

(declare-fun m!1263195 () Bool)

(assert (=> b!1378503 m!1263195))

(declare-fun m!1263197 () Bool)

(assert (=> b!1378503 m!1263197))

(declare-fun m!1263199 () Bool)

(assert (=> b!1378503 m!1263199))

(declare-fun m!1263201 () Bool)

(assert (=> b!1378504 m!1263201))

(declare-fun m!1263203 () Bool)

(assert (=> b!1378501 m!1263203))

(assert (=> b!1378501 m!1263203))

(declare-fun m!1263205 () Bool)

(assert (=> b!1378501 m!1263205))

(push 1)

(assert (not b!1378501))

(assert (not b!1378503))

(assert (not b!1378502))

(assert (not b!1378504))

(assert (not b!1378505))

(assert (not start!117112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

