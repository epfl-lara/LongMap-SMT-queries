; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127934 () Bool)

(assert start!127934)

(declare-fun b!1502877 () Bool)

(declare-fun res!1023756 () Bool)

(declare-fun e!840487 () Bool)

(assert (=> b!1502877 (=> (not res!1023756) (not e!840487))))

(declare-datatypes ((array!100249 0))(
  ( (array!100250 (arr!48381 (Array (_ BitVec 32) (_ BitVec 64))) (size!48931 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100249)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502877 (= res!1023756 (validKeyInArray!0 (select (arr!48381 a!2850) i!996)))))

(declare-fun b!1502878 () Bool)

(declare-fun res!1023760 () Bool)

(assert (=> b!1502878 (=> (not res!1023760) (not e!840487))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502878 (= res!1023760 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48931 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48931 a!2850)) (= (select (arr!48381 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48381 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48931 a!2850))))))

(declare-fun b!1502879 () Bool)

(declare-fun res!1023761 () Bool)

(assert (=> b!1502879 (=> (not res!1023761) (not e!840487))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502879 (= res!1023761 (and (= (size!48931 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48931 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48931 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502880 () Bool)

(assert (=> b!1502880 (= e!840487 false)))

(declare-fun lt!653464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502880 (= lt!653464 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502881 () Bool)

(declare-fun res!1023757 () Bool)

(assert (=> b!1502881 (=> (not res!1023757) (not e!840487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100249 (_ BitVec 32)) Bool)

(assert (=> b!1502881 (= res!1023757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502882 () Bool)

(declare-fun res!1023759 () Bool)

(assert (=> b!1502882 (=> (not res!1023759) (not e!840487))))

(assert (=> b!1502882 (= res!1023759 (validKeyInArray!0 (select (arr!48381 a!2850) j!87)))))

(declare-fun b!1502883 () Bool)

(declare-fun res!1023763 () Bool)

(assert (=> b!1502883 (=> (not res!1023763) (not e!840487))))

(declare-datatypes ((SeekEntryResult!12579 0))(
  ( (MissingZero!12579 (index!52708 (_ BitVec 32))) (Found!12579 (index!52709 (_ BitVec 32))) (Intermediate!12579 (undefined!13391 Bool) (index!52710 (_ BitVec 32)) (x!134395 (_ BitVec 32))) (Undefined!12579) (MissingVacant!12579 (index!52711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100249 (_ BitVec 32)) SeekEntryResult!12579)

(assert (=> b!1502883 (= res!1023763 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48381 a!2850) j!87) a!2850 mask!2661) (Found!12579 j!87)))))

(declare-fun res!1023762 () Bool)

(assert (=> start!127934 (=> (not res!1023762) (not e!840487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127934 (= res!1023762 (validMask!0 mask!2661))))

(assert (=> start!127934 e!840487))

(assert (=> start!127934 true))

(declare-fun array_inv!37409 (array!100249) Bool)

(assert (=> start!127934 (array_inv!37409 a!2850)))

(declare-fun b!1502884 () Bool)

(declare-fun res!1023755 () Bool)

(assert (=> b!1502884 (=> (not res!1023755) (not e!840487))))

(declare-datatypes ((List!34873 0))(
  ( (Nil!34870) (Cons!34869 (h!36266 (_ BitVec 64)) (t!49567 List!34873)) )
))
(declare-fun arrayNoDuplicates!0 (array!100249 (_ BitVec 32) List!34873) Bool)

(assert (=> b!1502884 (= res!1023755 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34870))))

(declare-fun b!1502885 () Bool)

(declare-fun res!1023758 () Bool)

(assert (=> b!1502885 (=> (not res!1023758) (not e!840487))))

(assert (=> b!1502885 (= res!1023758 (not (= (select (arr!48381 a!2850) index!625) (select (arr!48381 a!2850) j!87))))))

(assert (= (and start!127934 res!1023762) b!1502879))

(assert (= (and b!1502879 res!1023761) b!1502877))

(assert (= (and b!1502877 res!1023756) b!1502882))

(assert (= (and b!1502882 res!1023759) b!1502881))

(assert (= (and b!1502881 res!1023757) b!1502884))

(assert (= (and b!1502884 res!1023755) b!1502878))

(assert (= (and b!1502878 res!1023760) b!1502883))

(assert (= (and b!1502883 res!1023763) b!1502885))

(assert (= (and b!1502885 res!1023758) b!1502880))

(declare-fun m!1386107 () Bool)

(assert (=> b!1502880 m!1386107))

(declare-fun m!1386109 () Bool)

(assert (=> b!1502882 m!1386109))

(assert (=> b!1502882 m!1386109))

(declare-fun m!1386111 () Bool)

(assert (=> b!1502882 m!1386111))

(declare-fun m!1386113 () Bool)

(assert (=> b!1502878 m!1386113))

(declare-fun m!1386115 () Bool)

(assert (=> b!1502878 m!1386115))

(declare-fun m!1386117 () Bool)

(assert (=> b!1502878 m!1386117))

(declare-fun m!1386119 () Bool)

(assert (=> start!127934 m!1386119))

(declare-fun m!1386121 () Bool)

(assert (=> start!127934 m!1386121))

(assert (=> b!1502883 m!1386109))

(assert (=> b!1502883 m!1386109))

(declare-fun m!1386123 () Bool)

(assert (=> b!1502883 m!1386123))

(declare-fun m!1386125 () Bool)

(assert (=> b!1502884 m!1386125))

(declare-fun m!1386127 () Bool)

(assert (=> b!1502881 m!1386127))

(declare-fun m!1386129 () Bool)

(assert (=> b!1502885 m!1386129))

(assert (=> b!1502885 m!1386109))

(declare-fun m!1386131 () Bool)

(assert (=> b!1502877 m!1386131))

(assert (=> b!1502877 m!1386131))

(declare-fun m!1386133 () Bool)

(assert (=> b!1502877 m!1386133))

(check-sat (not b!1502880) (not b!1502882) (not b!1502884) (not b!1502881) (not b!1502883) (not b!1502877) (not start!127934))
