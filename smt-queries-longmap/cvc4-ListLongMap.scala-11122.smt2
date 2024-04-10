; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129966 () Bool)

(assert start!129966)

(declare-fun b!1525133 () Bool)

(declare-fun e!850149 () Bool)

(declare-fun e!850147 () Bool)

(assert (=> b!1525133 (= e!850149 e!850147)))

(declare-fun res!1043504 () Bool)

(assert (=> b!1525133 (=> res!1043504 e!850147)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101442 0))(
  ( (array!101443 (arr!48949 (Array (_ BitVec 32) (_ BitVec 64))) (size!49499 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101442)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525133 (= res!1043504 (or (not (= (select (arr!48949 a!2804) j!70) (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48949 a!2804) index!487) (select (arr!48949 a!2804) j!70)) (not (= (select (arr!48949 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525134 () Bool)

(declare-fun res!1043499 () Bool)

(assert (=> b!1525134 (=> (not res!1043499) (not e!850149))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13114 0))(
  ( (MissingZero!13114 (index!54851 (_ BitVec 32))) (Found!13114 (index!54852 (_ BitVec 32))) (Intermediate!13114 (undefined!13926 Bool) (index!54853 (_ BitVec 32)) (x!136543 (_ BitVec 32))) (Undefined!13114) (MissingVacant!13114 (index!54854 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101442 (_ BitVec 32)) SeekEntryResult!13114)

(assert (=> b!1525134 (= res!1043499 (= (seekEntry!0 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) (Found!13114 j!70)))))

(declare-fun b!1525135 () Bool)

(declare-fun res!1043503 () Bool)

(declare-fun e!850146 () Bool)

(assert (=> b!1525135 (=> (not res!1043503) (not e!850146))))

(declare-datatypes ((List!35432 0))(
  ( (Nil!35429) (Cons!35428 (h!36858 (_ BitVec 64)) (t!50126 List!35432)) )
))
(declare-fun arrayNoDuplicates!0 (array!101442 (_ BitVec 32) List!35432) Bool)

(assert (=> b!1525135 (= res!1043503 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35429))))

(declare-fun res!1043501 () Bool)

(assert (=> start!129966 (=> (not res!1043501) (not e!850146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129966 (= res!1043501 (validMask!0 mask!2512))))

(assert (=> start!129966 e!850146))

(assert (=> start!129966 true))

(declare-fun array_inv!37977 (array!101442) Bool)

(assert (=> start!129966 (array_inv!37977 a!2804)))

(declare-fun b!1525136 () Bool)

(declare-fun res!1043497 () Bool)

(assert (=> b!1525136 (=> (not res!1043497) (not e!850146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525136 (= res!1043497 (validKeyInArray!0 (select (arr!48949 a!2804) i!961)))))

(declare-fun b!1525137 () Bool)

(declare-fun res!1043496 () Bool)

(assert (=> b!1525137 (=> (not res!1043496) (not e!850146))))

(assert (=> b!1525137 (= res!1043496 (validKeyInArray!0 (select (arr!48949 a!2804) j!70)))))

(declare-fun b!1525138 () Bool)

(declare-fun res!1043500 () Bool)

(declare-fun e!850150 () Bool)

(assert (=> b!1525138 (=> (not res!1043500) (not e!850150))))

(declare-fun lt!660568 () SeekEntryResult!13114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101442 (_ BitVec 32)) SeekEntryResult!13114)

(assert (=> b!1525138 (= res!1043500 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) lt!660568))))

(declare-fun b!1525139 () Bool)

(declare-fun res!1043502 () Bool)

(assert (=> b!1525139 (=> (not res!1043502) (not e!850146))))

(assert (=> b!1525139 (= res!1043502 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49499 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49499 a!2804))))))

(declare-fun b!1525140 () Bool)

(declare-fun res!1043505 () Bool)

(assert (=> b!1525140 (=> (not res!1043505) (not e!850150))))

(declare-fun lt!660567 () SeekEntryResult!13114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525140 (= res!1043505 (= lt!660567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101443 (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49499 a!2804)) mask!2512)))))

(declare-fun b!1525141 () Bool)

(assert (=> b!1525141 (= e!850146 e!850150)))

(declare-fun res!1043495 () Bool)

(assert (=> b!1525141 (=> (not res!1043495) (not e!850150))))

(assert (=> b!1525141 (= res!1043495 (= lt!660567 lt!660568))))

(assert (=> b!1525141 (= lt!660568 (Intermediate!13114 false resIndex!21 resX!21))))

(assert (=> b!1525141 (= lt!660567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48949 a!2804) j!70) mask!2512) (select (arr!48949 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525142 () Bool)

(assert (=> b!1525142 (= e!850150 (not true))))

(assert (=> b!1525142 e!850149))

(declare-fun res!1043498 () Bool)

(assert (=> b!1525142 (=> (not res!1043498) (not e!850149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101442 (_ BitVec 32)) Bool)

(assert (=> b!1525142 (= res!1043498 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51012 0))(
  ( (Unit!51013) )
))
(declare-fun lt!660566 () Unit!51012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51012)

(assert (=> b!1525142 (= lt!660566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525143 () Bool)

(declare-fun res!1043494 () Bool)

(assert (=> b!1525143 (=> (not res!1043494) (not e!850146))))

(assert (=> b!1525143 (= res!1043494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525144 () Bool)

(declare-fun res!1043506 () Bool)

(assert (=> b!1525144 (=> (not res!1043506) (not e!850146))))

(assert (=> b!1525144 (= res!1043506 (and (= (size!49499 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49499 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49499 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525145 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101442 (_ BitVec 32)) SeekEntryResult!13114)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101442 (_ BitVec 32)) SeekEntryResult!13114)

(assert (=> b!1525145 (= e!850147 (= (seekEntryOrOpen!0 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48949 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129966 res!1043501) b!1525144))

(assert (= (and b!1525144 res!1043506) b!1525136))

(assert (= (and b!1525136 res!1043497) b!1525137))

(assert (= (and b!1525137 res!1043496) b!1525143))

(assert (= (and b!1525143 res!1043494) b!1525135))

(assert (= (and b!1525135 res!1043503) b!1525139))

(assert (= (and b!1525139 res!1043502) b!1525141))

(assert (= (and b!1525141 res!1043495) b!1525138))

(assert (= (and b!1525138 res!1043500) b!1525140))

(assert (= (and b!1525140 res!1043505) b!1525142))

(assert (= (and b!1525142 res!1043498) b!1525134))

(assert (= (and b!1525134 res!1043499) b!1525133))

(assert (= (and b!1525133 (not res!1043504)) b!1525145))

(declare-fun m!1408023 () Bool)

(assert (=> b!1525143 m!1408023))

(declare-fun m!1408025 () Bool)

(assert (=> b!1525138 m!1408025))

(assert (=> b!1525138 m!1408025))

(declare-fun m!1408027 () Bool)

(assert (=> b!1525138 m!1408027))

(declare-fun m!1408029 () Bool)

(assert (=> b!1525136 m!1408029))

(assert (=> b!1525136 m!1408029))

(declare-fun m!1408031 () Bool)

(assert (=> b!1525136 m!1408031))

(declare-fun m!1408033 () Bool)

(assert (=> b!1525142 m!1408033))

(declare-fun m!1408035 () Bool)

(assert (=> b!1525142 m!1408035))

(assert (=> b!1525145 m!1408025))

(assert (=> b!1525145 m!1408025))

(declare-fun m!1408037 () Bool)

(assert (=> b!1525145 m!1408037))

(assert (=> b!1525145 m!1408025))

(declare-fun m!1408039 () Bool)

(assert (=> b!1525145 m!1408039))

(assert (=> b!1525133 m!1408025))

(declare-fun m!1408041 () Bool)

(assert (=> b!1525133 m!1408041))

(declare-fun m!1408043 () Bool)

(assert (=> b!1525133 m!1408043))

(declare-fun m!1408045 () Bool)

(assert (=> b!1525133 m!1408045))

(assert (=> b!1525141 m!1408025))

(assert (=> b!1525141 m!1408025))

(declare-fun m!1408047 () Bool)

(assert (=> b!1525141 m!1408047))

(assert (=> b!1525141 m!1408047))

(assert (=> b!1525141 m!1408025))

(declare-fun m!1408049 () Bool)

(assert (=> b!1525141 m!1408049))

(declare-fun m!1408051 () Bool)

(assert (=> b!1525135 m!1408051))

(assert (=> b!1525140 m!1408041))

(assert (=> b!1525140 m!1408043))

(assert (=> b!1525140 m!1408043))

(declare-fun m!1408053 () Bool)

(assert (=> b!1525140 m!1408053))

(assert (=> b!1525140 m!1408053))

(assert (=> b!1525140 m!1408043))

(declare-fun m!1408055 () Bool)

(assert (=> b!1525140 m!1408055))

(declare-fun m!1408057 () Bool)

(assert (=> start!129966 m!1408057))

(declare-fun m!1408059 () Bool)

(assert (=> start!129966 m!1408059))

(assert (=> b!1525134 m!1408025))

(assert (=> b!1525134 m!1408025))

(declare-fun m!1408061 () Bool)

(assert (=> b!1525134 m!1408061))

(assert (=> b!1525137 m!1408025))

(assert (=> b!1525137 m!1408025))

(declare-fun m!1408063 () Bool)

(assert (=> b!1525137 m!1408063))

(push 1)

