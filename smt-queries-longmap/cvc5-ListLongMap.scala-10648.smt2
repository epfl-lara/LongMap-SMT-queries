; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125026 () Bool)

(assert start!125026)

(declare-fun b!1454502 () Bool)

(declare-fun res!985354 () Bool)

(declare-fun e!818561 () Bool)

(assert (=> b!1454502 (=> (not res!985354) (not e!818561))))

(declare-datatypes ((array!98474 0))(
  ( (array!98475 (arr!47525 (Array (_ BitVec 32) (_ BitVec 64))) (size!48075 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98474)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454502 (= res!985354 (validKeyInArray!0 (select (arr!47525 a!2862) j!93)))))

(declare-fun b!1454503 () Bool)

(declare-fun e!818558 () Bool)

(declare-fun e!818557 () Bool)

(assert (=> b!1454503 (= e!818558 (not e!818557))))

(declare-fun res!985350 () Bool)

(assert (=> b!1454503 (=> res!985350 e!818557)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454503 (= res!985350 (or (and (= (select (arr!47525 a!2862) index!646) (select (store (arr!47525 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47525 a!2862) index!646) (select (arr!47525 a!2862) j!93))) (= (select (arr!47525 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818553 () Bool)

(assert (=> b!1454503 e!818553))

(declare-fun res!985340 () Bool)

(assert (=> b!1454503 (=> (not res!985340) (not e!818553))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98474 (_ BitVec 32)) Bool)

(assert (=> b!1454503 (= res!985340 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49050 0))(
  ( (Unit!49051) )
))
(declare-fun lt!637616 () Unit!49050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49050)

(assert (=> b!1454503 (= lt!637616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454504 () Bool)

(declare-fun res!985348 () Bool)

(assert (=> b!1454504 (=> (not res!985348) (not e!818561))))

(assert (=> b!1454504 (= res!985348 (validKeyInArray!0 (select (arr!47525 a!2862) i!1006)))))

(declare-fun res!985344 () Bool)

(assert (=> start!125026 (=> (not res!985344) (not e!818561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125026 (= res!985344 (validMask!0 mask!2687))))

(assert (=> start!125026 e!818561))

(assert (=> start!125026 true))

(declare-fun array_inv!36553 (array!98474) Bool)

(assert (=> start!125026 (array_inv!36553 a!2862)))

(declare-fun b!1454505 () Bool)

(declare-fun e!818560 () Bool)

(assert (=> b!1454505 (= e!818561 e!818560)))

(declare-fun res!985337 () Bool)

(assert (=> b!1454505 (=> (not res!985337) (not e!818560))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454505 (= res!985337 (= (select (store (arr!47525 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637615 () array!98474)

(assert (=> b!1454505 (= lt!637615 (array!98475 (store (arr!47525 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48075 a!2862)))))

(declare-fun b!1454506 () Bool)

(declare-fun res!985352 () Bool)

(assert (=> b!1454506 (=> (not res!985352) (not e!818558))))

(declare-fun e!818554 () Bool)

(assert (=> b!1454506 (= res!985352 e!818554)))

(declare-fun c!134094 () Bool)

(assert (=> b!1454506 (= c!134094 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454507 () Bool)

(declare-fun res!985338 () Bool)

(assert (=> b!1454507 (=> (not res!985338) (not e!818561))))

(assert (=> b!1454507 (= res!985338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454508 () Bool)

(declare-fun res!985351 () Bool)

(assert (=> b!1454508 (=> (not res!985351) (not e!818561))))

(declare-datatypes ((List!34026 0))(
  ( (Nil!34023) (Cons!34022 (h!35372 (_ BitVec 64)) (t!48720 List!34026)) )
))
(declare-fun arrayNoDuplicates!0 (array!98474 (_ BitVec 32) List!34026) Bool)

(assert (=> b!1454508 (= res!985351 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34023))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1454509 () Bool)

(assert (=> b!1454509 (= e!818553 (and (or (= (select (arr!47525 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47525 a!2862) intermediateBeforeIndex!19) (select (arr!47525 a!2862) j!93))) (let ((bdg!53071 (select (store (arr!47525 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47525 a!2862) index!646) bdg!53071) (= (select (arr!47525 a!2862) index!646) (select (arr!47525 a!2862) j!93))) (= (select (arr!47525 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53071 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454510 () Bool)

(declare-fun res!985346 () Bool)

(assert (=> b!1454510 (=> (not res!985346) (not e!818561))))

(assert (=> b!1454510 (= res!985346 (and (= (size!48075 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48075 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48075 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454511 () Bool)

(declare-fun e!818556 () Bool)

(assert (=> b!1454511 (= e!818560 e!818556)))

(declare-fun res!985339 () Bool)

(assert (=> b!1454511 (=> (not res!985339) (not e!818556))))

(declare-datatypes ((SeekEntryResult!11777 0))(
  ( (MissingZero!11777 (index!49500 (_ BitVec 32))) (Found!11777 (index!49501 (_ BitVec 32))) (Intermediate!11777 (undefined!12589 Bool) (index!49502 (_ BitVec 32)) (x!131138 (_ BitVec 32))) (Undefined!11777) (MissingVacant!11777 (index!49503 (_ BitVec 32))) )
))
(declare-fun lt!637611 () SeekEntryResult!11777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98474 (_ BitVec 32)) SeekEntryResult!11777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454511 (= res!985339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47525 a!2862) j!93) mask!2687) (select (arr!47525 a!2862) j!93) a!2862 mask!2687) lt!637611))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454511 (= lt!637611 (Intermediate!11777 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454512 () Bool)

(declare-fun e!818559 () Bool)

(assert (=> b!1454512 (= e!818557 e!818559)))

(declare-fun res!985347 () Bool)

(assert (=> b!1454512 (=> res!985347 e!818559)))

(declare-fun lt!637612 () (_ BitVec 32))

(assert (=> b!1454512 (= res!985347 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637612 #b00000000000000000000000000000000) (bvsge lt!637612 (size!48075 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454512 (= lt!637612 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637617 () SeekEntryResult!11777)

(declare-fun lt!637614 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98474 (_ BitVec 32)) SeekEntryResult!11777)

(assert (=> b!1454512 (= lt!637617 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637614 lt!637615 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98474 (_ BitVec 32)) SeekEntryResult!11777)

(assert (=> b!1454512 (= lt!637617 (seekEntryOrOpen!0 lt!637614 lt!637615 mask!2687))))

(declare-fun b!1454513 () Bool)

(declare-fun res!985343 () Bool)

(assert (=> b!1454513 (=> (not res!985343) (not e!818561))))

(assert (=> b!1454513 (= res!985343 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48075 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48075 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48075 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454514 () Bool)

(declare-fun res!985353 () Bool)

(assert (=> b!1454514 (=> (not res!985353) (not e!818558))))

(assert (=> b!1454514 (= res!985353 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454515 () Bool)

(declare-fun res!985349 () Bool)

(assert (=> b!1454515 (=> res!985349 e!818559)))

(assert (=> b!1454515 (= res!985349 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637612 (select (arr!47525 a!2862) j!93) a!2862 mask!2687) lt!637611)))))

(declare-fun b!1454516 () Bool)

(declare-fun lt!637613 () SeekEntryResult!11777)

(assert (=> b!1454516 (= e!818554 (= lt!637613 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637614 lt!637615 mask!2687)))))

(declare-fun b!1454517 () Bool)

(declare-fun e!818552 () Bool)

(assert (=> b!1454517 (= e!818552 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637612 intermediateAfterIndex!19 lt!637614 lt!637615 mask!2687) lt!637617)))))

(declare-fun b!1454518 () Bool)

(assert (=> b!1454518 (= e!818559 true)))

(declare-fun lt!637610 () Bool)

(assert (=> b!1454518 (= lt!637610 e!818552)))

(declare-fun c!134093 () Bool)

(assert (=> b!1454518 (= c!134093 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454519 () Bool)

(declare-fun res!985341 () Bool)

(assert (=> b!1454519 (=> (not res!985341) (not e!818556))))

(assert (=> b!1454519 (= res!985341 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47525 a!2862) j!93) a!2862 mask!2687) lt!637611))))

(declare-fun b!1454520 () Bool)

(assert (=> b!1454520 (= e!818556 e!818558)))

(declare-fun res!985345 () Bool)

(assert (=> b!1454520 (=> (not res!985345) (not e!818558))))

(assert (=> b!1454520 (= res!985345 (= lt!637613 (Intermediate!11777 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454520 (= lt!637613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637614 mask!2687) lt!637614 lt!637615 mask!2687))))

(assert (=> b!1454520 (= lt!637614 (select (store (arr!47525 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454521 () Bool)

(assert (=> b!1454521 (= e!818554 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637614 lt!637615 mask!2687) (seekEntryOrOpen!0 lt!637614 lt!637615 mask!2687)))))

(declare-fun b!1454522 () Bool)

(assert (=> b!1454522 (= e!818552 (not (= lt!637613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637612 lt!637614 lt!637615 mask!2687))))))

(declare-fun b!1454523 () Bool)

(declare-fun res!985342 () Bool)

(assert (=> b!1454523 (=> (not res!985342) (not e!818553))))

(assert (=> b!1454523 (= res!985342 (= (seekEntryOrOpen!0 (select (arr!47525 a!2862) j!93) a!2862 mask!2687) (Found!11777 j!93)))))

(assert (= (and start!125026 res!985344) b!1454510))

(assert (= (and b!1454510 res!985346) b!1454504))

(assert (= (and b!1454504 res!985348) b!1454502))

(assert (= (and b!1454502 res!985354) b!1454507))

(assert (= (and b!1454507 res!985338) b!1454508))

(assert (= (and b!1454508 res!985351) b!1454513))

(assert (= (and b!1454513 res!985343) b!1454505))

(assert (= (and b!1454505 res!985337) b!1454511))

(assert (= (and b!1454511 res!985339) b!1454519))

(assert (= (and b!1454519 res!985341) b!1454520))

(assert (= (and b!1454520 res!985345) b!1454506))

(assert (= (and b!1454506 c!134094) b!1454516))

(assert (= (and b!1454506 (not c!134094)) b!1454521))

(assert (= (and b!1454506 res!985352) b!1454514))

(assert (= (and b!1454514 res!985353) b!1454503))

(assert (= (and b!1454503 res!985340) b!1454523))

(assert (= (and b!1454523 res!985342) b!1454509))

(assert (= (and b!1454503 (not res!985350)) b!1454512))

(assert (= (and b!1454512 (not res!985347)) b!1454515))

(assert (= (and b!1454515 (not res!985349)) b!1454518))

(assert (= (and b!1454518 c!134093) b!1454522))

(assert (= (and b!1454518 (not c!134093)) b!1454517))

(declare-fun m!1342837 () Bool)

(assert (=> b!1454504 m!1342837))

(assert (=> b!1454504 m!1342837))

(declare-fun m!1342839 () Bool)

(assert (=> b!1454504 m!1342839))

(declare-fun m!1342841 () Bool)

(assert (=> b!1454508 m!1342841))

(declare-fun m!1342843 () Bool)

(assert (=> b!1454512 m!1342843))

(declare-fun m!1342845 () Bool)

(assert (=> b!1454512 m!1342845))

(declare-fun m!1342847 () Bool)

(assert (=> b!1454512 m!1342847))

(declare-fun m!1342849 () Bool)

(assert (=> b!1454505 m!1342849))

(declare-fun m!1342851 () Bool)

(assert (=> b!1454505 m!1342851))

(declare-fun m!1342853 () Bool)

(assert (=> b!1454523 m!1342853))

(assert (=> b!1454523 m!1342853))

(declare-fun m!1342855 () Bool)

(assert (=> b!1454523 m!1342855))

(declare-fun m!1342857 () Bool)

(assert (=> b!1454520 m!1342857))

(assert (=> b!1454520 m!1342857))

(declare-fun m!1342859 () Bool)

(assert (=> b!1454520 m!1342859))

(assert (=> b!1454520 m!1342849))

(declare-fun m!1342861 () Bool)

(assert (=> b!1454520 m!1342861))

(declare-fun m!1342863 () Bool)

(assert (=> start!125026 m!1342863))

(declare-fun m!1342865 () Bool)

(assert (=> start!125026 m!1342865))

(assert (=> b!1454511 m!1342853))

(assert (=> b!1454511 m!1342853))

(declare-fun m!1342867 () Bool)

(assert (=> b!1454511 m!1342867))

(assert (=> b!1454511 m!1342867))

(assert (=> b!1454511 m!1342853))

(declare-fun m!1342869 () Bool)

(assert (=> b!1454511 m!1342869))

(assert (=> b!1454502 m!1342853))

(assert (=> b!1454502 m!1342853))

(declare-fun m!1342871 () Bool)

(assert (=> b!1454502 m!1342871))

(declare-fun m!1342873 () Bool)

(assert (=> b!1454516 m!1342873))

(declare-fun m!1342875 () Bool)

(assert (=> b!1454522 m!1342875))

(assert (=> b!1454509 m!1342849))

(declare-fun m!1342877 () Bool)

(assert (=> b!1454509 m!1342877))

(declare-fun m!1342879 () Bool)

(assert (=> b!1454509 m!1342879))

(declare-fun m!1342881 () Bool)

(assert (=> b!1454509 m!1342881))

(assert (=> b!1454509 m!1342853))

(declare-fun m!1342883 () Bool)

(assert (=> b!1454517 m!1342883))

(assert (=> b!1454521 m!1342845))

(assert (=> b!1454521 m!1342847))

(declare-fun m!1342885 () Bool)

(assert (=> b!1454503 m!1342885))

(assert (=> b!1454503 m!1342849))

(assert (=> b!1454503 m!1342879))

(assert (=> b!1454503 m!1342881))

(declare-fun m!1342887 () Bool)

(assert (=> b!1454503 m!1342887))

(assert (=> b!1454503 m!1342853))

(assert (=> b!1454515 m!1342853))

(assert (=> b!1454515 m!1342853))

(declare-fun m!1342889 () Bool)

(assert (=> b!1454515 m!1342889))

(assert (=> b!1454519 m!1342853))

(assert (=> b!1454519 m!1342853))

(declare-fun m!1342891 () Bool)

(assert (=> b!1454519 m!1342891))

(declare-fun m!1342893 () Bool)

(assert (=> b!1454507 m!1342893))

(push 1)

