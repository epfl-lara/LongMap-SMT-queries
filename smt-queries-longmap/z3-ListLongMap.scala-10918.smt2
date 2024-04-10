; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127772 () Bool)

(assert start!127772)

(declare-fun b!1501600 () Bool)

(declare-fun res!1022676 () Bool)

(declare-fun e!839986 () Bool)

(assert (=> b!1501600 (=> (not res!1022676) (not e!839986))))

(declare-datatypes ((array!100153 0))(
  ( (array!100154 (arr!48336 (Array (_ BitVec 32) (_ BitVec 64))) (size!48886 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100153)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100153 (_ BitVec 32)) Bool)

(assert (=> b!1501600 (= res!1022676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501601 () Bool)

(declare-fun res!1022680 () Bool)

(declare-fun e!839984 () Bool)

(assert (=> b!1501601 (=> (not res!1022680) (not e!839984))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501601 (= res!1022680 (not (= (select (arr!48336 a!2850) index!625) (select (arr!48336 a!2850) j!87))))))

(declare-fun b!1501602 () Bool)

(declare-fun e!839983 () Bool)

(assert (=> b!1501602 (= e!839983 (not true))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653216 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12546 0))(
  ( (MissingZero!12546 (index!52576 (_ BitVec 32))) (Found!12546 (index!52577 (_ BitVec 32))) (Intermediate!12546 (undefined!13358 Bool) (index!52578 (_ BitVec 32)) (x!134236 (_ BitVec 32))) (Undefined!12546) (MissingVacant!12546 (index!52579 (_ BitVec 32))) )
))
(declare-fun lt!653217 () SeekEntryResult!12546)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100153 (_ BitVec 32)) SeekEntryResult!12546)

(assert (=> b!1501602 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653216 vacantAfter!10 (select (store (arr!48336 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100154 (store (arr!48336 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48886 a!2850)) mask!2661) lt!653217)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50246 0))(
  ( (Unit!50247) )
))
(declare-fun lt!653218 () Unit!50246)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50246)

(assert (=> b!1501602 (= lt!653218 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653216 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501603 () Bool)

(declare-fun res!1022681 () Bool)

(assert (=> b!1501603 (=> (not res!1022681) (not e!839983))))

(assert (=> b!1501603 (= res!1022681 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653216 vacantBefore!10 (select (arr!48336 a!2850) j!87) a!2850 mask!2661) lt!653217))))

(declare-fun b!1501604 () Bool)

(declare-fun res!1022679 () Bool)

(assert (=> b!1501604 (=> (not res!1022679) (not e!839986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501604 (= res!1022679 (validKeyInArray!0 (select (arr!48336 a!2850) j!87)))))

(declare-fun b!1501605 () Bool)

(assert (=> b!1501605 (= e!839986 e!839984)))

(declare-fun res!1022686 () Bool)

(assert (=> b!1501605 (=> (not res!1022686) (not e!839984))))

(assert (=> b!1501605 (= res!1022686 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48336 a!2850) j!87) a!2850 mask!2661) lt!653217))))

(assert (=> b!1501605 (= lt!653217 (Found!12546 j!87))))

(declare-fun b!1501606 () Bool)

(declare-fun res!1022684 () Bool)

(assert (=> b!1501606 (=> (not res!1022684) (not e!839986))))

