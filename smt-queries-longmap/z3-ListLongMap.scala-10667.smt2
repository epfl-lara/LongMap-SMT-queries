; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125142 () Bool)

(assert start!125142)

(declare-fun b!1458330 () Bool)

(declare-fun res!988480 () Bool)

(declare-fun e!820297 () Bool)

(assert (=> b!1458330 (=> (not res!988480) (not e!820297))))

(declare-datatypes ((array!98590 0))(
  ( (array!98591 (arr!47583 (Array (_ BitVec 32) (_ BitVec 64))) (size!48133 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98590)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98590 (_ BitVec 32)) Bool)

(assert (=> b!1458330 (= res!988480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!639004 () array!98590)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!820292 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639003 () (_ BitVec 64))

(declare-fun b!1458331 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11835 0))(
  ( (MissingZero!11835 (index!49732 (_ BitVec 32))) (Found!11835 (index!49733 (_ BitVec 32))) (Intermediate!11835 (undefined!12647 Bool) (index!49734 (_ BitVec 32)) (x!131348 (_ BitVec 32))) (Undefined!11835) (MissingVacant!11835 (index!49735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11835)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11835)

(assert (=> b!1458331 (= e!820292 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639003 lt!639004 mask!2687) (seekEntryOrOpen!0 lt!639003 lt!639004 mask!2687)))))

(declare-fun b!1458332 () Bool)

(declare-fun e!820298 () Bool)

(declare-fun lt!639009 () (_ BitVec 32))

(declare-fun lt!639007 () SeekEntryResult!11835)

(assert (=> b!1458332 (= e!820298 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639009 intermediateAfterIndex!19 lt!639003 lt!639004 mask!2687) lt!639007)))))

(declare-fun b!1458333 () Bool)

(declare-fun res!988478 () Bool)

(assert (=> b!1458333 (=> (not res!988478) (not e!820297))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458333 (= res!988478 (validKeyInArray!0 (select (arr!47583 a!2862) i!1006)))))

(declare-fun b!1458335 () Bool)

(declare-fun res!988481 () Bool)

(declare-fun e!820301 () Bool)

(assert (=> b!1458335 (=> (not res!988481) (not e!820301))))

(assert (=> b!1458335 (= res!988481 e!820292)))

