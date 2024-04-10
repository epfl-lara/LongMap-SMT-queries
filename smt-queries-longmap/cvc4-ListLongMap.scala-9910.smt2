; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117208 () Bool)

(assert start!117208)

(declare-fun b!1379240 () Bool)

(declare-fun res!921777 () Bool)

(declare-fun e!781317 () Bool)

(assert (=> b!1379240 (=> (not res!921777) (not e!781317))))

(declare-datatypes ((array!93825 0))(
  ( (array!93826 (arr!45313 (Array (_ BitVec 32) (_ BitVec 64))) (size!45863 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93825)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379240 (= res!921777 (and (bvslt (size!45863 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45863 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379241 () Bool)

(declare-fun e!781318 () Bool)

(assert (=> b!1379241 (= e!781318 (not (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (size!45863 a!4094)) (bvsge i!1451 (bvsub from!3466 #b00000000000000000000000000000001)))))))

(declare-fun lt!607274 () (_ BitVec 32))

(declare-fun lt!607272 () array!93825)

(declare-fun arrayCountValidKeys!0 (array!93825 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379241 (= (bvadd (arrayCountValidKeys!0 lt!607272 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607274) (arrayCountValidKeys!0 lt!607272 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45853 0))(
  ( (Unit!45854) )
))
(declare-fun lt!607275 () Unit!45853)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45853)

(assert (=> b!1379241 (= lt!607275 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607272 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607273 () (_ BitVec 32))

(assert (=> b!1379241 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607273) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607271 () Unit!45853)

(assert (=> b!1379241 (= lt!607271 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921774 () Bool)

(assert (=> start!117208 (=> (not res!921774) (not e!781317))))

(assert (=> start!117208 (= res!921774 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45863 a!4094))))))

(assert (=> start!117208 e!781317))

(assert (=> start!117208 true))

(declare-fun array_inv!34341 (array!93825) Bool)

(assert (=> start!117208 (array_inv!34341 a!4094)))

(declare-fun b!1379242 () Bool)

(declare-fun res!921776 () Bool)

(assert (=> b!1379242 (=> (not res!921776) (not e!781317))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379242 (= res!921776 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379243 () Bool)

(declare-fun res!921775 () Bool)

(assert (=> b!1379243 (=> (not res!921775) (not e!781317))))

(assert (=> b!1379243 (= res!921775 (validKeyInArray!0 (select (arr!45313 a!4094) i!1451)))))

(declare-fun b!1379244 () Bool)

(assert (=> b!1379244 (= e!781317 e!781318)))

(declare-fun res!921778 () Bool)

(assert (=> b!1379244 (=> (not res!921778) (not e!781318))))

(assert (=> b!1379244 (= res!921778 (and (= lt!607274 (bvsub lt!607273 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379244 (= lt!607274 (arrayCountValidKeys!0 lt!607272 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379244 (= lt!607273 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379244 (= lt!607272 (array!93826 (store (arr!45313 a!4094) i!1451 k!2953) (size!45863 a!4094)))))

(assert (= (and start!117208 res!921774) b!1379243))

(assert (= (and b!1379243 res!921775) b!1379242))

(assert (= (and b!1379242 res!921776) b!1379240))

(assert (= (and b!1379240 res!921777) b!1379244))

(assert (= (and b!1379244 res!921778) b!1379241))

(declare-fun m!1264231 () Bool)

(assert (=> b!1379243 m!1264231))

(assert (=> b!1379243 m!1264231))

(declare-fun m!1264233 () Bool)

(assert (=> b!1379243 m!1264233))

(declare-fun m!1264235 () Bool)

(assert (=> b!1379244 m!1264235))

(declare-fun m!1264237 () Bool)

(assert (=> b!1379244 m!1264237))

(declare-fun m!1264239 () Bool)

(assert (=> b!1379244 m!1264239))

(declare-fun m!1264241 () Bool)

(assert (=> b!1379241 m!1264241))

(declare-fun m!1264243 () Bool)

(assert (=> b!1379241 m!1264243))

(declare-fun m!1264245 () Bool)

(assert (=> b!1379241 m!1264245))

(declare-fun m!1264247 () Bool)

(assert (=> b!1379241 m!1264247))

(declare-fun m!1264249 () Bool)

(assert (=> b!1379241 m!1264249))

(declare-fun m!1264251 () Bool)

(assert (=> b!1379241 m!1264251))

(declare-fun m!1264253 () Bool)

(assert (=> start!117208 m!1264253))

(declare-fun m!1264255 () Bool)

(assert (=> b!1379242 m!1264255))

(push 1)

(assert (not b!1379242))

(assert (not b!1379244))

(assert (not start!117208))

(assert (not b!1379241))

(assert (not b!1379243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

