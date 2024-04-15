; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130194 () Bool)

(assert start!130194)

(declare-fun res!1046542 () Bool)

(declare-fun e!851931 () Bool)

(assert (=> start!130194 (=> (not res!1046542) (not e!851931))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130194 (= res!1046542 (validMask!0 mask!2512))))

(assert (=> start!130194 e!851931))

(assert (=> start!130194 true))

(declare-datatypes ((array!101542 0))(
  ( (array!101543 (arr!48997 (Array (_ BitVec 32) (_ BitVec 64))) (size!49549 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101542)

(declare-fun array_inv!38230 (array!101542) Bool)

(assert (=> start!130194 (array_inv!38230 a!2804)))

(declare-fun b!1528643 () Bool)

(declare-fun res!1046545 () Bool)

(assert (=> b!1528643 (=> (not res!1046545) (not e!851931))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528643 (= res!1046545 (and (= (size!49549 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49549 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49549 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528644 () Bool)

(declare-fun res!1046537 () Bool)

(assert (=> b!1528644 (=> (not res!1046537) (not e!851931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528644 (= res!1046537 (validKeyInArray!0 (select (arr!48997 a!2804) i!961)))))

(declare-fun b!1528645 () Bool)

(declare-fun res!1046538 () Bool)

(assert (=> b!1528645 (=> (not res!1046538) (not e!851931))))

(assert (=> b!1528645 (= res!1046538 (validKeyInArray!0 (select (arr!48997 a!2804) j!70)))))

(declare-fun b!1528646 () Bool)

(declare-fun e!851932 () Bool)

(assert (=> b!1528646 (= e!851931 e!851932)))

(declare-fun res!1046534 () Bool)

(assert (=> b!1528646 (=> (not res!1046534) (not e!851932))))

(declare-datatypes ((SeekEntryResult!13185 0))(
  ( (MissingZero!13185 (index!55135 (_ BitVec 32))) (Found!13185 (index!55136 (_ BitVec 32))) (Intermediate!13185 (undefined!13997 Bool) (index!55137 (_ BitVec 32)) (x!136827 (_ BitVec 32))) (Undefined!13185) (MissingVacant!13185 (index!55138 (_ BitVec 32))) )
))
(declare-fun lt!661989 () SeekEntryResult!13185)

(declare-fun lt!661986 () SeekEntryResult!13185)

(assert (=> b!1528646 (= res!1046534 (= lt!661989 lt!661986))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528646 (= lt!661986 (Intermediate!13185 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528646 (= lt!661989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48997 a!2804) j!70) mask!2512) (select (arr!48997 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528647 () Bool)

(declare-fun res!1046543 () Bool)

(assert (=> b!1528647 (=> (not res!1046543) (not e!851931))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528647 (= res!1046543 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49549 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49549 a!2804))))))

(declare-fun b!1528648 () Bool)

(declare-fun e!851934 () Bool)

(assert (=> b!1528648 (= e!851932 (not e!851934))))

(declare-fun res!1046536 () Bool)

(assert (=> b!1528648 (=> res!1046536 e!851934)))

(assert (=> b!1528648 (= res!1046536 (or (not (= (select (arr!48997 a!2804) j!70) (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!851933 () Bool)

(assert (=> b!1528648 e!851933))

(declare-fun res!1046541 () Bool)

(assert (=> b!1528648 (=> (not res!1046541) (not e!851933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101542 (_ BitVec 32)) Bool)

(assert (=> b!1528648 (= res!1046541 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50993 0))(
  ( (Unit!50994) )
))
(declare-fun lt!661988 () Unit!50993)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50993)

(assert (=> b!1528648 (= lt!661988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528649 () Bool)

(declare-fun res!1046544 () Bool)

(assert (=> b!1528649 (=> (not res!1046544) (not e!851932))))

(assert (=> b!1528649 (= res!1046544 (= lt!661989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101543 (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49549 a!2804)) mask!2512)))))

(declare-fun b!1528650 () Bool)

(declare-fun res!1046540 () Bool)

(assert (=> b!1528650 (=> (not res!1046540) (not e!851931))))

(assert (=> b!1528650 (= res!1046540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528651 () Bool)

(assert (=> b!1528651 (= e!851934 true)))

(declare-fun lt!661987 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528651 (= lt!661987 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528652 () Bool)

(declare-fun res!1046539 () Bool)

(assert (=> b!1528652 (=> (not res!1046539) (not e!851932))))

(assert (=> b!1528652 (= res!1046539 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) lt!661986))))

(declare-fun b!1528653 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13185)

(assert (=> b!1528653 (= e!851933 (= (seekEntry!0 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) (Found!13185 j!70)))))

(declare-fun b!1528654 () Bool)

(declare-fun res!1046535 () Bool)

(assert (=> b!1528654 (=> (not res!1046535) (not e!851931))))

(declare-datatypes ((List!35558 0))(
  ( (Nil!35555) (Cons!35554 (h!36991 (_ BitVec 64)) (t!50244 List!35558)) )
))
(declare-fun arrayNoDuplicates!0 (array!101542 (_ BitVec 32) List!35558) Bool)

(assert (=> b!1528654 (= res!1046535 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35555))))

(assert (= (and start!130194 res!1046542) b!1528643))

(assert (= (and b!1528643 res!1046545) b!1528644))

(assert (= (and b!1528644 res!1046537) b!1528645))

(assert (= (and b!1528645 res!1046538) b!1528650))

(assert (= (and b!1528650 res!1046540) b!1528654))

(assert (= (and b!1528654 res!1046535) b!1528647))

(assert (= (and b!1528647 res!1046543) b!1528646))

(assert (= (and b!1528646 res!1046534) b!1528652))

(assert (= (and b!1528652 res!1046539) b!1528649))

(assert (= (and b!1528649 res!1046544) b!1528648))

(assert (= (and b!1528648 res!1046541) b!1528653))

(assert (= (and b!1528648 (not res!1046536)) b!1528651))

(declare-fun m!1410983 () Bool)

(assert (=> b!1528651 m!1410983))

(declare-fun m!1410985 () Bool)

(assert (=> b!1528644 m!1410985))

(assert (=> b!1528644 m!1410985))

(declare-fun m!1410987 () Bool)

(assert (=> b!1528644 m!1410987))

(declare-fun m!1410989 () Bool)

(assert (=> start!130194 m!1410989))

(declare-fun m!1410991 () Bool)

(assert (=> start!130194 m!1410991))

(declare-fun m!1410993 () Bool)

(assert (=> b!1528653 m!1410993))

(assert (=> b!1528653 m!1410993))

(declare-fun m!1410995 () Bool)

(assert (=> b!1528653 m!1410995))

(assert (=> b!1528648 m!1410993))

(declare-fun m!1410997 () Bool)

(assert (=> b!1528648 m!1410997))

(declare-fun m!1410999 () Bool)

(assert (=> b!1528648 m!1410999))

(declare-fun m!1411001 () Bool)

(assert (=> b!1528648 m!1411001))

(declare-fun m!1411003 () Bool)

(assert (=> b!1528648 m!1411003))

(declare-fun m!1411005 () Bool)

(assert (=> b!1528654 m!1411005))

(assert (=> b!1528645 m!1410993))

(assert (=> b!1528645 m!1410993))

(declare-fun m!1411007 () Bool)

(assert (=> b!1528645 m!1411007))

(declare-fun m!1411009 () Bool)

(assert (=> b!1528650 m!1411009))

(assert (=> b!1528646 m!1410993))

(assert (=> b!1528646 m!1410993))

(declare-fun m!1411011 () Bool)

(assert (=> b!1528646 m!1411011))

(assert (=> b!1528646 m!1411011))

(assert (=> b!1528646 m!1410993))

(declare-fun m!1411013 () Bool)

(assert (=> b!1528646 m!1411013))

(assert (=> b!1528649 m!1410999))

(assert (=> b!1528649 m!1411001))

(assert (=> b!1528649 m!1411001))

(declare-fun m!1411015 () Bool)

(assert (=> b!1528649 m!1411015))

(assert (=> b!1528649 m!1411015))

(assert (=> b!1528649 m!1411001))

(declare-fun m!1411017 () Bool)

(assert (=> b!1528649 m!1411017))

(assert (=> b!1528652 m!1410993))

(assert (=> b!1528652 m!1410993))

(declare-fun m!1411019 () Bool)

(assert (=> b!1528652 m!1411019))

(check-sat (not b!1528653) (not b!1528648) (not b!1528650) (not start!130194) (not b!1528646) (not b!1528651) (not b!1528652) (not b!1528644) (not b!1528649) (not b!1528654) (not b!1528645))
(check-sat)