(declare-fun c!134441 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458335 (= c!134441 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458336 () Bool)

(declare-fun res!988469 () Bool)

(assert (=> b!1458336 (=> (not res!988469) (not e!820297))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458336 (= res!988469 (and (= (size!48133 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48133 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48133 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458337 () Bool)

(declare-fun e!820293 () Bool)

(assert (=> b!1458337 (= e!820297 e!820293)))

(declare-fun res!988470 () Bool)

(assert (=> b!1458337 (=> (not res!988470) (not e!820293))))

(assert (=> b!1458337 (= res!988470 (= (select (store (arr!47583 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458337 (= lt!639004 (array!98591 (store (arr!47583 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48133 a!2862)))))

(declare-fun b!1458338 () Bool)

(declare-fun res!988477 () Bool)

(declare-fun e!820299 () Bool)

(assert (=> b!1458338 (=> (not res!988477) (not e!820299))))

(declare-fun lt!639006 () SeekEntryResult!11835)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11835)

(assert (=> b!1458338 (= res!988477 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47583 a!2862) j!93) a!2862 mask!2687) lt!639006))))

(declare-fun b!1458339 () Bool)

(declare-fun res!988475 () Bool)

(assert (=> b!1458339 (=> (not res!988475) (not e!820297))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458339 (= res!988475 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48133 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48133 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48133 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458340 () Bool)

(declare-fun lt!639002 () SeekEntryResult!11835)

(assert (=> b!1458340 (= e!820298 (not (= lt!639002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639009 lt!639003 lt!639004 mask!2687))))))

(declare-fun b!1458341 () Bool)

(assert (=> b!1458341 (= e!820299 e!820301)))

(declare-fun res!988483 () Bool)

(assert (=> b!1458341 (=> (not res!988483) (not e!820301))))

(assert (=> b!1458341 (= res!988483 (= lt!639002 (Intermediate!11835 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458341 (= lt!639002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639003 mask!2687) lt!639003 lt!639004 mask!2687))))

(assert (=> b!1458341 (= lt!639003 (select (store (arr!47583 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458342 () Bool)

(declare-fun e!820295 () Bool)

(assert (=> b!1458342 (= e!820295 true)))

(declare-fun lt!639005 () Bool)

(assert (=> b!1458342 (= lt!639005 e!820298)))

(declare-fun c!134442 () Bool)

(assert (=> b!1458342 (= c!134442 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458343 () Bool)

(assert (=> b!1458343 (= e!820293 e!820299)))

(declare-fun res!988473 () Bool)

(assert (=> b!1458343 (=> (not res!988473) (not e!820299))))

(assert (=> b!1458343 (= res!988473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47583 a!2862) j!93) mask!2687) (select (arr!47583 a!2862) j!93) a!2862 mask!2687) lt!639006))))

(assert (=> b!1458343 (= lt!639006 (Intermediate!11835 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458344 () Bool)

(declare-fun res!988479 () Bool)

(declare-fun e!820296 () Bool)

(assert (=> b!1458344 (=> (not res!988479) (not e!820296))))

(assert (=> b!1458344 (= res!988479 (= (seekEntryOrOpen!0 (select (arr!47583 a!2862) j!93) a!2862 mask!2687) (Found!11835 j!93)))))

(declare-fun b!1458345 () Bool)

(declare-fun res!988486 () Bool)

(assert (=> b!1458345 (=> (not res!988486) (not e!820297))))

(declare-datatypes ((List!34084 0))(
  ( (Nil!34081) (Cons!34080 (h!35430 (_ BitVec 64)) (t!48778 List!34084)) )
))
(declare-fun arrayNoDuplicates!0 (array!98590 (_ BitVec 32) List!34084) Bool)

(assert (=> b!1458345 (= res!988486 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34081))))

(declare-fun b!1458346 () Bool)

(assert (=> b!1458346 (= e!820292 (= lt!639002 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639003 lt!639004 mask!2687)))))

(declare-fun res!988474 () Bool)

(assert (=> start!125142 (=> (not res!988474) (not e!820297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125142 (= res!988474 (validMask!0 mask!2687))))

(assert (=> start!125142 e!820297))

(assert (=> start!125142 true))

(declare-fun array_inv!36611 (array!98590) Bool)

(assert (=> start!125142 (array_inv!36611 a!2862)))

(declare-fun b!1458334 () Bool)

(declare-fun res!988484 () Bool)

(assert (=> b!1458334 (=> (not res!988484) (not e!820301))))

(assert (=> b!1458334 (= res!988484 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458347 () Bool)

(declare-fun e!820294 () Bool)

(assert (=> b!1458347 (= e!820294 e!820295)))

(declare-fun res!988476 () Bool)

(assert (=> b!1458347 (=> res!988476 e!820295)))

(assert (=> b!1458347 (= res!988476 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639009 #b00000000000000000000000000000000) (bvsge lt!639009 (size!48133 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458347 (= lt!639009 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458347 (= lt!639007 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639003 lt!639004 mask!2687))))

(assert (=> b!1458347 (= lt!639007 (seekEntryOrOpen!0 lt!639003 lt!639004 mask!2687))))

(declare-fun b!1458348 () Bool)

(assert (=> b!1458348 (= e!820301 (not e!820294))))

(declare-fun res!988482 () Bool)

(assert (=> b!1458348 (=> res!988482 e!820294)))

(assert (=> b!1458348 (= res!988482 (or (and (= (select (arr!47583 a!2862) index!646) (select (store (arr!47583 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47583 a!2862) index!646) (select (arr!47583 a!2862) j!93))) (= (select (arr!47583 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458348 e!820296))

(declare-fun res!988485 () Bool)

(assert (=> b!1458348 (=> (not res!988485) (not e!820296))))

(assert (=> b!1458348 (= res!988485 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49166 0))(
  ( (Unit!49167) )
))
(declare-fun lt!639008 () Unit!49166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49166)

(assert (=> b!1458348 (= lt!639008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458349 () Bool)

(assert (=> b!1458349 (= e!820296 (and (or (= (select (arr!47583 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47583 a!2862) intermediateBeforeIndex!19) (select (arr!47583 a!2862) j!93))) (let ((bdg!53416 (select (store (arr!47583 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47583 a!2862) index!646) bdg!53416) (= (select (arr!47583 a!2862) index!646) (select (arr!47583 a!2862) j!93))) (= (select (arr!47583 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53416 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458350 () Bool)

(declare-fun res!988471 () Bool)

(assert (=> b!1458350 (=> res!988471 e!820295)))

(assert (=> b!1458350 (= res!988471 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639009 (select (arr!47583 a!2862) j!93) a!2862 mask!2687) lt!639006)))))

(declare-fun b!1458351 () Bool)

(declare-fun res!988472 () Bool)

(assert (=> b!1458351 (=> (not res!988472) (not e!820297))))

(assert (=> b!1458351 (= res!988472 (validKeyInArray!0 (select (arr!47583 a!2862) j!93)))))

(assert (= (and start!125142 res!988474) b!1458336))

(assert (= (and b!1458336 res!988469) b!1458333))

(assert (= (and b!1458333 res!988478) b!1458351))

(assert (= (and b!1458351 res!988472) b!1458330))

(assert (= (and b!1458330 res!988480) b!1458345))

(assert (= (and b!1458345 res!988486) b!1458339))

(assert (= (and b!1458339 res!988475) b!1458337))

(assert (= (and b!1458337 res!988470) b!1458343))

(assert (= (and b!1458343 res!988473) b!1458338))

(assert (= (and b!1458338 res!988477) b!1458341))

(assert (= (and b!1458341 res!988483) b!1458335))

(assert (= (and b!1458335 c!134441) b!1458346))

(assert (= (and b!1458335 (not c!134441)) b!1458331))

(assert (= (and b!1458335 res!988481) b!1458334))

(assert (= (and b!1458334 res!988484) b!1458348))

(assert (= (and b!1458348 res!988485) b!1458344))

(assert (= (and b!1458344 res!988479) b!1458349))

(assert (= (and b!1458348 (not res!988482)) b!1458347))

(assert (= (and b!1458347 (not res!988476)) b!1458350))

(assert (= (and b!1458350 (not res!988471)) b!1458342))

(assert (= (and b!1458342 c!134442) b!1458340))

(assert (= (and b!1458342 (not c!134442)) b!1458332))

(declare-fun m!1346201 () Bool)

(assert (=> b!1458341 m!1346201))

(assert (=> b!1458341 m!1346201))

(declare-fun m!1346203 () Bool)

(assert (=> b!1458341 m!1346203))

(declare-fun m!1346205 () Bool)

(assert (=> b!1458341 m!1346205))

(declare-fun m!1346207 () Bool)

(assert (=> b!1458341 m!1346207))

(declare-fun m!1346209 () Bool)

(assert (=> b!1458332 m!1346209))

(declare-fun m!1346211 () Bool)

(assert (=> b!1458338 m!1346211))

(assert (=> b!1458338 m!1346211))

(declare-fun m!1346213 () Bool)

(assert (=> b!1458338 m!1346213))

(declare-fun m!1346215 () Bool)

(assert (=> b!1458346 m!1346215))

(declare-fun m!1346217 () Bool)

(assert (=> b!1458331 m!1346217))

(declare-fun m!1346219 () Bool)

(assert (=> b!1458331 m!1346219))

(assert (=> b!1458343 m!1346211))

(assert (=> b!1458343 m!1346211))

(declare-fun m!1346221 () Bool)

(assert (=> b!1458343 m!1346221))

(assert (=> b!1458343 m!1346221))

(assert (=> b!1458343 m!1346211))

(declare-fun m!1346223 () Bool)

(assert (=> b!1458343 m!1346223))

(assert (=> b!1458337 m!1346205))

(declare-fun m!1346225 () Bool)

(assert (=> b!1458337 m!1346225))

(declare-fun m!1346227 () Bool)

(assert (=> b!1458347 m!1346227))

(assert (=> b!1458347 m!1346217))

(assert (=> b!1458347 m!1346219))

(assert (=> b!1458350 m!1346211))

(assert (=> b!1458350 m!1346211))

(declare-fun m!1346229 () Bool)

(assert (=> b!1458350 m!1346229))

(declare-fun m!1346231 () Bool)

(assert (=> b!1458345 m!1346231))

(declare-fun m!1346233 () Bool)

(assert (=> b!1458340 m!1346233))

(assert (=> b!1458351 m!1346211))

(assert (=> b!1458351 m!1346211))

(declare-fun m!1346235 () Bool)

(assert (=> b!1458351 m!1346235))

(assert (=> b!1458344 m!1346211))

(assert (=> b!1458344 m!1346211))

(declare-fun m!1346237 () Bool)

(assert (=> b!1458344 m!1346237))

(declare-fun m!1346239 () Bool)

(assert (=> b!1458348 m!1346239))

(assert (=> b!1458348 m!1346205))

(declare-fun m!1346241 () Bool)

(assert (=> b!1458348 m!1346241))

(declare-fun m!1346243 () Bool)

(assert (=> b!1458348 m!1346243))

(declare-fun m!1346245 () Bool)

(assert (=> b!1458348 m!1346245))

(assert (=> b!1458348 m!1346211))

(assert (=> b!1458349 m!1346205))

(declare-fun m!1346247 () Bool)

(assert (=> b!1458349 m!1346247))

(assert (=> b!1458349 m!1346241))

(assert (=> b!1458349 m!1346243))

(assert (=> b!1458349 m!1346211))

(declare-fun m!1346249 () Bool)

(assert (=> start!125142 m!1346249))

(declare-fun m!1346251 () Bool)

(assert (=> start!125142 m!1346251))

(declare-fun m!1346253 () Bool)

(assert (=> b!1458333 m!1346253))

(assert (=> b!1458333 m!1346253))

(declare-fun m!1346255 () Bool)

(assert (=> b!1458333 m!1346255))

(declare-fun m!1346257 () Bool)

(assert (=> b!1458330 m!1346257))

(check-sat (not b!1458348) (not b!1458350) (not b!1458331) (not b!1458345) (not start!125142) (not b!1458341) (not b!1458338) (not b!1458347) (not b!1458330) (not b!1458333) (not b!1458351) (not b!1458346) (not b!1458343) (not b!1458332) (not b!1458344) (not b!1458340))
(check-sat)
