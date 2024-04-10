; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117198 () Bool)

(assert start!117198)

(declare-fun b!1379165 () Bool)

(declare-fun e!781273 () Bool)

(declare-fun e!781272 () Bool)

(assert (=> b!1379165 (= e!781273 e!781272)))

(declare-fun res!921700 () Bool)

(assert (=> b!1379165 (=> (not res!921700) (not e!781272))))

(declare-fun lt!607199 () (_ BitVec 32))

(declare-fun lt!607198 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379165 (= res!921700 (and (= lt!607198 (bvsub lt!607199 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93815 0))(
  ( (array!93816 (arr!45308 (Array (_ BitVec 32) (_ BitVec 64))) (size!45858 (_ BitVec 32))) )
))
(declare-fun lt!607197 () array!93815)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93815 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379165 (= lt!607198 (arrayCountValidKeys!0 lt!607197 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93815)

(assert (=> b!1379165 (= lt!607199 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379165 (= lt!607197 (array!93816 (store (arr!45308 a!4094) i!1451 k!2953) (size!45858 a!4094)))))

(declare-fun b!1379166 () Bool)

(declare-fun res!921703 () Bool)

(assert (=> b!1379166 (=> (not res!921703) (not e!781273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379166 (= res!921703 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379167 () Bool)

(declare-fun res!921699 () Bool)

(assert (=> b!1379167 (=> (not res!921699) (not e!781273))))

(assert (=> b!1379167 (= res!921699 (validKeyInArray!0 (select (arr!45308 a!4094) i!1451)))))

(declare-fun b!1379168 () Bool)

(declare-fun res!921702 () Bool)

(assert (=> b!1379168 (=> (not res!921702) (not e!781273))))

(assert (=> b!1379168 (= res!921702 (and (bvslt (size!45858 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45858 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921701 () Bool)

(assert (=> start!117198 (=> (not res!921701) (not e!781273))))

(assert (=> start!117198 (= res!921701 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45858 a!4094))))))

(assert (=> start!117198 e!781273))

(assert (=> start!117198 true))

(declare-fun array_inv!34336 (array!93815) Bool)

(assert (=> start!117198 (array_inv!34336 a!4094)))

(declare-fun b!1379169 () Bool)

(assert (=> b!1379169 (= e!781272 (not true))))

(assert (=> b!1379169 (= (bvadd (arrayCountValidKeys!0 lt!607197 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607198) (arrayCountValidKeys!0 lt!607197 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45843 0))(
  ( (Unit!45844) )
))
(declare-fun lt!607200 () Unit!45843)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45843)

(assert (=> b!1379169 (= lt!607200 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607197 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379169 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607199) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607196 () Unit!45843)

(assert (=> b!1379169 (= lt!607196 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117198 res!921701) b!1379167))

(assert (= (and b!1379167 res!921699) b!1379166))

(assert (= (and b!1379166 res!921703) b!1379168))

(assert (= (and b!1379168 res!921702) b!1379165))

(assert (= (and b!1379165 res!921700) b!1379169))

(declare-fun m!1264101 () Bool)

(assert (=> start!117198 m!1264101))

(declare-fun m!1264103 () Bool)

(assert (=> b!1379169 m!1264103))

(declare-fun m!1264105 () Bool)

(assert (=> b!1379169 m!1264105))

(declare-fun m!1264107 () Bool)

(assert (=> b!1379169 m!1264107))

(declare-fun m!1264109 () Bool)

(assert (=> b!1379169 m!1264109))

(declare-fun m!1264111 () Bool)

(assert (=> b!1379169 m!1264111))

(declare-fun m!1264113 () Bool)

(assert (=> b!1379169 m!1264113))

(declare-fun m!1264115 () Bool)

(assert (=> b!1379165 m!1264115))

(declare-fun m!1264117 () Bool)

(assert (=> b!1379165 m!1264117))

(declare-fun m!1264119 () Bool)

(assert (=> b!1379165 m!1264119))

(declare-fun m!1264121 () Bool)

(assert (=> b!1379166 m!1264121))

(declare-fun m!1264123 () Bool)

(assert (=> b!1379167 m!1264123))

(assert (=> b!1379167 m!1264123))

(declare-fun m!1264125 () Bool)

(assert (=> b!1379167 m!1264125))

(push 1)

(assert (not start!117198))

(assert (not b!1379166))

(assert (not b!1379169))

(assert (not b!1379167))

(assert (not b!1379165))

(check-sat)

(pop 1)

