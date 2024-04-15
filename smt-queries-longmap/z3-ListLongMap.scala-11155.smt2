; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130242 () Bool)

(assert start!130242)

(declare-fun b!1529507 () Bool)

(declare-fun e!852291 () Bool)

(assert (=> b!1529507 (= e!852291 true)))

(declare-fun lt!662274 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529507 (= lt!662274 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529508 () Bool)

(declare-fun res!1047407 () Bool)

(declare-fun e!852294 () Bool)

(assert (=> b!1529508 (=> (not res!1047407) (not e!852294))))

(declare-datatypes ((array!101590 0))(
  ( (array!101591 (arr!49021 (Array (_ BitVec 32) (_ BitVec 64))) (size!49573 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101590)

(declare-datatypes ((List!35582 0))(
  ( (Nil!35579) (Cons!35578 (h!37015 (_ BitVec 64)) (t!50268 List!35582)) )
))
(declare-fun arrayNoDuplicates!0 (array!101590 (_ BitVec 32) List!35582) Bool)

(assert (=> b!1529508 (= res!1047407 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35579))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!852292 () Bool)

(declare-fun b!1529509 () Bool)

(declare-datatypes ((SeekEntryResult!13209 0))(
  ( (MissingZero!13209 (index!55231 (_ BitVec 32))) (Found!13209 (index!55232 (_ BitVec 32))) (Intermediate!13209 (undefined!14021 Bool) (index!55233 (_ BitVec 32)) (x!136915 (_ BitVec 32))) (Undefined!13209) (MissingVacant!13209 (index!55234 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13209)

(assert (=> b!1529509 (= e!852292 (= (seekEntry!0 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) (Found!13209 j!70)))))

(declare-fun b!1529511 () Bool)

(declare-fun res!1047409 () Bool)

(assert (=> b!1529511 (=> (not res!1047409) (not e!852294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101590 (_ BitVec 32)) Bool)

(assert (=> b!1529511 (= res!1047409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529512 () Bool)

(declare-fun e!852293 () Bool)

(assert (=> b!1529512 (= e!852293 (not e!852291))))

(declare-fun res!1047406 () Bool)

(assert (=> b!1529512 (=> res!1047406 e!852291)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529512 (= res!1047406 (or (not (= (select (arr!49021 a!2804) j!70) (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529512 e!852292))

(declare-fun res!1047400 () Bool)

(assert (=> b!1529512 (=> (not res!1047400) (not e!852292))))

(assert (=> b!1529512 (= res!1047400 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51041 0))(
  ( (Unit!51042) )
))
(declare-fun lt!662277 () Unit!51041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51041)

(assert (=> b!1529512 (= lt!662277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529513 () Bool)

(declare-fun res!1047398 () Bool)

(assert (=> b!1529513 (=> (not res!1047398) (not e!852294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529513 (= res!1047398 (validKeyInArray!0 (select (arr!49021 a!2804) j!70)))))

(declare-fun b!1529514 () Bool)

(declare-fun res!1047401 () Bool)

(assert (=> b!1529514 (=> (not res!1047401) (not e!852293))))

(declare-fun lt!662276 () SeekEntryResult!13209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529514 (= res!1047401 (= lt!662276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101591 (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49573 a!2804)) mask!2512)))))

(declare-fun b!1529515 () Bool)

(assert (=> b!1529515 (= e!852294 e!852293)))

(declare-fun res!1047403 () Bool)

(assert (=> b!1529515 (=> (not res!1047403) (not e!852293))))

(declare-fun lt!662275 () SeekEntryResult!13209)

(assert (=> b!1529515 (= res!1047403 (= lt!662276 lt!662275))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529515 (= lt!662275 (Intermediate!13209 false resIndex!21 resX!21))))

(assert (=> b!1529515 (= lt!662276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49021 a!2804) j!70) mask!2512) (select (arr!49021 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529516 () Bool)

(declare-fun res!1047399 () Bool)

(assert (=> b!1529516 (=> (not res!1047399) (not e!852294))))

(assert (=> b!1529516 (= res!1047399 (and (= (size!49573 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49573 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49573 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529510 () Bool)

(declare-fun res!1047404 () Bool)

(assert (=> b!1529510 (=> (not res!1047404) (not e!852294))))

(assert (=> b!1529510 (= res!1047404 (validKeyInArray!0 (select (arr!49021 a!2804) i!961)))))

(declare-fun res!1047408 () Bool)

(assert (=> start!130242 (=> (not res!1047408) (not e!852294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130242 (= res!1047408 (validMask!0 mask!2512))))

(assert (=> start!130242 e!852294))

(assert (=> start!130242 true))

(declare-fun array_inv!38254 (array!101590) Bool)

(assert (=> start!130242 (array_inv!38254 a!2804)))

(declare-fun b!1529517 () Bool)

(declare-fun res!1047405 () Bool)

(assert (=> b!1529517 (=> (not res!1047405) (not e!852293))))

(assert (=> b!1529517 (= res!1047405 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) lt!662275))))

(declare-fun b!1529518 () Bool)

(declare-fun res!1047402 () Bool)

(assert (=> b!1529518 (=> (not res!1047402) (not e!852294))))

(assert (=> b!1529518 (= res!1047402 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49573 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49573 a!2804))))))

(assert (= (and start!130242 res!1047408) b!1529516))

(assert (= (and b!1529516 res!1047399) b!1529510))

(assert (= (and b!1529510 res!1047404) b!1529513))

(assert (= (and b!1529513 res!1047398) b!1529511))

(assert (= (and b!1529511 res!1047409) b!1529508))

(assert (= (and b!1529508 res!1047407) b!1529518))

(assert (= (and b!1529518 res!1047402) b!1529515))

(assert (= (and b!1529515 res!1047403) b!1529517))

(assert (= (and b!1529517 res!1047405) b!1529514))

(assert (= (and b!1529514 res!1047401) b!1529512))

(assert (= (and b!1529512 res!1047400) b!1529509))

(assert (= (and b!1529512 (not res!1047406)) b!1529507))

(declare-fun m!1411895 () Bool)

(assert (=> b!1529509 m!1411895))

(assert (=> b!1529509 m!1411895))

(declare-fun m!1411897 () Bool)

(assert (=> b!1529509 m!1411897))

(declare-fun m!1411899 () Bool)

(assert (=> b!1529508 m!1411899))

(assert (=> b!1529512 m!1411895))

(declare-fun m!1411901 () Bool)

(assert (=> b!1529512 m!1411901))

(declare-fun m!1411903 () Bool)

(assert (=> b!1529512 m!1411903))

(declare-fun m!1411905 () Bool)

(assert (=> b!1529512 m!1411905))

(declare-fun m!1411907 () Bool)

(assert (=> b!1529512 m!1411907))

(declare-fun m!1411909 () Bool)

(assert (=> b!1529511 m!1411909))

(declare-fun m!1411911 () Bool)

(assert (=> b!1529510 m!1411911))

(assert (=> b!1529510 m!1411911))

(declare-fun m!1411913 () Bool)

(assert (=> b!1529510 m!1411913))

(assert (=> b!1529517 m!1411895))

(assert (=> b!1529517 m!1411895))

(declare-fun m!1411915 () Bool)

(assert (=> b!1529517 m!1411915))

(assert (=> b!1529514 m!1411903))

(assert (=> b!1529514 m!1411905))

(assert (=> b!1529514 m!1411905))

(declare-fun m!1411917 () Bool)

(assert (=> b!1529514 m!1411917))

(assert (=> b!1529514 m!1411917))

(assert (=> b!1529514 m!1411905))

(declare-fun m!1411919 () Bool)

(assert (=> b!1529514 m!1411919))

(declare-fun m!1411921 () Bool)

(assert (=> b!1529507 m!1411921))

(assert (=> b!1529515 m!1411895))

(assert (=> b!1529515 m!1411895))

(declare-fun m!1411923 () Bool)

(assert (=> b!1529515 m!1411923))

(assert (=> b!1529515 m!1411923))

(assert (=> b!1529515 m!1411895))

(declare-fun m!1411925 () Bool)

(assert (=> b!1529515 m!1411925))

(assert (=> b!1529513 m!1411895))

(assert (=> b!1529513 m!1411895))

(declare-fun m!1411927 () Bool)

(assert (=> b!1529513 m!1411927))

(declare-fun m!1411929 () Bool)

(assert (=> start!130242 m!1411929))

(declare-fun m!1411931 () Bool)

(assert (=> start!130242 m!1411931))

(check-sat (not b!1529508) (not b!1529511) (not b!1529507) (not b!1529509) (not b!1529513) (not b!1529517) (not b!1529514) (not start!130242) (not b!1529510) (not b!1529512) (not b!1529515))
(check-sat)
