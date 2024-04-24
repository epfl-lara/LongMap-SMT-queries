; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127858 () Bool)

(assert start!127858)

(declare-fun b!1500614 () Bool)

(declare-fun res!1020591 () Bool)

(declare-fun e!840207 () Bool)

(assert (=> b!1500614 (=> (not res!1020591) (not e!840207))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((array!100084 0))(
  ( (array!100085 (arr!48298 (Array (_ BitVec 32) (_ BitVec 64))) (size!48849 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100084)

(assert (=> b!1500614 (= res!1020591 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48849 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48849 a!2850)) (= (select (arr!48298 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48298 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48849 a!2850))))))

(declare-fun b!1500615 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500615 (= e!840207 (not (validKeyInArray!0 (select (store (arr!48298 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))))

(declare-fun res!1020595 () Bool)

(assert (=> start!127858 (=> (not res!1020595) (not e!840207))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127858 (= res!1020595 (validMask!0 mask!2661))))

(assert (=> start!127858 e!840207))

(assert (=> start!127858 true))

(declare-fun array_inv!37579 (array!100084) Bool)

(assert (=> start!127858 (array_inv!37579 a!2850)))

(declare-fun b!1500616 () Bool)

(declare-fun res!1020592 () Bool)

(assert (=> b!1500616 (=> (not res!1020592) (not e!840207))))

(assert (=> b!1500616 (= res!1020592 (validKeyInArray!0 (select (arr!48298 a!2850) i!996)))))

(declare-fun b!1500617 () Bool)

(declare-fun res!1020598 () Bool)

(assert (=> b!1500617 (=> (not res!1020598) (not e!840207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100084 (_ BitVec 32)) Bool)

(assert (=> b!1500617 (= res!1020598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500618 () Bool)

(declare-fun res!1020597 () Bool)

(assert (=> b!1500618 (=> (not res!1020597) (not e!840207))))

(assert (=> b!1500618 (= res!1020597 (and (= (select (arr!48298 a!2850) index!625) (select (arr!48298 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1500619 () Bool)

(declare-fun res!1020599 () Bool)

(assert (=> b!1500619 (=> (not res!1020599) (not e!840207))))

(assert (=> b!1500619 (= res!1020599 (and (= (size!48849 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48849 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48849 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500620 () Bool)

(declare-fun res!1020594 () Bool)

(assert (=> b!1500620 (=> (not res!1020594) (not e!840207))))

(declare-datatypes ((SeekEntryResult!12401 0))(
  ( (MissingZero!12401 (index!51996 (_ BitVec 32))) (Found!12401 (index!51997 (_ BitVec 32))) (Intermediate!12401 (undefined!13213 Bool) (index!51998 (_ BitVec 32)) (x!133885 (_ BitVec 32))) (Undefined!12401) (MissingVacant!12401 (index!51999 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100084 (_ BitVec 32)) SeekEntryResult!12401)

(assert (=> b!1500620 (= res!1020594 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48298 a!2850) j!87) a!2850 mask!2661) (Found!12401 j!87)))))

(declare-fun b!1500621 () Bool)

(declare-fun res!1020593 () Bool)

(assert (=> b!1500621 (=> (not res!1020593) (not e!840207))))

(assert (=> b!1500621 (= res!1020593 (validKeyInArray!0 (select (arr!48298 a!2850) j!87)))))

(declare-fun b!1500622 () Bool)

(declare-fun res!1020596 () Bool)

(assert (=> b!1500622 (=> (not res!1020596) (not e!840207))))

(declare-datatypes ((List!34777 0))(
  ( (Nil!34774) (Cons!34773 (h!36185 (_ BitVec 64)) (t!49463 List!34777)) )
))
(declare-fun arrayNoDuplicates!0 (array!100084 (_ BitVec 32) List!34777) Bool)

(assert (=> b!1500622 (= res!1020596 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34774))))

(assert (= (and start!127858 res!1020595) b!1500619))

(assert (= (and b!1500619 res!1020599) b!1500616))

(assert (= (and b!1500616 res!1020592) b!1500621))

(assert (= (and b!1500621 res!1020593) b!1500617))

(assert (= (and b!1500617 res!1020598) b!1500622))

(assert (= (and b!1500622 res!1020596) b!1500614))

(assert (= (and b!1500614 res!1020591) b!1500620))

(assert (= (and b!1500620 res!1020594) b!1500618))

(assert (= (and b!1500618 res!1020597) b!1500615))

(declare-fun m!1383791 () Bool)

(assert (=> b!1500615 m!1383791))

(declare-fun m!1383793 () Bool)

(assert (=> b!1500615 m!1383793))

(assert (=> b!1500615 m!1383793))

(declare-fun m!1383795 () Bool)

(assert (=> b!1500615 m!1383795))

(declare-fun m!1383797 () Bool)

(assert (=> b!1500622 m!1383797))

(declare-fun m!1383799 () Bool)

(assert (=> b!1500618 m!1383799))

(declare-fun m!1383801 () Bool)

(assert (=> b!1500618 m!1383801))

(declare-fun m!1383803 () Bool)

(assert (=> b!1500614 m!1383803))

(assert (=> b!1500614 m!1383791))

(declare-fun m!1383805 () Bool)

(assert (=> b!1500614 m!1383805))

(assert (=> b!1500620 m!1383801))

(assert (=> b!1500620 m!1383801))

(declare-fun m!1383807 () Bool)

(assert (=> b!1500620 m!1383807))

(declare-fun m!1383809 () Bool)

(assert (=> b!1500617 m!1383809))

(declare-fun m!1383811 () Bool)

(assert (=> start!127858 m!1383811))

(declare-fun m!1383813 () Bool)

(assert (=> start!127858 m!1383813))

(assert (=> b!1500621 m!1383801))

(assert (=> b!1500621 m!1383801))

(declare-fun m!1383815 () Bool)

(assert (=> b!1500621 m!1383815))

(declare-fun m!1383817 () Bool)

(assert (=> b!1500616 m!1383817))

(assert (=> b!1500616 m!1383817))

(declare-fun m!1383819 () Bool)

(assert (=> b!1500616 m!1383819))

(check-sat (not b!1500622) (not b!1500616) (not b!1500615) (not b!1500620) (not b!1500621) (not b!1500617) (not start!127858))
(check-sat)
