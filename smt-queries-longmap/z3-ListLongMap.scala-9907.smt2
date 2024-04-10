; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117188 () Bool)

(assert start!117188)

(declare-fun b!1379090 () Bool)

(declare-fun res!921626 () Bool)

(declare-fun e!781229 () Bool)

(assert (=> b!1379090 (=> (not res!921626) (not e!781229))))

(declare-datatypes ((array!93805 0))(
  ( (array!93806 (arr!45303 (Array (_ BitVec 32) (_ BitVec 64))) (size!45853 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93805)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379090 (= res!921626 (validKeyInArray!0 (select (arr!45303 a!4094) i!1451)))))

(declare-fun b!1379091 () Bool)

(declare-fun res!921624 () Bool)

(assert (=> b!1379091 (=> (not res!921624) (not e!781229))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379091 (= res!921624 (and (bvslt (size!45853 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45853 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379092 () Bool)

(declare-fun res!921628 () Bool)

(assert (=> b!1379092 (=> (not res!921628) (not e!781229))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379092 (= res!921628 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379093 () Bool)

(declare-fun e!781228 () Bool)

(assert (=> b!1379093 (= e!781228 (not true))))

(declare-fun lt!607122 () array!93805)

(declare-fun lt!607124 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379093 (= (bvadd (arrayCountValidKeys!0 lt!607122 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607124) (arrayCountValidKeys!0 lt!607122 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45833 0))(
  ( (Unit!45834) )
))
(declare-fun lt!607123 () Unit!45833)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45833)

(assert (=> b!1379093 (= lt!607123 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607122 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607125 () (_ BitVec 32))

(assert (=> b!1379093 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607125) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607121 () Unit!45833)

(assert (=> b!1379093 (= lt!607121 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379094 () Bool)

(assert (=> b!1379094 (= e!781229 e!781228)))

(declare-fun res!921625 () Bool)

(assert (=> b!1379094 (=> (not res!921625) (not e!781228))))

(assert (=> b!1379094 (= res!921625 (and (= lt!607124 (bvsub lt!607125 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379094 (= lt!607124 (arrayCountValidKeys!0 lt!607122 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379094 (= lt!607125 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379094 (= lt!607122 (array!93806 (store (arr!45303 a!4094) i!1451 k0!2953) (size!45853 a!4094)))))

(declare-fun res!921627 () Bool)

(assert (=> start!117188 (=> (not res!921627) (not e!781229))))

(assert (=> start!117188 (= res!921627 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45853 a!4094))))))

(assert (=> start!117188 e!781229))

(assert (=> start!117188 true))

(declare-fun array_inv!34331 (array!93805) Bool)

(assert (=> start!117188 (array_inv!34331 a!4094)))

(assert (= (and start!117188 res!921627) b!1379090))

(assert (= (and b!1379090 res!921626) b!1379092))

(assert (= (and b!1379092 res!921628) b!1379091))

(assert (= (and b!1379091 res!921624) b!1379094))

(assert (= (and b!1379094 res!921625) b!1379093))

(declare-fun m!1263971 () Bool)

(assert (=> b!1379090 m!1263971))

(assert (=> b!1379090 m!1263971))

(declare-fun m!1263973 () Bool)

(assert (=> b!1379090 m!1263973))

(declare-fun m!1263975 () Bool)

(assert (=> b!1379092 m!1263975))

(declare-fun m!1263977 () Bool)

(assert (=> b!1379093 m!1263977))

(declare-fun m!1263979 () Bool)

(assert (=> b!1379093 m!1263979))

(declare-fun m!1263981 () Bool)

(assert (=> b!1379093 m!1263981))

(declare-fun m!1263983 () Bool)

(assert (=> b!1379093 m!1263983))

(declare-fun m!1263985 () Bool)

(assert (=> b!1379093 m!1263985))

(declare-fun m!1263987 () Bool)

(assert (=> b!1379093 m!1263987))

(declare-fun m!1263989 () Bool)

(assert (=> b!1379094 m!1263989))

(declare-fun m!1263991 () Bool)

(assert (=> b!1379094 m!1263991))

(declare-fun m!1263993 () Bool)

(assert (=> b!1379094 m!1263993))

(declare-fun m!1263995 () Bool)

(assert (=> start!117188 m!1263995))

(check-sat (not b!1379092) (not b!1379090) (not start!117188) (not b!1379093) (not b!1379094))
(check-sat)
