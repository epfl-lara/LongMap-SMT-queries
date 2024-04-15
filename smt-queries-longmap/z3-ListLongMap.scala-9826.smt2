; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116638 () Bool)

(assert start!116638)

(declare-fun b!1374975 () Bool)

(declare-fun e!778926 () Bool)

(declare-datatypes ((array!93261 0))(
  ( (array!93262 (arr!45034 (Array (_ BitVec 32) (_ BitVec 64))) (size!45586 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93261)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374975 (= e!778926 (not (and (bvsge (size!45586 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!603786 () array!93261)

(declare-fun arrayCountValidKeys!0 (array!93261 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374975 (= (arrayCountValidKeys!0 lt!603786 (bvadd #b00000000000000000000000000000001 i!1457) (size!45586 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45586 a!4142)))))

(declare-datatypes ((Unit!45348 0))(
  ( (Unit!45349) )
))
(declare-fun lt!603787 () Unit!45348)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45348)

(assert (=> b!1374975 (= lt!603787 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374975 (= (arrayCountValidKeys!0 lt!603786 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374975 (= lt!603786 (array!93262 (store (arr!45034 a!4142) i!1457 k0!2959) (size!45586 a!4142)))))

(declare-fun lt!603788 () Unit!45348)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45348)

(assert (=> b!1374975 (= lt!603788 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374974 () Bool)

(declare-fun res!918071 () Bool)

(assert (=> b!1374974 (=> (not res!918071) (not e!778926))))

(assert (=> b!1374974 (= res!918071 (bvslt (size!45586 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374973 () Bool)

(declare-fun res!918072 () Bool)

(assert (=> b!1374973 (=> (not res!918072) (not e!778926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374973 (= res!918072 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374972 () Bool)

(declare-fun res!918073 () Bool)

(assert (=> b!1374972 (=> (not res!918073) (not e!778926))))

(assert (=> b!1374972 (= res!918073 (validKeyInArray!0 (select (arr!45034 a!4142) i!1457)))))

(declare-fun res!918074 () Bool)

(assert (=> start!116638 (=> (not res!918074) (not e!778926))))

(assert (=> start!116638 (= res!918074 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45586 a!4142))))))

(assert (=> start!116638 e!778926))

(assert (=> start!116638 true))

(declare-fun array_inv!34267 (array!93261) Bool)

(assert (=> start!116638 (array_inv!34267 a!4142)))

(assert (= (and start!116638 res!918074) b!1374972))

(assert (= (and b!1374972 res!918073) b!1374973))

(assert (= (and b!1374973 res!918072) b!1374974))

(assert (= (and b!1374974 res!918071) b!1374975))

(declare-fun m!1258143 () Bool)

(assert (=> b!1374975 m!1258143))

(declare-fun m!1258145 () Bool)

(assert (=> b!1374975 m!1258145))

(declare-fun m!1258147 () Bool)

(assert (=> b!1374975 m!1258147))

(declare-fun m!1258149 () Bool)

(assert (=> b!1374975 m!1258149))

(declare-fun m!1258151 () Bool)

(assert (=> b!1374975 m!1258151))

(declare-fun m!1258153 () Bool)

(assert (=> b!1374975 m!1258153))

(declare-fun m!1258155 () Bool)

(assert (=> b!1374975 m!1258155))

(declare-fun m!1258157 () Bool)

(assert (=> b!1374973 m!1258157))

(declare-fun m!1258159 () Bool)

(assert (=> b!1374972 m!1258159))

(assert (=> b!1374972 m!1258159))

(declare-fun m!1258161 () Bool)

(assert (=> b!1374972 m!1258161))

(declare-fun m!1258163 () Bool)

(assert (=> start!116638 m!1258163))

(check-sat (not b!1374975) (not start!116638) (not b!1374972) (not b!1374973))
(check-sat)
