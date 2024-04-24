; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130500 () Bool)

(assert start!130500)

(declare-fun b!1529656 () Bool)

(declare-fun e!852716 () Bool)

(declare-fun e!852717 () Bool)

(assert (=> b!1529656 (= e!852716 e!852717)))

(declare-fun res!1046205 () Bool)

(assert (=> b!1529656 (=> (not res!1046205) (not e!852717))))

(declare-fun lt!662280 () (_ BitVec 64))

(declare-datatypes ((array!101650 0))(
  ( (array!101651 (arr!49045 (Array (_ BitVec 32) (_ BitVec 64))) (size!49596 (_ BitVec 32))) )
))
(declare-fun lt!662281 () array!101650)

(declare-datatypes ((SeekEntryResult!13103 0))(
  ( (MissingZero!13103 (index!54807 (_ BitVec 32))) (Found!13103 (index!54808 (_ BitVec 32))) (Intermediate!13103 (undefined!13915 Bool) (index!54809 (_ BitVec 32)) (x!136708 (_ BitVec 32))) (Undefined!13103) (MissingVacant!13103 (index!54810 (_ BitVec 32))) )
))
(declare-fun lt!662279 () SeekEntryResult!13103)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529656 (= res!1046205 (= lt!662279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662280 mask!2512) lt!662280 lt!662281 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101650)

