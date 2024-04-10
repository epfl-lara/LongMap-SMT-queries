; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118074 () Bool)

(assert start!118074)

(declare-fun b!1382520 () Bool)

(declare-fun e!783607 () Bool)

(assert (=> b!1382520 (= e!783607 false)))

(declare-fun lt!608436 () Bool)

(declare-datatypes ((array!94438 0))(
  ( (array!94439 (arr!45600 (Array (_ BitVec 32) (_ BitVec 64))) (size!46150 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94438)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94438 (_ BitVec 32)) Bool)

(assert (=> b!1382520 (= lt!608436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382519 () Bool)

(declare-fun res!924109 () Bool)

(assert (=> b!1382519 (=> (not res!924109) (not e!783607))))

(declare-datatypes ((List!32134 0))(
  ( (Nil!32131) (Cons!32130 (h!33339 (_ BitVec 64)) (t!46828 List!32134)) )
))
(declare-fun arrayNoDuplicates!0 (array!94438 (_ BitVec 32) List!32134) Bool)

(assert (=> b!1382519 (= res!924109 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32131))))

(declare-fun res!924112 () Bool)

(assert (=> start!118074 (=> (not res!924112) (not e!783607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118074 (= res!924112 (validMask!0 mask!3034))))

(assert (=> start!118074 e!783607))

(assert (=> start!118074 true))

(declare-fun array_inv!34628 (array!94438) Bool)

(assert (=> start!118074 (array_inv!34628 a!2971)))

(declare-fun b!1382517 () Bool)

(declare-fun res!924111 () Bool)

(assert (=> b!1382517 (=> (not res!924111) (not e!783607))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382517 (= res!924111 (and (= (size!46150 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46150 a!2971))))))

(declare-fun b!1382518 () Bool)

(declare-fun res!924110 () Bool)

(assert (=> b!1382518 (=> (not res!924110) (not e!783607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382518 (= res!924110 (validKeyInArray!0 (select (arr!45600 a!2971) i!1094)))))

(assert (= (and start!118074 res!924112) b!1382517))

(assert (= (and b!1382517 res!924111) b!1382518))

(assert (= (and b!1382518 res!924110) b!1382519))

(assert (= (and b!1382519 res!924109) b!1382520))

(declare-fun m!1267647 () Bool)

(assert (=> b!1382520 m!1267647))

(declare-fun m!1267649 () Bool)

(assert (=> b!1382519 m!1267649))

(declare-fun m!1267651 () Bool)

(assert (=> start!118074 m!1267651))

(declare-fun m!1267653 () Bool)

(assert (=> start!118074 m!1267653))

(declare-fun m!1267655 () Bool)

(assert (=> b!1382518 m!1267655))

(assert (=> b!1382518 m!1267655))

(declare-fun m!1267657 () Bool)

(assert (=> b!1382518 m!1267657))

(check-sat (not b!1382520) (not start!118074) (not b!1382519) (not b!1382518))