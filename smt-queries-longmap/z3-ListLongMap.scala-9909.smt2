; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117200 () Bool)

(assert start!117200)

(declare-fun res!921717 () Bool)

(declare-fun e!781283 () Bool)

(assert (=> start!117200 (=> (not res!921717) (not e!781283))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93817 0))(
  ( (array!93818 (arr!45309 (Array (_ BitVec 32) (_ BitVec 64))) (size!45859 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93817)

(assert (=> start!117200 (= res!921717 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45859 a!4094))))))

(assert (=> start!117200 e!781283))

(assert (=> start!117200 true))

(declare-fun array_inv!34337 (array!93817) Bool)

(assert (=> start!117200 (array_inv!34337 a!4094)))

(declare-fun b!1379180 () Bool)

(declare-fun e!781282 () Bool)

(assert (=> b!1379180 (= e!781283 e!781282)))

(declare-fun res!921716 () Bool)

(assert (=> b!1379180 (=> (not res!921716) (not e!781282))))

(declare-fun lt!607211 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607214 () (_ BitVec 32))

(assert (=> b!1379180 (= res!921716 (and (= lt!607211 (bvsub lt!607214 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607213 () array!93817)

(declare-fun arrayCountValidKeys!0 (array!93817 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379180 (= lt!607211 (arrayCountValidKeys!0 lt!607213 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379180 (= lt!607214 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379180 (= lt!607213 (array!93818 (store (arr!45309 a!4094) i!1451 k0!2953) (size!45859 a!4094)))))

(declare-fun b!1379181 () Bool)

(declare-fun res!921714 () Bool)

(assert (=> b!1379181 (=> (not res!921714) (not e!781283))))

(assert (=> b!1379181 (= res!921714 (and (bvslt (size!45859 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45859 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379182 () Bool)

(assert (=> b!1379182 (= e!781282 (not true))))

(assert (=> b!1379182 (= (bvadd (arrayCountValidKeys!0 lt!607213 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607211) (arrayCountValidKeys!0 lt!607213 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45845 0))(
  ( (Unit!45846) )
))
(declare-fun lt!607215 () Unit!45845)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45845)

(assert (=> b!1379182 (= lt!607215 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607213 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379182 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607214) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607212 () Unit!45845)

(assert (=> b!1379182 (= lt!607212 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379183 () Bool)

(declare-fun res!921718 () Bool)

(assert (=> b!1379183 (=> (not res!921718) (not e!781283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379183 (= res!921718 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379184 () Bool)

(declare-fun res!921715 () Bool)

(assert (=> b!1379184 (=> (not res!921715) (not e!781283))))

(assert (=> b!1379184 (= res!921715 (validKeyInArray!0 (select (arr!45309 a!4094) i!1451)))))

(assert (= (and start!117200 res!921717) b!1379184))

(assert (= (and b!1379184 res!921715) b!1379183))

(assert (= (and b!1379183 res!921718) b!1379181))

(assert (= (and b!1379181 res!921714) b!1379180))

(assert (= (and b!1379180 res!921716) b!1379182))

(declare-fun m!1264127 () Bool)

(assert (=> start!117200 m!1264127))

(declare-fun m!1264129 () Bool)

(assert (=> b!1379182 m!1264129))

(declare-fun m!1264131 () Bool)

(assert (=> b!1379182 m!1264131))

(declare-fun m!1264133 () Bool)

(assert (=> b!1379182 m!1264133))

(declare-fun m!1264135 () Bool)

(assert (=> b!1379182 m!1264135))

(declare-fun m!1264137 () Bool)

(assert (=> b!1379182 m!1264137))

(declare-fun m!1264139 () Bool)

(assert (=> b!1379182 m!1264139))

(declare-fun m!1264141 () Bool)

(assert (=> b!1379184 m!1264141))

(assert (=> b!1379184 m!1264141))

(declare-fun m!1264143 () Bool)

(assert (=> b!1379184 m!1264143))

(declare-fun m!1264145 () Bool)

(assert (=> b!1379180 m!1264145))

(declare-fun m!1264147 () Bool)

(assert (=> b!1379180 m!1264147))

(declare-fun m!1264149 () Bool)

(assert (=> b!1379180 m!1264149))

(declare-fun m!1264151 () Bool)

(assert (=> b!1379183 m!1264151))

(check-sat (not b!1379182) (not start!117200) (not b!1379184) (not b!1379183) (not b!1379180))
(check-sat)
