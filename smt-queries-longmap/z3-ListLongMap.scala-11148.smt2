; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130252 () Bool)

(assert start!130252)

(declare-fun b!1529100 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!852192 () Bool)

(declare-datatypes ((array!101602 0))(
  ( (array!101603 (arr!49026 (Array (_ BitVec 32) (_ BitVec 64))) (size!49576 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101602)

(declare-datatypes ((SeekEntryResult!13191 0))(
  ( (MissingZero!13191 (index!55159 (_ BitVec 32))) (Found!13191 (index!55160 (_ BitVec 32))) (Intermediate!13191 (undefined!14003 Bool) (index!55161 (_ BitVec 32)) (x!136846 (_ BitVec 32))) (Undefined!13191) (MissingVacant!13191 (index!55162 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13191)

(assert (=> b!1529100 (= e!852192 (= (seekEntry!0 (select (arr!49026 a!2804) j!70) a!2804 mask!2512) (Found!13191 j!70)))))

(declare-fun b!1529101 () Bool)

(declare-fun res!1046812 () Bool)

(declare-fun e!852191 () Bool)

(assert (=> b!1529101 (=> (not res!1046812) (not e!852191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101602 (_ BitVec 32)) Bool)

(assert (=> b!1529101 (= res!1046812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529102 () Bool)

(declare-fun res!1046814 () Bool)

(declare-fun e!852189 () Bool)

(assert (=> b!1529102 (=> (not res!1046814) (not e!852189))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!662322 () SeekEntryResult!13191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529102 (= res!1046814 (= lt!662322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49026 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49026 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101603 (store (arr!49026 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)) mask!2512)))))

(declare-fun b!1529103 () Bool)

(declare-fun res!1046810 () Bool)

(assert (=> b!1529103 (=> (not res!1046810) (not e!852189))))

(declare-fun lt!662320 () SeekEntryResult!13191)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529103 (= res!1046810 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49026 a!2804) j!70) a!2804 mask!2512) lt!662320))))

(declare-fun b!1529104 () Bool)

(declare-fun res!1046807 () Bool)

(assert (=> b!1529104 (=> (not res!1046807) (not e!852191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529104 (= res!1046807 (validKeyInArray!0 (select (arr!49026 a!2804) i!961)))))

(declare-fun res!1046817 () Bool)

(assert (=> start!130252 (=> (not res!1046817) (not e!852191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130252 (= res!1046817 (validMask!0 mask!2512))))

(assert (=> start!130252 e!852191))

(assert (=> start!130252 true))

(declare-fun array_inv!38054 (array!101602) Bool)

(assert (=> start!130252 (array_inv!38054 a!2804)))

(declare-fun b!1529105 () Bool)

(declare-fun res!1046815 () Bool)

(assert (=> b!1529105 (=> (not res!1046815) (not e!852191))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529105 (= res!1046815 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49576 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49576 a!2804))))))

(declare-fun b!1529106 () Bool)

(declare-fun res!1046811 () Bool)

(assert (=> b!1529106 (=> (not res!1046811) (not e!852191))))

(assert (=> b!1529106 (= res!1046811 (validKeyInArray!0 (select (arr!49026 a!2804) j!70)))))

(declare-fun b!1529107 () Bool)

(declare-fun e!852193 () Bool)

(assert (=> b!1529107 (= e!852193 true)))

(declare-fun lt!662321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529107 (= lt!662321 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529108 () Bool)

(assert (=> b!1529108 (= e!852189 (not e!852193))))

(declare-fun res!1046818 () Bool)

(assert (=> b!1529108 (=> res!1046818 e!852193)))

(assert (=> b!1529108 (= res!1046818 (or (not (= (select (arr!49026 a!2804) j!70) (select (store (arr!49026 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529108 e!852192))

(declare-fun res!1046808 () Bool)

(assert (=> b!1529108 (=> (not res!1046808) (not e!852192))))

(assert (=> b!1529108 (= res!1046808 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51166 0))(
  ( (Unit!51167) )
))
(declare-fun lt!662323 () Unit!51166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51166)

(assert (=> b!1529108 (= lt!662323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529109 () Bool)

(declare-fun res!1046813 () Bool)

(assert (=> b!1529109 (=> (not res!1046813) (not e!852191))))

(declare-datatypes ((List!35509 0))(
  ( (Nil!35506) (Cons!35505 (h!36941 (_ BitVec 64)) (t!50203 List!35509)) )
))
(declare-fun arrayNoDuplicates!0 (array!101602 (_ BitVec 32) List!35509) Bool)

(assert (=> b!1529109 (= res!1046813 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35506))))

(declare-fun b!1529110 () Bool)

(declare-fun res!1046816 () Bool)

(assert (=> b!1529110 (=> (not res!1046816) (not e!852191))))

(assert (=> b!1529110 (= res!1046816 (and (= (size!49576 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49576 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49576 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529111 () Bool)

(assert (=> b!1529111 (= e!852191 e!852189)))

(declare-fun res!1046809 () Bool)

(assert (=> b!1529111 (=> (not res!1046809) (not e!852189))))

(assert (=> b!1529111 (= res!1046809 (= lt!662322 lt!662320))))

(assert (=> b!1529111 (= lt!662320 (Intermediate!13191 false resIndex!21 resX!21))))

(assert (=> b!1529111 (= lt!662322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49026 a!2804) j!70) mask!2512) (select (arr!49026 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130252 res!1046817) b!1529110))

(assert (= (and b!1529110 res!1046816) b!1529104))

(assert (= (and b!1529104 res!1046807) b!1529106))

(assert (= (and b!1529106 res!1046811) b!1529101))

(assert (= (and b!1529101 res!1046812) b!1529109))

(assert (= (and b!1529109 res!1046813) b!1529105))

(assert (= (and b!1529105 res!1046815) b!1529111))

(assert (= (and b!1529111 res!1046809) b!1529103))

(assert (= (and b!1529103 res!1046810) b!1529102))

(assert (= (and b!1529102 res!1046814) b!1529108))

(assert (= (and b!1529108 res!1046808) b!1529100))

(assert (= (and b!1529108 (not res!1046818)) b!1529107))

(declare-fun m!1412027 () Bool)

(assert (=> b!1529107 m!1412027))

(declare-fun m!1412029 () Bool)

(assert (=> b!1529103 m!1412029))

(assert (=> b!1529103 m!1412029))

(declare-fun m!1412031 () Bool)

(assert (=> b!1529103 m!1412031))

(declare-fun m!1412033 () Bool)

(assert (=> start!130252 m!1412033))

(declare-fun m!1412035 () Bool)

(assert (=> start!130252 m!1412035))

(assert (=> b!1529100 m!1412029))

(assert (=> b!1529100 m!1412029))

(declare-fun m!1412037 () Bool)

(assert (=> b!1529100 m!1412037))

(declare-fun m!1412039 () Bool)

(assert (=> b!1529109 m!1412039))

(declare-fun m!1412041 () Bool)

(assert (=> b!1529104 m!1412041))

(assert (=> b!1529104 m!1412041))

(declare-fun m!1412043 () Bool)

(assert (=> b!1529104 m!1412043))

(assert (=> b!1529108 m!1412029))

(declare-fun m!1412045 () Bool)

(assert (=> b!1529108 m!1412045))

(declare-fun m!1412047 () Bool)

(assert (=> b!1529108 m!1412047))

(declare-fun m!1412049 () Bool)

(assert (=> b!1529108 m!1412049))

(declare-fun m!1412051 () Bool)

(assert (=> b!1529108 m!1412051))

(assert (=> b!1529102 m!1412047))

(assert (=> b!1529102 m!1412049))

(assert (=> b!1529102 m!1412049))

(declare-fun m!1412053 () Bool)

(assert (=> b!1529102 m!1412053))

(assert (=> b!1529102 m!1412053))

(assert (=> b!1529102 m!1412049))

(declare-fun m!1412055 () Bool)

(assert (=> b!1529102 m!1412055))

(assert (=> b!1529106 m!1412029))

(assert (=> b!1529106 m!1412029))

(declare-fun m!1412057 () Bool)

(assert (=> b!1529106 m!1412057))

(assert (=> b!1529111 m!1412029))

(assert (=> b!1529111 m!1412029))

(declare-fun m!1412059 () Bool)

(assert (=> b!1529111 m!1412059))

(assert (=> b!1529111 m!1412059))

(assert (=> b!1529111 m!1412029))

(declare-fun m!1412061 () Bool)

(assert (=> b!1529111 m!1412061))

(declare-fun m!1412063 () Bool)

(assert (=> b!1529101 m!1412063))

(check-sat (not start!130252) (not b!1529111) (not b!1529101) (not b!1529103) (not b!1529104) (not b!1529100) (not b!1529107) (not b!1529109) (not b!1529102) (not b!1529108) (not b!1529106))
(check-sat)