(assert (=> b!1501606 (= res!1022684 (and (= (size!48886 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48886 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48886 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501607 () Bool)

(assert (=> b!1501607 (= e!839984 e!839983)))

(declare-fun res!1022682 () Bool)

(assert (=> b!1501607 (=> (not res!1022682) (not e!839983))))

(assert (=> b!1501607 (= res!1022682 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653216 #b00000000000000000000000000000000) (bvslt lt!653216 (size!48886 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501607 (= lt!653216 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501608 () Bool)

(declare-fun res!1022678 () Bool)

(assert (=> b!1501608 (=> (not res!1022678) (not e!839986))))

(declare-datatypes ((List!34828 0))(
  ( (Nil!34825) (Cons!34824 (h!36221 (_ BitVec 64)) (t!49522 List!34828)) )
))
(declare-fun arrayNoDuplicates!0 (array!100153 (_ BitVec 32) List!34828) Bool)

(assert (=> b!1501608 (= res!1022678 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34825))))

(declare-fun b!1501609 () Bool)

(declare-fun res!1022683 () Bool)

(assert (=> b!1501609 (=> (not res!1022683) (not e!839986))))

(assert (=> b!1501609 (= res!1022683 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48886 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48886 a!2850)) (= (select (arr!48336 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48336 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48886 a!2850))))))

(declare-fun res!1022685 () Bool)

(assert (=> start!127772 (=> (not res!1022685) (not e!839986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127772 (= res!1022685 (validMask!0 mask!2661))))

(assert (=> start!127772 e!839986))

(assert (=> start!127772 true))

(declare-fun array_inv!37364 (array!100153) Bool)

(assert (=> start!127772 (array_inv!37364 a!2850)))

(declare-fun b!1501610 () Bool)

(declare-fun res!1022677 () Bool)

(assert (=> b!1501610 (=> (not res!1022677) (not e!839986))))

(assert (=> b!1501610 (= res!1022677 (validKeyInArray!0 (select (arr!48336 a!2850) i!996)))))

(assert (= (and start!127772 res!1022685) b!1501606))

(assert (= (and b!1501606 res!1022684) b!1501610))

(assert (= (and b!1501610 res!1022677) b!1501604))

(assert (= (and b!1501604 res!1022679) b!1501600))

(assert (= (and b!1501600 res!1022676) b!1501608))

(assert (= (and b!1501608 res!1022678) b!1501609))

(assert (= (and b!1501609 res!1022683) b!1501605))

(assert (= (and b!1501605 res!1022686) b!1501601))

(assert (= (and b!1501601 res!1022680) b!1501607))

(assert (= (and b!1501607 res!1022682) b!1501603))

(assert (= (and b!1501603 res!1022681) b!1501602))

(declare-fun m!1384849 () Bool)

(assert (=> b!1501608 m!1384849))

(declare-fun m!1384851 () Bool)

(assert (=> b!1501609 m!1384851))

(declare-fun m!1384853 () Bool)

(assert (=> b!1501609 m!1384853))

(declare-fun m!1384855 () Bool)

(assert (=> b!1501609 m!1384855))

(declare-fun m!1384857 () Bool)

(assert (=> b!1501600 m!1384857))

(declare-fun m!1384859 () Bool)

(assert (=> start!127772 m!1384859))

(declare-fun m!1384861 () Bool)

(assert (=> start!127772 m!1384861))

(declare-fun m!1384863 () Bool)

(assert (=> b!1501603 m!1384863))

(assert (=> b!1501603 m!1384863))

(declare-fun m!1384865 () Bool)

(assert (=> b!1501603 m!1384865))

(declare-fun m!1384867 () Bool)

(assert (=> b!1501607 m!1384867))

(assert (=> b!1501604 m!1384863))

(assert (=> b!1501604 m!1384863))

(declare-fun m!1384869 () Bool)

(assert (=> b!1501604 m!1384869))

(declare-fun m!1384871 () Bool)

(assert (=> b!1501610 m!1384871))

(assert (=> b!1501610 m!1384871))

(declare-fun m!1384873 () Bool)

(assert (=> b!1501610 m!1384873))

(assert (=> b!1501605 m!1384863))

(assert (=> b!1501605 m!1384863))

(declare-fun m!1384875 () Bool)

(assert (=> b!1501605 m!1384875))

(declare-fun m!1384877 () Bool)

(assert (=> b!1501601 m!1384877))

(assert (=> b!1501601 m!1384863))

(assert (=> b!1501602 m!1384853))

(declare-fun m!1384879 () Bool)

(assert (=> b!1501602 m!1384879))

(assert (=> b!1501602 m!1384879))

(declare-fun m!1384881 () Bool)

(assert (=> b!1501602 m!1384881))

(declare-fun m!1384883 () Bool)

(assert (=> b!1501602 m!1384883))

(check-sat (not b!1501607) (not b!1501600) (not b!1501604) (not b!1501603) (not start!127772) (not b!1501602) (not b!1501608) (not b!1501605) (not b!1501610))
(check-sat)
