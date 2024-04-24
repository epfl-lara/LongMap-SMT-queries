; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130482 () Bool)

(assert start!130482)

(declare-fun b!1529278 () Bool)

(declare-fun e!852528 () Bool)

(declare-fun e!852525 () Bool)

(assert (=> b!1529278 (= e!852528 e!852525)))

(declare-fun res!1045839 () Bool)

(assert (=> b!1529278 (=> (not res!1045839) (not e!852525))))

(declare-datatypes ((SeekEntryResult!13094 0))(
  ( (MissingZero!13094 (index!54771 (_ BitVec 32))) (Found!13094 (index!54772 (_ BitVec 32))) (Intermediate!13094 (undefined!13906 Bool) (index!54773 (_ BitVec 32)) (x!136675 (_ BitVec 32))) (Undefined!13094) (MissingVacant!13094 (index!54774 (_ BitVec 32))) )
))
(declare-fun lt!662147 () SeekEntryResult!13094)

(declare-fun lt!662146 () (_ BitVec 64))

(declare-datatypes ((array!101632 0))(
  ( (array!101633 (arr!49036 (Array (_ BitVec 32) (_ BitVec 64))) (size!49587 (_ BitVec 32))) )
))
(declare-fun lt!662144 () array!101632)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529278 (= res!1045839 (= lt!662147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662146 mask!2512) lt!662146 lt!662144 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101632)

