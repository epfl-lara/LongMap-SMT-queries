; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128840 () Bool)

(assert start!128840)

(declare-fun b!1509841 () Bool)

(declare-fun res!1029745 () Bool)

(declare-fun e!843238 () Bool)

(assert (=> b!1509841 (=> (not res!1029745) (not e!843238))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!100696 0))(
  ( (array!100697 (arr!48585 (Array (_ BitVec 32) (_ BitVec 64))) (size!49135 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100696)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1509841 (= res!1029745 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49135 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49135 a!2804))))))

(declare-fun b!1509842 () Bool)

(declare-fun e!843236 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12756 0))(
  ( (MissingZero!12756 (index!53419 (_ BitVec 32))) (Found!12756 (index!53420 (_ BitVec 32))) (Intermediate!12756 (undefined!13568 Bool) (index!53421 (_ BitVec 32)) (x!135170 (_ BitVec 32))) (Undefined!12756) (MissingVacant!12756 (index!53422 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100696 (_ BitVec 32)) SeekEntryResult!12756)

(assert (=> b!1509842 (= e!843236 (= (seekEntry!0 (select (arr!48585 a!2804) j!70) a!2804 mask!2512) (Found!12756 j!70)))))

(declare-fun b!1509843 () Bool)

(declare-fun res!1029752 () Bool)

(declare-fun e!843235 () Bool)

(assert (=> b!1509843 (=> (not res!1029752) (not e!843235))))

(declare-fun lt!655009 () SeekEntryResult!12756)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100696 (_ BitVec 32)) SeekEntryResult!12756)

(assert (=> b!1509843 (= res!1029752 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48585 a!2804) j!70) a!2804 mask!2512) lt!655009))))

(declare-fun b!1509844 () Bool)

(declare-fun res!1029750 () Bool)

(assert (=> b!1509844 (=> (not res!1029750) (not e!843238))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509844 (= res!1029750 (validKeyInArray!0 (select (arr!48585 a!2804) i!961)))))

(declare-fun res!1029753 () Bool)

