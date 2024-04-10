; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116614 () Bool)

(assert start!116614)

(declare-fun b!1374897 () Bool)

(declare-fun e!778876 () Bool)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374897 (= e!778876 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1457) i!1457))))))

(declare-datatypes ((array!93299 0))(
  ( (array!93300 (arr!45054 (Array (_ BitVec 32) (_ BitVec 64))) (size!45604 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93299)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374897 (= (arrayCountValidKeys!0 (array!93300 (store (arr!45054 a!4142) i!1457 k0!2959) (size!45604 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45497 0))(
  ( (Unit!45498) )
))
(declare-fun lt!603918 () Unit!45497)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45497)

(assert (=> b!1374897 (= lt!603918 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374896 () Bool)

(declare-fun res!918024 () Bool)

(assert (=> b!1374896 (=> (not res!918024) (not e!778876))))

(assert (=> b!1374896 (= res!918024 (bvslt (size!45604 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374894 () Bool)

(declare-fun res!918022 () Bool)

(assert (=> b!1374894 (=> (not res!918022) (not e!778876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374894 (= res!918022 (validKeyInArray!0 (select (arr!45054 a!4142) i!1457)))))

(declare-fun b!1374895 () Bool)

(declare-fun res!918023 () Bool)

(assert (=> b!1374895 (=> (not res!918023) (not e!778876))))

(assert (=> b!1374895 (= res!918023 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!918025 () Bool)

(assert (=> start!116614 (=> (not res!918025) (not e!778876))))

(assert (=> start!116614 (= res!918025 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45604 a!4142))))))

(assert (=> start!116614 e!778876))

(assert (=> start!116614 true))

(declare-fun array_inv!34082 (array!93299) Bool)

(assert (=> start!116614 (array_inv!34082 a!4142)))

(assert (= (and start!116614 res!918025) b!1374894))

(assert (= (and b!1374894 res!918022) b!1374895))

(assert (= (and b!1374895 res!918023) b!1374896))

(assert (= (and b!1374896 res!918024) b!1374897))

(declare-fun m!1258487 () Bool)

(assert (=> b!1374897 m!1258487))

(declare-fun m!1258489 () Bool)

(assert (=> b!1374897 m!1258489))

(declare-fun m!1258491 () Bool)

(assert (=> b!1374897 m!1258491))

(declare-fun m!1258493 () Bool)

(assert (=> b!1374897 m!1258493))

(declare-fun m!1258495 () Bool)

(assert (=> b!1374894 m!1258495))

(assert (=> b!1374894 m!1258495))

(declare-fun m!1258497 () Bool)

(assert (=> b!1374894 m!1258497))

(declare-fun m!1258499 () Bool)

(assert (=> b!1374895 m!1258499))

(declare-fun m!1258501 () Bool)

(assert (=> start!116614 m!1258501))

(check-sat (not b!1374897) (not start!116614) (not b!1374895) (not b!1374894))
(check-sat)
