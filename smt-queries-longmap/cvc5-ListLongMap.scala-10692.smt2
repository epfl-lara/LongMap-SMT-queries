; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125290 () Bool)

(assert start!125290)

(declare-fun b!1463043 () Bool)

(declare-fun res!992381 () Bool)

(declare-fun e!822344 () Bool)

(assert (=> b!1463043 (=> (not res!992381) (not e!822344))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463043 (= res!992381 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463044 () Bool)

(declare-fun res!992377 () Bool)

(declare-fun e!822345 () Bool)

(assert (=> b!1463044 (=> res!992377 e!822345)))

(declare-datatypes ((SeekEntryResult!11909 0))(
  ( (MissingZero!11909 (index!50028 (_ BitVec 32))) (Found!11909 (index!50029 (_ BitVec 32))) (Intermediate!11909 (undefined!12721 Bool) (index!50030 (_ BitVec 32)) (x!131622 (_ BitVec 32))) (Undefined!11909) (MissingVacant!11909 (index!50031 (_ BitVec 32))) )
))
(declare-fun lt!640642 () SeekEntryResult!11909)

(declare-datatypes ((array!98738 0))(
  ( (array!98739 (arr!47657 (Array (_ BitVec 32) (_ BitVec 64))) (size!48207 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98738)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!640646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98738 (_ BitVec 32)) SeekEntryResult!11909)

(assert (=> b!1463044 (= res!992377 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640646 (select (arr!47657 a!2862) j!93) a!2862 mask!2687) lt!640642)))))

(declare-fun b!1463045 () Bool)

(declare-fun e!822347 () Bool)

(declare-fun e!822350 () Bool)

(assert (=> b!1463045 (= e!822347 e!822350)))

(declare-fun res!992374 () Bool)

(assert (=> b!1463045 (=> (not res!992374) (not e!822350))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463045 (= res!992374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47657 a!2862) j!93) mask!2687) (select (arr!47657 a!2862) j!93) a!2862 mask!2687) lt!640642))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463045 (= lt!640642 (Intermediate!11909 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!640643 () array!98738)

(declare-fun b!1463046 () Bool)

(declare-fun lt!640644 () (_ BitVec 64))

(declare-fun e!822348 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98738 (_ BitVec 32)) SeekEntryResult!11909)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98738 (_ BitVec 32)) SeekEntryResult!11909)

(assert (=> b!1463046 (= e!822348 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640646 intermediateAfterIndex!19 lt!640644 lt!640643 mask!2687) (seekEntryOrOpen!0 lt!640644 lt!640643 mask!2687))))))

(declare-fun b!1463047 () Bool)

(declare-fun res!992373 () Bool)

(declare-fun e!822346 () Bool)

