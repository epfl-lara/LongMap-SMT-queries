; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130902 () Bool)

(assert start!130902)

(declare-fun b!1533871 () Bool)

(declare-fun e!854828 () Bool)

(declare-fun e!854827 () Bool)

(assert (=> b!1533871 (= e!854828 e!854827)))

(declare-fun res!1049537 () Bool)

(assert (=> b!1533871 (=> (not res!1049537) (not e!854827))))

(declare-datatypes ((SeekEntryResult!13181 0))(
  ( (MissingZero!13181 (index!55119 (_ BitVec 32))) (Found!13181 (index!55120 (_ BitVec 32))) (Intermediate!13181 (undefined!13993 Bool) (index!55121 (_ BitVec 32)) (x!137030 (_ BitVec 32))) (Undefined!13181) (MissingVacant!13181 (index!55122 (_ BitVec 32))) )
))
(declare-fun lt!664170 () SeekEntryResult!13181)

(declare-fun lt!664173 () SeekEntryResult!13181)

(assert (=> b!1533871 (= res!1049537 (= lt!664170 lt!664173))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1533871 (= lt!664173 (Intermediate!13181 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101818 0))(
  ( (array!101819 (arr!49123 (Array (_ BitVec 32) (_ BitVec 64))) (size!49674 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101818)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101818 (_ BitVec 32)) SeekEntryResult!13181)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533871 (= lt!664170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49123 a!2804) j!70) mask!2512) (select (arr!49123 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533872 () Bool)

(declare-fun res!1049536 () Bool)

(assert (=> b!1533872 (=> (not res!1049536) (not e!854828))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1533872 (= res!1049536 (and (= (size!49674 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49674 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49674 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1533873 () Bool)

(declare-fun res!1049530 () Bool)

(assert (=> b!1533873 (=> (not res!1049530) (not e!854828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533873 (= res!1049530 (validKeyInArray!0 (select (arr!49123 a!2804) i!961)))))

(declare-fun b!1533874 () Bool)

(declare-fun res!1049529 () Bool)

(assert (=> b!1533874 (=> (not res!1049529) (not e!854828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101818 (_ BitVec 32)) Bool)

(assert (=> b!1533874 (= res!1049529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1533875 () Bool)

(declare-fun res!1049532 () Bool)

(declare-fun e!854825 () Bool)

(assert (=> b!1533875 (=> res!1049532 e!854825)))

(declare-fun lt!664172 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1533875 (= res!1049532 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664172 (select (arr!49123 a!2804) j!70) a!2804 mask!2512) lt!664173)))))

(declare-fun b!1533876 () Bool)

(declare-fun res!1049535 () Bool)

(assert (=> b!1533876 (=> (not res!1049535) (not e!854827))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1533876 (= res!1049535 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49123 a!2804) j!70) a!2804 mask!2512) lt!664173))))

(declare-fun b!1533877 () Bool)

(declare-fun res!1049531 () Bool)

(assert (=> b!1533877 (=> (not res!1049531) (not e!854828))))

(assert (=> b!1533877 (= res!1049531 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49674 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49674 a!2804))))))

(declare-fun b!1533878 () Bool)

(declare-fun res!1049528 () Bool)

(assert (=> b!1533878 (=> (not res!1049528) (not e!854827))))

(assert (=> b!1533878 (= res!1049528 (= lt!664170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49123 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49123 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101819 (store (arr!49123 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49674 a!2804)) mask!2512)))))

(declare-fun b!1533879 () Bool)

(declare-fun e!854830 () Bool)

(assert (=> b!1533879 (= e!854827 (not e!854830))))

(declare-fun res!1049526 () Bool)

(assert (=> b!1533879 (=> res!1049526 e!854830)))

(assert (=> b!1533879 (= res!1049526 (or (not (= (select (arr!49123 a!2804) j!70) (select (store (arr!49123 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!854826 () Bool)

(assert (=> b!1533879 e!854826))

(declare-fun res!1049527 () Bool)

(assert (=> b!1533879 (=> (not res!1049527) (not e!854826))))

(assert (=> b!1533879 (= res!1049527 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51181 0))(
  ( (Unit!51182) )
))
(declare-fun lt!664171 () Unit!51181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51181)

(assert (=> b!1533879 (= lt!664171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1049533 () Bool)

(assert (=> start!130902 (=> (not res!1049533) (not e!854828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130902 (= res!1049533 (validMask!0 mask!2512))))

(assert (=> start!130902 e!854828))

(assert (=> start!130902 true))

(declare-fun array_inv!38404 (array!101818) Bool)

(assert (=> start!130902 (array_inv!38404 a!2804)))

(declare-fun b!1533880 () Bool)

(declare-fun res!1049534 () Bool)

(assert (=> b!1533880 (=> (not res!1049534) (not e!854828))))

(assert (=> b!1533880 (= res!1049534 (validKeyInArray!0 (select (arr!49123 a!2804) j!70)))))

(declare-fun b!1533881 () Bool)

(declare-fun res!1049525 () Bool)

(assert (=> b!1533881 (=> (not res!1049525) (not e!854828))))

(declare-datatypes ((List!35593 0))(
  ( (Nil!35590) (Cons!35589 (h!37052 (_ BitVec 64)) (t!50279 List!35593)) )
))
(declare-fun arrayNoDuplicates!0 (array!101818 (_ BitVec 32) List!35593) Bool)

(assert (=> b!1533881 (= res!1049525 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35590))))

(declare-fun b!1533882 () Bool)

(assert (=> b!1533882 (= e!854830 e!854825)))

(declare-fun res!1049538 () Bool)

(assert (=> b!1533882 (=> res!1049538 e!854825)))

(assert (=> b!1533882 (= res!1049538 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664172 #b00000000000000000000000000000000) (bvsge lt!664172 (size!49674 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533882 (= lt!664172 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1533883 () Bool)

(assert (=> b!1533883 (= e!854825 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!534)) (bvsub #b01111111111111111111111111111110 x!534)))))

(declare-fun b!1533884 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101818 (_ BitVec 32)) SeekEntryResult!13181)

(assert (=> b!1533884 (= e!854826 (= (seekEntry!0 (select (arr!49123 a!2804) j!70) a!2804 mask!2512) (Found!13181 j!70)))))

(assert (= (and start!130902 res!1049533) b!1533872))

(assert (= (and b!1533872 res!1049536) b!1533873))

(assert (= (and b!1533873 res!1049530) b!1533880))

(assert (= (and b!1533880 res!1049534) b!1533874))

(assert (= (and b!1533874 res!1049529) b!1533881))

(assert (= (and b!1533881 res!1049525) b!1533877))

(assert (= (and b!1533877 res!1049531) b!1533871))

(assert (= (and b!1533871 res!1049537) b!1533876))

(assert (= (and b!1533876 res!1049535) b!1533878))

(assert (= (and b!1533878 res!1049528) b!1533879))

(assert (= (and b!1533879 res!1049527) b!1533884))

(assert (= (and b!1533879 (not res!1049526)) b!1533882))

(assert (= (and b!1533882 (not res!1049538)) b!1533875))

(assert (= (and b!1533875 (not res!1049532)) b!1533883))

(declare-fun m!1416397 () Bool)

(assert (=> b!1533871 m!1416397))

(assert (=> b!1533871 m!1416397))

(declare-fun m!1416399 () Bool)

(assert (=> b!1533871 m!1416399))

(assert (=> b!1533871 m!1416399))

(assert (=> b!1533871 m!1416397))

(declare-fun m!1416401 () Bool)

(assert (=> b!1533871 m!1416401))

(assert (=> b!1533876 m!1416397))

(assert (=> b!1533876 m!1416397))

(declare-fun m!1416403 () Bool)

(assert (=> b!1533876 m!1416403))

(declare-fun m!1416405 () Bool)

(assert (=> b!1533882 m!1416405))

(assert (=> b!1533879 m!1416397))

(declare-fun m!1416407 () Bool)

(assert (=> b!1533879 m!1416407))

(declare-fun m!1416409 () Bool)

(assert (=> b!1533879 m!1416409))

(declare-fun m!1416411 () Bool)

(assert (=> b!1533879 m!1416411))

(declare-fun m!1416413 () Bool)

(assert (=> b!1533879 m!1416413))

(assert (=> b!1533875 m!1416397))

(assert (=> b!1533875 m!1416397))

(declare-fun m!1416415 () Bool)

(assert (=> b!1533875 m!1416415))

(declare-fun m!1416417 () Bool)

(assert (=> start!130902 m!1416417))

(declare-fun m!1416419 () Bool)

(assert (=> start!130902 m!1416419))

(declare-fun m!1416421 () Bool)

(assert (=> b!1533874 m!1416421))

(assert (=> b!1533878 m!1416409))

(assert (=> b!1533878 m!1416411))

(assert (=> b!1533878 m!1416411))

(declare-fun m!1416423 () Bool)

(assert (=> b!1533878 m!1416423))

(assert (=> b!1533878 m!1416423))

(assert (=> b!1533878 m!1416411))

(declare-fun m!1416425 () Bool)

(assert (=> b!1533878 m!1416425))

(assert (=> b!1533880 m!1416397))

(assert (=> b!1533880 m!1416397))

(declare-fun m!1416427 () Bool)

(assert (=> b!1533880 m!1416427))

(assert (=> b!1533884 m!1416397))

(assert (=> b!1533884 m!1416397))

(declare-fun m!1416429 () Bool)

(assert (=> b!1533884 m!1416429))

(declare-fun m!1416431 () Bool)

(assert (=> b!1533881 m!1416431))

(declare-fun m!1416433 () Bool)

(assert (=> b!1533873 m!1416433))

(assert (=> b!1533873 m!1416433))

(declare-fun m!1416435 () Bool)

(assert (=> b!1533873 m!1416435))

(check-sat (not b!1533874) (not b!1533876) (not b!1533875) (not b!1533871) (not b!1533882) (not b!1533879) (not b!1533880) (not b!1533884) (not start!130902) (not b!1533873) (not b!1533878) (not b!1533881))
(check-sat)
