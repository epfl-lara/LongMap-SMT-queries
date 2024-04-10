; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130058 () Bool)

(assert start!130058)

(declare-fun b!1526104 () Bool)

(declare-fun res!1044149 () Bool)

(declare-fun e!850664 () Bool)

(assert (=> b!1526104 (=> (not res!1044149) (not e!850664))))

(declare-datatypes ((array!101471 0))(
  ( (array!101472 (arr!48962 (Array (_ BitVec 32) (_ BitVec 64))) (size!49512 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101471)

(declare-datatypes ((List!35445 0))(
  ( (Nil!35442) (Cons!35441 (h!36874 (_ BitVec 64)) (t!50139 List!35445)) )
))
(declare-fun arrayNoDuplicates!0 (array!101471 (_ BitVec 32) List!35445) Bool)

(assert (=> b!1526104 (= res!1044149 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35442))))

(declare-fun b!1526105 () Bool)

(declare-fun e!850663 () Bool)

(declare-fun e!850665 () Bool)

(assert (=> b!1526105 (= e!850663 e!850665)))

(declare-fun res!1044144 () Bool)

(assert (=> b!1526105 (=> (not res!1044144) (not e!850665))))

(declare-fun lt!660956 () array!101471)

(declare-fun lt!660957 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13127 0))(
  ( (MissingZero!13127 (index!54903 (_ BitVec 32))) (Found!13127 (index!54904 (_ BitVec 32))) (Intermediate!13127 (undefined!13939 Bool) (index!54905 (_ BitVec 32)) (x!136605 (_ BitVec 32))) (Undefined!13127) (MissingVacant!13127 (index!54906 (_ BitVec 32))) )
))
(declare-fun lt!660954 () SeekEntryResult!13127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101471 (_ BitVec 32)) SeekEntryResult!13127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526105 (= res!1044144 (= lt!660954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660957 mask!2512) lt!660957 lt!660956 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526105 (= lt!660957 (select (store (arr!48962 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526105 (= lt!660956 (array!101472 (store (arr!48962 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49512 a!2804)))))

(declare-fun b!1526106 () Bool)

(declare-fun res!1044145 () Bool)

(declare-fun e!850668 () Bool)

(assert (=> b!1526106 (=> (not res!1044145) (not e!850668))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101471 (_ BitVec 32)) SeekEntryResult!13127)

(assert (=> b!1526106 (= res!1044145 (= (seekEntry!0 (select (arr!48962 a!2804) j!70) a!2804 mask!2512) (Found!13127 j!70)))))

(declare-fun b!1526108 () Bool)

(declare-fun res!1044141 () Bool)

(assert (=> b!1526108 (=> (not res!1044141) (not e!850664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526108 (= res!1044141 (validKeyInArray!0 (select (arr!48962 a!2804) i!961)))))

(declare-fun e!850669 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1526109 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101471 (_ BitVec 32)) SeekEntryResult!13127)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101471 (_ BitVec 32)) SeekEntryResult!13127)

(assert (=> b!1526109 (= e!850669 (= (seekEntryOrOpen!0 lt!660957 lt!660956 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660957 lt!660956 mask!2512)))))

(declare-fun b!1526110 () Bool)

(declare-fun res!1044148 () Bool)

(assert (=> b!1526110 (=> (not res!1044148) (not e!850664))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526110 (= res!1044148 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49512 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49512 a!2804))))))

(declare-fun b!1526111 () Bool)

(assert (=> b!1526111 (= e!850665 (not true))))

(assert (=> b!1526111 e!850668))

(declare-fun res!1044147 () Bool)

(assert (=> b!1526111 (=> (not res!1044147) (not e!850668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101471 (_ BitVec 32)) Bool)

(assert (=> b!1526111 (= res!1044147 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51038 0))(
  ( (Unit!51039) )
))
(declare-fun lt!660958 () Unit!51038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51038)

(assert (=> b!1526111 (= lt!660958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526112 () Bool)

(declare-fun res!1044140 () Bool)

(assert (=> b!1526112 (=> (not res!1044140) (not e!850664))))

(assert (=> b!1526112 (= res!1044140 (and (= (size!49512 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49512 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49512 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526113 () Bool)

(declare-fun e!850666 () Bool)

(assert (=> b!1526113 (= e!850668 e!850666)))

(declare-fun res!1044138 () Bool)

(assert (=> b!1526113 (=> res!1044138 e!850666)))

(assert (=> b!1526113 (= res!1044138 (or (not (= (select (arr!48962 a!2804) j!70) lt!660957)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48962 a!2804) index!487) (select (arr!48962 a!2804) j!70)) (not (= (select (arr!48962 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526114 () Bool)

(assert (=> b!1526114 (= e!850664 e!850663)))

(declare-fun res!1044139 () Bool)

(assert (=> b!1526114 (=> (not res!1044139) (not e!850663))))

(declare-fun lt!660955 () SeekEntryResult!13127)

(assert (=> b!1526114 (= res!1044139 (= lt!660954 lt!660955))))

(assert (=> b!1526114 (= lt!660955 (Intermediate!13127 false resIndex!21 resX!21))))

(assert (=> b!1526114 (= lt!660954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48962 a!2804) j!70) mask!2512) (select (arr!48962 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1044151 () Bool)

(assert (=> start!130058 (=> (not res!1044151) (not e!850664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130058 (= res!1044151 (validMask!0 mask!2512))))

(assert (=> start!130058 e!850664))

(assert (=> start!130058 true))

(declare-fun array_inv!37990 (array!101471) Bool)

(assert (=> start!130058 (array_inv!37990 a!2804)))

(declare-fun b!1526107 () Bool)

(declare-fun res!1044143 () Bool)

(assert (=> b!1526107 (=> (not res!1044143) (not e!850663))))

(assert (=> b!1526107 (= res!1044143 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48962 a!2804) j!70) a!2804 mask!2512) lt!660955))))

(declare-fun b!1526115 () Bool)

(assert (=> b!1526115 (= e!850666 e!850669)))

(declare-fun res!1044146 () Bool)

(assert (=> b!1526115 (=> (not res!1044146) (not e!850669))))

(assert (=> b!1526115 (= res!1044146 (= (seekEntryOrOpen!0 (select (arr!48962 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48962 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526116 () Bool)

(declare-fun res!1044150 () Bool)

(assert (=> b!1526116 (=> (not res!1044150) (not e!850664))))

(assert (=> b!1526116 (= res!1044150 (validKeyInArray!0 (select (arr!48962 a!2804) j!70)))))

(declare-fun b!1526117 () Bool)

(declare-fun res!1044142 () Bool)

(assert (=> b!1526117 (=> (not res!1044142) (not e!850664))))

(assert (=> b!1526117 (= res!1044142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130058 res!1044151) b!1526112))

(assert (= (and b!1526112 res!1044140) b!1526108))

(assert (= (and b!1526108 res!1044141) b!1526116))

(assert (= (and b!1526116 res!1044150) b!1526117))

(assert (= (and b!1526117 res!1044142) b!1526104))

(assert (= (and b!1526104 res!1044149) b!1526110))

(assert (= (and b!1526110 res!1044148) b!1526114))

(assert (= (and b!1526114 res!1044139) b!1526107))

(assert (= (and b!1526107 res!1044143) b!1526105))

(assert (= (and b!1526105 res!1044144) b!1526111))

(assert (= (and b!1526111 res!1044147) b!1526106))

(assert (= (and b!1526106 res!1044145) b!1526113))

(assert (= (and b!1526113 (not res!1044138)) b!1526115))

(assert (= (and b!1526115 res!1044146) b!1526109))

(declare-fun m!1408875 () Bool)

(assert (=> b!1526111 m!1408875))

(declare-fun m!1408877 () Bool)

(assert (=> b!1526111 m!1408877))

(declare-fun m!1408879 () Bool)

(assert (=> b!1526115 m!1408879))

(assert (=> b!1526115 m!1408879))

(declare-fun m!1408881 () Bool)

(assert (=> b!1526115 m!1408881))

(assert (=> b!1526115 m!1408879))

(declare-fun m!1408883 () Bool)

(assert (=> b!1526115 m!1408883))

(declare-fun m!1408885 () Bool)

(assert (=> start!130058 m!1408885))

(declare-fun m!1408887 () Bool)

(assert (=> start!130058 m!1408887))

(assert (=> b!1526106 m!1408879))

(assert (=> b!1526106 m!1408879))

(declare-fun m!1408889 () Bool)

(assert (=> b!1526106 m!1408889))

(declare-fun m!1408891 () Bool)

(assert (=> b!1526117 m!1408891))

(assert (=> b!1526114 m!1408879))

(assert (=> b!1526114 m!1408879))

(declare-fun m!1408893 () Bool)

(assert (=> b!1526114 m!1408893))

(assert (=> b!1526114 m!1408893))

(assert (=> b!1526114 m!1408879))

(declare-fun m!1408895 () Bool)

(assert (=> b!1526114 m!1408895))

(assert (=> b!1526116 m!1408879))

(assert (=> b!1526116 m!1408879))

(declare-fun m!1408897 () Bool)

(assert (=> b!1526116 m!1408897))

(assert (=> b!1526107 m!1408879))

(assert (=> b!1526107 m!1408879))

(declare-fun m!1408899 () Bool)

(assert (=> b!1526107 m!1408899))

(declare-fun m!1408901 () Bool)

(assert (=> b!1526109 m!1408901))

(declare-fun m!1408903 () Bool)

(assert (=> b!1526109 m!1408903))

(declare-fun m!1408905 () Bool)

(assert (=> b!1526105 m!1408905))

(assert (=> b!1526105 m!1408905))

(declare-fun m!1408907 () Bool)

(assert (=> b!1526105 m!1408907))

(declare-fun m!1408909 () Bool)

(assert (=> b!1526105 m!1408909))

(declare-fun m!1408911 () Bool)

(assert (=> b!1526105 m!1408911))

(declare-fun m!1408913 () Bool)

(assert (=> b!1526108 m!1408913))

(assert (=> b!1526108 m!1408913))

(declare-fun m!1408915 () Bool)

(assert (=> b!1526108 m!1408915))

(assert (=> b!1526113 m!1408879))

(declare-fun m!1408917 () Bool)

(assert (=> b!1526113 m!1408917))

(declare-fun m!1408919 () Bool)

(assert (=> b!1526104 m!1408919))

(push 1)