(assert (=> start!128840 (=> (not res!1029753) (not e!843238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128840 (= res!1029753 (validMask!0 mask!2512))))

(assert (=> start!128840 e!843238))

(assert (=> start!128840 true))

(declare-fun array_inv!37613 (array!100696) Bool)

(assert (=> start!128840 (array_inv!37613 a!2804)))

(declare-fun b!1509845 () Bool)

(declare-fun res!1029744 () Bool)

(assert (=> b!1509845 (=> (not res!1029744) (not e!843238))))

(assert (=> b!1509845 (= res!1029744 (and (= (size!49135 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49135 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49135 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509846 () Bool)

(declare-fun res!1029754 () Bool)

(assert (=> b!1509846 (=> (not res!1029754) (not e!843238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100696 (_ BitVec 32)) Bool)

(assert (=> b!1509846 (= res!1029754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509847 () Bool)

(assert (=> b!1509847 (= e!843235 (not true))))

(assert (=> b!1509847 e!843236))

(declare-fun res!1029746 () Bool)

(assert (=> b!1509847 (=> (not res!1029746) (not e!843236))))

(assert (=> b!1509847 (= res!1029746 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50380 0))(
  ( (Unit!50381) )
))
(declare-fun lt!655007 () Unit!50380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50380)

(assert (=> b!1509847 (= lt!655007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509848 () Bool)

(declare-fun res!1029748 () Bool)

(assert (=> b!1509848 (=> (not res!1029748) (not e!843235))))

(declare-fun lt!655008 () SeekEntryResult!12756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509848 (= res!1029748 (= lt!655008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48585 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48585 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100697 (store (arr!48585 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49135 a!2804)) mask!2512)))))

(declare-fun b!1509849 () Bool)

(assert (=> b!1509849 (= e!843238 e!843235)))

(declare-fun res!1029747 () Bool)

(assert (=> b!1509849 (=> (not res!1029747) (not e!843235))))

(assert (=> b!1509849 (= res!1029747 (= lt!655008 lt!655009))))

(assert (=> b!1509849 (= lt!655009 (Intermediate!12756 false resIndex!21 resX!21))))

(assert (=> b!1509849 (= lt!655008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48585 a!2804) j!70) mask!2512) (select (arr!48585 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509850 () Bool)

(declare-fun res!1029751 () Bool)

(assert (=> b!1509850 (=> (not res!1029751) (not e!843238))))

(assert (=> b!1509850 (= res!1029751 (validKeyInArray!0 (select (arr!48585 a!2804) j!70)))))

(declare-fun b!1509851 () Bool)

(declare-fun res!1029749 () Bool)

(assert (=> b!1509851 (=> (not res!1029749) (not e!843238))))

(declare-datatypes ((List!35068 0))(
  ( (Nil!35065) (Cons!35064 (h!36476 (_ BitVec 64)) (t!49762 List!35068)) )
))
(declare-fun arrayNoDuplicates!0 (array!100696 (_ BitVec 32) List!35068) Bool)

(assert (=> b!1509851 (= res!1029749 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35065))))

(assert (= (and start!128840 res!1029753) b!1509845))

(assert (= (and b!1509845 res!1029744) b!1509844))

(assert (= (and b!1509844 res!1029750) b!1509850))

(assert (= (and b!1509850 res!1029751) b!1509846))

(assert (= (and b!1509846 res!1029754) b!1509851))

(assert (= (and b!1509851 res!1029749) b!1509841))

(assert (= (and b!1509841 res!1029745) b!1509849))

(assert (= (and b!1509849 res!1029747) b!1509843))

(assert (= (and b!1509843 res!1029752) b!1509848))

(assert (= (and b!1509848 res!1029748) b!1509847))

(assert (= (and b!1509847 res!1029746) b!1509842))

(declare-fun m!1392367 () Bool)

(assert (=> b!1509843 m!1392367))

(assert (=> b!1509843 m!1392367))

(declare-fun m!1392369 () Bool)

(assert (=> b!1509843 m!1392369))

(declare-fun m!1392371 () Bool)

(assert (=> start!128840 m!1392371))

(declare-fun m!1392373 () Bool)

(assert (=> start!128840 m!1392373))

(declare-fun m!1392375 () Bool)

(assert (=> b!1509851 m!1392375))

(assert (=> b!1509850 m!1392367))

(assert (=> b!1509850 m!1392367))

(declare-fun m!1392377 () Bool)

(assert (=> b!1509850 m!1392377))

(declare-fun m!1392379 () Bool)

(assert (=> b!1509846 m!1392379))

(declare-fun m!1392381 () Bool)

(assert (=> b!1509844 m!1392381))

(assert (=> b!1509844 m!1392381))

(declare-fun m!1392383 () Bool)

(assert (=> b!1509844 m!1392383))

(assert (=> b!1509849 m!1392367))

(assert (=> b!1509849 m!1392367))

(declare-fun m!1392385 () Bool)

(assert (=> b!1509849 m!1392385))

(assert (=> b!1509849 m!1392385))

(assert (=> b!1509849 m!1392367))

(declare-fun m!1392387 () Bool)

(assert (=> b!1509849 m!1392387))

(declare-fun m!1392389 () Bool)

(assert (=> b!1509848 m!1392389))

(declare-fun m!1392391 () Bool)

(assert (=> b!1509848 m!1392391))

(assert (=> b!1509848 m!1392391))

(declare-fun m!1392393 () Bool)

(assert (=> b!1509848 m!1392393))

(assert (=> b!1509848 m!1392393))

(assert (=> b!1509848 m!1392391))

(declare-fun m!1392395 () Bool)

(assert (=> b!1509848 m!1392395))

(declare-fun m!1392397 () Bool)

(assert (=> b!1509847 m!1392397))

(declare-fun m!1392399 () Bool)

(assert (=> b!1509847 m!1392399))

(assert (=> b!1509842 m!1392367))

(assert (=> b!1509842 m!1392367))

(declare-fun m!1392401 () Bool)

(assert (=> b!1509842 m!1392401))

(check-sat (not b!1509844) (not b!1509847) (not b!1509850) (not b!1509846) (not b!1509843) (not b!1509848) (not b!1509849) (not b!1509842) (not b!1509851) (not start!128840))
(check-sat)
