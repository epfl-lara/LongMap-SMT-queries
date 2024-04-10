; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117202 () Bool)

(assert start!117202)

(declare-fun res!921733 () Bool)

(declare-fun e!781291 () Bool)

(assert (=> start!117202 (=> (not res!921733) (not e!781291))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93819 0))(
  ( (array!93820 (arr!45310 (Array (_ BitVec 32) (_ BitVec 64))) (size!45860 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93819)

(assert (=> start!117202 (= res!921733 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45860 a!4094))))))

(assert (=> start!117202 e!781291))

(assert (=> start!117202 true))

(declare-fun array_inv!34338 (array!93819) Bool)

(assert (=> start!117202 (array_inv!34338 a!4094)))

(declare-fun b!1379195 () Bool)

(declare-fun res!921731 () Bool)

(assert (=> b!1379195 (=> (not res!921731) (not e!781291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379195 (= res!921731 (validKeyInArray!0 (select (arr!45310 a!4094) i!1451)))))

(declare-fun b!1379196 () Bool)

(declare-fun e!781290 () Bool)

(assert (=> b!1379196 (= e!781290 (not true))))

(declare-fun lt!607228 () array!93819)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607226 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379196 (= (bvadd (arrayCountValidKeys!0 lt!607228 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607226) (arrayCountValidKeys!0 lt!607228 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45847 0))(
  ( (Unit!45848) )
))
(declare-fun lt!607229 () Unit!45847)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45847)

(assert (=> b!1379196 (= lt!607229 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607228 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607230 () (_ BitVec 32))

(assert (=> b!1379196 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607230) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607227 () Unit!45847)

(assert (=> b!1379196 (= lt!607227 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379197 () Bool)

(declare-fun res!921729 () Bool)

(assert (=> b!1379197 (=> (not res!921729) (not e!781291))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379197 (= res!921729 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379198 () Bool)

(assert (=> b!1379198 (= e!781291 e!781290)))

(declare-fun res!921730 () Bool)

(assert (=> b!1379198 (=> (not res!921730) (not e!781290))))

(assert (=> b!1379198 (= res!921730 (and (= lt!607226 (bvsub lt!607230 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379198 (= lt!607226 (arrayCountValidKeys!0 lt!607228 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379198 (= lt!607230 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379198 (= lt!607228 (array!93820 (store (arr!45310 a!4094) i!1451 k!2953) (size!45860 a!4094)))))

(declare-fun b!1379199 () Bool)

(declare-fun res!921732 () Bool)

(assert (=> b!1379199 (=> (not res!921732) (not e!781291))))

(assert (=> b!1379199 (= res!921732 (and (bvslt (size!45860 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45860 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117202 res!921733) b!1379195))

(assert (= (and b!1379195 res!921731) b!1379197))

(assert (= (and b!1379197 res!921729) b!1379199))

(assert (= (and b!1379199 res!921732) b!1379198))

(assert (= (and b!1379198 res!921730) b!1379196))

(declare-fun m!1264153 () Bool)

(assert (=> b!1379195 m!1264153))

(assert (=> b!1379195 m!1264153))

(declare-fun m!1264155 () Bool)

(assert (=> b!1379195 m!1264155))

(declare-fun m!1264157 () Bool)

(assert (=> b!1379198 m!1264157))

(declare-fun m!1264159 () Bool)

(assert (=> b!1379198 m!1264159))

(declare-fun m!1264161 () Bool)

(assert (=> b!1379198 m!1264161))

(declare-fun m!1264163 () Bool)

(assert (=> b!1379196 m!1264163))

(declare-fun m!1264165 () Bool)

(assert (=> b!1379196 m!1264165))

(declare-fun m!1264167 () Bool)

(assert (=> b!1379196 m!1264167))

(declare-fun m!1264169 () Bool)

(assert (=> b!1379196 m!1264169))

(declare-fun m!1264171 () Bool)

(assert (=> b!1379196 m!1264171))

(declare-fun m!1264173 () Bool)

(assert (=> b!1379196 m!1264173))

(declare-fun m!1264175 () Bool)

(assert (=> b!1379197 m!1264175))

(declare-fun m!1264177 () Bool)

(assert (=> start!117202 m!1264177))

(push 1)

(assert (not b!1379195))

(assert (not b!1379196))

(assert (not b!1379197))

(assert (not start!117202))

(assert (not b!1379198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

