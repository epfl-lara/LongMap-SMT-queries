; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71942 () Bool)

(assert start!71942)

(declare-fun b!835117 () Bool)

(declare-fun res!567602 () Bool)

(declare-fun e!466003 () Bool)

(assert (=> b!835117 (=> (not res!567602) (not e!466003))))

(declare-datatypes ((array!46689 0))(
  ( (array!46690 (arr!22374 (Array (_ BitVec 32) (_ BitVec 64))) (size!22794 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46689)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835117 (= res!567602 (not (validKeyInArray!0 (select (arr!22374 a!4227) to!390))))))

(declare-fun b!835118 () Bool)

(declare-fun e!466001 () Bool)

(assert (=> b!835118 (= e!466001 e!466003)))

(declare-fun res!567603 () Bool)

(assert (=> b!835118 (=> (not res!567603) (not e!466003))))

(declare-fun lt!379188 () (_ BitVec 32))

(declare-fun lt!379189 () (_ BitVec 32))

(assert (=> b!835118 (= res!567603 (and (= lt!379189 lt!379188) (not (= to!390 (size!22794 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835118 (= lt!379188 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835118 (= lt!379189 (arrayCountValidKeys!0 (array!46690 (store (arr!22374 a!4227) i!1466 k0!2968) (size!22794 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835119 () Bool)

(declare-fun res!567601 () Bool)

(assert (=> b!835119 (=> (not res!567601) (not e!466001))))

(assert (=> b!835119 (= res!567601 (validKeyInArray!0 k0!2968))))

(declare-fun res!567600 () Bool)

(assert (=> start!71942 (=> (not res!567600) (not e!466001))))

(assert (=> start!71942 (= res!567600 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22794 a!4227))))))

(assert (=> start!71942 e!466001))

(assert (=> start!71942 true))

(declare-fun array_inv!17860 (array!46689) Bool)

(assert (=> start!71942 (array_inv!17860 a!4227)))

(declare-fun b!835120 () Bool)

(declare-fun res!567599 () Bool)

(assert (=> b!835120 (=> (not res!567599) (not e!466001))))

(assert (=> b!835120 (= res!567599 (and (bvslt (size!22794 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22794 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835121 () Bool)

(assert (=> b!835121 (= e!466003 (not true))))

(assert (=> b!835121 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379188)))

(declare-datatypes ((Unit!28660 0))(
  ( (Unit!28661) )
))
(declare-fun lt!379190 () Unit!28660)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46689 (_ BitVec 32) (_ BitVec 32)) Unit!28660)

(assert (=> b!835121 (= lt!379190 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835122 () Bool)

(declare-fun res!567598 () Bool)

(assert (=> b!835122 (=> (not res!567598) (not e!466001))))

(assert (=> b!835122 (= res!567598 (not (validKeyInArray!0 (select (arr!22374 a!4227) i!1466))))))

(assert (= (and start!71942 res!567600) b!835122))

(assert (= (and b!835122 res!567598) b!835119))

(assert (= (and b!835119 res!567601) b!835120))

(assert (= (and b!835120 res!567599) b!835118))

(assert (= (and b!835118 res!567603) b!835117))

(assert (= (and b!835117 res!567602) b!835121))

(declare-fun m!780447 () Bool)

(assert (=> b!835119 m!780447))

(declare-fun m!780449 () Bool)

(assert (=> b!835121 m!780449))

(declare-fun m!780451 () Bool)

(assert (=> b!835121 m!780451))

(declare-fun m!780453 () Bool)

(assert (=> b!835122 m!780453))

(assert (=> b!835122 m!780453))

(declare-fun m!780455 () Bool)

(assert (=> b!835122 m!780455))

(declare-fun m!780457 () Bool)

(assert (=> b!835117 m!780457))

(assert (=> b!835117 m!780457))

(declare-fun m!780459 () Bool)

(assert (=> b!835117 m!780459))

(declare-fun m!780461 () Bool)

(assert (=> b!835118 m!780461))

(declare-fun m!780463 () Bool)

(assert (=> b!835118 m!780463))

(declare-fun m!780465 () Bool)

(assert (=> b!835118 m!780465))

(declare-fun m!780467 () Bool)

(assert (=> start!71942 m!780467))

(check-sat (not b!835119) (not b!835122) (not b!835121) (not start!71942) (not b!835118) (not b!835117))
(check-sat)
