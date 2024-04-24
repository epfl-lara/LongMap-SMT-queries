; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129206 () Bool)

(assert start!129206)

(declare-fun res!1031471 () Bool)

(declare-fun e!844766 () Bool)

(assert (=> start!129206 (=> (not res!1031471) (not e!844766))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129206 (= res!1031471 (validMask!0 mask!2512))))

(assert (=> start!129206 e!844766))

(assert (=> start!129206 true))

(declare-datatypes ((array!100876 0))(
  ( (array!100877 (arr!48670 (Array (_ BitVec 32) (_ BitVec 64))) (size!49221 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100876)

(declare-fun array_inv!37951 (array!100876) Bool)

(assert (=> start!129206 (array_inv!37951 a!2804)))

(declare-fun b!1512738 () Bool)

(declare-fun res!1031473 () Bool)

(assert (=> b!1512738 (=> (not res!1031473) (not e!844766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100876 (_ BitVec 32)) Bool)

(assert (=> b!1512738 (= res!1031473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512739 () Bool)

(declare-fun e!844764 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12734 0))(
  ( (MissingZero!12734 (index!53331 (_ BitVec 32))) (Found!12734 (index!53332 (_ BitVec 32))) (Intermediate!12734 (undefined!13546 Bool) (index!53333 (_ BitVec 32)) (x!135273 (_ BitVec 32))) (Undefined!12734) (MissingVacant!12734 (index!53334 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12734)

(assert (=> b!1512739 (= e!844764 (= (seekEntry!0 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) (Found!12734 j!70)))))

(declare-fun b!1512740 () Bool)

(declare-fun res!1031467 () Bool)

(declare-fun e!844767 () Bool)

(assert (=> b!1512740 (=> (not res!1031467) (not e!844767))))

(declare-fun lt!655959 () SeekEntryResult!12734)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512740 (= res!1031467 (= lt!655959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100877 (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49221 a!2804)) mask!2512)))))

(declare-fun b!1512741 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512741 (= e!844767 (not (or (not (= (select (arr!48670 a!2804) j!70) (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48670 a!2804) index!487) (select (arr!48670 a!2804) j!70)) (not (= (select (arr!48670 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1512741 e!844764))

(declare-fun res!1031469 () Bool)

(assert (=> b!1512741 (=> (not res!1031469) (not e!844764))))

(assert (=> b!1512741 (= res!1031469 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50371 0))(
  ( (Unit!50372) )
))
(declare-fun lt!655958 () Unit!50371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50371)

(assert (=> b!1512741 (= lt!655958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512742 () Bool)

(assert (=> b!1512742 (= e!844766 e!844767)))

(declare-fun res!1031465 () Bool)

(assert (=> b!1512742 (=> (not res!1031465) (not e!844767))))

(declare-fun lt!655960 () SeekEntryResult!12734)

(assert (=> b!1512742 (= res!1031465 (= lt!655959 lt!655960))))

(assert (=> b!1512742 (= lt!655960 (Intermediate!12734 false resIndex!21 resX!21))))

(assert (=> b!1512742 (= lt!655959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48670 a!2804) j!70) mask!2512) (select (arr!48670 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512743 () Bool)

(declare-fun res!1031472 () Bool)

(assert (=> b!1512743 (=> (not res!1031472) (not e!844766))))

(declare-datatypes ((List!35140 0))(
  ( (Nil!35137) (Cons!35136 (h!36563 (_ BitVec 64)) (t!49826 List!35140)) )
))
(declare-fun arrayNoDuplicates!0 (array!100876 (_ BitVec 32) List!35140) Bool)

(assert (=> b!1512743 (= res!1031472 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35137))))

(declare-fun b!1512744 () Bool)

(declare-fun res!1031464 () Bool)

(assert (=> b!1512744 (=> (not res!1031464) (not e!844766))))

(assert (=> b!1512744 (= res!1031464 (and (= (size!49221 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49221 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49221 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512745 () Bool)

(declare-fun res!1031474 () Bool)

(assert (=> b!1512745 (=> (not res!1031474) (not e!844766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512745 (= res!1031474 (validKeyInArray!0 (select (arr!48670 a!2804) j!70)))))

(declare-fun b!1512746 () Bool)

(declare-fun res!1031468 () Bool)

(assert (=> b!1512746 (=> (not res!1031468) (not e!844766))))

(assert (=> b!1512746 (= res!1031468 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49221 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49221 a!2804))))))

(declare-fun b!1512747 () Bool)

(declare-fun res!1031470 () Bool)

(assert (=> b!1512747 (=> (not res!1031470) (not e!844767))))

(assert (=> b!1512747 (= res!1031470 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) lt!655960))))

(declare-fun b!1512748 () Bool)

(declare-fun res!1031466 () Bool)

(assert (=> b!1512748 (=> (not res!1031466) (not e!844766))))

(assert (=> b!1512748 (= res!1031466 (validKeyInArray!0 (select (arr!48670 a!2804) i!961)))))

(assert (= (and start!129206 res!1031471) b!1512744))

(assert (= (and b!1512744 res!1031464) b!1512748))

(assert (= (and b!1512748 res!1031466) b!1512745))

(assert (= (and b!1512745 res!1031474) b!1512738))

(assert (= (and b!1512738 res!1031473) b!1512743))

(assert (= (and b!1512743 res!1031472) b!1512746))

(assert (= (and b!1512746 res!1031468) b!1512742))

(assert (= (and b!1512742 res!1031465) b!1512747))

(assert (= (and b!1512747 res!1031470) b!1512740))

(assert (= (and b!1512740 res!1031467) b!1512741))

(assert (= (and b!1512741 res!1031469) b!1512739))

(declare-fun m!1395339 () Bool)

(assert (=> start!129206 m!1395339))

(declare-fun m!1395341 () Bool)

(assert (=> start!129206 m!1395341))

(declare-fun m!1395343 () Bool)

(assert (=> b!1512742 m!1395343))

(assert (=> b!1512742 m!1395343))

(declare-fun m!1395345 () Bool)

(assert (=> b!1512742 m!1395345))

(assert (=> b!1512742 m!1395345))

(assert (=> b!1512742 m!1395343))

(declare-fun m!1395347 () Bool)

(assert (=> b!1512742 m!1395347))

(assert (=> b!1512745 m!1395343))

(assert (=> b!1512745 m!1395343))

(declare-fun m!1395349 () Bool)

(assert (=> b!1512745 m!1395349))

(assert (=> b!1512739 m!1395343))

(assert (=> b!1512739 m!1395343))

(declare-fun m!1395351 () Bool)

(assert (=> b!1512739 m!1395351))

(assert (=> b!1512747 m!1395343))

(assert (=> b!1512747 m!1395343))

(declare-fun m!1395353 () Bool)

(assert (=> b!1512747 m!1395353))

(declare-fun m!1395355 () Bool)

(assert (=> b!1512743 m!1395355))

(assert (=> b!1512741 m!1395343))

(declare-fun m!1395357 () Bool)

(assert (=> b!1512741 m!1395357))

(declare-fun m!1395359 () Bool)

(assert (=> b!1512741 m!1395359))

(declare-fun m!1395361 () Bool)

(assert (=> b!1512741 m!1395361))

(declare-fun m!1395363 () Bool)

(assert (=> b!1512741 m!1395363))

(declare-fun m!1395365 () Bool)

(assert (=> b!1512741 m!1395365))

(declare-fun m!1395367 () Bool)

(assert (=> b!1512738 m!1395367))

(declare-fun m!1395369 () Bool)

(assert (=> b!1512748 m!1395369))

(assert (=> b!1512748 m!1395369))

(declare-fun m!1395371 () Bool)

(assert (=> b!1512748 m!1395371))

(assert (=> b!1512740 m!1395359))

(assert (=> b!1512740 m!1395363))

(assert (=> b!1512740 m!1395363))

(declare-fun m!1395373 () Bool)

(assert (=> b!1512740 m!1395373))

(assert (=> b!1512740 m!1395373))

(assert (=> b!1512740 m!1395363))

(declare-fun m!1395375 () Bool)

(assert (=> b!1512740 m!1395375))

(check-sat (not b!1512742) (not b!1512748) (not start!129206) (not b!1512738) (not b!1512739) (not b!1512743) (not b!1512741) (not b!1512745) (not b!1512747) (not b!1512740))
(check-sat)
