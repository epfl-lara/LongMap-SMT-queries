; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129816 () Bool)

(assert start!129816)

(declare-fun b!1523826 () Bool)

(declare-fun res!1042667 () Bool)

(declare-fun e!849490 () Bool)

(assert (=> b!1523826 (=> (not res!1042667) (not e!849490))))

(declare-datatypes ((SeekEntryResult!13095 0))(
  ( (MissingZero!13095 (index!54775 (_ BitVec 32))) (Found!13095 (index!54776 (_ BitVec 32))) (Intermediate!13095 (undefined!13907 Bool) (index!54777 (_ BitVec 32)) (x!136470 (_ BitVec 32))) (Undefined!13095) (MissingVacant!13095 (index!54778 (_ BitVec 32))) )
))
(declare-fun lt!659948 () SeekEntryResult!13095)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101353 0))(
  ( (array!101354 (arr!48907 (Array (_ BitVec 32) (_ BitVec 64))) (size!49459 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101353)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101353 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523826 (= res!1042667 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48907 a!2804) j!70) a!2804 mask!2512) lt!659948))))

(declare-fun b!1523827 () Bool)

(declare-fun res!1042669 () Bool)

(declare-fun e!849491 () Bool)

(assert (=> b!1523827 (=> (not res!1042669) (not e!849491))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523827 (= res!1042669 (and (= (size!49459 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49459 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49459 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523828 () Bool)

(declare-fun res!1042672 () Bool)

(assert (=> b!1523828 (=> (not res!1042672) (not e!849491))))

(declare-datatypes ((List!35468 0))(
  ( (Nil!35465) (Cons!35464 (h!36892 (_ BitVec 64)) (t!50154 List!35468)) )
))
(declare-fun arrayNoDuplicates!0 (array!101353 (_ BitVec 32) List!35468) Bool)

(assert (=> b!1523828 (= res!1042672 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35465))))

(declare-fun b!1523829 () Bool)

(declare-fun res!1042670 () Bool)

(assert (=> b!1523829 (=> (not res!1042670) (not e!849491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523829 (= res!1042670 (validKeyInArray!0 (select (arr!48907 a!2804) i!961)))))

(declare-fun e!849492 () Bool)

(declare-fun b!1523830 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101353 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523830 (= e!849492 (= (seekEntry!0 (select (arr!48907 a!2804) j!70) a!2804 mask!2512) (Found!13095 j!70)))))

(declare-fun b!1523831 () Bool)

(assert (=> b!1523831 (= e!849491 e!849490)))

(declare-fun res!1042665 () Bool)

(assert (=> b!1523831 (=> (not res!1042665) (not e!849490))))

(declare-fun lt!659947 () SeekEntryResult!13095)

(assert (=> b!1523831 (= res!1042665 (= lt!659947 lt!659948))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523831 (= lt!659948 (Intermediate!13095 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523831 (= lt!659947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48907 a!2804) j!70) mask!2512) (select (arr!48907 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523832 () Bool)

(declare-fun res!1042666 () Bool)

(assert (=> b!1523832 (=> (not res!1042666) (not e!849491))))

(assert (=> b!1523832 (= res!1042666 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49459 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49459 a!2804))))))

(declare-fun b!1523833 () Bool)

(declare-fun res!1042664 () Bool)

(assert (=> b!1523833 (=> (not res!1042664) (not e!849491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101353 (_ BitVec 32)) Bool)

(assert (=> b!1523833 (= res!1042664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1042668 () Bool)

(assert (=> start!129816 (=> (not res!1042668) (not e!849491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129816 (= res!1042668 (validMask!0 mask!2512))))

(assert (=> start!129816 e!849491))

(assert (=> start!129816 true))

(declare-fun array_inv!38140 (array!101353) Bool)

(assert (=> start!129816 (array_inv!38140 a!2804)))

(declare-fun b!1523834 () Bool)

(declare-fun res!1042671 () Bool)

(assert (=> b!1523834 (=> (not res!1042671) (not e!849491))))

(assert (=> b!1523834 (= res!1042671 (validKeyInArray!0 (select (arr!48907 a!2804) j!70)))))

(declare-fun b!1523835 () Bool)

(declare-fun res!1042662 () Bool)

(assert (=> b!1523835 (=> (not res!1042662) (not e!849490))))

(assert (=> b!1523835 (= res!1042662 (= lt!659947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101354 (store (arr!48907 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49459 a!2804)) mask!2512)))))

(declare-fun b!1523836 () Bool)

(assert (=> b!1523836 (= e!849490 (not true))))

(assert (=> b!1523836 e!849492))

(declare-fun res!1042663 () Bool)

(assert (=> b!1523836 (=> (not res!1042663) (not e!849492))))

(assert (=> b!1523836 (= res!1042663 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50813 0))(
  ( (Unit!50814) )
))
(declare-fun lt!659949 () Unit!50813)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50813)

(assert (=> b!1523836 (= lt!659949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129816 res!1042668) b!1523827))

(assert (= (and b!1523827 res!1042669) b!1523829))

(assert (= (and b!1523829 res!1042670) b!1523834))

(assert (= (and b!1523834 res!1042671) b!1523833))

(assert (= (and b!1523833 res!1042664) b!1523828))

(assert (= (and b!1523828 res!1042672) b!1523832))

(assert (= (and b!1523832 res!1042666) b!1523831))

(assert (= (and b!1523831 res!1042665) b!1523826))

(assert (= (and b!1523826 res!1042667) b!1523835))

(assert (= (and b!1523835 res!1042662) b!1523836))

(assert (= (and b!1523836 res!1042663) b!1523830))

(declare-fun m!1406267 () Bool)

(assert (=> b!1523830 m!1406267))

(assert (=> b!1523830 m!1406267))

(declare-fun m!1406269 () Bool)

(assert (=> b!1523830 m!1406269))

(assert (=> b!1523831 m!1406267))

(assert (=> b!1523831 m!1406267))

(declare-fun m!1406271 () Bool)

(assert (=> b!1523831 m!1406271))

(assert (=> b!1523831 m!1406271))

(assert (=> b!1523831 m!1406267))

(declare-fun m!1406273 () Bool)

(assert (=> b!1523831 m!1406273))

(declare-fun m!1406275 () Bool)

(assert (=> b!1523833 m!1406275))

(declare-fun m!1406277 () Bool)

(assert (=> start!129816 m!1406277))

(declare-fun m!1406279 () Bool)

(assert (=> start!129816 m!1406279))

(declare-fun m!1406281 () Bool)

(assert (=> b!1523828 m!1406281))

(declare-fun m!1406283 () Bool)

(assert (=> b!1523836 m!1406283))

(declare-fun m!1406285 () Bool)

(assert (=> b!1523836 m!1406285))

(assert (=> b!1523834 m!1406267))

(assert (=> b!1523834 m!1406267))

(declare-fun m!1406287 () Bool)

(assert (=> b!1523834 m!1406287))

(assert (=> b!1523826 m!1406267))

(assert (=> b!1523826 m!1406267))

(declare-fun m!1406289 () Bool)

(assert (=> b!1523826 m!1406289))

(declare-fun m!1406291 () Bool)

(assert (=> b!1523835 m!1406291))

(declare-fun m!1406293 () Bool)

(assert (=> b!1523835 m!1406293))

(assert (=> b!1523835 m!1406293))

(declare-fun m!1406295 () Bool)

(assert (=> b!1523835 m!1406295))

(assert (=> b!1523835 m!1406295))

(assert (=> b!1523835 m!1406293))

(declare-fun m!1406297 () Bool)

(assert (=> b!1523835 m!1406297))

(declare-fun m!1406299 () Bool)

(assert (=> b!1523829 m!1406299))

(assert (=> b!1523829 m!1406299))

(declare-fun m!1406301 () Bool)

(assert (=> b!1523829 m!1406301))

(check-sat (not b!1523830) (not b!1523836) (not b!1523834) (not start!129816) (not b!1523829) (not b!1523828) (not b!1523833) (not b!1523835) (not b!1523831) (not b!1523826))
(check-sat)
