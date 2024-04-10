; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117900 () Bool)

(assert start!117900)

(declare-fun res!923116 () Bool)

(declare-fun e!783112 () Bool)

(assert (=> start!117900 (=> (not res!923116) (not e!783112))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117900 (= res!923116 (validMask!0 mask!3034))))

(assert (=> start!117900 e!783112))

(assert (=> start!117900 true))

(declare-datatypes ((array!94291 0))(
  ( (array!94292 (arr!45528 (Array (_ BitVec 32) (_ BitVec 64))) (size!46078 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94291)

(declare-fun array_inv!34556 (array!94291) Bool)

(assert (=> start!117900 (array_inv!34556 a!2971)))

(declare-fun b!1381486 () Bool)

(declare-fun res!923115 () Bool)

(assert (=> b!1381486 (=> (not res!923115) (not e!783112))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381486 (= res!923115 (and (= (size!46078 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46078 a!2971))))))

(declare-fun b!1381487 () Bool)

(declare-fun res!923114 () Bool)

(assert (=> b!1381487 (=> (not res!923114) (not e!783112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381487 (= res!923114 (validKeyInArray!0 (select (arr!45528 a!2971) i!1094)))))

(declare-fun b!1381488 () Bool)

(assert (=> b!1381488 (= e!783112 false)))

(declare-fun lt!608220 () Bool)

(declare-datatypes ((List!32062 0))(
  ( (Nil!32059) (Cons!32058 (h!33267 (_ BitVec 64)) (t!46756 List!32062)) )
))
(declare-fun arrayNoDuplicates!0 (array!94291 (_ BitVec 32) List!32062) Bool)

(assert (=> b!1381488 (= lt!608220 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32059))))

(assert (= (and start!117900 res!923116) b!1381486))

(assert (= (and b!1381486 res!923115) b!1381487))

(assert (= (and b!1381487 res!923114) b!1381488))

(declare-fun m!1266673 () Bool)

(assert (=> start!117900 m!1266673))

(declare-fun m!1266675 () Bool)

(assert (=> start!117900 m!1266675))

(declare-fun m!1266677 () Bool)

(assert (=> b!1381487 m!1266677))

(assert (=> b!1381487 m!1266677))

(declare-fun m!1266679 () Bool)

(assert (=> b!1381487 m!1266679))

(declare-fun m!1266681 () Bool)

(assert (=> b!1381488 m!1266681))

(check-sat (not start!117900) (not b!1381488) (not b!1381487))
(check-sat)