(assert (=> b!1529656 (= lt!662280 (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529656 (= lt!662281 (array!101651 (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49596 a!2804)))))

(declare-fun res!1046209 () Bool)

(declare-fun e!852713 () Bool)

(assert (=> start!130500 (=> (not res!1046209) (not e!852713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130500 (= res!1046209 (validMask!0 mask!2512))))

(assert (=> start!130500 e!852713))

(assert (=> start!130500 true))

(declare-fun array_inv!38326 (array!101650) Bool)

(assert (=> start!130500 (array_inv!38326 a!2804)))

(declare-fun b!1529657 () Bool)

(declare-fun res!1046211 () Bool)

(assert (=> b!1529657 (=> (not res!1046211) (not e!852713))))

(declare-datatypes ((List!35515 0))(
  ( (Nil!35512) (Cons!35511 (h!36962 (_ BitVec 64)) (t!50201 List!35515)) )
))
(declare-fun arrayNoDuplicates!0 (array!101650 (_ BitVec 32) List!35515) Bool)

(assert (=> b!1529657 (= res!1046211 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35512))))

(declare-fun b!1529658 () Bool)

(declare-fun res!1046212 () Bool)

(assert (=> b!1529658 (=> (not res!1046212) (not e!852713))))

(assert (=> b!1529658 (= res!1046212 (and (= (size!49596 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49596 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49596 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529659 () Bool)

(declare-fun res!1046207 () Bool)

(assert (=> b!1529659 (=> (not res!1046207) (not e!852713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101650 (_ BitVec 32)) Bool)

(assert (=> b!1529659 (= res!1046207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529660 () Bool)

(declare-fun e!852715 () Bool)

(declare-fun e!852714 () Bool)

(assert (=> b!1529660 (= e!852715 e!852714)))

(declare-fun res!1046204 () Bool)

(assert (=> b!1529660 (=> (not res!1046204) (not e!852714))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13103)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13103)

(assert (=> b!1529660 (= res!1046204 (= (seekEntryOrOpen!0 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49045 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529661 () Bool)

(declare-fun res!1046213 () Bool)

(assert (=> b!1529661 (=> (not res!1046213) (not e!852713))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529661 (= res!1046213 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49596 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49596 a!2804))))))

(declare-fun b!1529662 () Bool)

(assert (=> b!1529662 (= e!852713 e!852716)))

(declare-fun res!1046215 () Bool)

(assert (=> b!1529662 (=> (not res!1046215) (not e!852716))))

(declare-fun lt!662283 () SeekEntryResult!13103)

(assert (=> b!1529662 (= res!1046215 (= lt!662279 lt!662283))))

(assert (=> b!1529662 (= lt!662283 (Intermediate!13103 false resIndex!21 resX!21))))

(assert (=> b!1529662 (= lt!662279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49045 a!2804) j!70) mask!2512) (select (arr!49045 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529663 () Bool)

(declare-fun res!1046208 () Bool)

(assert (=> b!1529663 (=> (not res!1046208) (not e!852713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529663 (= res!1046208 (validKeyInArray!0 (select (arr!49045 a!2804) j!70)))))

(declare-fun b!1529664 () Bool)

(declare-fun res!1046206 () Bool)

(assert (=> b!1529664 (=> (not res!1046206) (not e!852713))))

(assert (=> b!1529664 (= res!1046206 (validKeyInArray!0 (select (arr!49045 a!2804) i!961)))))

(declare-fun b!1529665 () Bool)

(declare-fun e!852712 () Bool)

(assert (=> b!1529665 (= e!852712 e!852715)))

(declare-fun res!1046210 () Bool)

(assert (=> b!1529665 (=> res!1046210 e!852715)))

(assert (=> b!1529665 (= res!1046210 (or (not (= (select (arr!49045 a!2804) j!70) lt!662280)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49045 a!2804) index!487) (select (arr!49045 a!2804) j!70)) (not (= (select (arr!49045 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529666 () Bool)

(declare-fun res!1046214 () Bool)

(assert (=> b!1529666 (=> (not res!1046214) (not e!852712))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13103)

(assert (=> b!1529666 (= res!1046214 (= (seekEntry!0 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) (Found!13103 j!70)))))

(declare-fun b!1529667 () Bool)

(assert (=> b!1529667 (= e!852717 (not true))))

(assert (=> b!1529667 e!852712))

(declare-fun res!1046216 () Bool)

(assert (=> b!1529667 (=> (not res!1046216) (not e!852712))))

(assert (=> b!1529667 (= res!1046216 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51025 0))(
  ( (Unit!51026) )
))
(declare-fun lt!662282 () Unit!51025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51025)

(assert (=> b!1529667 (= lt!662282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529668 () Bool)

(declare-fun res!1046217 () Bool)

(assert (=> b!1529668 (=> (not res!1046217) (not e!852716))))

(assert (=> b!1529668 (= res!1046217 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) lt!662283))))

(declare-fun b!1529669 () Bool)

(assert (=> b!1529669 (= e!852714 (= (seekEntryOrOpen!0 lt!662280 lt!662281 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662280 lt!662281 mask!2512)))))

(assert (= (and start!130500 res!1046209) b!1529658))

(assert (= (and b!1529658 res!1046212) b!1529664))

(assert (= (and b!1529664 res!1046206) b!1529663))

(assert (= (and b!1529663 res!1046208) b!1529659))

(assert (= (and b!1529659 res!1046207) b!1529657))

(assert (= (and b!1529657 res!1046211) b!1529661))

(assert (= (and b!1529661 res!1046213) b!1529662))

(assert (= (and b!1529662 res!1046215) b!1529668))

(assert (= (and b!1529668 res!1046217) b!1529656))

(assert (= (and b!1529656 res!1046205) b!1529667))

(assert (= (and b!1529667 res!1046216) b!1529666))

(assert (= (and b!1529666 res!1046214) b!1529665))

(assert (= (and b!1529665 (not res!1046210)) b!1529660))

(assert (= (and b!1529660 res!1046204) b!1529669))

(declare-fun m!1412395 () Bool)

(assert (=> b!1529668 m!1412395))

(assert (=> b!1529668 m!1412395))

(declare-fun m!1412397 () Bool)

(assert (=> b!1529668 m!1412397))

(assert (=> b!1529663 m!1412395))

(assert (=> b!1529663 m!1412395))

(declare-fun m!1412399 () Bool)

(assert (=> b!1529663 m!1412399))

(declare-fun m!1412401 () Bool)

(assert (=> b!1529669 m!1412401))

(declare-fun m!1412403 () Bool)

(assert (=> b!1529669 m!1412403))

(assert (=> b!1529665 m!1412395))

(declare-fun m!1412405 () Bool)

(assert (=> b!1529665 m!1412405))

(declare-fun m!1412407 () Bool)

(assert (=> start!130500 m!1412407))

(declare-fun m!1412409 () Bool)

(assert (=> start!130500 m!1412409))

(assert (=> b!1529660 m!1412395))

(assert (=> b!1529660 m!1412395))

(declare-fun m!1412411 () Bool)

(assert (=> b!1529660 m!1412411))

(assert (=> b!1529660 m!1412395))

(declare-fun m!1412413 () Bool)

(assert (=> b!1529660 m!1412413))

(assert (=> b!1529662 m!1412395))

(assert (=> b!1529662 m!1412395))

(declare-fun m!1412415 () Bool)

(assert (=> b!1529662 m!1412415))

(assert (=> b!1529662 m!1412415))

(assert (=> b!1529662 m!1412395))

(declare-fun m!1412417 () Bool)

(assert (=> b!1529662 m!1412417))

(declare-fun m!1412419 () Bool)

(assert (=> b!1529657 m!1412419))

(declare-fun m!1412421 () Bool)

(assert (=> b!1529659 m!1412421))

(declare-fun m!1412423 () Bool)

(assert (=> b!1529664 m!1412423))

(assert (=> b!1529664 m!1412423))

(declare-fun m!1412425 () Bool)

(assert (=> b!1529664 m!1412425))

(declare-fun m!1412427 () Bool)

(assert (=> b!1529667 m!1412427))

(declare-fun m!1412429 () Bool)

(assert (=> b!1529667 m!1412429))

(declare-fun m!1412431 () Bool)

(assert (=> b!1529656 m!1412431))

(assert (=> b!1529656 m!1412431))

(declare-fun m!1412433 () Bool)

(assert (=> b!1529656 m!1412433))

(declare-fun m!1412435 () Bool)

(assert (=> b!1529656 m!1412435))

(declare-fun m!1412437 () Bool)

(assert (=> b!1529656 m!1412437))

(assert (=> b!1529666 m!1412395))

(assert (=> b!1529666 m!1412395))

(declare-fun m!1412439 () Bool)

(assert (=> b!1529666 m!1412439))

(check-sat (not b!1529659) (not b!1529656) (not b!1529666) (not start!130500) (not b!1529668) (not b!1529667) (not b!1529657) (not b!1529660) (not b!1529662) (not b!1529669) (not b!1529664) (not b!1529663))
(check-sat)
