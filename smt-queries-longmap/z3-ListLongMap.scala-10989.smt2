; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128768 () Bool)

(assert start!128768)

(declare-fun res!1028694 () Bool)

(declare-fun e!842881 () Bool)

(assert (=> start!128768 (=> (not res!1028694) (not e!842881))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128768 (= res!1028694 (validMask!0 mask!2512))))

(assert (=> start!128768 e!842881))

(assert (=> start!128768 true))

(declare-datatypes ((array!100624 0))(
  ( (array!100625 (arr!48549 (Array (_ BitVec 32) (_ BitVec 64))) (size!49099 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100624)

(declare-fun array_inv!37577 (array!100624) Bool)

(assert (=> start!128768 (array_inv!37577 a!2804)))

(declare-fun b!1508787 () Bool)

(declare-fun res!1028695 () Bool)

(assert (=> b!1508787 (=> (not res!1028695) (not e!842881))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508787 (= res!1028695 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49099 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49099 a!2804))))))

(declare-fun b!1508788 () Bool)

(declare-fun e!842879 () Bool)

(assert (=> b!1508788 (= e!842881 e!842879)))

(declare-fun res!1028690 () Bool)

(assert (=> b!1508788 (=> (not res!1028690) (not e!842879))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12720 0))(
  ( (MissingZero!12720 (index!53275 (_ BitVec 32))) (Found!12720 (index!53276 (_ BitVec 32))) (Intermediate!12720 (undefined!13532 Bool) (index!53277 (_ BitVec 32)) (x!135038 (_ BitVec 32))) (Undefined!12720) (MissingVacant!12720 (index!53278 (_ BitVec 32))) )
))
(declare-fun lt!654742 () SeekEntryResult!12720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100624 (_ BitVec 32)) SeekEntryResult!12720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508788 (= res!1028690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48549 a!2804) j!70) mask!2512) (select (arr!48549 a!2804) j!70) a!2804 mask!2512) lt!654742))))

(assert (=> b!1508788 (= lt!654742 (Intermediate!12720 false resIndex!21 resX!21))))

(declare-fun b!1508789 () Bool)

(assert (=> b!1508789 (= e!842879 false)))

(declare-fun lt!654741 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508789 (= lt!654741 (toIndex!0 (select (store (arr!48549 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508790 () Bool)

(declare-fun res!1028698 () Bool)

(assert (=> b!1508790 (=> (not res!1028698) (not e!842881))))

(declare-datatypes ((List!35032 0))(
  ( (Nil!35029) (Cons!35028 (h!36440 (_ BitVec 64)) (t!49726 List!35032)) )
))
(declare-fun arrayNoDuplicates!0 (array!100624 (_ BitVec 32) List!35032) Bool)

(assert (=> b!1508790 (= res!1028698 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35029))))

(declare-fun b!1508791 () Bool)

(declare-fun res!1028691 () Bool)

(assert (=> b!1508791 (=> (not res!1028691) (not e!842881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508791 (= res!1028691 (validKeyInArray!0 (select (arr!48549 a!2804) i!961)))))

(declare-fun b!1508792 () Bool)

(declare-fun res!1028696 () Bool)

(assert (=> b!1508792 (=> (not res!1028696) (not e!842881))))

(assert (=> b!1508792 (= res!1028696 (and (= (size!49099 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49099 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49099 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508793 () Bool)

(declare-fun res!1028697 () Bool)

(assert (=> b!1508793 (=> (not res!1028697) (not e!842879))))

(assert (=> b!1508793 (= res!1028697 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48549 a!2804) j!70) a!2804 mask!2512) lt!654742))))

(declare-fun b!1508794 () Bool)

(declare-fun res!1028692 () Bool)

(assert (=> b!1508794 (=> (not res!1028692) (not e!842881))))

(assert (=> b!1508794 (= res!1028692 (validKeyInArray!0 (select (arr!48549 a!2804) j!70)))))

(declare-fun b!1508795 () Bool)

(declare-fun res!1028693 () Bool)

(assert (=> b!1508795 (=> (not res!1028693) (not e!842881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100624 (_ BitVec 32)) Bool)

(assert (=> b!1508795 (= res!1028693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128768 res!1028694) b!1508792))

(assert (= (and b!1508792 res!1028696) b!1508791))

(assert (= (and b!1508791 res!1028691) b!1508794))

(assert (= (and b!1508794 res!1028692) b!1508795))

(assert (= (and b!1508795 res!1028693) b!1508790))

(assert (= (and b!1508790 res!1028698) b!1508787))

(assert (= (and b!1508787 res!1028695) b!1508788))

(assert (= (and b!1508788 res!1028690) b!1508793))

(assert (= (and b!1508793 res!1028697) b!1508789))

(declare-fun m!1391207 () Bool)

(assert (=> b!1508790 m!1391207))

(declare-fun m!1391209 () Bool)

(assert (=> b!1508793 m!1391209))

(assert (=> b!1508793 m!1391209))

(declare-fun m!1391211 () Bool)

(assert (=> b!1508793 m!1391211))

(declare-fun m!1391213 () Bool)

(assert (=> b!1508789 m!1391213))

(declare-fun m!1391215 () Bool)

(assert (=> b!1508789 m!1391215))

(assert (=> b!1508789 m!1391215))

(declare-fun m!1391217 () Bool)

(assert (=> b!1508789 m!1391217))

(assert (=> b!1508788 m!1391209))

(assert (=> b!1508788 m!1391209))

(declare-fun m!1391219 () Bool)

(assert (=> b!1508788 m!1391219))

(assert (=> b!1508788 m!1391219))

(assert (=> b!1508788 m!1391209))

(declare-fun m!1391221 () Bool)

(assert (=> b!1508788 m!1391221))

(declare-fun m!1391223 () Bool)

(assert (=> start!128768 m!1391223))

(declare-fun m!1391225 () Bool)

(assert (=> start!128768 m!1391225))

(declare-fun m!1391227 () Bool)

(assert (=> b!1508791 m!1391227))

(assert (=> b!1508791 m!1391227))

(declare-fun m!1391229 () Bool)

(assert (=> b!1508791 m!1391229))

(assert (=> b!1508794 m!1391209))

(assert (=> b!1508794 m!1391209))

(declare-fun m!1391231 () Bool)

(assert (=> b!1508794 m!1391231))

(declare-fun m!1391233 () Bool)

(assert (=> b!1508795 m!1391233))

(check-sat (not b!1508795) (not b!1508788) (not b!1508793) (not b!1508789) (not b!1508790) (not b!1508791) (not b!1508794) (not start!128768))
(check-sat)
