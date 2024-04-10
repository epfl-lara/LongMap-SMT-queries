; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117204 () Bool)

(assert start!117204)

(declare-fun b!1379210 () Bool)

(declare-fun res!921748 () Bool)

(declare-fun e!781301 () Bool)

(assert (=> b!1379210 (=> (not res!921748) (not e!781301))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379210 (= res!921748 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379211 () Bool)

(declare-fun res!921746 () Bool)

(assert (=> b!1379211 (=> (not res!921746) (not e!781301))))

(declare-datatypes ((array!93821 0))(
  ( (array!93822 (arr!45311 (Array (_ BitVec 32) (_ BitVec 64))) (size!45861 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93821)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379211 (= res!921746 (validKeyInArray!0 (select (arr!45311 a!4094) i!1451)))))

(declare-fun b!1379212 () Bool)

(declare-fun res!921745 () Bool)

(assert (=> b!1379212 (=> (not res!921745) (not e!781301))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379212 (= res!921745 (and (bvslt (size!45861 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45861 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379213 () Bool)

(declare-fun e!781299 () Bool)

(assert (=> b!1379213 (= e!781301 e!781299)))

(declare-fun res!921744 () Bool)

(assert (=> b!1379213 (=> (not res!921744) (not e!781299))))

(declare-fun lt!607241 () (_ BitVec 32))

(declare-fun lt!607243 () (_ BitVec 32))

(assert (=> b!1379213 (= res!921744 (and (= lt!607243 (bvsub lt!607241 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607244 () array!93821)

(declare-fun arrayCountValidKeys!0 (array!93821 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379213 (= lt!607243 (arrayCountValidKeys!0 lt!607244 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379213 (= lt!607241 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379213 (= lt!607244 (array!93822 (store (arr!45311 a!4094) i!1451 k!2953) (size!45861 a!4094)))))

(declare-fun res!921747 () Bool)

(assert (=> start!117204 (=> (not res!921747) (not e!781301))))

(assert (=> start!117204 (= res!921747 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45861 a!4094))))))

(assert (=> start!117204 e!781301))

(assert (=> start!117204 true))

(declare-fun array_inv!34339 (array!93821) Bool)

(assert (=> start!117204 (array_inv!34339 a!4094)))

(declare-fun b!1379214 () Bool)

(assert (=> b!1379214 (= e!781299 (not (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (size!45861 a!4094)) (bvsge i!1451 (bvsub from!3466 #b00000000000000000000000000000001)))))))

(assert (=> b!1379214 (= (bvadd (arrayCountValidKeys!0 lt!607244 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607243) (arrayCountValidKeys!0 lt!607244 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45849 0))(
  ( (Unit!45850) )
))
(declare-fun lt!607245 () Unit!45849)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45849)

(assert (=> b!1379214 (= lt!607245 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607244 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379214 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607241) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607242 () Unit!45849)

(assert (=> b!1379214 (= lt!607242 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117204 res!921747) b!1379211))

(assert (= (and b!1379211 res!921746) b!1379210))

(assert (= (and b!1379210 res!921748) b!1379212))

(assert (= (and b!1379212 res!921745) b!1379213))

(assert (= (and b!1379213 res!921744) b!1379214))

(declare-fun m!1264179 () Bool)

(assert (=> start!117204 m!1264179))

(declare-fun m!1264181 () Bool)

(assert (=> b!1379210 m!1264181))

(declare-fun m!1264183 () Bool)

(assert (=> b!1379211 m!1264183))

(assert (=> b!1379211 m!1264183))

(declare-fun m!1264185 () Bool)

(assert (=> b!1379211 m!1264185))

(declare-fun m!1264187 () Bool)

(assert (=> b!1379213 m!1264187))

(declare-fun m!1264189 () Bool)

(assert (=> b!1379213 m!1264189))

(declare-fun m!1264191 () Bool)

(assert (=> b!1379213 m!1264191))

(declare-fun m!1264193 () Bool)

(assert (=> b!1379214 m!1264193))

(declare-fun m!1264195 () Bool)

(assert (=> b!1379214 m!1264195))

(declare-fun m!1264197 () Bool)

(assert (=> b!1379214 m!1264197))

(declare-fun m!1264199 () Bool)

(assert (=> b!1379214 m!1264199))

(declare-fun m!1264201 () Bool)

(assert (=> b!1379214 m!1264201))

(declare-fun m!1264203 () Bool)

(assert (=> b!1379214 m!1264203))

(push 1)

(assert (not b!1379211))

(assert (not b!1379210))

(assert (not b!1379213))

(assert (not b!1379214))

(assert (not start!117204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

