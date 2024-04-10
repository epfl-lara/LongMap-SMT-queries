; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117190 () Bool)

(assert start!117190)

(declare-fun b!1379105 () Bool)

(declare-fun e!781238 () Bool)

(assert (=> b!1379105 (= e!781238 (not true))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607137 () (_ BitVec 32))

(declare-datatypes ((array!93807 0))(
  ( (array!93808 (arr!45304 (Array (_ BitVec 32) (_ BitVec 64))) (size!45854 (_ BitVec 32))) )
))
(declare-fun lt!607139 () array!93807)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379105 (= (bvadd (arrayCountValidKeys!0 lt!607139 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607137) (arrayCountValidKeys!0 lt!607139 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45835 0))(
  ( (Unit!45836) )
))
(declare-fun lt!607138 () Unit!45835)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45835)

(assert (=> b!1379105 (= lt!607138 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607139 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun a!4094 () array!93807)

(declare-fun lt!607140 () (_ BitVec 32))

(assert (=> b!1379105 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607140) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607136 () Unit!45835)

(assert (=> b!1379105 (= lt!607136 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379106 () Bool)

(declare-fun e!781236 () Bool)

(assert (=> b!1379106 (= e!781236 e!781238)))

(declare-fun res!921642 () Bool)

(assert (=> b!1379106 (=> (not res!921642) (not e!781238))))

(assert (=> b!1379106 (= res!921642 (and (= lt!607137 (bvsub lt!607140 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379106 (= lt!607137 (arrayCountValidKeys!0 lt!607139 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379106 (= lt!607140 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379106 (= lt!607139 (array!93808 (store (arr!45304 a!4094) i!1451 k!2953) (size!45854 a!4094)))))

(declare-fun b!1379107 () Bool)

(declare-fun res!921640 () Bool)

(assert (=> b!1379107 (=> (not res!921640) (not e!781236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379107 (= res!921640 (validKeyInArray!0 (select (arr!45304 a!4094) i!1451)))))

(declare-fun res!921639 () Bool)

(assert (=> start!117190 (=> (not res!921639) (not e!781236))))

(assert (=> start!117190 (= res!921639 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45854 a!4094))))))

(assert (=> start!117190 e!781236))

(assert (=> start!117190 true))

(declare-fun array_inv!34332 (array!93807) Bool)

(assert (=> start!117190 (array_inv!34332 a!4094)))

(declare-fun b!1379108 () Bool)

(declare-fun res!921643 () Bool)

(assert (=> b!1379108 (=> (not res!921643) (not e!781236))))

(assert (=> b!1379108 (= res!921643 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379109 () Bool)

(declare-fun res!921641 () Bool)

(assert (=> b!1379109 (=> (not res!921641) (not e!781236))))

(assert (=> b!1379109 (= res!921641 (and (bvslt (size!45854 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45854 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117190 res!921639) b!1379107))

(assert (= (and b!1379107 res!921640) b!1379108))

(assert (= (and b!1379108 res!921643) b!1379109))

(assert (= (and b!1379109 res!921641) b!1379106))

(assert (= (and b!1379106 res!921642) b!1379105))

(declare-fun m!1263997 () Bool)

(assert (=> b!1379107 m!1263997))

(assert (=> b!1379107 m!1263997))

(declare-fun m!1263999 () Bool)

(assert (=> b!1379107 m!1263999))

(declare-fun m!1264001 () Bool)

(assert (=> start!117190 m!1264001))

(declare-fun m!1264003 () Bool)

(assert (=> b!1379105 m!1264003))

(declare-fun m!1264005 () Bool)

(assert (=> b!1379105 m!1264005))

(declare-fun m!1264007 () Bool)

(assert (=> b!1379105 m!1264007))

(declare-fun m!1264009 () Bool)

(assert (=> b!1379105 m!1264009))

(declare-fun m!1264011 () Bool)

(assert (=> b!1379105 m!1264011))

(declare-fun m!1264013 () Bool)

(assert (=> b!1379105 m!1264013))

(declare-fun m!1264015 () Bool)

(assert (=> b!1379108 m!1264015))

(declare-fun m!1264017 () Bool)

(assert (=> b!1379106 m!1264017))

(declare-fun m!1264019 () Bool)

(assert (=> b!1379106 m!1264019))

(declare-fun m!1264021 () Bool)

(assert (=> b!1379106 m!1264021))

(push 1)

(assert (not b!1379108))

(assert (not b!1379106))

(assert (not start!117190))

(assert (not b!1379105))

(assert (not b!1379107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

