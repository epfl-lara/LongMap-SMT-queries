; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92564 () Bool)

(assert start!92564)

(declare-fun b!1052874 () Bool)

(declare-fun res!702003 () Bool)

(declare-fun e!597842 () Bool)

(assert (=> b!1052874 (=> (not res!702003) (not e!597842))))

(declare-datatypes ((array!66365 0))(
  ( (array!66366 (arr!31922 (Array (_ BitVec 32) (_ BitVec 64))) (size!32458 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66365)

(declare-datatypes ((List!22234 0))(
  ( (Nil!22231) (Cons!22230 (h!23439 (_ BitVec 64)) (t!31541 List!22234)) )
))
(declare-fun arrayNoDuplicates!0 (array!66365 (_ BitVec 32) List!22234) Bool)

(assert (=> b!1052874 (= res!702003 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22231))))

(declare-fun res!702005 () Bool)

(assert (=> start!92564 (=> (not res!702005) (not e!597842))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92564 (= res!702005 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32458 a!3488)) (bvslt (size!32458 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92564 e!597842))

(assert (=> start!92564 true))

(declare-fun array_inv!24702 (array!66365) Bool)

(assert (=> start!92564 (array_inv!24702 a!3488)))

(declare-fun b!1052875 () Bool)

(declare-fun e!597844 () Bool)

(assert (=> b!1052875 (= e!597844 (not true))))

(declare-fun lt!464994 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052875 (= (select (store (arr!31922 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464994) k0!2747)))

(declare-fun b!1052876 () Bool)

(declare-fun res!702002 () Bool)

(assert (=> b!1052876 (=> (not res!702002) (not e!597842))))

(assert (=> b!1052876 (= res!702002 (= (select (arr!31922 a!3488) i!1381) k0!2747))))

(declare-fun b!1052877 () Bool)

(declare-fun e!597843 () Bool)

(assert (=> b!1052877 (= e!597842 e!597843)))

(declare-fun res!702004 () Bool)

(assert (=> b!1052877 (=> (not res!702004) (not e!597843))))

(declare-fun lt!464993 () array!66365)

(declare-fun arrayContainsKey!0 (array!66365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052877 (= res!702004 (arrayContainsKey!0 lt!464993 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052877 (= lt!464993 (array!66366 (store (arr!31922 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32458 a!3488)))))

(declare-fun b!1052878 () Bool)

(assert (=> b!1052878 (= e!597843 e!597844)))

(declare-fun res!702000 () Bool)

(assert (=> b!1052878 (=> (not res!702000) (not e!597844))))

(assert (=> b!1052878 (= res!702000 (not (= lt!464994 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66365 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052878 (= lt!464994 (arrayScanForKey!0 lt!464993 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052879 () Bool)

(declare-fun res!702001 () Bool)

(assert (=> b!1052879 (=> (not res!702001) (not e!597842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052879 (= res!702001 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92564 res!702005) b!1052874))

(assert (= (and b!1052874 res!702003) b!1052879))

(assert (= (and b!1052879 res!702001) b!1052876))

(assert (= (and b!1052876 res!702002) b!1052877))

(assert (= (and b!1052877 res!702004) b!1052878))

(assert (= (and b!1052878 res!702000) b!1052875))

(declare-fun m!973269 () Bool)

(assert (=> b!1052879 m!973269))

(declare-fun m!973271 () Bool)

(assert (=> b!1052877 m!973271))

(declare-fun m!973273 () Bool)

(assert (=> b!1052877 m!973273))

(assert (=> b!1052875 m!973273))

(declare-fun m!973275 () Bool)

(assert (=> b!1052875 m!973275))

(declare-fun m!973277 () Bool)

(assert (=> b!1052878 m!973277))

(declare-fun m!973279 () Bool)

(assert (=> b!1052874 m!973279))

(declare-fun m!973281 () Bool)

(assert (=> start!92564 m!973281))

(declare-fun m!973283 () Bool)

(assert (=> b!1052876 m!973283))

(check-sat (not b!1052874) (not start!92564) (not b!1052877) (not b!1052879) (not b!1052878))
(check-sat)
