; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117194 () Bool)

(assert start!117194)

(declare-fun res!921673 () Bool)

(declare-fun e!781255 () Bool)

(assert (=> start!117194 (=> (not res!921673) (not e!781255))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93811 0))(
  ( (array!93812 (arr!45306 (Array (_ BitVec 32) (_ BitVec 64))) (size!45856 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93811)

(assert (=> start!117194 (= res!921673 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45856 a!4094))))))

(assert (=> start!117194 e!781255))

(assert (=> start!117194 true))

(declare-fun array_inv!34334 (array!93811) Bool)

(assert (=> start!117194 (array_inv!34334 a!4094)))

(declare-fun b!1379135 () Bool)

(declare-fun res!921671 () Bool)

(assert (=> b!1379135 (=> (not res!921671) (not e!781255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379135 (= res!921671 (validKeyInArray!0 (select (arr!45306 a!4094) i!1451)))))

(declare-fun b!1379136 () Bool)

(declare-fun e!781254 () Bool)

(assert (=> b!1379136 (= e!781254 (not true))))

(declare-fun lt!607168 () (_ BitVec 32))

(declare-fun lt!607170 () array!93811)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93811 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379136 (= (bvadd (arrayCountValidKeys!0 lt!607170 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607168) (arrayCountValidKeys!0 lt!607170 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45839 0))(
  ( (Unit!45840) )
))
(declare-fun lt!607169 () Unit!45839)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45839)

(assert (=> b!1379136 (= lt!607169 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607170 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607166 () (_ BitVec 32))

(assert (=> b!1379136 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607166) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607167 () Unit!45839)

(assert (=> b!1379136 (= lt!607167 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379137 () Bool)

(assert (=> b!1379137 (= e!781255 e!781254)))

(declare-fun res!921669 () Bool)

(assert (=> b!1379137 (=> (not res!921669) (not e!781254))))

(assert (=> b!1379137 (= res!921669 (and (= lt!607168 (bvsub lt!607166 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379137 (= lt!607168 (arrayCountValidKeys!0 lt!607170 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379137 (= lt!607166 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379137 (= lt!607170 (array!93812 (store (arr!45306 a!4094) i!1451 k0!2953) (size!45856 a!4094)))))

(declare-fun b!1379138 () Bool)

(declare-fun res!921670 () Bool)

(assert (=> b!1379138 (=> (not res!921670) (not e!781255))))

(assert (=> b!1379138 (= res!921670 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379139 () Bool)

(declare-fun res!921672 () Bool)

(assert (=> b!1379139 (=> (not res!921672) (not e!781255))))

(assert (=> b!1379139 (= res!921672 (and (bvslt (size!45856 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45856 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117194 res!921673) b!1379135))

(assert (= (and b!1379135 res!921671) b!1379138))

(assert (= (and b!1379138 res!921670) b!1379139))

(assert (= (and b!1379139 res!921672) b!1379137))

(assert (= (and b!1379137 res!921669) b!1379136))

(declare-fun m!1264049 () Bool)

(assert (=> b!1379137 m!1264049))

(declare-fun m!1264051 () Bool)

(assert (=> b!1379137 m!1264051))

(declare-fun m!1264053 () Bool)

(assert (=> b!1379137 m!1264053))

(declare-fun m!1264055 () Bool)

(assert (=> b!1379136 m!1264055))

(declare-fun m!1264057 () Bool)

(assert (=> b!1379136 m!1264057))

(declare-fun m!1264059 () Bool)

(assert (=> b!1379136 m!1264059))

(declare-fun m!1264061 () Bool)

(assert (=> b!1379136 m!1264061))

(declare-fun m!1264063 () Bool)

(assert (=> b!1379136 m!1264063))

(declare-fun m!1264065 () Bool)

(assert (=> b!1379136 m!1264065))

(declare-fun m!1264067 () Bool)

(assert (=> b!1379135 m!1264067))

(assert (=> b!1379135 m!1264067))

(declare-fun m!1264069 () Bool)

(assert (=> b!1379135 m!1264069))

(declare-fun m!1264071 () Bool)

(assert (=> start!117194 m!1264071))

(declare-fun m!1264073 () Bool)

(assert (=> b!1379138 m!1264073))

(check-sat (not b!1379135) (not start!117194) (not b!1379136) (not b!1379138) (not b!1379137))
(check-sat)
