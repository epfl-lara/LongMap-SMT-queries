; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128972 () Bool)

(assert start!128972)

(declare-fun b!1512119 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100828 0))(
  ( (array!100829 (arr!48651 (Array (_ BitVec 32) (_ BitVec 64))) (size!49201 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100828)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844089 () Bool)

(declare-datatypes ((SeekEntryResult!12822 0))(
  ( (MissingZero!12822 (index!53683 (_ BitVec 32))) (Found!12822 (index!53684 (_ BitVec 32))) (Intermediate!12822 (undefined!13634 Bool) (index!53685 (_ BitVec 32)) (x!135412 (_ BitVec 32))) (Undefined!12822) (MissingVacant!12822 (index!53686 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12822)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12822)

(assert (=> b!1512119 (= e!844089 (= (seekEntryOrOpen!0 (select (arr!48651 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48651 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512120 () Bool)

(declare-fun res!1032025 () Bool)

(declare-fun e!844087 () Bool)

(assert (=> b!1512120 (=> (not res!1032025) (not e!844087))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512120 (= res!1032025 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49201 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49201 a!2804))))))

(declare-fun b!1512121 () Bool)

(declare-fun res!1032031 () Bool)

(assert (=> b!1512121 (=> (not res!1032031) (not e!844087))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512121 (= res!1032031 (and (= (size!49201 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49201 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49201 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512122 () Bool)

(declare-fun res!1032032 () Bool)

(assert (=> b!1512122 (=> (not res!1032032) (not e!844087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100828 (_ BitVec 32)) Bool)

(assert (=> b!1512122 (= res!1032032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512123 () Bool)

(declare-fun res!1032027 () Bool)

(assert (=> b!1512123 (=> (not res!1032027) (not e!844087))))

(declare-datatypes ((List!35134 0))(
  ( (Nil!35131) (Cons!35130 (h!36542 (_ BitVec 64)) (t!49828 List!35134)) )
))
(declare-fun arrayNoDuplicates!0 (array!100828 (_ BitVec 32) List!35134) Bool)

(assert (=> b!1512123 (= res!1032027 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35131))))

(declare-fun b!1512124 () Bool)

(declare-fun res!1032034 () Bool)

(assert (=> b!1512124 (=> (not res!1032034) (not e!844087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512124 (= res!1032034 (validKeyInArray!0 (select (arr!48651 a!2804) j!70)))))

(declare-fun b!1512125 () Bool)

(declare-fun res!1032023 () Bool)

(assert (=> b!1512125 (=> (not res!1032023) (not e!844087))))

(assert (=> b!1512125 (= res!1032023 (validKeyInArray!0 (select (arr!48651 a!2804) i!961)))))

(declare-fun b!1512126 () Bool)

(declare-fun e!844086 () Bool)

(assert (=> b!1512126 (= e!844086 (not true))))

(declare-fun e!844088 () Bool)

(assert (=> b!1512126 e!844088))

(declare-fun res!1032029 () Bool)

(assert (=> b!1512126 (=> (not res!1032029) (not e!844088))))

(assert (=> b!1512126 (= res!1032029 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50512 0))(
  ( (Unit!50513) )
))
(declare-fun lt!655602 () Unit!50512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50512)

(assert (=> b!1512126 (= lt!655602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512127 () Bool)

(assert (=> b!1512127 (= e!844087 e!844086)))

(declare-fun res!1032033 () Bool)

(assert (=> b!1512127 (=> (not res!1032033) (not e!844086))))

(declare-fun lt!655603 () SeekEntryResult!12822)

(declare-fun lt!655601 () SeekEntryResult!12822)

(assert (=> b!1512127 (= res!1032033 (= lt!655603 lt!655601))))

(assert (=> b!1512127 (= lt!655601 (Intermediate!12822 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512127 (= lt!655603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48651 a!2804) j!70) mask!2512) (select (arr!48651 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512129 () Bool)

(declare-fun res!1032022 () Bool)

(assert (=> b!1512129 (=> (not res!1032022) (not e!844088))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12822)

(assert (=> b!1512129 (= res!1032022 (= (seekEntry!0 (select (arr!48651 a!2804) j!70) a!2804 mask!2512) (Found!12822 j!70)))))

(declare-fun b!1512130 () Bool)

(declare-fun res!1032026 () Bool)

(assert (=> b!1512130 (=> (not res!1032026) (not e!844086))))

(assert (=> b!1512130 (= res!1032026 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48651 a!2804) j!70) a!2804 mask!2512) lt!655601))))

(declare-fun b!1512131 () Bool)

(declare-fun res!1032024 () Bool)

(assert (=> b!1512131 (=> (not res!1032024) (not e!844086))))

(assert (=> b!1512131 (= res!1032024 (= lt!655603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48651 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48651 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100829 (store (arr!48651 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49201 a!2804)) mask!2512)))))

(declare-fun b!1512128 () Bool)

(assert (=> b!1512128 (= e!844088 e!844089)))

(declare-fun res!1032030 () Bool)

(assert (=> b!1512128 (=> res!1032030 e!844089)))

(assert (=> b!1512128 (= res!1032030 (or (not (= (select (arr!48651 a!2804) j!70) (select (store (arr!48651 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48651 a!2804) index!487) (select (arr!48651 a!2804) j!70)) (not (= (select (arr!48651 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032028 () Bool)

(assert (=> start!128972 (=> (not res!1032028) (not e!844087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128972 (= res!1032028 (validMask!0 mask!2512))))

(assert (=> start!128972 e!844087))

(assert (=> start!128972 true))

(declare-fun array_inv!37679 (array!100828) Bool)

(assert (=> start!128972 (array_inv!37679 a!2804)))

(assert (= (and start!128972 res!1032028) b!1512121))

(assert (= (and b!1512121 res!1032031) b!1512125))

(assert (= (and b!1512125 res!1032023) b!1512124))

(assert (= (and b!1512124 res!1032034) b!1512122))

(assert (= (and b!1512122 res!1032032) b!1512123))

(assert (= (and b!1512123 res!1032027) b!1512120))

(assert (= (and b!1512120 res!1032025) b!1512127))

(assert (= (and b!1512127 res!1032033) b!1512130))

(assert (= (and b!1512130 res!1032026) b!1512131))

(assert (= (and b!1512131 res!1032024) b!1512126))

(assert (= (and b!1512126 res!1032029) b!1512129))

(assert (= (and b!1512129 res!1032022) b!1512128))

(assert (= (and b!1512128 (not res!1032030)) b!1512119))

(declare-fun m!1394863 () Bool)

(assert (=> b!1512129 m!1394863))

(assert (=> b!1512129 m!1394863))

(declare-fun m!1394865 () Bool)

(assert (=> b!1512129 m!1394865))

(assert (=> b!1512127 m!1394863))

(assert (=> b!1512127 m!1394863))

(declare-fun m!1394867 () Bool)

(assert (=> b!1512127 m!1394867))

(assert (=> b!1512127 m!1394867))

(assert (=> b!1512127 m!1394863))

(declare-fun m!1394869 () Bool)

(assert (=> b!1512127 m!1394869))

(assert (=> b!1512130 m!1394863))

(assert (=> b!1512130 m!1394863))

(declare-fun m!1394871 () Bool)

(assert (=> b!1512130 m!1394871))

(declare-fun m!1394873 () Bool)

(assert (=> b!1512131 m!1394873))

(declare-fun m!1394875 () Bool)

(assert (=> b!1512131 m!1394875))

(assert (=> b!1512131 m!1394875))

(declare-fun m!1394877 () Bool)

(assert (=> b!1512131 m!1394877))

(assert (=> b!1512131 m!1394877))

(assert (=> b!1512131 m!1394875))

(declare-fun m!1394879 () Bool)

(assert (=> b!1512131 m!1394879))

(assert (=> b!1512119 m!1394863))

(assert (=> b!1512119 m!1394863))

(declare-fun m!1394881 () Bool)

(assert (=> b!1512119 m!1394881))

(assert (=> b!1512119 m!1394863))

(declare-fun m!1394883 () Bool)

(assert (=> b!1512119 m!1394883))

(assert (=> b!1512128 m!1394863))

(assert (=> b!1512128 m!1394873))

(assert (=> b!1512128 m!1394875))

(declare-fun m!1394885 () Bool)

(assert (=> b!1512128 m!1394885))

(declare-fun m!1394887 () Bool)

(assert (=> b!1512126 m!1394887))

(declare-fun m!1394889 () Bool)

(assert (=> b!1512126 m!1394889))

(declare-fun m!1394891 () Bool)

(assert (=> b!1512122 m!1394891))

(assert (=> b!1512124 m!1394863))

(assert (=> b!1512124 m!1394863))

(declare-fun m!1394893 () Bool)

(assert (=> b!1512124 m!1394893))

(declare-fun m!1394895 () Bool)

(assert (=> start!128972 m!1394895))

(declare-fun m!1394897 () Bool)

(assert (=> start!128972 m!1394897))

(declare-fun m!1394899 () Bool)

(assert (=> b!1512125 m!1394899))

(assert (=> b!1512125 m!1394899))

(declare-fun m!1394901 () Bool)

(assert (=> b!1512125 m!1394901))

(declare-fun m!1394903 () Bool)

(assert (=> b!1512123 m!1394903))

(check-sat (not b!1512131) (not b!1512123) (not b!1512124) (not start!128972) (not b!1512122) (not b!1512125) (not b!1512126) (not b!1512119) (not b!1512127) (not b!1512129) (not b!1512130))
(check-sat)
