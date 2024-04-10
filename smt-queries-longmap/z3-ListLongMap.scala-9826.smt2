; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116644 () Bool)

(assert start!116644)

(declare-fun b!1375046 () Bool)

(declare-fun res!918109 () Bool)

(declare-fun e!778959 () Bool)

(assert (=> b!1375046 (=> (not res!918109) (not e!778959))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375046 (= res!918109 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1375045 () Bool)

(declare-fun res!918112 () Bool)

(assert (=> b!1375045 (=> (not res!918112) (not e!778959))))

(declare-datatypes ((array!93313 0))(
  ( (array!93314 (arr!45060 (Array (_ BitVec 32) (_ BitVec 64))) (size!45610 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93313)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375045 (= res!918112 (validKeyInArray!0 (select (arr!45060 a!4142) i!1457)))))

(declare-fun b!1375048 () Bool)

(assert (=> b!1375048 (= e!778959 (not (and (bvsge (size!45610 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!603979 () array!93313)

(declare-fun arrayCountValidKeys!0 (array!93313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375048 (= (arrayCountValidKeys!0 lt!603979 (bvadd #b00000000000000000000000000000001 i!1457) (size!45610 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45610 a!4142)))))

(declare-datatypes ((Unit!45509 0))(
  ( (Unit!45510) )
))
(declare-fun lt!603978 () Unit!45509)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45509)

(assert (=> b!1375048 (= lt!603978 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375048 (= (arrayCountValidKeys!0 lt!603979 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1375048 (= lt!603979 (array!93314 (store (arr!45060 a!4142) i!1457 k0!2959) (size!45610 a!4142)))))

(declare-fun lt!603977 () Unit!45509)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45509)

(assert (=> b!1375048 (= lt!603977 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1375047 () Bool)

(declare-fun res!918111 () Bool)

(assert (=> b!1375047 (=> (not res!918111) (not e!778959))))

(assert (=> b!1375047 (= res!918111 (bvslt (size!45610 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918110 () Bool)

(assert (=> start!116644 (=> (not res!918110) (not e!778959))))

(assert (=> start!116644 (= res!918110 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45610 a!4142))))))

(assert (=> start!116644 e!778959))

(assert (=> start!116644 true))

(declare-fun array_inv!34088 (array!93313) Bool)

(assert (=> start!116644 (array_inv!34088 a!4142)))

(assert (= (and start!116644 res!918110) b!1375045))

(assert (= (and b!1375045 res!918112) b!1375046))

(assert (= (and b!1375046 res!918109) b!1375047))

(assert (= (and b!1375047 res!918111) b!1375048))

(declare-fun m!1258667 () Bool)

(assert (=> b!1375046 m!1258667))

(declare-fun m!1258669 () Bool)

(assert (=> b!1375045 m!1258669))

(assert (=> b!1375045 m!1258669))

(declare-fun m!1258671 () Bool)

(assert (=> b!1375045 m!1258671))

(declare-fun m!1258673 () Bool)

(assert (=> b!1375048 m!1258673))

(declare-fun m!1258675 () Bool)

(assert (=> b!1375048 m!1258675))

(declare-fun m!1258677 () Bool)

(assert (=> b!1375048 m!1258677))

(declare-fun m!1258679 () Bool)

(assert (=> b!1375048 m!1258679))

(declare-fun m!1258681 () Bool)

(assert (=> b!1375048 m!1258681))

(declare-fun m!1258683 () Bool)

(assert (=> b!1375048 m!1258683))

(declare-fun m!1258685 () Bool)

(assert (=> b!1375048 m!1258685))

(declare-fun m!1258687 () Bool)

(assert (=> start!116644 m!1258687))

(check-sat (not b!1375046) (not start!116644) (not b!1375045) (not b!1375048))
(check-sat)
