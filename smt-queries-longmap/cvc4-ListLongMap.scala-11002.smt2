; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128848 () Bool)

(assert start!128848)

(declare-fun b!1509973 () Bool)

(declare-fun res!1029884 () Bool)

(declare-fun e!843285 () Bool)

(assert (=> b!1509973 (=> (not res!1029884) (not e!843285))))

(declare-datatypes ((array!100704 0))(
  ( (array!100705 (arr!48589 (Array (_ BitVec 32) (_ BitVec 64))) (size!49139 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100704)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509973 (= res!1029884 (validKeyInArray!0 (select (arr!48589 a!2804) i!961)))))

(declare-fun b!1509974 () Bool)

(declare-fun res!1029878 () Bool)

(assert (=> b!1509974 (=> (not res!1029878) (not e!843285))))

(declare-datatypes ((List!35072 0))(
  ( (Nil!35069) (Cons!35068 (h!36480 (_ BitVec 64)) (t!49766 List!35072)) )
))
(declare-fun arrayNoDuplicates!0 (array!100704 (_ BitVec 32) List!35072) Bool)

(assert (=> b!1509974 (= res!1029878 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35069))))

(declare-fun b!1509975 () Bool)

(declare-fun res!1029882 () Bool)

(assert (=> b!1509975 (=> (not res!1029882) (not e!843285))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509975 (= res!1029882 (validKeyInArray!0 (select (arr!48589 a!2804) j!70)))))

(declare-fun b!1509976 () Bool)

(declare-fun res!1029886 () Bool)

(assert (=> b!1509976 (=> (not res!1029886) (not e!843285))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1509976 (= res!1029886 (and (= (size!49139 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49139 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49139 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029880 () Bool)

(assert (=> start!128848 (=> (not res!1029880) (not e!843285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128848 (= res!1029880 (validMask!0 mask!2512))))

(assert (=> start!128848 e!843285))

(assert (=> start!128848 true))

(declare-fun array_inv!37617 (array!100704) Bool)

(assert (=> start!128848 (array_inv!37617 a!2804)))

(declare-fun b!1509977 () Bool)

(declare-fun res!1029879 () Bool)

(assert (=> b!1509977 (=> (not res!1029879) (not e!843285))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509977 (= res!1029879 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49139 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49139 a!2804))))))

(declare-fun e!843284 () Bool)

(declare-fun b!1509978 () Bool)

(declare-datatypes ((SeekEntryResult!12760 0))(
  ( (MissingZero!12760 (index!53435 (_ BitVec 32))) (Found!12760 (index!53436 (_ BitVec 32))) (Intermediate!12760 (undefined!13572 Bool) (index!53437 (_ BitVec 32)) (x!135182 (_ BitVec 32))) (Undefined!12760) (MissingVacant!12760 (index!53438 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100704 (_ BitVec 32)) SeekEntryResult!12760)

(assert (=> b!1509978 (= e!843284 (= (seekEntry!0 (select (arr!48589 a!2804) j!70) a!2804 mask!2512) (Found!12760 j!70)))))

(declare-fun b!1509979 () Bool)

(declare-fun res!1029883 () Bool)

(declare-fun e!843286 () Bool)

(assert (=> b!1509979 (=> (not res!1029883) (not e!843286))))

(declare-fun lt!655044 () SeekEntryResult!12760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100704 (_ BitVec 32)) SeekEntryResult!12760)

(assert (=> b!1509979 (= res!1029883 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48589 a!2804) j!70) a!2804 mask!2512) lt!655044))))

(declare-fun b!1509980 () Bool)

(declare-fun res!1029876 () Bool)

(assert (=> b!1509980 (=> (not res!1029876) (not e!843286))))

(declare-fun lt!655043 () SeekEntryResult!12760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509980 (= res!1029876 (= lt!655043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100705 (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49139 a!2804)) mask!2512)))))

(declare-fun b!1509981 () Bool)

(declare-fun res!1029877 () Bool)

