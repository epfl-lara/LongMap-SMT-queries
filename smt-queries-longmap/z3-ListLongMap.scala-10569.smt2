; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124770 () Bool)

(assert start!124770)

(declare-fun b!1442864 () Bool)

(declare-fun res!974380 () Bool)

(declare-fun e!813456 () Bool)

(assert (=> b!1442864 (=> (not res!974380) (not e!813456))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98113 0))(
  ( (array!98114 (arr!47341 (Array (_ BitVec 32) (_ BitVec 64))) (size!47892 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98113)

(assert (=> b!1442864 (= res!974380 (and (= (size!47892 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47892 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47892 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442866 () Bool)

(declare-fun e!813452 () Bool)

(assert (=> b!1442866 (= e!813456 e!813452)))

(declare-fun res!974376 () Bool)

(assert (=> b!1442866 (=> (not res!974376) (not e!813452))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442866 (= res!974376 (= (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633753 () array!98113)

(assert (=> b!1442866 (= lt!633753 (array!98114 (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47892 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813453 () Bool)

(declare-fun b!1442867 () Bool)

(declare-fun lt!633757 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11490 0))(
  ( (MissingZero!11490 (index!48352 (_ BitVec 32))) (Found!11490 (index!48353 (_ BitVec 32))) (Intermediate!11490 (undefined!12302 Bool) (index!48354 (_ BitVec 32)) (x!130243 (_ BitVec 32))) (Undefined!11490) (MissingVacant!11490 (index!48355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98113 (_ BitVec 32)) SeekEntryResult!11490)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98113 (_ BitVec 32)) SeekEntryResult!11490)

(assert (=> b!1442867 (= e!813453 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633757 lt!633753 mask!2687) (seekEntryOrOpen!0 lt!633757 lt!633753 mask!2687)))))

(declare-fun b!1442868 () Bool)

(declare-fun res!974381 () Bool)

(assert (=> b!1442868 (=> (not res!974381) (not e!813456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98113 (_ BitVec 32)) Bool)

(assert (=> b!1442868 (= res!974381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442869 () Bool)

(declare-fun e!813454 () Bool)

(assert (=> b!1442869 (= e!813454 (not true))))

(assert (=> b!1442869 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48509 0))(
  ( (Unit!48510) )
))
(declare-fun lt!633754 () Unit!48509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48509)

(assert (=> b!1442869 (= lt!633754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442870 () Bool)

(declare-fun res!974378 () Bool)

(assert (=> b!1442870 (=> (not res!974378) (not e!813454))))

(assert (=> b!1442870 (= res!974378 e!813453)))

(declare-fun c!133765 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442870 (= c!133765 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442871 () Bool)

(declare-fun lt!633756 () SeekEntryResult!11490)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98113 (_ BitVec 32)) SeekEntryResult!11490)

(assert (=> b!1442871 (= e!813453 (= lt!633756 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633757 lt!633753 mask!2687)))))

(declare-fun b!1442872 () Bool)

(declare-fun res!974379 () Bool)

(assert (=> b!1442872 (=> (not res!974379) (not e!813456))))

(declare-datatypes ((List!33829 0))(
  ( (Nil!33826) (Cons!33825 (h!35186 (_ BitVec 64)) (t!48515 List!33829)) )
))
(declare-fun arrayNoDuplicates!0 (array!98113 (_ BitVec 32) List!33829) Bool)

(assert (=> b!1442872 (= res!974379 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33826))))

(declare-fun res!974383 () Bool)

(assert (=> start!124770 (=> (not res!974383) (not e!813456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124770 (= res!974383 (validMask!0 mask!2687))))

(assert (=> start!124770 e!813456))

(assert (=> start!124770 true))

(declare-fun array_inv!36622 (array!98113) Bool)

(assert (=> start!124770 (array_inv!36622 a!2862)))

(declare-fun b!1442865 () Bool)

(declare-fun e!813451 () Bool)

(assert (=> b!1442865 (= e!813451 e!813454)))

(declare-fun res!974373 () Bool)

(assert (=> b!1442865 (=> (not res!974373) (not e!813454))))

(assert (=> b!1442865 (= res!974373 (= lt!633756 (Intermediate!11490 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442865 (= lt!633756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633757 mask!2687) lt!633757 lt!633753 mask!2687))))

(assert (=> b!1442865 (= lt!633757 (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442873 () Bool)

(declare-fun res!974375 () Bool)

(assert (=> b!1442873 (=> (not res!974375) (not e!813456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442873 (= res!974375 (validKeyInArray!0 (select (arr!47341 a!2862) i!1006)))))

(declare-fun b!1442874 () Bool)

(declare-fun res!974372 () Bool)

(assert (=> b!1442874 (=> (not res!974372) (not e!813454))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442874 (= res!974372 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442875 () Bool)

(assert (=> b!1442875 (= e!813452 e!813451)))

(declare-fun res!974384 () Bool)

(assert (=> b!1442875 (=> (not res!974384) (not e!813451))))

(declare-fun lt!633755 () SeekEntryResult!11490)

(assert (=> b!1442875 (= res!974384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47341 a!2862) j!93) mask!2687) (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!633755))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442875 (= lt!633755 (Intermediate!11490 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442876 () Bool)

(declare-fun res!974374 () Bool)

(assert (=> b!1442876 (=> (not res!974374) (not e!813456))))

(assert (=> b!1442876 (= res!974374 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47892 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47892 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47892 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442877 () Bool)

(declare-fun res!974382 () Bool)

(assert (=> b!1442877 (=> (not res!974382) (not e!813451))))

(assert (=> b!1442877 (= res!974382 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!633755))))

(declare-fun b!1442878 () Bool)

(declare-fun res!974377 () Bool)

(assert (=> b!1442878 (=> (not res!974377) (not e!813456))))

(assert (=> b!1442878 (= res!974377 (validKeyInArray!0 (select (arr!47341 a!2862) j!93)))))

(assert (= (and start!124770 res!974383) b!1442864))

(assert (= (and b!1442864 res!974380) b!1442873))

(assert (= (and b!1442873 res!974375) b!1442878))

(assert (= (and b!1442878 res!974377) b!1442868))

(assert (= (and b!1442868 res!974381) b!1442872))

(assert (= (and b!1442872 res!974379) b!1442876))

(assert (= (and b!1442876 res!974374) b!1442866))

(assert (= (and b!1442866 res!974376) b!1442875))

(assert (= (and b!1442875 res!974384) b!1442877))

(assert (= (and b!1442877 res!974382) b!1442865))

(assert (= (and b!1442865 res!974373) b!1442870))

(assert (= (and b!1442870 c!133765) b!1442871))

(assert (= (and b!1442870 (not c!133765)) b!1442867))

(assert (= (and b!1442870 res!974378) b!1442874))

(assert (= (and b!1442874 res!974372) b!1442869))

(declare-fun m!1332193 () Bool)

(assert (=> b!1442869 m!1332193))

(declare-fun m!1332195 () Bool)

(assert (=> b!1442869 m!1332195))

(declare-fun m!1332197 () Bool)

(assert (=> b!1442873 m!1332197))

(assert (=> b!1442873 m!1332197))

(declare-fun m!1332199 () Bool)

(assert (=> b!1442873 m!1332199))

(declare-fun m!1332201 () Bool)

(assert (=> b!1442878 m!1332201))

(assert (=> b!1442878 m!1332201))

(declare-fun m!1332203 () Bool)

(assert (=> b!1442878 m!1332203))

(declare-fun m!1332205 () Bool)

(assert (=> b!1442868 m!1332205))

(assert (=> b!1442877 m!1332201))

(assert (=> b!1442877 m!1332201))

(declare-fun m!1332207 () Bool)

(assert (=> b!1442877 m!1332207))

(declare-fun m!1332209 () Bool)

(assert (=> start!124770 m!1332209))

(declare-fun m!1332211 () Bool)

(assert (=> start!124770 m!1332211))

(declare-fun m!1332213 () Bool)

(assert (=> b!1442866 m!1332213))

(declare-fun m!1332215 () Bool)

(assert (=> b!1442866 m!1332215))

(declare-fun m!1332217 () Bool)

(assert (=> b!1442865 m!1332217))

(assert (=> b!1442865 m!1332217))

(declare-fun m!1332219 () Bool)

(assert (=> b!1442865 m!1332219))

(assert (=> b!1442865 m!1332213))

(declare-fun m!1332221 () Bool)

(assert (=> b!1442865 m!1332221))

(declare-fun m!1332223 () Bool)

(assert (=> b!1442871 m!1332223))

(declare-fun m!1332225 () Bool)

(assert (=> b!1442872 m!1332225))

(assert (=> b!1442875 m!1332201))

(assert (=> b!1442875 m!1332201))

(declare-fun m!1332227 () Bool)

(assert (=> b!1442875 m!1332227))

(assert (=> b!1442875 m!1332227))

(assert (=> b!1442875 m!1332201))

(declare-fun m!1332229 () Bool)

(assert (=> b!1442875 m!1332229))

(declare-fun m!1332231 () Bool)

(assert (=> b!1442867 m!1332231))

(declare-fun m!1332233 () Bool)

(assert (=> b!1442867 m!1332233))

(check-sat (not b!1442877) (not b!1442873) (not b!1442865) (not b!1442867) (not b!1442872) (not b!1442875) (not start!124770) (not b!1442869) (not b!1442868) (not b!1442871) (not b!1442878))
(check-sat)