(assert (=> b!1463047 (=> (not res!992373) (not e!822346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463047 (= res!992373 (validKeyInArray!0 (select (arr!47657 a!2862) i!1006)))))

(declare-fun b!1463048 () Bool)

(assert (=> b!1463048 (= e!822346 e!822347)))

(declare-fun res!992368 () Bool)

(assert (=> b!1463048 (=> (not res!992368) (not e!822347))))

(assert (=> b!1463048 (= res!992368 (= (select (store (arr!47657 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463048 (= lt!640643 (array!98739 (store (arr!47657 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48207 a!2862)))))

(declare-fun b!1463049 () Bool)

(declare-fun res!992371 () Bool)

(declare-fun e!822342 () Bool)

(assert (=> b!1463049 (=> (not res!992371) (not e!822342))))

(assert (=> b!1463049 (= res!992371 (= (seekEntryOrOpen!0 (select (arr!47657 a!2862) j!93) a!2862 mask!2687) (Found!11909 j!93)))))

(declare-fun b!1463050 () Bool)

(assert (=> b!1463050 (= e!822350 e!822344)))

(declare-fun res!992376 () Bool)

(assert (=> b!1463050 (=> (not res!992376) (not e!822344))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!640647 () SeekEntryResult!11909)

(assert (=> b!1463050 (= res!992376 (= lt!640647 (Intermediate!11909 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463050 (= lt!640647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640644 mask!2687) lt!640644 lt!640643 mask!2687))))

(assert (=> b!1463050 (= lt!640644 (select (store (arr!47657 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463051 () Bool)

(assert (=> b!1463051 (= e!822342 (or (= (select (arr!47657 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47657 a!2862) intermediateBeforeIndex!19) (select (arr!47657 a!2862) j!93))))))

(declare-fun b!1463052 () Bool)

(declare-fun res!992379 () Bool)

(assert (=> b!1463052 (=> (not res!992379) (not e!822346))))

(assert (=> b!1463052 (= res!992379 (and (= (size!48207 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48207 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48207 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463053 () Bool)

(declare-fun e!822349 () Bool)

(assert (=> b!1463053 (= e!822344 (not e!822349))))

(declare-fun res!992382 () Bool)

(assert (=> b!1463053 (=> res!992382 e!822349)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1463053 (= res!992382 (or (and (= (select (arr!47657 a!2862) index!646) (select (store (arr!47657 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47657 a!2862) index!646) (select (arr!47657 a!2862) j!93))) (= (select (arr!47657 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463053 e!822342))

(declare-fun res!992380 () Bool)

(assert (=> b!1463053 (=> (not res!992380) (not e!822342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98738 (_ BitVec 32)) Bool)

(assert (=> b!1463053 (= res!992380 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49314 0))(
  ( (Unit!49315) )
))
(declare-fun lt!640641 () Unit!49314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49314)

(assert (=> b!1463053 (= lt!640641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463054 () Bool)

(declare-fun res!992372 () Bool)

(assert (=> b!1463054 (=> (not res!992372) (not e!822346))))

(assert (=> b!1463054 (= res!992372 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48207 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48207 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48207 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463055 () Bool)

(declare-fun res!992375 () Bool)

(assert (=> b!1463055 (=> (not res!992375) (not e!822346))))

(assert (=> b!1463055 (= res!992375 (validKeyInArray!0 (select (arr!47657 a!2862) j!93)))))

(declare-fun res!992367 () Bool)

(assert (=> start!125290 (=> (not res!992367) (not e!822346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125290 (= res!992367 (validMask!0 mask!2687))))

(assert (=> start!125290 e!822346))

(assert (=> start!125290 true))

(declare-fun array_inv!36685 (array!98738) Bool)

(assert (=> start!125290 (array_inv!36685 a!2862)))

(declare-fun e!822341 () Bool)

(declare-fun b!1463056 () Bool)

(assert (=> b!1463056 (= e!822341 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640644 lt!640643 mask!2687) (seekEntryOrOpen!0 lt!640644 lt!640643 mask!2687)))))

(declare-fun b!1463057 () Bool)

(assert (=> b!1463057 (= e!822341 (= lt!640647 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640644 lt!640643 mask!2687)))))

(declare-fun b!1463058 () Bool)

(declare-fun res!992369 () Bool)

(assert (=> b!1463058 (=> (not res!992369) (not e!822346))))

(assert (=> b!1463058 (= res!992369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463059 () Bool)

(declare-fun res!992366 () Bool)

(assert (=> b!1463059 (=> (not res!992366) (not e!822346))))

(declare-datatypes ((List!34158 0))(
  ( (Nil!34155) (Cons!34154 (h!35504 (_ BitVec 64)) (t!48852 List!34158)) )
))
(declare-fun arrayNoDuplicates!0 (array!98738 (_ BitVec 32) List!34158) Bool)

(assert (=> b!1463059 (= res!992366 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34155))))

(declare-fun b!1463060 () Bool)

(assert (=> b!1463060 (= e!822345 true)))

(declare-fun lt!640645 () Bool)

(assert (=> b!1463060 (= lt!640645 e!822348)))

(declare-fun c!134849 () Bool)

(assert (=> b!1463060 (= c!134849 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463061 () Bool)

(assert (=> b!1463061 (= e!822348 (not (= lt!640647 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640646 lt!640644 lt!640643 mask!2687))))))

(declare-fun b!1463062 () Bool)

(assert (=> b!1463062 (= e!822349 e!822345)))

(declare-fun res!992378 () Bool)

(assert (=> b!1463062 (=> res!992378 e!822345)))

(assert (=> b!1463062 (= res!992378 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640646 #b00000000000000000000000000000000) (bvsge lt!640646 (size!48207 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463062 (= lt!640646 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463063 () Bool)

(declare-fun res!992383 () Bool)

(assert (=> b!1463063 (=> (not res!992383) (not e!822350))))

(assert (=> b!1463063 (= res!992383 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47657 a!2862) j!93) a!2862 mask!2687) lt!640642))))

(declare-fun b!1463064 () Bool)

(declare-fun res!992370 () Bool)

(assert (=> b!1463064 (=> (not res!992370) (not e!822344))))

(assert (=> b!1463064 (= res!992370 e!822341)))

(declare-fun c!134850 () Bool)

(assert (=> b!1463064 (= c!134850 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125290 res!992367) b!1463052))

(assert (= (and b!1463052 res!992379) b!1463047))

(assert (= (and b!1463047 res!992373) b!1463055))

(assert (= (and b!1463055 res!992375) b!1463058))

(assert (= (and b!1463058 res!992369) b!1463059))

(assert (= (and b!1463059 res!992366) b!1463054))

(assert (= (and b!1463054 res!992372) b!1463048))

(assert (= (and b!1463048 res!992368) b!1463045))

(assert (= (and b!1463045 res!992374) b!1463063))

(assert (= (and b!1463063 res!992383) b!1463050))

(assert (= (and b!1463050 res!992376) b!1463064))

(assert (= (and b!1463064 c!134850) b!1463057))

(assert (= (and b!1463064 (not c!134850)) b!1463056))

(assert (= (and b!1463064 res!992370) b!1463043))

(assert (= (and b!1463043 res!992381) b!1463053))

(assert (= (and b!1463053 res!992380) b!1463049))

(assert (= (and b!1463049 res!992371) b!1463051))

(assert (= (and b!1463053 (not res!992382)) b!1463062))

(assert (= (and b!1463062 (not res!992378)) b!1463044))

(assert (= (and b!1463044 (not res!992377)) b!1463060))

(assert (= (and b!1463060 c!134849) b!1463061))

(assert (= (and b!1463060 (not c!134849)) b!1463046))

(declare-fun m!1350427 () Bool)

(assert (=> b!1463057 m!1350427))

(declare-fun m!1350429 () Bool)

(assert (=> start!125290 m!1350429))

(declare-fun m!1350431 () Bool)

(assert (=> start!125290 m!1350431))

(declare-fun m!1350433 () Bool)

(assert (=> b!1463062 m!1350433))

(declare-fun m!1350435 () Bool)

(assert (=> b!1463046 m!1350435))

(declare-fun m!1350437 () Bool)

(assert (=> b!1463046 m!1350437))

(declare-fun m!1350439 () Bool)

(assert (=> b!1463053 m!1350439))

(declare-fun m!1350441 () Bool)

(assert (=> b!1463053 m!1350441))

(declare-fun m!1350443 () Bool)

(assert (=> b!1463053 m!1350443))

(declare-fun m!1350445 () Bool)

(assert (=> b!1463053 m!1350445))

(declare-fun m!1350447 () Bool)

(assert (=> b!1463053 m!1350447))

(declare-fun m!1350449 () Bool)

(assert (=> b!1463053 m!1350449))

(declare-fun m!1350451 () Bool)

(assert (=> b!1463047 m!1350451))

(assert (=> b!1463047 m!1350451))

(declare-fun m!1350453 () Bool)

(assert (=> b!1463047 m!1350453))

(declare-fun m!1350455 () Bool)

(assert (=> b!1463051 m!1350455))

(assert (=> b!1463051 m!1350449))

(declare-fun m!1350457 () Bool)

(assert (=> b!1463059 m!1350457))

(declare-fun m!1350459 () Bool)

(assert (=> b!1463058 m!1350459))

(assert (=> b!1463045 m!1350449))

(assert (=> b!1463045 m!1350449))

(declare-fun m!1350461 () Bool)

(assert (=> b!1463045 m!1350461))

(assert (=> b!1463045 m!1350461))

(assert (=> b!1463045 m!1350449))

(declare-fun m!1350463 () Bool)

(assert (=> b!1463045 m!1350463))

(declare-fun m!1350465 () Bool)

(assert (=> b!1463061 m!1350465))

(assert (=> b!1463044 m!1350449))

(assert (=> b!1463044 m!1350449))

(declare-fun m!1350467 () Bool)

(assert (=> b!1463044 m!1350467))

(assert (=> b!1463063 m!1350449))

(assert (=> b!1463063 m!1350449))

(declare-fun m!1350469 () Bool)

(assert (=> b!1463063 m!1350469))

(assert (=> b!1463049 m!1350449))

(assert (=> b!1463049 m!1350449))

(declare-fun m!1350471 () Bool)

(assert (=> b!1463049 m!1350471))

(assert (=> b!1463048 m!1350441))

(declare-fun m!1350473 () Bool)

(assert (=> b!1463048 m!1350473))

(declare-fun m!1350475 () Bool)

(assert (=> b!1463050 m!1350475))

(assert (=> b!1463050 m!1350475))

(declare-fun m!1350477 () Bool)

(assert (=> b!1463050 m!1350477))

(assert (=> b!1463050 m!1350441))

(declare-fun m!1350479 () Bool)

(assert (=> b!1463050 m!1350479))

(declare-fun m!1350481 () Bool)

(assert (=> b!1463056 m!1350481))

(assert (=> b!1463056 m!1350437))

(assert (=> b!1463055 m!1350449))

(assert (=> b!1463055 m!1350449))

(declare-fun m!1350483 () Bool)

(assert (=> b!1463055 m!1350483))

(push 1)