(assert (=> b!1509981 (=> (not res!1029877) (not e!843285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100704 (_ BitVec 32)) Bool)

(assert (=> b!1509981 (= res!1029877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509982 () Bool)

(assert (=> b!1509982 (= e!843285 e!843286)))

(declare-fun res!1029885 () Bool)

(assert (=> b!1509982 (=> (not res!1029885) (not e!843286))))

(assert (=> b!1509982 (= res!1029885 (= lt!655043 lt!655044))))

(assert (=> b!1509982 (= lt!655044 (Intermediate!12760 false resIndex!21 resX!21))))

(assert (=> b!1509982 (= lt!655043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48589 a!2804) j!70) mask!2512) (select (arr!48589 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509983 () Bool)

(assert (=> b!1509983 (= e!843286 (not true))))

(assert (=> b!1509983 e!843284))

(declare-fun res!1029881 () Bool)

(assert (=> b!1509983 (=> (not res!1029881) (not e!843284))))

(assert (=> b!1509983 (= res!1029881 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50388 0))(
  ( (Unit!50389) )
))
(declare-fun lt!655045 () Unit!50388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50388)

(assert (=> b!1509983 (= lt!655045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128848 res!1029880) b!1509976))

(assert (= (and b!1509976 res!1029886) b!1509973))

(assert (= (and b!1509973 res!1029884) b!1509975))

(assert (= (and b!1509975 res!1029882) b!1509981))

(assert (= (and b!1509981 res!1029877) b!1509974))

(assert (= (and b!1509974 res!1029878) b!1509977))

(assert (= (and b!1509977 res!1029879) b!1509982))

(assert (= (and b!1509982 res!1029885) b!1509979))

(assert (= (and b!1509979 res!1029883) b!1509980))

(assert (= (and b!1509980 res!1029876) b!1509983))

(assert (= (and b!1509983 res!1029881) b!1509978))

(declare-fun m!1392511 () Bool)

(assert (=> b!1509975 m!1392511))

(assert (=> b!1509975 m!1392511))

(declare-fun m!1392513 () Bool)

(assert (=> b!1509975 m!1392513))

(declare-fun m!1392515 () Bool)

(assert (=> b!1509974 m!1392515))

(declare-fun m!1392517 () Bool)

(assert (=> start!128848 m!1392517))

(declare-fun m!1392519 () Bool)

(assert (=> start!128848 m!1392519))

(declare-fun m!1392521 () Bool)

(assert (=> b!1509983 m!1392521))

(declare-fun m!1392523 () Bool)

(assert (=> b!1509983 m!1392523))

(assert (=> b!1509979 m!1392511))

(assert (=> b!1509979 m!1392511))

(declare-fun m!1392525 () Bool)

(assert (=> b!1509979 m!1392525))

(assert (=> b!1509978 m!1392511))

(assert (=> b!1509978 m!1392511))

(declare-fun m!1392527 () Bool)

(assert (=> b!1509978 m!1392527))

(declare-fun m!1392529 () Bool)

(assert (=> b!1509981 m!1392529))

(declare-fun m!1392531 () Bool)

(assert (=> b!1509973 m!1392531))

(assert (=> b!1509973 m!1392531))

(declare-fun m!1392533 () Bool)

(assert (=> b!1509973 m!1392533))

(declare-fun m!1392535 () Bool)

(assert (=> b!1509980 m!1392535))

(declare-fun m!1392537 () Bool)

(assert (=> b!1509980 m!1392537))

(assert (=> b!1509980 m!1392537))

(declare-fun m!1392539 () Bool)

(assert (=> b!1509980 m!1392539))

(assert (=> b!1509980 m!1392539))

(assert (=> b!1509980 m!1392537))

(declare-fun m!1392541 () Bool)

(assert (=> b!1509980 m!1392541))

(assert (=> b!1509982 m!1392511))

(assert (=> b!1509982 m!1392511))

(declare-fun m!1392543 () Bool)

(assert (=> b!1509982 m!1392543))

(assert (=> b!1509982 m!1392543))

(assert (=> b!1509982 m!1392511))

(declare-fun m!1392545 () Bool)

(assert (=> b!1509982 m!1392545))

(push 1)

