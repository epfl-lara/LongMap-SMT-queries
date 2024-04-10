; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130288 () Bool)

(assert start!130288)

(declare-fun b!1529748 () Bool)

(declare-fun res!1047465 () Bool)

(declare-fun e!852459 () Bool)

(assert (=> b!1529748 (=> (not res!1047465) (not e!852459))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101638 0))(
  ( (array!101639 (arr!49044 (Array (_ BitVec 32) (_ BitVec 64))) (size!49594 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101638)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529748 (= res!1047465 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49594 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49594 a!2804))))))

(declare-fun b!1529749 () Bool)

(declare-fun res!1047455 () Bool)

(assert (=> b!1529749 (=> (not res!1047455) (not e!852459))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529749 (= res!1047455 (validKeyInArray!0 (select (arr!49044 a!2804) j!70)))))

(declare-fun b!1529750 () Bool)

(declare-fun e!852463 () Bool)

(assert (=> b!1529750 (= e!852459 e!852463)))

(declare-fun res!1047461 () Bool)

(assert (=> b!1529750 (=> (not res!1047461) (not e!852463))))

(declare-datatypes ((SeekEntryResult!13209 0))(
  ( (MissingZero!13209 (index!55231 (_ BitVec 32))) (Found!13209 (index!55232 (_ BitVec 32))) (Intermediate!13209 (undefined!14021 Bool) (index!55233 (_ BitVec 32)) (x!136912 (_ BitVec 32))) (Undefined!13209) (MissingVacant!13209 (index!55234 (_ BitVec 32))) )
))
(declare-fun lt!662538 () SeekEntryResult!13209)

(declare-fun lt!662539 () SeekEntryResult!13209)

(assert (=> b!1529750 (= res!1047461 (= lt!662538 lt!662539))))

