; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129176 () Bool)

(assert start!129176)

(declare-fun res!1036972 () Bool)

(declare-fun e!846294 () Bool)

(assert (=> start!129176 (=> (not res!1036972) (not e!846294))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129176 (= res!1036972 (validMask!0 mask!2512))))

(assert (=> start!129176 e!846294))

(assert (=> start!129176 true))

(declare-datatypes ((array!101032 0))(
  ( (array!101033 (arr!48754 (Array (_ BitVec 32) (_ BitVec 64))) (size!49306 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101032)

(declare-fun array_inv!37987 (array!101032) Bool)

(assert (=> start!129176 (array_inv!37987 a!2804)))

(declare-fun b!1516861 () Bool)

(declare-fun e!846289 () Bool)

(declare-fun e!846290 () Bool)

(assert (=> b!1516861 (= e!846289 (not e!846290))))

(declare-fun res!1036981 () Bool)

(assert (=> b!1516861 (=> res!1036981 e!846290)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516861 (= res!1036981 (or (not (= (select (arr!48754 a!2804) j!70) (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846291 () Bool)

(assert (=> b!1516861 e!846291))

(declare-fun res!1036979 () Bool)

(assert (=> b!1516861 (=> (not res!1036979) (not e!846291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101032 (_ BitVec 32)) Bool)

(assert (=> b!1516861 (= res!1036979 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50603 0))(
  ( (Unit!50604) )
))
(declare-fun lt!657401 () Unit!50603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50603)

(assert (=> b!1516861 (= lt!657401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516862 () Bool)

(declare-fun e!846292 () Bool)

(assert (=> b!1516862 (= e!846290 e!846292)))

(declare-fun res!1036971 () Bool)

(assert (=> b!1516862 (=> res!1036971 e!846292)))

(declare-fun lt!657398 () (_ BitVec 32))

(assert (=> b!1516862 (= res!1036971 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657398 #b00000000000000000000000000000000) (bvsge lt!657398 (size!49306 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516862 (= lt!657398 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516863 () Bool)

(declare-fun res!1036977 () Bool)

(assert (=> b!1516863 (=> (not res!1036977) (not e!846294))))

(assert (=> b!1516863 (= res!1036977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516864 () Bool)

(declare-datatypes ((SeekEntryResult!12948 0))(
  ( (MissingZero!12948 (index!54187 (_ BitVec 32))) (Found!12948 (index!54188 (_ BitVec 32))) (Intermediate!12948 (undefined!13760 Bool) (index!54189 (_ BitVec 32)) (x!135876 (_ BitVec 32))) (Undefined!12948) (MissingVacant!12948 (index!54190 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12948)

(assert (=> b!1516864 (= e!846291 (= (seekEntry!0 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) (Found!12948 j!70)))))

(declare-fun b!1516865 () Bool)

(declare-fun res!1036980 () Bool)

(assert (=> b!1516865 (=> (not res!1036980) (not e!846294))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516865 (= res!1036980 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49306 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49306 a!2804))))))

(declare-fun b!1516866 () Bool)

(assert (=> b!1516866 (= e!846292 true)))

(declare-fun lt!657402 () SeekEntryResult!12948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12948)

(assert (=> b!1516866 (= lt!657402 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657398 (select (arr!48754 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516867 () Bool)

(declare-fun res!1036973 () Bool)

(assert (=> b!1516867 (=> (not res!1036973) (not e!846289))))

(declare-fun lt!657400 () SeekEntryResult!12948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516867 (= res!1036973 (= lt!657400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101033 (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49306 a!2804)) mask!2512)))))

(declare-fun b!1516868 () Bool)

(assert (=> b!1516868 (= e!846294 e!846289)))

(declare-fun res!1036975 () Bool)

(assert (=> b!1516868 (=> (not res!1036975) (not e!846289))))

(declare-fun lt!657399 () SeekEntryResult!12948)

(assert (=> b!1516868 (= res!1036975 (= lt!657400 lt!657399))))

(assert (=> b!1516868 (= lt!657399 (Intermediate!12948 false resIndex!21 resX!21))))

(assert (=> b!1516868 (= lt!657400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48754 a!2804) j!70) mask!2512) (select (arr!48754 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516869 () Bool)

(declare-fun res!1036976 () Bool)

(assert (=> b!1516869 (=> (not res!1036976) (not e!846294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516869 (= res!1036976 (validKeyInArray!0 (select (arr!48754 a!2804) j!70)))))

(declare-fun b!1516870 () Bool)

(declare-fun res!1036982 () Bool)

(assert (=> b!1516870 (=> (not res!1036982) (not e!846289))))

(assert (=> b!1516870 (= res!1036982 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) lt!657399))))

(declare-fun b!1516871 () Bool)

(declare-fun res!1036978 () Bool)

(assert (=> b!1516871 (=> (not res!1036978) (not e!846294))))

(declare-datatypes ((List!35315 0))(
  ( (Nil!35312) (Cons!35311 (h!36724 (_ BitVec 64)) (t!50001 List!35315)) )
))
(declare-fun arrayNoDuplicates!0 (array!101032 (_ BitVec 32) List!35315) Bool)

(assert (=> b!1516871 (= res!1036978 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35312))))

(declare-fun b!1516872 () Bool)

(declare-fun res!1036970 () Bool)

(assert (=> b!1516872 (=> (not res!1036970) (not e!846294))))

(assert (=> b!1516872 (= res!1036970 (validKeyInArray!0 (select (arr!48754 a!2804) i!961)))))

(declare-fun b!1516873 () Bool)

(declare-fun res!1036974 () Bool)

(assert (=> b!1516873 (=> (not res!1036974) (not e!846294))))

(assert (=> b!1516873 (= res!1036974 (and (= (size!49306 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49306 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49306 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129176 res!1036972) b!1516873))

(assert (= (and b!1516873 res!1036974) b!1516872))

(assert (= (and b!1516872 res!1036970) b!1516869))

(assert (= (and b!1516869 res!1036976) b!1516863))

(assert (= (and b!1516863 res!1036977) b!1516871))

(assert (= (and b!1516871 res!1036978) b!1516865))

(assert (= (and b!1516865 res!1036980) b!1516868))

(assert (= (and b!1516868 res!1036975) b!1516870))

(assert (= (and b!1516870 res!1036982) b!1516867))

(assert (= (and b!1516867 res!1036973) b!1516861))

(assert (= (and b!1516861 res!1036979) b!1516864))

(assert (= (and b!1516861 (not res!1036981)) b!1516862))

(assert (= (and b!1516862 (not res!1036971)) b!1516866))

(declare-fun m!1399577 () Bool)

(assert (=> b!1516869 m!1399577))

(assert (=> b!1516869 m!1399577))

(declare-fun m!1399579 () Bool)

(assert (=> b!1516869 m!1399579))

(assert (=> b!1516864 m!1399577))

(assert (=> b!1516864 m!1399577))

(declare-fun m!1399581 () Bool)

(assert (=> b!1516864 m!1399581))

(declare-fun m!1399583 () Bool)

(assert (=> b!1516871 m!1399583))

(assert (=> b!1516870 m!1399577))

(assert (=> b!1516870 m!1399577))

(declare-fun m!1399585 () Bool)

(assert (=> b!1516870 m!1399585))

(assert (=> b!1516861 m!1399577))

(declare-fun m!1399587 () Bool)

(assert (=> b!1516861 m!1399587))

(declare-fun m!1399589 () Bool)

(assert (=> b!1516861 m!1399589))

(declare-fun m!1399591 () Bool)

(assert (=> b!1516861 m!1399591))

(declare-fun m!1399593 () Bool)

(assert (=> b!1516861 m!1399593))

(declare-fun m!1399595 () Bool)

(assert (=> start!129176 m!1399595))

(declare-fun m!1399597 () Bool)

(assert (=> start!129176 m!1399597))

(declare-fun m!1399599 () Bool)

(assert (=> b!1516863 m!1399599))

(assert (=> b!1516867 m!1399589))

(assert (=> b!1516867 m!1399591))

(assert (=> b!1516867 m!1399591))

(declare-fun m!1399601 () Bool)

(assert (=> b!1516867 m!1399601))

(assert (=> b!1516867 m!1399601))

(assert (=> b!1516867 m!1399591))

(declare-fun m!1399603 () Bool)

(assert (=> b!1516867 m!1399603))

(assert (=> b!1516868 m!1399577))

(assert (=> b!1516868 m!1399577))

(declare-fun m!1399605 () Bool)

(assert (=> b!1516868 m!1399605))

(assert (=> b!1516868 m!1399605))

(assert (=> b!1516868 m!1399577))

(declare-fun m!1399607 () Bool)

(assert (=> b!1516868 m!1399607))

(declare-fun m!1399609 () Bool)

(assert (=> b!1516862 m!1399609))

(declare-fun m!1399611 () Bool)

(assert (=> b!1516872 m!1399611))

(assert (=> b!1516872 m!1399611))

(declare-fun m!1399613 () Bool)

(assert (=> b!1516872 m!1399613))

(assert (=> b!1516866 m!1399577))

(assert (=> b!1516866 m!1399577))

(declare-fun m!1399615 () Bool)

(assert (=> b!1516866 m!1399615))

(check-sat (not b!1516863) (not b!1516867) (not b!1516869) (not start!129176) (not b!1516870) (not b!1516864) (not b!1516862) (not b!1516872) (not b!1516861) (not b!1516868) (not b!1516866) (not b!1516871))
(check-sat)
