; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129638 () Bool)

(assert start!129638)

(declare-fun b!1520368 () Bool)

(declare-fun e!848302 () Bool)

(declare-fun e!848301 () Bool)

(assert (=> b!1520368 (= e!848302 e!848301)))

(declare-fun res!1038919 () Bool)

(assert (=> b!1520368 (=> res!1038919 e!848301)))

(declare-datatypes ((array!101257 0))(
  ( (array!101258 (arr!48859 (Array (_ BitVec 32) (_ BitVec 64))) (size!49410 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101257)

(declare-fun lt!658896 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520368 (= res!1038919 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658896 #b00000000000000000000000000000000) (bvsge lt!658896 (size!49410 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520368 (= lt!658896 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520369 () Bool)

(declare-fun e!848300 () Bool)

(assert (=> b!1520369 (= e!848300 (not e!848302))))

(declare-fun res!1038916 () Bool)

(assert (=> b!1520369 (=> res!1038916 e!848302)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520369 (= res!1038916 (or (not (= (select (arr!48859 a!2804) j!70) (select (store (arr!48859 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!848303 () Bool)

(assert (=> b!1520369 e!848303))

(declare-fun res!1038915 () Bool)

(assert (=> b!1520369 (=> (not res!1038915) (not e!848303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101257 (_ BitVec 32)) Bool)

(assert (=> b!1520369 (= res!1038915 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50749 0))(
  ( (Unit!50750) )
))
(declare-fun lt!658899 () Unit!50749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50749)

(assert (=> b!1520369 (= lt!658899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520370 () Bool)

(declare-fun e!848304 () Bool)

(assert (=> b!1520370 (= e!848304 e!848300)))

(declare-fun res!1038913 () Bool)

(assert (=> b!1520370 (=> (not res!1038913) (not e!848300))))

(declare-datatypes ((SeekEntryResult!12923 0))(
  ( (MissingZero!12923 (index!54087 (_ BitVec 32))) (Found!12923 (index!54088 (_ BitVec 32))) (Intermediate!12923 (undefined!13735 Bool) (index!54089 (_ BitVec 32)) (x!135972 (_ BitVec 32))) (Undefined!12923) (MissingVacant!12923 (index!54090 (_ BitVec 32))) )
))
(declare-fun lt!658898 () SeekEntryResult!12923)

(declare-fun lt!658897 () SeekEntryResult!12923)

(assert (=> b!1520370 (= res!1038913 (= lt!658898 lt!658897))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520370 (= lt!658897 (Intermediate!12923 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101257 (_ BitVec 32)) SeekEntryResult!12923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520370 (= lt!658898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48859 a!2804) j!70) mask!2512) (select (arr!48859 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520371 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101257 (_ BitVec 32)) SeekEntryResult!12923)

(assert (=> b!1520371 (= e!848303 (= (seekEntry!0 (select (arr!48859 a!2804) j!70) a!2804 mask!2512) (Found!12923 j!70)))))

(declare-fun b!1520372 () Bool)

(declare-fun res!1038918 () Bool)

(assert (=> b!1520372 (=> (not res!1038918) (not e!848304))))

(assert (=> b!1520372 (= res!1038918 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49410 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49410 a!2804))))))

(declare-fun b!1520373 () Bool)

(declare-fun res!1038922 () Bool)

(assert (=> b!1520373 (=> (not res!1038922) (not e!848304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520373 (= res!1038922 (validKeyInArray!0 (select (arr!48859 a!2804) i!961)))))

(declare-fun b!1520374 () Bool)

(declare-fun res!1038911 () Bool)

(assert (=> b!1520374 (=> (not res!1038911) (not e!848300))))

(assert (=> b!1520374 (= res!1038911 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48859 a!2804) j!70) a!2804 mask!2512) lt!658897))))

(declare-fun b!1520375 () Bool)

(declare-fun res!1038923 () Bool)

(assert (=> b!1520375 (=> (not res!1038923) (not e!848304))))

(assert (=> b!1520375 (= res!1038923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520377 () Bool)

(declare-fun res!1038921 () Bool)

(assert (=> b!1520377 (=> (not res!1038921) (not e!848300))))

(assert (=> b!1520377 (= res!1038921 (= lt!658898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48859 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48859 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101258 (store (arr!48859 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49410 a!2804)) mask!2512)))))

(declare-fun b!1520378 () Bool)

(declare-fun res!1038920 () Bool)

(assert (=> b!1520378 (=> (not res!1038920) (not e!848304))))

(assert (=> b!1520378 (= res!1038920 (and (= (size!49410 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49410 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49410 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520379 () Bool)

(declare-fun res!1038914 () Bool)

(assert (=> b!1520379 (=> (not res!1038914) (not e!848304))))

(declare-datatypes ((List!35329 0))(
  ( (Nil!35326) (Cons!35325 (h!36755 (_ BitVec 64)) (t!50015 List!35329)) )
))
(declare-fun arrayNoDuplicates!0 (array!101257 (_ BitVec 32) List!35329) Bool)

(assert (=> b!1520379 (= res!1038914 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35326))))

(declare-fun b!1520380 () Bool)

(assert (=> b!1520380 (= e!848301 true)))

(declare-fun lt!658900 () SeekEntryResult!12923)

(assert (=> b!1520380 (= lt!658900 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658896 (select (arr!48859 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520376 () Bool)

(declare-fun res!1038917 () Bool)

(assert (=> b!1520376 (=> (not res!1038917) (not e!848304))))

(assert (=> b!1520376 (= res!1038917 (validKeyInArray!0 (select (arr!48859 a!2804) j!70)))))

(declare-fun res!1038912 () Bool)

(assert (=> start!129638 (=> (not res!1038912) (not e!848304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129638 (= res!1038912 (validMask!0 mask!2512))))

(assert (=> start!129638 e!848304))

(assert (=> start!129638 true))

(declare-fun array_inv!38140 (array!101257) Bool)

(assert (=> start!129638 (array_inv!38140 a!2804)))

(assert (= (and start!129638 res!1038912) b!1520378))

(assert (= (and b!1520378 res!1038920) b!1520373))

(assert (= (and b!1520373 res!1038922) b!1520376))

(assert (= (and b!1520376 res!1038917) b!1520375))

(assert (= (and b!1520375 res!1038923) b!1520379))

(assert (= (and b!1520379 res!1038914) b!1520372))

(assert (= (and b!1520372 res!1038918) b!1520370))

(assert (= (and b!1520370 res!1038913) b!1520374))

(assert (= (and b!1520374 res!1038911) b!1520377))

(assert (= (and b!1520377 res!1038921) b!1520369))

(assert (= (and b!1520369 res!1038915) b!1520371))

(assert (= (and b!1520369 (not res!1038916)) b!1520368))

(assert (= (and b!1520368 (not res!1038919)) b!1520380))

(declare-fun m!1403529 () Bool)

(assert (=> b!1520370 m!1403529))

(assert (=> b!1520370 m!1403529))

(declare-fun m!1403531 () Bool)

(assert (=> b!1520370 m!1403531))

(assert (=> b!1520370 m!1403531))

(assert (=> b!1520370 m!1403529))

(declare-fun m!1403533 () Bool)

(assert (=> b!1520370 m!1403533))

(declare-fun m!1403535 () Bool)

(assert (=> b!1520373 m!1403535))

(assert (=> b!1520373 m!1403535))

(declare-fun m!1403537 () Bool)

(assert (=> b!1520373 m!1403537))

(assert (=> b!1520371 m!1403529))

(assert (=> b!1520371 m!1403529))

(declare-fun m!1403539 () Bool)

(assert (=> b!1520371 m!1403539))

(declare-fun m!1403541 () Bool)

(assert (=> b!1520377 m!1403541))

(declare-fun m!1403543 () Bool)

(assert (=> b!1520377 m!1403543))

(assert (=> b!1520377 m!1403543))

(declare-fun m!1403545 () Bool)

(assert (=> b!1520377 m!1403545))

(assert (=> b!1520377 m!1403545))

(assert (=> b!1520377 m!1403543))

(declare-fun m!1403547 () Bool)

(assert (=> b!1520377 m!1403547))

(assert (=> b!1520369 m!1403529))

(declare-fun m!1403549 () Bool)

(assert (=> b!1520369 m!1403549))

(assert (=> b!1520369 m!1403541))

(assert (=> b!1520369 m!1403543))

(declare-fun m!1403551 () Bool)

(assert (=> b!1520369 m!1403551))

(declare-fun m!1403553 () Bool)

(assert (=> b!1520375 m!1403553))

(assert (=> b!1520374 m!1403529))

(assert (=> b!1520374 m!1403529))

(declare-fun m!1403555 () Bool)

(assert (=> b!1520374 m!1403555))

(assert (=> b!1520376 m!1403529))

(assert (=> b!1520376 m!1403529))

(declare-fun m!1403557 () Bool)

(assert (=> b!1520376 m!1403557))

(declare-fun m!1403559 () Bool)

(assert (=> start!129638 m!1403559))

(declare-fun m!1403561 () Bool)

(assert (=> start!129638 m!1403561))

(declare-fun m!1403563 () Bool)

(assert (=> b!1520368 m!1403563))

(declare-fun m!1403565 () Bool)

(assert (=> b!1520379 m!1403565))

(assert (=> b!1520380 m!1403529))

(assert (=> b!1520380 m!1403529))

(declare-fun m!1403567 () Bool)

(assert (=> b!1520380 m!1403567))

(check-sat (not b!1520379) (not b!1520377) (not b!1520373) (not b!1520368) (not b!1520370) (not b!1520375) (not b!1520369) (not b!1520374) (not b!1520380) (not start!129638) (not b!1520376) (not b!1520371))
(check-sat)
