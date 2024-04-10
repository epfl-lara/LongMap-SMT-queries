; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117186 () Bool)

(assert start!117186)

(declare-fun b!1379075 () Bool)

(declare-fun res!921609 () Bool)

(declare-fun e!781219 () Bool)

(assert (=> b!1379075 (=> (not res!921609) (not e!781219))))

(declare-datatypes ((array!93803 0))(
  ( (array!93804 (arr!45302 (Array (_ BitVec 32) (_ BitVec 64))) (size!45852 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93803)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379075 (= res!921609 (validKeyInArray!0 (select (arr!45302 a!4094) i!1451)))))

(declare-fun b!1379076 () Bool)

(declare-fun e!781220 () Bool)

(assert (=> b!1379076 (= e!781220 (not true))))

(declare-fun lt!607109 () (_ BitVec 32))

(declare-fun lt!607106 () array!93803)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93803 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379076 (= (bvadd (arrayCountValidKeys!0 lt!607106 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607109) (arrayCountValidKeys!0 lt!607106 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45831 0))(
  ( (Unit!45832) )
))
(declare-fun lt!607110 () Unit!45831)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45831)

(assert (=> b!1379076 (= lt!607110 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607106 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607108 () (_ BitVec 32))

(assert (=> b!1379076 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607108) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607107 () Unit!45831)

(assert (=> b!1379076 (= lt!607107 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379077 () Bool)

(assert (=> b!1379077 (= e!781219 e!781220)))

(declare-fun res!921612 () Bool)

(assert (=> b!1379077 (=> (not res!921612) (not e!781220))))

(assert (=> b!1379077 (= res!921612 (and (= lt!607109 (bvsub lt!607108 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379077 (= lt!607109 (arrayCountValidKeys!0 lt!607106 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379077 (= lt!607108 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379077 (= lt!607106 (array!93804 (store (arr!45302 a!4094) i!1451 k!2953) (size!45852 a!4094)))))

(declare-fun b!1379078 () Bool)

(declare-fun res!921613 () Bool)

(assert (=> b!1379078 (=> (not res!921613) (not e!781219))))

(assert (=> b!1379078 (= res!921613 (and (bvslt (size!45852 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45852 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921610 () Bool)

(assert (=> start!117186 (=> (not res!921610) (not e!781219))))

(assert (=> start!117186 (= res!921610 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45852 a!4094))))))

(assert (=> start!117186 e!781219))

(assert (=> start!117186 true))

(declare-fun array_inv!34330 (array!93803) Bool)

(assert (=> start!117186 (array_inv!34330 a!4094)))

(declare-fun b!1379079 () Bool)

(declare-fun res!921611 () Bool)

(assert (=> b!1379079 (=> (not res!921611) (not e!781219))))

(assert (=> b!1379079 (= res!921611 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117186 res!921610) b!1379075))

(assert (= (and b!1379075 res!921609) b!1379079))

(assert (= (and b!1379079 res!921611) b!1379078))

(assert (= (and b!1379078 res!921613) b!1379077))

(assert (= (and b!1379077 res!921612) b!1379076))

(declare-fun m!1263945 () Bool)

(assert (=> b!1379079 m!1263945))

(declare-fun m!1263947 () Bool)

(assert (=> b!1379075 m!1263947))

(assert (=> b!1379075 m!1263947))

(declare-fun m!1263949 () Bool)

(assert (=> b!1379075 m!1263949))

(declare-fun m!1263951 () Bool)

(assert (=> b!1379077 m!1263951))

(declare-fun m!1263953 () Bool)

(assert (=> b!1379077 m!1263953))

(declare-fun m!1263955 () Bool)

(assert (=> b!1379077 m!1263955))

(declare-fun m!1263957 () Bool)

(assert (=> start!117186 m!1263957))

(declare-fun m!1263959 () Bool)

(assert (=> b!1379076 m!1263959))

(declare-fun m!1263961 () Bool)

(assert (=> b!1379076 m!1263961))

(declare-fun m!1263963 () Bool)

(assert (=> b!1379076 m!1263963))

(declare-fun m!1263965 () Bool)

(assert (=> b!1379076 m!1263965))

(declare-fun m!1263967 () Bool)

(assert (=> b!1379076 m!1263967))

(declare-fun m!1263969 () Bool)

(assert (=> b!1379076 m!1263969))

(push 1)

(assert (not b!1379079))

(assert (not start!117186))

(assert (not b!1379077))

(assert (not b!1379075))

(assert (not b!1379076))

(check-sat)

