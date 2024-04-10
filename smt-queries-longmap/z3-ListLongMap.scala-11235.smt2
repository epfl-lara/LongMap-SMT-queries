; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131044 () Bool)

(assert start!131044)

(declare-fun b!1537576 () Bool)

(declare-fun res!1054665 () Bool)

(declare-fun e!855697 () Bool)

(assert (=> b!1537576 (=> (not res!1054665) (not e!855697))))

(declare-datatypes ((array!102142 0))(
  ( (array!102143 (arr!49287 (Array (_ BitVec 32) (_ BitVec 64))) (size!49837 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102142)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537576 (= res!1054665 (validKeyInArray!0 (select (arr!49287 a!2792) i!951)))))

(declare-fun b!1537577 () Bool)

(declare-fun res!1054666 () Bool)

(assert (=> b!1537577 (=> (not res!1054666) (not e!855697))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537577 (= res!1054666 (validKeyInArray!0 (select (arr!49287 a!2792) j!64)))))

(declare-fun b!1537578 () Bool)

(declare-fun res!1054663 () Bool)

(assert (=> b!1537578 (=> (not res!1054663) (not e!855697))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102142 (_ BitVec 32)) Bool)

(assert (=> b!1537578 (= res!1054663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537579 () Bool)

(declare-fun res!1054664 () Bool)

(assert (=> b!1537579 (=> (not res!1054664) (not e!855697))))

(assert (=> b!1537579 (= res!1054664 (and (= (size!49837 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49837 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49837 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054662 () Bool)

(assert (=> start!131044 (=> (not res!1054662) (not e!855697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131044 (= res!1054662 (validMask!0 mask!2480))))

(assert (=> start!131044 e!855697))

(assert (=> start!131044 true))

(declare-fun array_inv!38315 (array!102142) Bool)

(assert (=> start!131044 (array_inv!38315 a!2792)))

(declare-fun b!1537580 () Bool)

(assert (=> b!1537580 (= e!855697 false)))

(declare-fun lt!664753 () Bool)

(declare-datatypes ((List!35761 0))(
  ( (Nil!35758) (Cons!35757 (h!37202 (_ BitVec 64)) (t!50455 List!35761)) )
))
(declare-fun arrayNoDuplicates!0 (array!102142 (_ BitVec 32) List!35761) Bool)

(assert (=> b!1537580 (= lt!664753 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35758))))

(assert (= (and start!131044 res!1054662) b!1537579))

(assert (= (and b!1537579 res!1054664) b!1537576))

(assert (= (and b!1537576 res!1054665) b!1537577))

(assert (= (and b!1537577 res!1054666) b!1537578))

(assert (= (and b!1537578 res!1054663) b!1537580))

(declare-fun m!1420099 () Bool)

(assert (=> b!1537580 m!1420099))

(declare-fun m!1420101 () Bool)

(assert (=> b!1537577 m!1420101))

(assert (=> b!1537577 m!1420101))

(declare-fun m!1420103 () Bool)

(assert (=> b!1537577 m!1420103))

(declare-fun m!1420105 () Bool)

(assert (=> b!1537576 m!1420105))

(assert (=> b!1537576 m!1420105))

(declare-fun m!1420107 () Bool)

(assert (=> b!1537576 m!1420107))

(declare-fun m!1420109 () Bool)

(assert (=> start!131044 m!1420109))

(declare-fun m!1420111 () Bool)

(assert (=> start!131044 m!1420111))

(declare-fun m!1420113 () Bool)

(assert (=> b!1537578 m!1420113))

(check-sat (not b!1537576) (not b!1537577) (not start!131044) (not b!1537578) (not b!1537580))
