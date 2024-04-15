; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129212 () Bool)

(assert start!129212)

(declare-fun b!1517563 () Bool)

(declare-fun e!846615 () Bool)

(assert (=> b!1517563 (= e!846615 true)))

(declare-datatypes ((SeekEntryResult!12966 0))(
  ( (MissingZero!12966 (index!54259 (_ BitVec 32))) (Found!12966 (index!54260 (_ BitVec 32))) (Intermediate!12966 (undefined!13778 Bool) (index!54261 (_ BitVec 32)) (x!135942 (_ BitVec 32))) (Undefined!12966) (MissingVacant!12966 (index!54262 (_ BitVec 32))) )
))
(declare-fun lt!657668 () SeekEntryResult!12966)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101068 0))(
  ( (array!101069 (arr!48772 (Array (_ BitVec 32) (_ BitVec 64))) (size!49324 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101068)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657672 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12966)

(assert (=> b!1517563 (= lt!657668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657672 (select (arr!48772 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517564 () Bool)

(declare-fun res!1037681 () Bool)

(declare-fun e!846613 () Bool)

(assert (=> b!1517564 (=> (not res!1037681) (not e!846613))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517564 (= res!1037681 (and (= (size!49324 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49324 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49324 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517565 () Bool)

(declare-fun e!846617 () Bool)

(assert (=> b!1517565 (= e!846613 e!846617)))

(declare-fun res!1037677 () Bool)

(assert (=> b!1517565 (=> (not res!1037677) (not e!846617))))

(declare-fun lt!657671 () SeekEntryResult!12966)

(declare-fun lt!657669 () SeekEntryResult!12966)

(assert (=> b!1517565 (= res!1037677 (= lt!657671 lt!657669))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517565 (= lt!657669 (Intermediate!12966 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517565 (= lt!657671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48772 a!2804) j!70) mask!2512) (select (arr!48772 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517566 () Bool)

(declare-fun res!1037679 () Bool)

(assert (=> b!1517566 (=> (not res!1037679) (not e!846613))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1517566 (= res!1037679 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49324 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49324 a!2804))))))

(declare-fun b!1517567 () Bool)

(declare-fun e!846616 () Bool)

(assert (=> b!1517567 (= e!846617 (not e!846616))))

(declare-fun res!1037678 () Bool)

(assert (=> b!1517567 (=> res!1037678 e!846616)))

(assert (=> b!1517567 (= res!1037678 (or (not (= (select (arr!48772 a!2804) j!70) (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846618 () Bool)

(assert (=> b!1517567 e!846618))

(declare-fun res!1037672 () Bool)

(assert (=> b!1517567 (=> (not res!1037672) (not e!846618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101068 (_ BitVec 32)) Bool)

(assert (=> b!1517567 (= res!1037672 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50639 0))(
  ( (Unit!50640) )
))
(declare-fun lt!657670 () Unit!50639)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50639)

(assert (=> b!1517567 (= lt!657670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1037674 () Bool)

(assert (=> start!129212 (=> (not res!1037674) (not e!846613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129212 (= res!1037674 (validMask!0 mask!2512))))

(assert (=> start!129212 e!846613))

(assert (=> start!129212 true))

(declare-fun array_inv!38005 (array!101068) Bool)

(assert (=> start!129212 (array_inv!38005 a!2804)))

(declare-fun b!1517568 () Bool)

(declare-fun res!1037673 () Bool)

(assert (=> b!1517568 (=> (not res!1037673) (not e!846617))))

(assert (=> b!1517568 (= res!1037673 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) lt!657669))))

(declare-fun b!1517569 () Bool)

(declare-fun res!1037676 () Bool)

(assert (=> b!1517569 (=> (not res!1037676) (not e!846613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517569 (= res!1037676 (validKeyInArray!0 (select (arr!48772 a!2804) j!70)))))

(declare-fun b!1517570 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12966)

(assert (=> b!1517570 (= e!846618 (= (seekEntry!0 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) (Found!12966 j!70)))))

(declare-fun b!1517571 () Bool)

(declare-fun res!1037684 () Bool)

(assert (=> b!1517571 (=> (not res!1037684) (not e!846613))))

(assert (=> b!1517571 (= res!1037684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517572 () Bool)

(declare-fun res!1037680 () Bool)

(assert (=> b!1517572 (=> (not res!1037680) (not e!846613))))

(declare-datatypes ((List!35333 0))(
  ( (Nil!35330) (Cons!35329 (h!36742 (_ BitVec 64)) (t!50019 List!35333)) )
))
(declare-fun arrayNoDuplicates!0 (array!101068 (_ BitVec 32) List!35333) Bool)

(assert (=> b!1517572 (= res!1037680 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35330))))

(declare-fun b!1517573 () Bool)

(declare-fun res!1037683 () Bool)

(assert (=> b!1517573 (=> (not res!1037683) (not e!846613))))

(assert (=> b!1517573 (= res!1037683 (validKeyInArray!0 (select (arr!48772 a!2804) i!961)))))

(declare-fun b!1517574 () Bool)

(declare-fun res!1037682 () Bool)

(assert (=> b!1517574 (=> (not res!1037682) (not e!846617))))

(assert (=> b!1517574 (= res!1037682 (= lt!657671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101069 (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49324 a!2804)) mask!2512)))))

(declare-fun b!1517575 () Bool)

(assert (=> b!1517575 (= e!846616 e!846615)))

(declare-fun res!1037675 () Bool)

(assert (=> b!1517575 (=> res!1037675 e!846615)))

(assert (=> b!1517575 (= res!1037675 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657672 #b00000000000000000000000000000000) (bvsge lt!657672 (size!49324 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517575 (= lt!657672 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!129212 res!1037674) b!1517564))

(assert (= (and b!1517564 res!1037681) b!1517573))

(assert (= (and b!1517573 res!1037683) b!1517569))

(assert (= (and b!1517569 res!1037676) b!1517571))

(assert (= (and b!1517571 res!1037684) b!1517572))

(assert (= (and b!1517572 res!1037680) b!1517566))

(assert (= (and b!1517566 res!1037679) b!1517565))

(assert (= (and b!1517565 res!1037677) b!1517568))

(assert (= (and b!1517568 res!1037673) b!1517574))

(assert (= (and b!1517574 res!1037682) b!1517567))

(assert (= (and b!1517567 res!1037672) b!1517570))

(assert (= (and b!1517567 (not res!1037678)) b!1517575))

(assert (= (and b!1517575 (not res!1037675)) b!1517563))

(declare-fun m!1400297 () Bool)

(assert (=> b!1517568 m!1400297))

(assert (=> b!1517568 m!1400297))

(declare-fun m!1400299 () Bool)

(assert (=> b!1517568 m!1400299))

(assert (=> b!1517569 m!1400297))

(assert (=> b!1517569 m!1400297))

(declare-fun m!1400301 () Bool)

(assert (=> b!1517569 m!1400301))

(declare-fun m!1400303 () Bool)

(assert (=> b!1517572 m!1400303))

(assert (=> b!1517570 m!1400297))

(assert (=> b!1517570 m!1400297))

(declare-fun m!1400305 () Bool)

(assert (=> b!1517570 m!1400305))

(assert (=> b!1517565 m!1400297))

(assert (=> b!1517565 m!1400297))

(declare-fun m!1400307 () Bool)

(assert (=> b!1517565 m!1400307))

(assert (=> b!1517565 m!1400307))

(assert (=> b!1517565 m!1400297))

(declare-fun m!1400309 () Bool)

(assert (=> b!1517565 m!1400309))

(declare-fun m!1400311 () Bool)

(assert (=> b!1517575 m!1400311))

(declare-fun m!1400313 () Bool)

(assert (=> start!129212 m!1400313))

(declare-fun m!1400315 () Bool)

(assert (=> start!129212 m!1400315))

(declare-fun m!1400317 () Bool)

(assert (=> b!1517574 m!1400317))

(declare-fun m!1400319 () Bool)

(assert (=> b!1517574 m!1400319))

(assert (=> b!1517574 m!1400319))

(declare-fun m!1400321 () Bool)

(assert (=> b!1517574 m!1400321))

(assert (=> b!1517574 m!1400321))

(assert (=> b!1517574 m!1400319))

(declare-fun m!1400323 () Bool)

(assert (=> b!1517574 m!1400323))

(declare-fun m!1400325 () Bool)

(assert (=> b!1517571 m!1400325))

(assert (=> b!1517567 m!1400297))

(declare-fun m!1400327 () Bool)

(assert (=> b!1517567 m!1400327))

(assert (=> b!1517567 m!1400317))

(assert (=> b!1517567 m!1400319))

(declare-fun m!1400329 () Bool)

(assert (=> b!1517567 m!1400329))

(declare-fun m!1400331 () Bool)

(assert (=> b!1517573 m!1400331))

(assert (=> b!1517573 m!1400331))

(declare-fun m!1400333 () Bool)

(assert (=> b!1517573 m!1400333))

(assert (=> b!1517563 m!1400297))

(assert (=> b!1517563 m!1400297))

(declare-fun m!1400335 () Bool)

(assert (=> b!1517563 m!1400335))

(check-sat (not b!1517571) (not b!1517568) (not b!1517567) (not b!1517569) (not b!1517563) (not b!1517565) (not b!1517574) (not b!1517570) (not start!129212) (not b!1517573) (not b!1517572) (not b!1517575))
(check-sat)
