; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125012 () Bool)

(assert start!125012)

(declare-fun res!984973 () Bool)

(declare-fun e!818347 () Bool)

(assert (=> start!125012 (=> (not res!984973) (not e!818347))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125012 (= res!984973 (validMask!0 mask!2687))))

(assert (=> start!125012 e!818347))

(assert (=> start!125012 true))

(declare-datatypes ((array!98460 0))(
  ( (array!98461 (arr!47518 (Array (_ BitVec 32) (_ BitVec 64))) (size!48068 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98460)

(declare-fun array_inv!36546 (array!98460) Bool)

(assert (=> start!125012 (array_inv!36546 a!2862)))

(declare-fun b!1454040 () Bool)

(declare-fun e!818349 () Bool)

(declare-fun e!818346 () Bool)

(assert (=> b!1454040 (= e!818349 e!818346)))

(declare-fun res!984962 () Bool)

(assert (=> b!1454040 (=> (not res!984962) (not e!818346))))

(declare-datatypes ((SeekEntryResult!11770 0))(
  ( (MissingZero!11770 (index!49472 (_ BitVec 32))) (Found!11770 (index!49473 (_ BitVec 32))) (Intermediate!11770 (undefined!12582 Bool) (index!49474 (_ BitVec 32)) (x!131107 (_ BitVec 32))) (Undefined!11770) (MissingVacant!11770 (index!49475 (_ BitVec 32))) )
))
(declare-fun lt!637449 () SeekEntryResult!11770)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98460 (_ BitVec 32)) SeekEntryResult!11770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454040 (= res!984962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47518 a!2862) j!93) mask!2687) (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637449))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454040 (= lt!637449 (Intermediate!11770 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454041 () Bool)

(declare-fun e!818348 () Bool)

(assert (=> b!1454041 (= e!818348 true)))

(declare-fun lt!637446 () Bool)

(declare-fun e!818342 () Bool)

(assert (=> b!1454041 (= lt!637446 e!818342)))

(declare-fun c!134051 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454041 (= c!134051 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454042 () Bool)

(declare-fun res!984967 () Bool)

(declare-fun e!818343 () Bool)

(assert (=> b!1454042 (=> (not res!984967) (not e!818343))))

(declare-fun e!818345 () Bool)

(assert (=> b!1454042 (= res!984967 e!818345)))

(declare-fun c!134052 () Bool)

(assert (=> b!1454042 (= c!134052 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454043 () Bool)

(declare-fun res!984964 () Bool)

(assert (=> b!1454043 (=> (not res!984964) (not e!818347))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454043 (= res!984964 (validKeyInArray!0 (select (arr!47518 a!2862) i!1006)))))

(declare-fun b!1454044 () Bool)

(declare-fun res!984968 () Bool)

(assert (=> b!1454044 (=> (not res!984968) (not e!818347))))

(assert (=> b!1454044 (= res!984968 (validKeyInArray!0 (select (arr!47518 a!2862) j!93)))))

(declare-fun b!1454045 () Bool)

(assert (=> b!1454045 (= e!818347 e!818349)))

(declare-fun res!984972 () Bool)

(assert (=> b!1454045 (=> (not res!984972) (not e!818349))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454045 (= res!984972 (= (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637445 () array!98460)

(assert (=> b!1454045 (= lt!637445 (array!98461 (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48068 a!2862)))))

(declare-fun b!1454046 () Bool)

(declare-fun res!984976 () Bool)

(assert (=> b!1454046 (=> res!984976 e!818348)))

(declare-fun lt!637448 () (_ BitVec 32))

(assert (=> b!1454046 (= res!984976 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637448 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637449)))))

(declare-fun b!1454047 () Bool)

(declare-fun res!984971 () Bool)

(assert (=> b!1454047 (=> (not res!984971) (not e!818347))))

(assert (=> b!1454047 (= res!984971 (and (= (size!48068 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48068 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48068 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!637443 () (_ BitVec 64))

(declare-fun b!1454048 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98460 (_ BitVec 32)) SeekEntryResult!11770)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98460 (_ BitVec 32)) SeekEntryResult!11770)

(assert (=> b!1454048 (= e!818345 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637443 lt!637445 mask!2687) (seekEntryOrOpen!0 lt!637443 lt!637445 mask!2687)))))

(declare-fun b!1454049 () Bool)

(assert (=> b!1454049 (= e!818346 e!818343)))

(declare-fun res!984960 () Bool)

(assert (=> b!1454049 (=> (not res!984960) (not e!818343))))

(declare-fun lt!637447 () SeekEntryResult!11770)

(assert (=> b!1454049 (= res!984960 (= lt!637447 (Intermediate!11770 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454049 (= lt!637447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637443 mask!2687) lt!637443 lt!637445 mask!2687))))

(assert (=> b!1454049 (= lt!637443 (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454050 () Bool)

(declare-fun res!984965 () Bool)

(assert (=> b!1454050 (=> (not res!984965) (not e!818347))))

(declare-datatypes ((List!34019 0))(
  ( (Nil!34016) (Cons!34015 (h!35365 (_ BitVec 64)) (t!48713 List!34019)) )
))
(declare-fun arrayNoDuplicates!0 (array!98460 (_ BitVec 32) List!34019) Bool)

(assert (=> b!1454050 (= res!984965 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34016))))

(declare-fun b!1454051 () Bool)

(declare-fun lt!637444 () SeekEntryResult!11770)

(assert (=> b!1454051 (= e!818342 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637448 intermediateAfterIndex!19 lt!637443 lt!637445 mask!2687) lt!637444)))))

(declare-fun b!1454052 () Bool)

(declare-fun e!818344 () Bool)

(assert (=> b!1454052 (= e!818343 (not e!818344))))

(declare-fun res!984969 () Bool)

(assert (=> b!1454052 (=> res!984969 e!818344)))

(assert (=> b!1454052 (= res!984969 (or (and (= (select (arr!47518 a!2862) index!646) (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47518 a!2862) index!646) (select (arr!47518 a!2862) j!93))) (= (select (arr!47518 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818350 () Bool)

(assert (=> b!1454052 e!818350))

(declare-fun res!984963 () Bool)

(assert (=> b!1454052 (=> (not res!984963) (not e!818350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98460 (_ BitVec 32)) Bool)

(assert (=> b!1454052 (= res!984963 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49036 0))(
  ( (Unit!49037) )
))
(declare-fun lt!637442 () Unit!49036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49036)

(assert (=> b!1454052 (= lt!637442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454053 () Bool)

(declare-fun res!984970 () Bool)

(assert (=> b!1454053 (=> (not res!984970) (not e!818346))))

(assert (=> b!1454053 (= res!984970 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637449))))

(declare-fun b!1454054 () Bool)

(declare-fun res!984975 () Bool)

(assert (=> b!1454054 (=> (not res!984975) (not e!818343))))

(assert (=> b!1454054 (= res!984975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454055 () Bool)

(assert (=> b!1454055 (= e!818344 e!818348)))

(declare-fun res!984959 () Bool)

(assert (=> b!1454055 (=> res!984959 e!818348)))

(assert (=> b!1454055 (= res!984959 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637448 #b00000000000000000000000000000000) (bvsge lt!637448 (size!48068 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454055 (= lt!637448 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454055 (= lt!637444 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637443 lt!637445 mask!2687))))

(assert (=> b!1454055 (= lt!637444 (seekEntryOrOpen!0 lt!637443 lt!637445 mask!2687))))

(declare-fun b!1454056 () Bool)

(assert (=> b!1454056 (= e!818345 (= lt!637447 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637443 lt!637445 mask!2687)))))

(declare-fun b!1454057 () Bool)

(assert (=> b!1454057 (= e!818350 (and (or (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) (select (arr!47518 a!2862) j!93))) (let ((bdg!53023 (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47518 a!2862) index!646) bdg!53023) (= (select (arr!47518 a!2862) index!646) (select (arr!47518 a!2862) j!93))) (= (select (arr!47518 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53023 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454058 () Bool)

(declare-fun res!984966 () Bool)

(assert (=> b!1454058 (=> (not res!984966) (not e!818350))))

(assert (=> b!1454058 (= res!984966 (= (seekEntryOrOpen!0 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) (Found!11770 j!93)))))

(declare-fun b!1454059 () Bool)

(declare-fun res!984974 () Bool)

(assert (=> b!1454059 (=> (not res!984974) (not e!818347))))

(assert (=> b!1454059 (= res!984974 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48068 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48068 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48068 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454060 () Bool)

(declare-fun res!984961 () Bool)

(assert (=> b!1454060 (=> (not res!984961) (not e!818347))))

(assert (=> b!1454060 (= res!984961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454061 () Bool)

(assert (=> b!1454061 (= e!818342 (not (= lt!637447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637448 lt!637443 lt!637445 mask!2687))))))

(assert (= (and start!125012 res!984973) b!1454047))

(assert (= (and b!1454047 res!984971) b!1454043))

(assert (= (and b!1454043 res!984964) b!1454044))

(assert (= (and b!1454044 res!984968) b!1454060))

(assert (= (and b!1454060 res!984961) b!1454050))

(assert (= (and b!1454050 res!984965) b!1454059))

(assert (= (and b!1454059 res!984974) b!1454045))

(assert (= (and b!1454045 res!984972) b!1454040))

(assert (= (and b!1454040 res!984962) b!1454053))

(assert (= (and b!1454053 res!984970) b!1454049))

(assert (= (and b!1454049 res!984960) b!1454042))

(assert (= (and b!1454042 c!134052) b!1454056))

(assert (= (and b!1454042 (not c!134052)) b!1454048))

(assert (= (and b!1454042 res!984967) b!1454054))

(assert (= (and b!1454054 res!984975) b!1454052))

(assert (= (and b!1454052 res!984963) b!1454058))

(assert (= (and b!1454058 res!984966) b!1454057))

(assert (= (and b!1454052 (not res!984969)) b!1454055))

(assert (= (and b!1454055 (not res!984959)) b!1454046))

(assert (= (and b!1454046 (not res!984976)) b!1454041))

(assert (= (and b!1454041 c!134051) b!1454061))

(assert (= (and b!1454041 (not c!134051)) b!1454051))

(declare-fun m!1342431 () Bool)

(assert (=> b!1454043 m!1342431))

(assert (=> b!1454043 m!1342431))

(declare-fun m!1342433 () Bool)

(assert (=> b!1454043 m!1342433))

(declare-fun m!1342435 () Bool)

(assert (=> b!1454057 m!1342435))

(declare-fun m!1342437 () Bool)

(assert (=> b!1454057 m!1342437))

(declare-fun m!1342439 () Bool)

(assert (=> b!1454057 m!1342439))

(declare-fun m!1342441 () Bool)

(assert (=> b!1454057 m!1342441))

(declare-fun m!1342443 () Bool)

(assert (=> b!1454057 m!1342443))

(declare-fun m!1342445 () Bool)

(assert (=> b!1454049 m!1342445))

(assert (=> b!1454049 m!1342445))

(declare-fun m!1342447 () Bool)

(assert (=> b!1454049 m!1342447))

(assert (=> b!1454049 m!1342435))

(declare-fun m!1342449 () Bool)

(assert (=> b!1454049 m!1342449))

(assert (=> b!1454044 m!1342443))

(assert (=> b!1454044 m!1342443))

(declare-fun m!1342451 () Bool)

(assert (=> b!1454044 m!1342451))

(assert (=> b!1454053 m!1342443))

(assert (=> b!1454053 m!1342443))

(declare-fun m!1342453 () Bool)

(assert (=> b!1454053 m!1342453))

(declare-fun m!1342455 () Bool)

(assert (=> b!1454061 m!1342455))

(assert (=> b!1454058 m!1342443))

(assert (=> b!1454058 m!1342443))

(declare-fun m!1342457 () Bool)

(assert (=> b!1454058 m!1342457))

(assert (=> b!1454046 m!1342443))

(assert (=> b!1454046 m!1342443))

(declare-fun m!1342459 () Bool)

(assert (=> b!1454046 m!1342459))

(declare-fun m!1342461 () Bool)

(assert (=> b!1454051 m!1342461))

(declare-fun m!1342463 () Bool)

(assert (=> b!1454060 m!1342463))

(declare-fun m!1342465 () Bool)

(assert (=> b!1454048 m!1342465))

(declare-fun m!1342467 () Bool)

(assert (=> b!1454048 m!1342467))

(declare-fun m!1342469 () Bool)

(assert (=> b!1454050 m!1342469))

(declare-fun m!1342471 () Bool)

(assert (=> b!1454052 m!1342471))

(assert (=> b!1454052 m!1342435))

(assert (=> b!1454052 m!1342439))

(assert (=> b!1454052 m!1342441))

(declare-fun m!1342473 () Bool)

(assert (=> b!1454052 m!1342473))

(assert (=> b!1454052 m!1342443))

(assert (=> b!1454040 m!1342443))

(assert (=> b!1454040 m!1342443))

(declare-fun m!1342475 () Bool)

(assert (=> b!1454040 m!1342475))

(assert (=> b!1454040 m!1342475))

(assert (=> b!1454040 m!1342443))

(declare-fun m!1342477 () Bool)

(assert (=> b!1454040 m!1342477))

(declare-fun m!1342479 () Bool)

(assert (=> b!1454056 m!1342479))

(declare-fun m!1342481 () Bool)

(assert (=> start!125012 m!1342481))

(declare-fun m!1342483 () Bool)

(assert (=> start!125012 m!1342483))

(declare-fun m!1342485 () Bool)

(assert (=> b!1454055 m!1342485))

(assert (=> b!1454055 m!1342465))

(assert (=> b!1454055 m!1342467))

(assert (=> b!1454045 m!1342435))

(declare-fun m!1342487 () Bool)

(assert (=> b!1454045 m!1342487))

(push 1)

