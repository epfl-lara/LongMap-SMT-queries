; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129380 () Bool)

(assert start!129380)

(declare-fun b!1516119 () Bool)

(declare-fun e!846232 () Bool)

(declare-fun e!846233 () Bool)

(assert (=> b!1516119 (= e!846232 e!846233)))

(declare-fun res!1034857 () Bool)

(assert (=> b!1516119 (=> (not res!1034857) (not e!846233))))

(declare-datatypes ((SeekEntryResult!12821 0))(
  ( (MissingZero!12821 (index!53679 (_ BitVec 32))) (Found!12821 (index!53680 (_ BitVec 32))) (Intermediate!12821 (undefined!13633 Bool) (index!53681 (_ BitVec 32)) (x!135592 (_ BitVec 32))) (Undefined!12821) (MissingVacant!12821 (index!53682 (_ BitVec 32))) )
))
(declare-fun lt!656946 () SeekEntryResult!12821)

(declare-fun lt!656945 () SeekEntryResult!12821)

(assert (=> b!1516119 (= res!1034857 (= lt!656946 lt!656945))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516119 (= lt!656945 (Intermediate!12821 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101050 0))(
  ( (array!101051 (arr!48757 (Array (_ BitVec 32) (_ BitVec 64))) (size!49308 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516119 (= lt!656946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48757 a!2804) j!70) mask!2512) (select (arr!48757 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516120 () Bool)

(declare-fun e!846228 () Bool)

(declare-fun e!846229 () Bool)

(assert (=> b!1516120 (= e!846228 e!846229)))

(declare-fun res!1034846 () Bool)

(assert (=> b!1516120 (=> (not res!1034846) (not e!846229))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12821)

(assert (=> b!1516120 (= res!1034846 (= (seekEntryOrOpen!0 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48757 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516121 () Bool)

(declare-fun e!846234 () Bool)

(assert (=> b!1516121 (= e!846234 (not true))))

(declare-fun e!846230 () Bool)

(assert (=> b!1516121 e!846230))

(declare-fun res!1034847 () Bool)

(assert (=> b!1516121 (=> (not res!1034847) (not e!846230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101050 (_ BitVec 32)) Bool)

(assert (=> b!1516121 (= res!1034847 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50545 0))(
  ( (Unit!50546) )
))
(declare-fun lt!656944 () Unit!50545)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50545)

(assert (=> b!1516121 (= lt!656944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1034852 () Bool)

(assert (=> start!129380 (=> (not res!1034852) (not e!846232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129380 (= res!1034852 (validMask!0 mask!2512))))

(assert (=> start!129380 e!846232))

(assert (=> start!129380 true))

(declare-fun array_inv!38038 (array!101050) Bool)

(assert (=> start!129380 (array_inv!38038 a!2804)))

(declare-fun b!1516122 () Bool)

(declare-fun res!1034856 () Bool)

(assert (=> b!1516122 (=> (not res!1034856) (not e!846230))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12821)

(assert (=> b!1516122 (= res!1034856 (= (seekEntry!0 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) (Found!12821 j!70)))))

(declare-fun b!1516123 () Bool)

(declare-fun res!1034854 () Bool)

(assert (=> b!1516123 (=> (not res!1034854) (not e!846232))))

(declare-datatypes ((List!35227 0))(
  ( (Nil!35224) (Cons!35223 (h!36650 (_ BitVec 64)) (t!49913 List!35227)) )
))
(declare-fun arrayNoDuplicates!0 (array!101050 (_ BitVec 32) List!35227) Bool)

(assert (=> b!1516123 (= res!1034854 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35224))))

(declare-fun b!1516124 () Bool)

(declare-fun res!1034851 () Bool)

(assert (=> b!1516124 (=> (not res!1034851) (not e!846232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516124 (= res!1034851 (validKeyInArray!0 (select (arr!48757 a!2804) j!70)))))

(declare-fun b!1516125 () Bool)

(declare-fun res!1034845 () Bool)

(assert (=> b!1516125 (=> (not res!1034845) (not e!846232))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516125 (= res!1034845 (and (= (size!49308 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49308 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49308 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516126 () Bool)

(assert (=> b!1516126 (= e!846230 e!846228)))

(declare-fun res!1034848 () Bool)

(assert (=> b!1516126 (=> res!1034848 e!846228)))

(declare-fun lt!656947 () (_ BitVec 64))

(assert (=> b!1516126 (= res!1034848 (or (not (= (select (arr!48757 a!2804) j!70) lt!656947)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48757 a!2804) index!487) (select (arr!48757 a!2804) j!70)) (not (= (select (arr!48757 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516127 () Bool)

(declare-fun res!1034853 () Bool)

(assert (=> b!1516127 (=> (not res!1034853) (not e!846233))))

(assert (=> b!1516127 (= res!1034853 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) lt!656945))))

(declare-fun b!1516128 () Bool)

(declare-fun res!1034858 () Bool)

(assert (=> b!1516128 (=> (not res!1034858) (not e!846232))))

(assert (=> b!1516128 (= res!1034858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516129 () Bool)

(assert (=> b!1516129 (= e!846233 e!846234)))

(declare-fun res!1034855 () Bool)

(assert (=> b!1516129 (=> (not res!1034855) (not e!846234))))

(declare-fun lt!656943 () array!101050)

(assert (=> b!1516129 (= res!1034855 (= lt!656946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656947 mask!2512) lt!656947 lt!656943 mask!2512)))))

(assert (=> b!1516129 (= lt!656947 (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516129 (= lt!656943 (array!101051 (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49308 a!2804)))))

(declare-fun b!1516130 () Bool)

(declare-fun res!1034849 () Bool)

(assert (=> b!1516130 (=> (not res!1034849) (not e!846232))))

(assert (=> b!1516130 (= res!1034849 (validKeyInArray!0 (select (arr!48757 a!2804) i!961)))))

(declare-fun b!1516131 () Bool)

(assert (=> b!1516131 (= e!846229 (= (seekEntryOrOpen!0 lt!656947 lt!656943 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656947 lt!656943 mask!2512)))))

(declare-fun b!1516132 () Bool)

(declare-fun res!1034850 () Bool)

(assert (=> b!1516132 (=> (not res!1034850) (not e!846232))))

(assert (=> b!1516132 (= res!1034850 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49308 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49308 a!2804))))))

(assert (= (and start!129380 res!1034852) b!1516125))

(assert (= (and b!1516125 res!1034845) b!1516130))

(assert (= (and b!1516130 res!1034849) b!1516124))

(assert (= (and b!1516124 res!1034851) b!1516128))

(assert (= (and b!1516128 res!1034858) b!1516123))

(assert (= (and b!1516123 res!1034854) b!1516132))

(assert (= (and b!1516132 res!1034850) b!1516119))

(assert (= (and b!1516119 res!1034857) b!1516127))

(assert (= (and b!1516127 res!1034853) b!1516129))

(assert (= (and b!1516129 res!1034855) b!1516121))

(assert (= (and b!1516121 res!1034847) b!1516122))

(assert (= (and b!1516122 res!1034856) b!1516126))

(assert (= (and b!1516126 (not res!1034848)) b!1516120))

(assert (= (and b!1516120 res!1034846) b!1516131))

(declare-fun m!1399023 () Bool)

(assert (=> b!1516127 m!1399023))

(assert (=> b!1516127 m!1399023))

(declare-fun m!1399025 () Bool)

(assert (=> b!1516127 m!1399025))

(assert (=> b!1516122 m!1399023))

(assert (=> b!1516122 m!1399023))

(declare-fun m!1399027 () Bool)

(assert (=> b!1516122 m!1399027))

(declare-fun m!1399029 () Bool)

(assert (=> start!129380 m!1399029))

(declare-fun m!1399031 () Bool)

(assert (=> start!129380 m!1399031))

(declare-fun m!1399033 () Bool)

(assert (=> b!1516130 m!1399033))

(assert (=> b!1516130 m!1399033))

(declare-fun m!1399035 () Bool)

(assert (=> b!1516130 m!1399035))

(declare-fun m!1399037 () Bool)

(assert (=> b!1516129 m!1399037))

(assert (=> b!1516129 m!1399037))

(declare-fun m!1399039 () Bool)

(assert (=> b!1516129 m!1399039))

(declare-fun m!1399041 () Bool)

(assert (=> b!1516129 m!1399041))

(declare-fun m!1399043 () Bool)

(assert (=> b!1516129 m!1399043))

(declare-fun m!1399045 () Bool)

(assert (=> b!1516131 m!1399045))

(declare-fun m!1399047 () Bool)

(assert (=> b!1516131 m!1399047))

(declare-fun m!1399049 () Bool)

(assert (=> b!1516128 m!1399049))

(assert (=> b!1516120 m!1399023))

(assert (=> b!1516120 m!1399023))

(declare-fun m!1399051 () Bool)

(assert (=> b!1516120 m!1399051))

(assert (=> b!1516120 m!1399023))

(declare-fun m!1399053 () Bool)

(assert (=> b!1516120 m!1399053))

(assert (=> b!1516119 m!1399023))

(assert (=> b!1516119 m!1399023))

(declare-fun m!1399055 () Bool)

(assert (=> b!1516119 m!1399055))

(assert (=> b!1516119 m!1399055))

(assert (=> b!1516119 m!1399023))

(declare-fun m!1399057 () Bool)

(assert (=> b!1516119 m!1399057))

(assert (=> b!1516126 m!1399023))

(declare-fun m!1399059 () Bool)

(assert (=> b!1516126 m!1399059))

(assert (=> b!1516124 m!1399023))

(assert (=> b!1516124 m!1399023))

(declare-fun m!1399061 () Bool)

(assert (=> b!1516124 m!1399061))

(declare-fun m!1399063 () Bool)

(assert (=> b!1516121 m!1399063))

(declare-fun m!1399065 () Bool)

(assert (=> b!1516121 m!1399065))

(declare-fun m!1399067 () Bool)

(assert (=> b!1516123 m!1399067))

(check-sat (not b!1516121) (not start!129380) (not b!1516127) (not b!1516123) (not b!1516124) (not b!1516128) (not b!1516131) (not b!1516129) (not b!1516120) (not b!1516130) (not b!1516119) (not b!1516122))
(check-sat)
