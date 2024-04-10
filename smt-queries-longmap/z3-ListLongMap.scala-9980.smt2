; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117888 () Bool)

(assert start!117888)

(declare-fun res!923060 () Bool)

(declare-fun e!783076 () Bool)

(assert (=> start!117888 (=> (not res!923060) (not e!783076))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117888 (= res!923060 (validMask!0 mask!3034))))

(assert (=> start!117888 e!783076))

(assert (=> start!117888 true))

(declare-datatypes ((array!94279 0))(
  ( (array!94280 (arr!45522 (Array (_ BitVec 32) (_ BitVec 64))) (size!46072 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94279)

(declare-fun array_inv!34550 (array!94279) Bool)

(assert (=> start!117888 (array_inv!34550 a!2971)))

(declare-fun b!1381432 () Bool)

(declare-fun res!923062 () Bool)

(assert (=> b!1381432 (=> (not res!923062) (not e!783076))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381432 (= res!923062 (and (= (size!46072 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46072 a!2971))))))

(declare-fun b!1381433 () Bool)

(declare-fun res!923061 () Bool)

(assert (=> b!1381433 (=> (not res!923061) (not e!783076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381433 (= res!923061 (validKeyInArray!0 (select (arr!45522 a!2971) i!1094)))))

(declare-fun b!1381434 () Bool)

(assert (=> b!1381434 (= e!783076 false)))

(declare-fun lt!608202 () Bool)

(declare-datatypes ((List!32056 0))(
  ( (Nil!32053) (Cons!32052 (h!33261 (_ BitVec 64)) (t!46750 List!32056)) )
))
(declare-fun arrayNoDuplicates!0 (array!94279 (_ BitVec 32) List!32056) Bool)

(assert (=> b!1381434 (= lt!608202 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32053))))

(assert (= (and start!117888 res!923060) b!1381432))

(assert (= (and b!1381432 res!923062) b!1381433))

(assert (= (and b!1381433 res!923061) b!1381434))

(declare-fun m!1266613 () Bool)

(assert (=> start!117888 m!1266613))

(declare-fun m!1266615 () Bool)

(assert (=> start!117888 m!1266615))

(declare-fun m!1266617 () Bool)

(assert (=> b!1381433 m!1266617))

(assert (=> b!1381433 m!1266617))

(declare-fun m!1266619 () Bool)

(assert (=> b!1381433 m!1266619))

(declare-fun m!1266621 () Bool)

(assert (=> b!1381434 m!1266621))

(check-sat (not b!1381434) (not start!117888) (not b!1381433))
(check-sat)
