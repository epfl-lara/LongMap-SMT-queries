; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71874 () Bool)

(assert start!71874)

(declare-fun b!835232 () Bool)

(declare-fun res!568103 () Bool)

(declare-fun e!465966 () Bool)

(assert (=> b!835232 (=> (not res!568103) (not e!465966))))

(declare-datatypes ((array!46784 0))(
  ( (array!46785 (arr!22426 (Array (_ BitVec 32) (_ BitVec 64))) (size!22847 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46784)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835232 (= res!568103 (and (bvslt (size!22847 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22847 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835233 () Bool)

(declare-fun res!568105 () Bool)

(assert (=> b!835233 (=> (not res!568105) (not e!465966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835233 (= res!568105 (validKeyInArray!0 (select (arr!22426 a!4227) to!390)))))

(declare-fun res!568104 () Bool)

(assert (=> start!71874 (=> (not res!568104) (not e!465966))))

(assert (=> start!71874 (= res!568104 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22847 a!4227))))))

(assert (=> start!71874 e!465966))

(assert (=> start!71874 true))

(declare-fun array_inv!17873 (array!46784) Bool)

(assert (=> start!71874 (array_inv!17873 a!4227)))

(declare-fun b!835234 () Bool)

(declare-fun res!568109 () Bool)

(assert (=> b!835234 (=> (not res!568109) (not e!465966))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46784 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835234 (= res!568109 (= (arrayCountValidKeys!0 (array!46785 (store (arr!22426 a!4227) i!1466 k0!2968) (size!22847 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835235 () Bool)

(declare-fun res!568108 () Bool)

(assert (=> b!835235 (=> (not res!568108) (not e!465966))))

(assert (=> b!835235 (= res!568108 (not (= to!390 (size!22847 a!4227))))))

(declare-fun b!835236 () Bool)

(declare-fun res!568106 () Bool)

(assert (=> b!835236 (=> (not res!568106) (not e!465966))))

(assert (=> b!835236 (= res!568106 (not (validKeyInArray!0 (select (arr!22426 a!4227) i!1466))))))

(declare-fun b!835237 () Bool)

(declare-fun res!568107 () Bool)

(assert (=> b!835237 (=> (not res!568107) (not e!465966))))

(assert (=> b!835237 (= res!568107 (validKeyInArray!0 k0!2968))))

(declare-fun b!835238 () Bool)

(assert (=> b!835238 (= e!465966 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22847 a!4227))))))

(assert (= (and start!71874 res!568104) b!835236))

(assert (= (and b!835236 res!568106) b!835237))

(assert (= (and b!835237 res!568107) b!835232))

(assert (= (and b!835232 res!568103) b!835234))

(assert (= (and b!835234 res!568109) b!835235))

(assert (= (and b!835235 res!568108) b!835233))

(assert (= (and b!835233 res!568105) b!835238))

(declare-fun m!780387 () Bool)

(assert (=> b!835236 m!780387))

(assert (=> b!835236 m!780387))

(declare-fun m!780389 () Bool)

(assert (=> b!835236 m!780389))

(declare-fun m!780391 () Bool)

(assert (=> b!835233 m!780391))

(assert (=> b!835233 m!780391))

(declare-fun m!780393 () Bool)

(assert (=> b!835233 m!780393))

(declare-fun m!780395 () Bool)

(assert (=> start!71874 m!780395))

(declare-fun m!780397 () Bool)

(assert (=> b!835234 m!780397))

(declare-fun m!780399 () Bool)

(assert (=> b!835234 m!780399))

(declare-fun m!780401 () Bool)

(assert (=> b!835234 m!780401))

(declare-fun m!780403 () Bool)

(assert (=> b!835237 m!780403))

(check-sat (not b!835236) (not b!835234) (not b!835237) (not start!71874) (not b!835233))
(check-sat)