(assert (=> b!1529278 (= lt!662146 (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529278 (= lt!662144 (array!101633 (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49587 a!2804)))))

(declare-fun b!1529279 () Bool)

(declare-fun res!1045834 () Bool)

(declare-fun e!852529 () Bool)

(assert (=> b!1529279 (=> (not res!1045834) (not e!852529))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13094)

(assert (=> b!1529279 (= res!1045834 (= (seekEntry!0 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) (Found!13094 j!70)))))

(declare-fun b!1529280 () Bool)

(declare-fun e!852527 () Bool)

(declare-fun e!852524 () Bool)

(assert (=> b!1529280 (= e!852527 e!852524)))

(declare-fun res!1045826 () Bool)

(assert (=> b!1529280 (=> (not res!1045826) (not e!852524))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13094)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13094)

(assert (=> b!1529280 (= res!1045826 (= (seekEntryOrOpen!0 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49036 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529281 () Bool)

(declare-fun res!1045837 () Bool)

(assert (=> b!1529281 (=> (not res!1045837) (not e!852528))))

(declare-fun lt!662148 () SeekEntryResult!13094)

(assert (=> b!1529281 (= res!1045837 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) lt!662148))))

(declare-fun b!1529282 () Bool)

(declare-fun res!1045832 () Bool)

(declare-fun e!852523 () Bool)

(assert (=> b!1529282 (=> (not res!1045832) (not e!852523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529282 (= res!1045832 (validKeyInArray!0 (select (arr!49036 a!2804) i!961)))))

(declare-fun b!1529283 () Bool)

(assert (=> b!1529283 (= e!852523 e!852528)))

(declare-fun res!1045833 () Bool)

(assert (=> b!1529283 (=> (not res!1045833) (not e!852528))))

(assert (=> b!1529283 (= res!1045833 (= lt!662147 lt!662148))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529283 (= lt!662148 (Intermediate!13094 false resIndex!21 resX!21))))

(assert (=> b!1529283 (= lt!662147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49036 a!2804) j!70) mask!2512) (select (arr!49036 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529284 () Bool)

(declare-fun res!1045830 () Bool)

(assert (=> b!1529284 (=> (not res!1045830) (not e!852523))))

(assert (=> b!1529284 (= res!1045830 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49587 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49587 a!2804))))))

(declare-fun res!1045835 () Bool)

(assert (=> start!130482 (=> (not res!1045835) (not e!852523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130482 (= res!1045835 (validMask!0 mask!2512))))

(assert (=> start!130482 e!852523))

(assert (=> start!130482 true))

(declare-fun array_inv!38317 (array!101632) Bool)

(assert (=> start!130482 (array_inv!38317 a!2804)))

(declare-fun b!1529285 () Bool)

(assert (=> b!1529285 (= e!852525 (not true))))

(assert (=> b!1529285 e!852529))

(declare-fun res!1045831 () Bool)

(assert (=> b!1529285 (=> (not res!1045831) (not e!852529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101632 (_ BitVec 32)) Bool)

(assert (=> b!1529285 (= res!1045831 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51007 0))(
  ( (Unit!51008) )
))
(declare-fun lt!662145 () Unit!51007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51007)

(assert (=> b!1529285 (= lt!662145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529286 () Bool)

(declare-fun res!1045829 () Bool)

(assert (=> b!1529286 (=> (not res!1045829) (not e!852523))))

(assert (=> b!1529286 (= res!1045829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529287 () Bool)

(assert (=> b!1529287 (= e!852524 (= (seekEntryOrOpen!0 lt!662146 lt!662144 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662146 lt!662144 mask!2512)))))

(declare-fun b!1529288 () Bool)

(declare-fun res!1045838 () Bool)

(assert (=> b!1529288 (=> (not res!1045838) (not e!852523))))

(assert (=> b!1529288 (= res!1045838 (and (= (size!49587 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49587 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49587 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529289 () Bool)

(declare-fun res!1045828 () Bool)

(assert (=> b!1529289 (=> (not res!1045828) (not e!852523))))

(assert (=> b!1529289 (= res!1045828 (validKeyInArray!0 (select (arr!49036 a!2804) j!70)))))

(declare-fun b!1529290 () Bool)

(declare-fun res!1045827 () Bool)

(assert (=> b!1529290 (=> (not res!1045827) (not e!852523))))

(declare-datatypes ((List!35506 0))(
  ( (Nil!35503) (Cons!35502 (h!36953 (_ BitVec 64)) (t!50192 List!35506)) )
))
(declare-fun arrayNoDuplicates!0 (array!101632 (_ BitVec 32) List!35506) Bool)

(assert (=> b!1529290 (= res!1045827 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35503))))

(declare-fun b!1529291 () Bool)

(assert (=> b!1529291 (= e!852529 e!852527)))

(declare-fun res!1045836 () Bool)

(assert (=> b!1529291 (=> res!1045836 e!852527)))

(assert (=> b!1529291 (= res!1045836 (or (not (= (select (arr!49036 a!2804) j!70) lt!662146)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49036 a!2804) index!487) (select (arr!49036 a!2804) j!70)) (not (= (select (arr!49036 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!130482 res!1045835) b!1529288))

(assert (= (and b!1529288 res!1045838) b!1529282))

(assert (= (and b!1529282 res!1045832) b!1529289))

(assert (= (and b!1529289 res!1045828) b!1529286))

(assert (= (and b!1529286 res!1045829) b!1529290))

(assert (= (and b!1529290 res!1045827) b!1529284))

(assert (= (and b!1529284 res!1045830) b!1529283))

(assert (= (and b!1529283 res!1045833) b!1529281))

(assert (= (and b!1529281 res!1045837) b!1529278))

(assert (= (and b!1529278 res!1045839) b!1529285))

(assert (= (and b!1529285 res!1045831) b!1529279))

(assert (= (and b!1529279 res!1045834) b!1529291))

(assert (= (and b!1529291 (not res!1045836)) b!1529280))

(assert (= (and b!1529280 res!1045826) b!1529287))

(declare-fun m!1411981 () Bool)

(assert (=> b!1529281 m!1411981))

(assert (=> b!1529281 m!1411981))

(declare-fun m!1411983 () Bool)

(assert (=> b!1529281 m!1411983))

(assert (=> b!1529291 m!1411981))

(declare-fun m!1411985 () Bool)

(assert (=> b!1529291 m!1411985))

(declare-fun m!1411987 () Bool)

(assert (=> start!130482 m!1411987))

(declare-fun m!1411989 () Bool)

(assert (=> start!130482 m!1411989))

(declare-fun m!1411991 () Bool)

(assert (=> b!1529278 m!1411991))

(assert (=> b!1529278 m!1411991))

(declare-fun m!1411993 () Bool)

(assert (=> b!1529278 m!1411993))

(declare-fun m!1411995 () Bool)

(assert (=> b!1529278 m!1411995))

(declare-fun m!1411997 () Bool)

(assert (=> b!1529278 m!1411997))

(assert (=> b!1529279 m!1411981))

(assert (=> b!1529279 m!1411981))

(declare-fun m!1411999 () Bool)

(assert (=> b!1529279 m!1411999))

(assert (=> b!1529283 m!1411981))

(assert (=> b!1529283 m!1411981))

(declare-fun m!1412001 () Bool)

(assert (=> b!1529283 m!1412001))

(assert (=> b!1529283 m!1412001))

(assert (=> b!1529283 m!1411981))

(declare-fun m!1412003 () Bool)

(assert (=> b!1529283 m!1412003))

(declare-fun m!1412005 () Bool)

(assert (=> b!1529290 m!1412005))

(assert (=> b!1529289 m!1411981))

(assert (=> b!1529289 m!1411981))

(declare-fun m!1412007 () Bool)

(assert (=> b!1529289 m!1412007))

(declare-fun m!1412009 () Bool)

(assert (=> b!1529286 m!1412009))

(declare-fun m!1412011 () Bool)

(assert (=> b!1529285 m!1412011))

(declare-fun m!1412013 () Bool)

(assert (=> b!1529285 m!1412013))

(declare-fun m!1412015 () Bool)

(assert (=> b!1529282 m!1412015))

(assert (=> b!1529282 m!1412015))

(declare-fun m!1412017 () Bool)

(assert (=> b!1529282 m!1412017))

(assert (=> b!1529280 m!1411981))

(assert (=> b!1529280 m!1411981))

(declare-fun m!1412019 () Bool)

(assert (=> b!1529280 m!1412019))

(assert (=> b!1529280 m!1411981))

(declare-fun m!1412021 () Bool)

(assert (=> b!1529280 m!1412021))

(declare-fun m!1412023 () Bool)

(assert (=> b!1529287 m!1412023))

(declare-fun m!1412025 () Bool)

(assert (=> b!1529287 m!1412025))

(check-sat (not b!1529289) (not b!1529283) (not b!1529290) (not b!1529282) (not b!1529281) (not b!1529278) (not b!1529279) (not start!130482) (not b!1529286) (not b!1529287) (not b!1529280) (not b!1529285))
(check-sat)
