; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127712 () Bool)

(assert start!127712)

(declare-fun b!1500641 () Bool)

(declare-fun e!839654 () Bool)

(assert (=> b!1500641 (= e!839654 false)))

(declare-datatypes ((array!100093 0))(
  ( (array!100094 (arr!48306 (Array (_ BitVec 32) (_ BitVec 64))) (size!48856 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100093)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652977 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12516 0))(
  ( (MissingZero!12516 (index!52456 (_ BitVec 32))) (Found!12516 (index!52457 (_ BitVec 32))) (Intermediate!12516 (undefined!13328 Bool) (index!52458 (_ BitVec 32)) (x!134126 (_ BitVec 32))) (Undefined!12516) (MissingVacant!12516 (index!52459 (_ BitVec 32))) )
))
(declare-fun lt!652978 () SeekEntryResult!12516)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100093 (_ BitVec 32)) SeekEntryResult!12516)

(assert (=> b!1500641 (= lt!652978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652977 vacantBefore!10 (select (arr!48306 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021726 () Bool)

(declare-fun e!839655 () Bool)

(assert (=> start!127712 (=> (not res!1021726) (not e!839655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127712 (= res!1021726 (validMask!0 mask!2661))))

(assert (=> start!127712 e!839655))

(assert (=> start!127712 true))

(declare-fun array_inv!37334 (array!100093) Bool)

(assert (=> start!127712 (array_inv!37334 a!2850)))

(declare-fun b!1500642 () Bool)

(assert (=> b!1500642 (= e!839655 e!839654)))

(declare-fun res!1021717 () Bool)

(assert (=> b!1500642 (=> (not res!1021717) (not e!839654))))

(assert (=> b!1500642 (= res!1021717 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652977 #b00000000000000000000000000000000) (bvslt lt!652977 (size!48856 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500642 (= lt!652977 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500643 () Bool)

(declare-fun res!1021720 () Bool)

(assert (=> b!1500643 (=> (not res!1021720) (not e!839655))))

(assert (=> b!1500643 (= res!1021720 (not (= (select (arr!48306 a!2850) index!625) (select (arr!48306 a!2850) j!87))))))

(declare-fun b!1500644 () Bool)

(declare-fun res!1021721 () Bool)

(assert (=> b!1500644 (=> (not res!1021721) (not e!839655))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500644 (= res!1021721 (and (= (size!48856 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48856 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48856 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500645 () Bool)

(declare-fun res!1021719 () Bool)

(assert (=> b!1500645 (=> (not res!1021719) (not e!839655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500645 (= res!1021719 (validKeyInArray!0 (select (arr!48306 a!2850) j!87)))))

(declare-fun b!1500646 () Bool)

(declare-fun res!1021718 () Bool)

(assert (=> b!1500646 (=> (not res!1021718) (not e!839655))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500646 (= res!1021718 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48856 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48856 a!2850)) (= (select (arr!48306 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48306 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48856 a!2850))))))

(declare-fun b!1500647 () Bool)

(declare-fun res!1021725 () Bool)

(assert (=> b!1500647 (=> (not res!1021725) (not e!839655))))

(declare-datatypes ((List!34798 0))(
  ( (Nil!34795) (Cons!34794 (h!36191 (_ BitVec 64)) (t!49492 List!34798)) )
))
(declare-fun arrayNoDuplicates!0 (array!100093 (_ BitVec 32) List!34798) Bool)

(assert (=> b!1500647 (= res!1021725 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34795))))

(declare-fun b!1500648 () Bool)

(declare-fun res!1021722 () Bool)

(assert (=> b!1500648 (=> (not res!1021722) (not e!839655))))

(assert (=> b!1500648 (= res!1021722 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48306 a!2850) j!87) a!2850 mask!2661) (Found!12516 j!87)))))

(declare-fun b!1500649 () Bool)

(declare-fun res!1021724 () Bool)

(assert (=> b!1500649 (=> (not res!1021724) (not e!839655))))

(assert (=> b!1500649 (= res!1021724 (validKeyInArray!0 (select (arr!48306 a!2850) i!996)))))

(declare-fun b!1500650 () Bool)

(declare-fun res!1021723 () Bool)

(assert (=> b!1500650 (=> (not res!1021723) (not e!839655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100093 (_ BitVec 32)) Bool)

(assert (=> b!1500650 (= res!1021723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127712 res!1021726) b!1500644))

(assert (= (and b!1500644 res!1021721) b!1500649))

(assert (= (and b!1500649 res!1021724) b!1500645))

(assert (= (and b!1500645 res!1021719) b!1500650))

(assert (= (and b!1500650 res!1021723) b!1500647))

(assert (= (and b!1500647 res!1021725) b!1500646))

(assert (= (and b!1500646 res!1021718) b!1500648))

(assert (= (and b!1500648 res!1021722) b!1500643))

(assert (= (and b!1500643 res!1021720) b!1500642))

(assert (= (and b!1500642 res!1021717) b!1500641))

(declare-fun m!1383835 () Bool)

(assert (=> b!1500649 m!1383835))

(assert (=> b!1500649 m!1383835))

(declare-fun m!1383837 () Bool)

(assert (=> b!1500649 m!1383837))

(declare-fun m!1383839 () Bool)

(assert (=> b!1500648 m!1383839))

(assert (=> b!1500648 m!1383839))

(declare-fun m!1383841 () Bool)

(assert (=> b!1500648 m!1383841))

(declare-fun m!1383843 () Bool)

(assert (=> b!1500646 m!1383843))

(declare-fun m!1383845 () Bool)

(assert (=> b!1500646 m!1383845))

(declare-fun m!1383847 () Bool)

(assert (=> b!1500646 m!1383847))

(declare-fun m!1383849 () Bool)

(assert (=> b!1500643 m!1383849))

(assert (=> b!1500643 m!1383839))

(declare-fun m!1383851 () Bool)

(assert (=> b!1500650 m!1383851))

(assert (=> b!1500641 m!1383839))

(assert (=> b!1500641 m!1383839))

(declare-fun m!1383853 () Bool)

(assert (=> b!1500641 m!1383853))

(declare-fun m!1383855 () Bool)

(assert (=> start!127712 m!1383855))

(declare-fun m!1383857 () Bool)

(assert (=> start!127712 m!1383857))

(declare-fun m!1383859 () Bool)

(assert (=> b!1500647 m!1383859))

(declare-fun m!1383861 () Bool)

(assert (=> b!1500642 m!1383861))

(assert (=> b!1500645 m!1383839))

(assert (=> b!1500645 m!1383839))

(declare-fun m!1383863 () Bool)

(assert (=> b!1500645 m!1383863))

(check-sat (not b!1500647) (not b!1500642) (not b!1500649) (not b!1500648) (not b!1500641) (not start!127712) (not b!1500650) (not b!1500645))
(check-sat)
