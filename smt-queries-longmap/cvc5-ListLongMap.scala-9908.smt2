; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117192 () Bool)

(assert start!117192)

(declare-fun b!1379120 () Bool)

(declare-fun res!921656 () Bool)

(declare-fun e!781245 () Bool)

(assert (=> b!1379120 (=> (not res!921656) (not e!781245))))

(declare-datatypes ((array!93809 0))(
  ( (array!93810 (arr!45305 (Array (_ BitVec 32) (_ BitVec 64))) (size!45855 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93809)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379120 (= res!921656 (validKeyInArray!0 (select (arr!45305 a!4094) i!1451)))))

(declare-fun b!1379121 () Bool)

(declare-fun e!781247 () Bool)

(assert (=> b!1379121 (= e!781247 (not true))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607153 () array!93809)

(declare-fun lt!607155 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379121 (= (bvadd (arrayCountValidKeys!0 lt!607153 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607155) (arrayCountValidKeys!0 lt!607153 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45837 0))(
  ( (Unit!45838) )
))
(declare-fun lt!607154 () Unit!45837)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45837)

(assert (=> b!1379121 (= lt!607154 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607153 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607152 () (_ BitVec 32))

(assert (=> b!1379121 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607152) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607151 () Unit!45837)

(assert (=> b!1379121 (= lt!607151 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379122 () Bool)

(declare-fun res!921657 () Bool)

(assert (=> b!1379122 (=> (not res!921657) (not e!781245))))

(assert (=> b!1379122 (= res!921657 (and (bvslt (size!45855 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45855 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921655 () Bool)

(assert (=> start!117192 (=> (not res!921655) (not e!781245))))

(assert (=> start!117192 (= res!921655 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45855 a!4094))))))

(assert (=> start!117192 e!781245))

(assert (=> start!117192 true))

(declare-fun array_inv!34333 (array!93809) Bool)

(assert (=> start!117192 (array_inv!34333 a!4094)))

(declare-fun b!1379123 () Bool)

(declare-fun res!921654 () Bool)

(assert (=> b!1379123 (=> (not res!921654) (not e!781245))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379123 (= res!921654 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379124 () Bool)

(assert (=> b!1379124 (= e!781245 e!781247)))

(declare-fun res!921658 () Bool)

(assert (=> b!1379124 (=> (not res!921658) (not e!781247))))

(assert (=> b!1379124 (= res!921658 (and (= lt!607155 (bvsub lt!607152 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379124 (= lt!607155 (arrayCountValidKeys!0 lt!607153 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379124 (= lt!607152 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379124 (= lt!607153 (array!93810 (store (arr!45305 a!4094) i!1451 k!2953) (size!45855 a!4094)))))

(assert (= (and start!117192 res!921655) b!1379120))

(assert (= (and b!1379120 res!921656) b!1379123))

(assert (= (and b!1379123 res!921654) b!1379122))

(assert (= (and b!1379122 res!921657) b!1379124))

(assert (= (and b!1379124 res!921658) b!1379121))

(declare-fun m!1264023 () Bool)

(assert (=> b!1379123 m!1264023))

(declare-fun m!1264025 () Bool)

(assert (=> start!117192 m!1264025))

(declare-fun m!1264027 () Bool)

(assert (=> b!1379120 m!1264027))

(assert (=> b!1379120 m!1264027))

(declare-fun m!1264029 () Bool)

(assert (=> b!1379120 m!1264029))

(declare-fun m!1264031 () Bool)

(assert (=> b!1379121 m!1264031))

(declare-fun m!1264033 () Bool)

(assert (=> b!1379121 m!1264033))

(declare-fun m!1264035 () Bool)

(assert (=> b!1379121 m!1264035))

(declare-fun m!1264037 () Bool)

(assert (=> b!1379121 m!1264037))

(declare-fun m!1264039 () Bool)

(assert (=> b!1379121 m!1264039))

(declare-fun m!1264041 () Bool)

(assert (=> b!1379121 m!1264041))

(declare-fun m!1264043 () Bool)

(assert (=> b!1379124 m!1264043))

(declare-fun m!1264045 () Bool)

(assert (=> b!1379124 m!1264045))

(declare-fun m!1264047 () Bool)

(assert (=> b!1379124 m!1264047))

(push 1)

(assert (not start!117192))

(assert (not b!1379124))

(assert (not b!1379121))

(assert (not b!1379120))

(assert (not b!1379123))

(check-sat)

