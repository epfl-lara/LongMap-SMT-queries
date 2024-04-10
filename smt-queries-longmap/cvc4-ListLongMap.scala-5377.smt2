; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71864 () Bool)

(assert start!71864)

(declare-fun b!835147 () Bool)

(declare-fun res!568020 () Bool)

(declare-fun e!465936 () Bool)

(assert (=> b!835147 (=> (not res!568020) (not e!465936))))

(declare-datatypes ((array!46774 0))(
  ( (array!46775 (arr!22421 (Array (_ BitVec 32) (_ BitVec 64))) (size!22842 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46774)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835147 (= res!568020 (not (validKeyInArray!0 (select (arr!22421 a!4227) i!1466))))))

(declare-fun b!835148 () Bool)

(declare-fun res!568019 () Bool)

(assert (=> b!835148 (=> (not res!568019) (not e!465936))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835148 (= res!568019 (validKeyInArray!0 k!2968))))

(declare-fun b!835149 () Bool)

(declare-fun res!568021 () Bool)

(assert (=> b!835149 (=> (not res!568021) (not e!465936))))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46774 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835149 (= res!568021 (= (arrayCountValidKeys!0 (array!46775 (store (arr!22421 a!4227) i!1466 k!2968) (size!22842 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835150 () Bool)

(declare-fun res!568018 () Bool)

(assert (=> b!835150 (=> (not res!568018) (not e!465936))))

(assert (=> b!835150 (= res!568018 (and (bvslt (size!22842 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22842 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835151 () Bool)

(assert (=> b!835151 (= e!465936 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!22842 a!4227)) to!390) #b00000000000000000000000000000000))))

(declare-fun res!568022 () Bool)

(assert (=> start!71864 (=> (not res!568022) (not e!465936))))

(assert (=> start!71864 (= res!568022 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22842 a!4227))))))

(assert (=> start!71864 e!465936))

(assert (=> start!71864 true))

(declare-fun array_inv!17868 (array!46774) Bool)

(assert (=> start!71864 (array_inv!17868 a!4227)))

(assert (= (and start!71864 res!568022) b!835147))

(assert (= (and b!835147 res!568020) b!835148))

(assert (= (and b!835148 res!568019) b!835150))

(assert (= (and b!835150 res!568018) b!835149))

(assert (= (and b!835149 res!568021) b!835151))

(declare-fun m!780313 () Bool)

(assert (=> b!835147 m!780313))

(assert (=> b!835147 m!780313))

(declare-fun m!780315 () Bool)

(assert (=> b!835147 m!780315))

(declare-fun m!780317 () Bool)

(assert (=> b!835148 m!780317))

(declare-fun m!780319 () Bool)

(assert (=> b!835149 m!780319))

(declare-fun m!780321 () Bool)

(assert (=> b!835149 m!780321))

(declare-fun m!780323 () Bool)

(assert (=> b!835149 m!780323))

(declare-fun m!780325 () Bool)

(assert (=> start!71864 m!780325))

(push 1)

(assert (not b!835149))

(assert (not b!835148))

(assert (not b!835147))

(assert (not start!71864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