(assert (=> b!1529750 (= lt!662539 (Intermediate!13209 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529750 (= lt!662538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49044 a!2804) j!70) mask!2512) (select (arr!49044 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529751 () Bool)

(declare-fun res!1047462 () Bool)

(assert (=> b!1529751 (=> (not res!1047462) (not e!852459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101638 (_ BitVec 32)) Bool)

(assert (=> b!1529751 (= res!1047462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529752 () Bool)

(declare-fun e!852462 () Bool)

(assert (=> b!1529752 (= e!852463 (not e!852462))))

(declare-fun res!1047459 () Bool)

(assert (=> b!1529752 (=> res!1047459 e!852462)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529752 (= res!1047459 (or (not (= (select (arr!49044 a!2804) j!70) (select (store (arr!49044 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852460 () Bool)

(assert (=> b!1529752 e!852460))

(declare-fun res!1047463 () Bool)

(assert (=> b!1529752 (=> (not res!1047463) (not e!852460))))

(assert (=> b!1529752 (= res!1047463 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51202 0))(
  ( (Unit!51203) )
))
(declare-fun lt!662537 () Unit!51202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51202)

(assert (=> b!1529752 (= lt!662537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529753 () Bool)

(declare-fun res!1047464 () Bool)

(assert (=> b!1529753 (=> (not res!1047464) (not e!852463))))

(assert (=> b!1529753 (= res!1047464 (= lt!662538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49044 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49044 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101639 (store (arr!49044 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49594 a!2804)) mask!2512)))))

(declare-fun b!1529754 () Bool)

(declare-fun res!1047458 () Bool)

(assert (=> b!1529754 (=> (not res!1047458) (not e!852459))))

(declare-datatypes ((List!35527 0))(
  ( (Nil!35524) (Cons!35523 (h!36959 (_ BitVec 64)) (t!50221 List!35527)) )
))
(declare-fun arrayNoDuplicates!0 (array!101638 (_ BitVec 32) List!35527) Bool)

(assert (=> b!1529754 (= res!1047458 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35524))))

(declare-fun b!1529755 () Bool)

(declare-fun res!1047466 () Bool)

(assert (=> b!1529755 (=> (not res!1047466) (not e!852459))))

(assert (=> b!1529755 (= res!1047466 (and (= (size!49594 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49594 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49594 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1047457 () Bool)

(assert (=> start!130288 (=> (not res!1047457) (not e!852459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130288 (= res!1047457 (validMask!0 mask!2512))))

(assert (=> start!130288 e!852459))

(assert (=> start!130288 true))

(declare-fun array_inv!38072 (array!101638) Bool)

(assert (=> start!130288 (array_inv!38072 a!2804)))

(declare-fun b!1529756 () Bool)

(declare-fun res!1047456 () Bool)

(assert (=> b!1529756 (=> (not res!1047456) (not e!852463))))

(assert (=> b!1529756 (= res!1047456 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49044 a!2804) j!70) a!2804 mask!2512) lt!662539))))

(declare-fun b!1529757 () Bool)

(assert (=> b!1529757 (= e!852462 true)))

(declare-fun lt!662536 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529757 (= lt!662536 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529758 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13209)

(assert (=> b!1529758 (= e!852460 (= (seekEntry!0 (select (arr!49044 a!2804) j!70) a!2804 mask!2512) (Found!13209 j!70)))))

(declare-fun b!1529759 () Bool)

(declare-fun res!1047460 () Bool)

(assert (=> b!1529759 (=> (not res!1047460) (not e!852459))))

(assert (=> b!1529759 (= res!1047460 (validKeyInArray!0 (select (arr!49044 a!2804) i!961)))))

(assert (= (and start!130288 res!1047457) b!1529755))

(assert (= (and b!1529755 res!1047466) b!1529759))

(assert (= (and b!1529759 res!1047460) b!1529749))

(assert (= (and b!1529749 res!1047455) b!1529751))

(assert (= (and b!1529751 res!1047462) b!1529754))

(assert (= (and b!1529754 res!1047458) b!1529748))

(assert (= (and b!1529748 res!1047465) b!1529750))

(assert (= (and b!1529750 res!1047461) b!1529756))

(assert (= (and b!1529756 res!1047456) b!1529753))

(assert (= (and b!1529753 res!1047464) b!1529752))

(assert (= (and b!1529752 res!1047463) b!1529758))

(assert (= (and b!1529752 (not res!1047459)) b!1529757))

(declare-fun m!1412711 () Bool)

(assert (=> b!1529758 m!1412711))

(assert (=> b!1529758 m!1412711))

(declare-fun m!1412713 () Bool)

(assert (=> b!1529758 m!1412713))

(declare-fun m!1412715 () Bool)

(assert (=> b!1529759 m!1412715))

(assert (=> b!1529759 m!1412715))

(declare-fun m!1412717 () Bool)

(assert (=> b!1529759 m!1412717))

(assert (=> b!1529752 m!1412711))

(declare-fun m!1412719 () Bool)

(assert (=> b!1529752 m!1412719))

(declare-fun m!1412721 () Bool)

(assert (=> b!1529752 m!1412721))

(declare-fun m!1412723 () Bool)

(assert (=> b!1529752 m!1412723))

(declare-fun m!1412725 () Bool)

(assert (=> b!1529752 m!1412725))

(assert (=> b!1529753 m!1412721))

(assert (=> b!1529753 m!1412723))

(assert (=> b!1529753 m!1412723))

(declare-fun m!1412727 () Bool)

(assert (=> b!1529753 m!1412727))

(assert (=> b!1529753 m!1412727))

(assert (=> b!1529753 m!1412723))

(declare-fun m!1412729 () Bool)

(assert (=> b!1529753 m!1412729))

(declare-fun m!1412731 () Bool)

(assert (=> b!1529754 m!1412731))

(declare-fun m!1412733 () Bool)

(assert (=> b!1529751 m!1412733))

(declare-fun m!1412735 () Bool)

(assert (=> start!130288 m!1412735))

(declare-fun m!1412737 () Bool)

(assert (=> start!130288 m!1412737))

(assert (=> b!1529749 m!1412711))

(assert (=> b!1529749 m!1412711))

(declare-fun m!1412739 () Bool)

(assert (=> b!1529749 m!1412739))

(assert (=> b!1529756 m!1412711))

(assert (=> b!1529756 m!1412711))

(declare-fun m!1412741 () Bool)

(assert (=> b!1529756 m!1412741))

(assert (=> b!1529750 m!1412711))

(assert (=> b!1529750 m!1412711))

(declare-fun m!1412743 () Bool)

(assert (=> b!1529750 m!1412743))

(assert (=> b!1529750 m!1412743))

(assert (=> b!1529750 m!1412711))

(declare-fun m!1412745 () Bool)

(assert (=> b!1529750 m!1412745))

(declare-fun m!1412747 () Bool)

(assert (=> b!1529757 m!1412747))

(check-sat (not b!1529756) (not b!1529750) (not b!1529757) (not b!1529759) (not b!1529758) (not start!130288) (not b!1529754) (not b!1529749) (not b!1529752) (not b!1529753) (not b!1529751))
(check-sat)
