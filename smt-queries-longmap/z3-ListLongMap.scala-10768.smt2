; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126204 () Bool)

(assert start!126204)

(declare-fun b!1476376 () Bool)

(declare-fun res!1002462 () Bool)

(declare-fun e!828435 () Bool)

(assert (=> b!1476376 (=> (not res!1002462) (not e!828435))))

(declare-datatypes ((array!99319 0))(
  ( (array!99320 (arr!47938 (Array (_ BitVec 32) (_ BitVec 64))) (size!48489 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99319)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99319 (_ BitVec 32)) Bool)

(assert (=> b!1476376 (= res!1002462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476377 () Bool)

(declare-fun res!1002460 () Bool)

(assert (=> b!1476377 (=> (not res!1002460) (not e!828435))))

(declare-datatypes ((List!34426 0))(
  ( (Nil!34423) (Cons!34422 (h!35795 (_ BitVec 64)) (t!49112 List!34426)) )
))
(declare-fun arrayNoDuplicates!0 (array!99319 (_ BitVec 32) List!34426) Bool)

(assert (=> b!1476377 (= res!1002460 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34423))))

(declare-fun b!1476378 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644959 () (_ BitVec 64))

(declare-fun lt!644957 () array!99319)

(declare-fun e!828431 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12075 0))(
  ( (MissingZero!12075 (index!50692 (_ BitVec 32))) (Found!12075 (index!50693 (_ BitVec 32))) (Intermediate!12075 (undefined!12887 Bool) (index!50694 (_ BitVec 32)) (x!132456 (_ BitVec 32))) (Undefined!12075) (MissingVacant!12075 (index!50695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99319 (_ BitVec 32)) SeekEntryResult!12075)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99319 (_ BitVec 32)) SeekEntryResult!12075)

(assert (=> b!1476378 (= e!828431 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644959 lt!644957 mask!2687) (seekEntryOrOpen!0 lt!644959 lt!644957 mask!2687)))))

(declare-fun b!1476380 () Bool)

(declare-fun res!1002467 () Bool)

(assert (=> b!1476380 (=> (not res!1002467) (not e!828435))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476380 (= res!1002467 (and (= (size!48489 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48489 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48489 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476381 () Bool)

(declare-fun res!1002461 () Bool)

(assert (=> b!1476381 (=> (not res!1002461) (not e!828435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476381 (= res!1002461 (validKeyInArray!0 (select (arr!47938 a!2862) j!93)))))

(declare-fun b!1476382 () Bool)

(declare-fun res!1002463 () Bool)

(declare-fun e!828429 () Bool)

(assert (=> b!1476382 (=> (not res!1002463) (not e!828429))))

(declare-fun lt!644960 () SeekEntryResult!12075)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99319 (_ BitVec 32)) SeekEntryResult!12075)

(assert (=> b!1476382 (= res!1002463 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!644960))))

(declare-fun b!1476383 () Bool)

(declare-fun e!828432 () Bool)

(declare-fun lt!644962 () SeekEntryResult!12075)

(assert (=> b!1476383 (= e!828432 (= lt!644962 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476384 () Bool)

(declare-fun res!1002456 () Bool)

(declare-fun e!828430 () Bool)

(assert (=> b!1476384 (=> (not res!1002456) (not e!828430))))

(assert (=> b!1476384 (= res!1002456 e!828431)))

(declare-fun c!136486 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476384 (= c!136486 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1002458 () Bool)

(assert (=> start!126204 (=> (not res!1002458) (not e!828435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126204 (= res!1002458 (validMask!0 mask!2687))))

(assert (=> start!126204 e!828435))

(assert (=> start!126204 true))

(declare-fun array_inv!37219 (array!99319) Bool)

(assert (=> start!126204 (array_inv!37219 a!2862)))

(declare-fun b!1476379 () Bool)

(declare-fun e!828433 () Bool)

(assert (=> b!1476379 (= e!828435 e!828433)))

(declare-fun res!1002464 () Bool)

(assert (=> b!1476379 (=> (not res!1002464) (not e!828433))))

(assert (=> b!1476379 (= res!1002464 (= (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476379 (= lt!644957 (array!99320 (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48489 a!2862)))))

(declare-fun b!1476385 () Bool)

(declare-fun res!1002459 () Bool)

(assert (=> b!1476385 (=> (not res!1002459) (not e!828435))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476385 (= res!1002459 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48489 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48489 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48489 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476386 () Bool)

(assert (=> b!1476386 (= e!828429 e!828430)))

(declare-fun res!1002455 () Bool)

(assert (=> b!1476386 (=> (not res!1002455) (not e!828430))))

(declare-fun lt!644961 () SeekEntryResult!12075)

(assert (=> b!1476386 (= res!1002455 (= lt!644961 (Intermediate!12075 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476386 (= lt!644961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644959 mask!2687) lt!644959 lt!644957 mask!2687))))

(assert (=> b!1476386 (= lt!644959 (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476387 () Bool)

(declare-fun res!1002466 () Bool)

(assert (=> b!1476387 (=> (not res!1002466) (not e!828435))))

(assert (=> b!1476387 (= res!1002466 (validKeyInArray!0 (select (arr!47938 a!2862) i!1006)))))

(declare-fun b!1476388 () Bool)

(assert (=> b!1476388 (= e!828431 (= lt!644961 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644959 lt!644957 mask!2687)))))

(declare-fun b!1476389 () Bool)

(assert (=> b!1476389 (= e!828430 (not e!828432))))

(declare-fun res!1002454 () Bool)

(assert (=> b!1476389 (=> res!1002454 e!828432)))

(assert (=> b!1476389 (= res!1002454 (or (and (= (select (arr!47938 a!2862) index!646) (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47938 a!2862) index!646) (select (arr!47938 a!2862) j!93))) (not (= (select (arr!47938 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1476389 (and (= lt!644962 (Found!12075 j!93)) (or (= (select (arr!47938 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47938 a!2862) intermediateBeforeIndex!19) (select (arr!47938 a!2862) j!93))))))

(assert (=> b!1476389 (= lt!644962 (seekEntryOrOpen!0 (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476389 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49523 0))(
  ( (Unit!49524) )
))
(declare-fun lt!644958 () Unit!49523)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49523)

(assert (=> b!1476389 (= lt!644958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476390 () Bool)

(assert (=> b!1476390 (= e!828433 e!828429)))

(declare-fun res!1002457 () Bool)

(assert (=> b!1476390 (=> (not res!1002457) (not e!828429))))

(assert (=> b!1476390 (= res!1002457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!644960))))

(assert (=> b!1476390 (= lt!644960 (Intermediate!12075 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476391 () Bool)

(declare-fun res!1002465 () Bool)

(assert (=> b!1476391 (=> (not res!1002465) (not e!828430))))

(assert (=> b!1476391 (= res!1002465 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126204 res!1002458) b!1476380))

(assert (= (and b!1476380 res!1002467) b!1476387))

(assert (= (and b!1476387 res!1002466) b!1476381))

(assert (= (and b!1476381 res!1002461) b!1476376))

(assert (= (and b!1476376 res!1002462) b!1476377))

(assert (= (and b!1476377 res!1002460) b!1476385))

(assert (= (and b!1476385 res!1002459) b!1476379))

(assert (= (and b!1476379 res!1002464) b!1476390))

(assert (= (and b!1476390 res!1002457) b!1476382))

(assert (= (and b!1476382 res!1002463) b!1476386))

(assert (= (and b!1476386 res!1002455) b!1476384))

(assert (= (and b!1476384 c!136486) b!1476388))

(assert (= (and b!1476384 (not c!136486)) b!1476378))

(assert (= (and b!1476384 res!1002456) b!1476391))

(assert (= (and b!1476391 res!1002465) b!1476389))

(assert (= (and b!1476389 (not res!1002454)) b!1476383))

(declare-fun m!1362781 () Bool)

(assert (=> b!1476383 m!1362781))

(assert (=> b!1476383 m!1362781))

(declare-fun m!1362783 () Bool)

(assert (=> b!1476383 m!1362783))

(declare-fun m!1362785 () Bool)

(assert (=> b!1476387 m!1362785))

(assert (=> b!1476387 m!1362785))

(declare-fun m!1362787 () Bool)

(assert (=> b!1476387 m!1362787))

(assert (=> b!1476382 m!1362781))

(assert (=> b!1476382 m!1362781))

(declare-fun m!1362789 () Bool)

(assert (=> b!1476382 m!1362789))

(declare-fun m!1362791 () Bool)

(assert (=> start!126204 m!1362791))

(declare-fun m!1362793 () Bool)

(assert (=> start!126204 m!1362793))

(declare-fun m!1362795 () Bool)

(assert (=> b!1476377 m!1362795))

(declare-fun m!1362797 () Bool)

(assert (=> b!1476378 m!1362797))

(declare-fun m!1362799 () Bool)

(assert (=> b!1476378 m!1362799))

(declare-fun m!1362801 () Bool)

(assert (=> b!1476379 m!1362801))

(declare-fun m!1362803 () Bool)

(assert (=> b!1476379 m!1362803))

(assert (=> b!1476390 m!1362781))

(assert (=> b!1476390 m!1362781))

(declare-fun m!1362805 () Bool)

(assert (=> b!1476390 m!1362805))

(assert (=> b!1476390 m!1362805))

(assert (=> b!1476390 m!1362781))

(declare-fun m!1362807 () Bool)

(assert (=> b!1476390 m!1362807))

(declare-fun m!1362809 () Bool)

(assert (=> b!1476389 m!1362809))

(assert (=> b!1476389 m!1362801))

(declare-fun m!1362811 () Bool)

(assert (=> b!1476389 m!1362811))

(declare-fun m!1362813 () Bool)

(assert (=> b!1476389 m!1362813))

(declare-fun m!1362815 () Bool)

(assert (=> b!1476389 m!1362815))

(assert (=> b!1476389 m!1362781))

(declare-fun m!1362817 () Bool)

(assert (=> b!1476389 m!1362817))

(declare-fun m!1362819 () Bool)

(assert (=> b!1476389 m!1362819))

(assert (=> b!1476389 m!1362781))

(declare-fun m!1362821 () Bool)

(assert (=> b!1476386 m!1362821))

(assert (=> b!1476386 m!1362821))

(declare-fun m!1362823 () Bool)

(assert (=> b!1476386 m!1362823))

(assert (=> b!1476386 m!1362801))

(declare-fun m!1362825 () Bool)

(assert (=> b!1476386 m!1362825))

(declare-fun m!1362827 () Bool)

(assert (=> b!1476376 m!1362827))

(assert (=> b!1476381 m!1362781))

(assert (=> b!1476381 m!1362781))

(declare-fun m!1362829 () Bool)

(assert (=> b!1476381 m!1362829))

(declare-fun m!1362831 () Bool)

(assert (=> b!1476388 m!1362831))

(check-sat (not b!1476387) (not b!1476382) (not start!126204) (not b!1476389) (not b!1476377) (not b!1476388) (not b!1476378) (not b!1476381) (not b!1476383) (not b!1476386) (not b!1476390) (not b!1476376))
(check-sat)
(get-model)

(declare-fun d!156147 () Bool)

(assert (=> d!156147 (= (validKeyInArray!0 (select (arr!47938 a!2862) j!93)) (and (not (= (select (arr!47938 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47938 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1476381 d!156147))

(declare-fun b!1476506 () Bool)

(declare-fun e!828488 () Bool)

(declare-fun lt!645003 () SeekEntryResult!12075)

(assert (=> b!1476506 (= e!828488 (bvsge (x!132456 lt!645003) #b01111111111111111111111111111110))))

(declare-fun b!1476507 () Bool)

(declare-fun e!828490 () SeekEntryResult!12075)

(assert (=> b!1476507 (= e!828490 (Intermediate!12075 true index!646 x!665))))

(declare-fun b!1476508 () Bool)

(declare-fun e!828489 () SeekEntryResult!12075)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476508 (= e!828489 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476509 () Bool)

(assert (=> b!1476509 (and (bvsge (index!50694 lt!645003) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645003) (size!48489 a!2862)))))

(declare-fun e!828491 () Bool)

(assert (=> b!1476509 (= e!828491 (= (select (arr!47938 a!2862) (index!50694 lt!645003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156149 () Bool)

(assert (=> d!156149 e!828488))

(declare-fun c!136500 () Bool)

(get-info :version)

(assert (=> d!156149 (= c!136500 (and ((_ is Intermediate!12075) lt!645003) (undefined!12887 lt!645003)))))

(assert (=> d!156149 (= lt!645003 e!828490)))

(declare-fun c!136499 () Bool)

(assert (=> d!156149 (= c!136499 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645004 () (_ BitVec 64))

(assert (=> d!156149 (= lt!645004 (select (arr!47938 a!2862) index!646))))

(assert (=> d!156149 (validMask!0 mask!2687)))

(assert (=> d!156149 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645003)))

(declare-fun b!1476510 () Bool)

(assert (=> b!1476510 (= e!828490 e!828489)))

(declare-fun c!136501 () Bool)

(assert (=> b!1476510 (= c!136501 (or (= lt!645004 (select (arr!47938 a!2862) j!93)) (= (bvadd lt!645004 lt!645004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476511 () Bool)

(assert (=> b!1476511 (= e!828489 (Intermediate!12075 false index!646 x!665))))

(declare-fun b!1476512 () Bool)

(assert (=> b!1476512 (and (bvsge (index!50694 lt!645003) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645003) (size!48489 a!2862)))))

(declare-fun res!1002558 () Bool)

(assert (=> b!1476512 (= res!1002558 (= (select (arr!47938 a!2862) (index!50694 lt!645003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476512 (=> res!1002558 e!828491)))

(declare-fun b!1476513 () Bool)

(assert (=> b!1476513 (and (bvsge (index!50694 lt!645003) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645003) (size!48489 a!2862)))))

(declare-fun res!1002560 () Bool)

(assert (=> b!1476513 (= res!1002560 (= (select (arr!47938 a!2862) (index!50694 lt!645003)) (select (arr!47938 a!2862) j!93)))))

(assert (=> b!1476513 (=> res!1002560 e!828491)))

(declare-fun e!828492 () Bool)

(assert (=> b!1476513 (= e!828492 e!828491)))

(declare-fun b!1476514 () Bool)

(assert (=> b!1476514 (= e!828488 e!828492)))

(declare-fun res!1002559 () Bool)

(assert (=> b!1476514 (= res!1002559 (and ((_ is Intermediate!12075) lt!645003) (not (undefined!12887 lt!645003)) (bvslt (x!132456 lt!645003) #b01111111111111111111111111111110) (bvsge (x!132456 lt!645003) #b00000000000000000000000000000000) (bvsge (x!132456 lt!645003) x!665)))))

(assert (=> b!1476514 (=> (not res!1002559) (not e!828492))))

(assert (= (and d!156149 c!136499) b!1476507))

(assert (= (and d!156149 (not c!136499)) b!1476510))

(assert (= (and b!1476510 c!136501) b!1476511))

(assert (= (and b!1476510 (not c!136501)) b!1476508))

(assert (= (and d!156149 c!136500) b!1476506))

(assert (= (and d!156149 (not c!136500)) b!1476514))

(assert (= (and b!1476514 res!1002559) b!1476513))

(assert (= (and b!1476513 (not res!1002560)) b!1476512))

(assert (= (and b!1476512 (not res!1002558)) b!1476509))

(declare-fun m!1362937 () Bool)

(assert (=> b!1476508 m!1362937))

(assert (=> b!1476508 m!1362937))

(assert (=> b!1476508 m!1362781))

(declare-fun m!1362939 () Bool)

(assert (=> b!1476508 m!1362939))

(declare-fun m!1362941 () Bool)

(assert (=> b!1476512 m!1362941))

(assert (=> d!156149 m!1362815))

(assert (=> d!156149 m!1362791))

(assert (=> b!1476509 m!1362941))

(assert (=> b!1476513 m!1362941))

(assert (=> b!1476382 d!156149))

(declare-fun b!1476528 () Bool)

(declare-fun e!828499 () SeekEntryResult!12075)

(assert (=> b!1476528 (= e!828499 Undefined!12075)))

(declare-fun b!1476529 () Bool)

(declare-fun e!828500 () SeekEntryResult!12075)

(assert (=> b!1476529 (= e!828500 (Found!12075 index!646))))

(declare-fun b!1476530 () Bool)

(declare-fun e!828501 () SeekEntryResult!12075)

(assert (=> b!1476530 (= e!828501 (MissingVacant!12075 intermediateAfterIndex!19))))

(declare-fun b!1476531 () Bool)

(assert (=> b!1476531 (= e!828501 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!644959 lt!644957 mask!2687))))

(declare-fun b!1476532 () Bool)

(declare-fun c!136510 () Bool)

(declare-fun lt!645009 () (_ BitVec 64))

(assert (=> b!1476532 (= c!136510 (= lt!645009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476532 (= e!828500 e!828501)))

(declare-fun d!156151 () Bool)

(declare-fun lt!645010 () SeekEntryResult!12075)

(assert (=> d!156151 (and (or ((_ is Undefined!12075) lt!645010) (not ((_ is Found!12075) lt!645010)) (and (bvsge (index!50693 lt!645010) #b00000000000000000000000000000000) (bvslt (index!50693 lt!645010) (size!48489 lt!644957)))) (or ((_ is Undefined!12075) lt!645010) ((_ is Found!12075) lt!645010) (not ((_ is MissingVacant!12075) lt!645010)) (not (= (index!50695 lt!645010) intermediateAfterIndex!19)) (and (bvsge (index!50695 lt!645010) #b00000000000000000000000000000000) (bvslt (index!50695 lt!645010) (size!48489 lt!644957)))) (or ((_ is Undefined!12075) lt!645010) (ite ((_ is Found!12075) lt!645010) (= (select (arr!47938 lt!644957) (index!50693 lt!645010)) lt!644959) (and ((_ is MissingVacant!12075) lt!645010) (= (index!50695 lt!645010) intermediateAfterIndex!19) (= (select (arr!47938 lt!644957) (index!50695 lt!645010)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156151 (= lt!645010 e!828499)))

(declare-fun c!136508 () Bool)

(assert (=> d!156151 (= c!136508 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156151 (= lt!645009 (select (arr!47938 lt!644957) index!646))))

(assert (=> d!156151 (validMask!0 mask!2687)))

(assert (=> d!156151 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644959 lt!644957 mask!2687) lt!645010)))

(declare-fun b!1476527 () Bool)

(assert (=> b!1476527 (= e!828499 e!828500)))

(declare-fun c!136509 () Bool)

(assert (=> b!1476527 (= c!136509 (= lt!645009 lt!644959))))

(assert (= (and d!156151 c!136508) b!1476528))

(assert (= (and d!156151 (not c!136508)) b!1476527))

(assert (= (and b!1476527 c!136509) b!1476529))

(assert (= (and b!1476527 (not c!136509)) b!1476532))

(assert (= (and b!1476532 c!136510) b!1476530))

(assert (= (and b!1476532 (not c!136510)) b!1476531))

(assert (=> b!1476531 m!1362937))

(assert (=> b!1476531 m!1362937))

(declare-fun m!1362943 () Bool)

(assert (=> b!1476531 m!1362943))

(declare-fun m!1362945 () Bool)

(assert (=> d!156151 m!1362945))

(declare-fun m!1362947 () Bool)

(assert (=> d!156151 m!1362947))

(declare-fun m!1362949 () Bool)

(assert (=> d!156151 m!1362949))

(assert (=> d!156151 m!1362791))

(assert (=> b!1476378 d!156151))

(declare-fun b!1476545 () Bool)

(declare-fun e!828510 () SeekEntryResult!12075)

(declare-fun e!828509 () SeekEntryResult!12075)

(assert (=> b!1476545 (= e!828510 e!828509)))

(declare-fun lt!645019 () (_ BitVec 64))

(declare-fun lt!645017 () SeekEntryResult!12075)

(assert (=> b!1476545 (= lt!645019 (select (arr!47938 lt!644957) (index!50694 lt!645017)))))

(declare-fun c!136517 () Bool)

(assert (=> b!1476545 (= c!136517 (= lt!645019 lt!644959))))

(declare-fun b!1476546 () Bool)

(declare-fun c!136519 () Bool)

(assert (=> b!1476546 (= c!136519 (= lt!645019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828508 () SeekEntryResult!12075)

(assert (=> b!1476546 (= e!828509 e!828508)))

(declare-fun b!1476547 () Bool)

(assert (=> b!1476547 (= e!828508 (seekKeyOrZeroReturnVacant!0 (x!132456 lt!645017) (index!50694 lt!645017) (index!50694 lt!645017) lt!644959 lt!644957 mask!2687))))

(declare-fun b!1476548 () Bool)

(assert (=> b!1476548 (= e!828508 (MissingZero!12075 (index!50694 lt!645017)))))

(declare-fun b!1476549 () Bool)

(assert (=> b!1476549 (= e!828510 Undefined!12075)))

(declare-fun b!1476550 () Bool)

(assert (=> b!1476550 (= e!828509 (Found!12075 (index!50694 lt!645017)))))

(declare-fun d!156153 () Bool)

(declare-fun lt!645018 () SeekEntryResult!12075)

(assert (=> d!156153 (and (or ((_ is Undefined!12075) lt!645018) (not ((_ is Found!12075) lt!645018)) (and (bvsge (index!50693 lt!645018) #b00000000000000000000000000000000) (bvslt (index!50693 lt!645018) (size!48489 lt!644957)))) (or ((_ is Undefined!12075) lt!645018) ((_ is Found!12075) lt!645018) (not ((_ is MissingZero!12075) lt!645018)) (and (bvsge (index!50692 lt!645018) #b00000000000000000000000000000000) (bvslt (index!50692 lt!645018) (size!48489 lt!644957)))) (or ((_ is Undefined!12075) lt!645018) ((_ is Found!12075) lt!645018) ((_ is MissingZero!12075) lt!645018) (not ((_ is MissingVacant!12075) lt!645018)) (and (bvsge (index!50695 lt!645018) #b00000000000000000000000000000000) (bvslt (index!50695 lt!645018) (size!48489 lt!644957)))) (or ((_ is Undefined!12075) lt!645018) (ite ((_ is Found!12075) lt!645018) (= (select (arr!47938 lt!644957) (index!50693 lt!645018)) lt!644959) (ite ((_ is MissingZero!12075) lt!645018) (= (select (arr!47938 lt!644957) (index!50692 lt!645018)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12075) lt!645018) (= (select (arr!47938 lt!644957) (index!50695 lt!645018)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156153 (= lt!645018 e!828510)))

(declare-fun c!136518 () Bool)

(assert (=> d!156153 (= c!136518 (and ((_ is Intermediate!12075) lt!645017) (undefined!12887 lt!645017)))))

(assert (=> d!156153 (= lt!645017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644959 mask!2687) lt!644959 lt!644957 mask!2687))))

(assert (=> d!156153 (validMask!0 mask!2687)))

(assert (=> d!156153 (= (seekEntryOrOpen!0 lt!644959 lt!644957 mask!2687) lt!645018)))

(assert (= (and d!156153 c!136518) b!1476549))

(assert (= (and d!156153 (not c!136518)) b!1476545))

(assert (= (and b!1476545 c!136517) b!1476550))

(assert (= (and b!1476545 (not c!136517)) b!1476546))

(assert (= (and b!1476546 c!136519) b!1476548))

(assert (= (and b!1476546 (not c!136519)) b!1476547))

(declare-fun m!1362951 () Bool)

(assert (=> b!1476545 m!1362951))

(declare-fun m!1362953 () Bool)

(assert (=> b!1476547 m!1362953))

(declare-fun m!1362955 () Bool)

(assert (=> d!156153 m!1362955))

(declare-fun m!1362957 () Bool)

(assert (=> d!156153 m!1362957))

(declare-fun m!1362959 () Bool)

(assert (=> d!156153 m!1362959))

(assert (=> d!156153 m!1362821))

(assert (=> d!156153 m!1362821))

(assert (=> d!156153 m!1362823))

(assert (=> d!156153 m!1362791))

(assert (=> b!1476378 d!156153))

(declare-fun b!1476551 () Bool)

(declare-fun e!828513 () SeekEntryResult!12075)

(declare-fun e!828512 () SeekEntryResult!12075)

(assert (=> b!1476551 (= e!828513 e!828512)))

(declare-fun lt!645022 () (_ BitVec 64))

(declare-fun lt!645020 () SeekEntryResult!12075)

(assert (=> b!1476551 (= lt!645022 (select (arr!47938 a!2862) (index!50694 lt!645020)))))

(declare-fun c!136520 () Bool)

(assert (=> b!1476551 (= c!136520 (= lt!645022 (select (arr!47938 a!2862) j!93)))))

(declare-fun b!1476552 () Bool)

(declare-fun c!136522 () Bool)

(assert (=> b!1476552 (= c!136522 (= lt!645022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828511 () SeekEntryResult!12075)

(assert (=> b!1476552 (= e!828512 e!828511)))

(declare-fun b!1476553 () Bool)

(assert (=> b!1476553 (= e!828511 (seekKeyOrZeroReturnVacant!0 (x!132456 lt!645020) (index!50694 lt!645020) (index!50694 lt!645020) (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476554 () Bool)

(assert (=> b!1476554 (= e!828511 (MissingZero!12075 (index!50694 lt!645020)))))

(declare-fun b!1476555 () Bool)

(assert (=> b!1476555 (= e!828513 Undefined!12075)))

(declare-fun b!1476556 () Bool)

(assert (=> b!1476556 (= e!828512 (Found!12075 (index!50694 lt!645020)))))

(declare-fun d!156155 () Bool)

(declare-fun lt!645021 () SeekEntryResult!12075)

(assert (=> d!156155 (and (or ((_ is Undefined!12075) lt!645021) (not ((_ is Found!12075) lt!645021)) (and (bvsge (index!50693 lt!645021) #b00000000000000000000000000000000) (bvslt (index!50693 lt!645021) (size!48489 a!2862)))) (or ((_ is Undefined!12075) lt!645021) ((_ is Found!12075) lt!645021) (not ((_ is MissingZero!12075) lt!645021)) (and (bvsge (index!50692 lt!645021) #b00000000000000000000000000000000) (bvslt (index!50692 lt!645021) (size!48489 a!2862)))) (or ((_ is Undefined!12075) lt!645021) ((_ is Found!12075) lt!645021) ((_ is MissingZero!12075) lt!645021) (not ((_ is MissingVacant!12075) lt!645021)) (and (bvsge (index!50695 lt!645021) #b00000000000000000000000000000000) (bvslt (index!50695 lt!645021) (size!48489 a!2862)))) (or ((_ is Undefined!12075) lt!645021) (ite ((_ is Found!12075) lt!645021) (= (select (arr!47938 a!2862) (index!50693 lt!645021)) (select (arr!47938 a!2862) j!93)) (ite ((_ is MissingZero!12075) lt!645021) (= (select (arr!47938 a!2862) (index!50692 lt!645021)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12075) lt!645021) (= (select (arr!47938 a!2862) (index!50695 lt!645021)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156155 (= lt!645021 e!828513)))

(declare-fun c!136521 () Bool)

(assert (=> d!156155 (= c!136521 (and ((_ is Intermediate!12075) lt!645020) (undefined!12887 lt!645020)))))

(assert (=> d!156155 (= lt!645020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156155 (validMask!0 mask!2687)))

(assert (=> d!156155 (= (seekEntryOrOpen!0 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645021)))

(assert (= (and d!156155 c!136521) b!1476555))

(assert (= (and d!156155 (not c!136521)) b!1476551))

(assert (= (and b!1476551 c!136520) b!1476556))

(assert (= (and b!1476551 (not c!136520)) b!1476552))

(assert (= (and b!1476552 c!136522) b!1476554))

(assert (= (and b!1476552 (not c!136522)) b!1476553))

(declare-fun m!1362961 () Bool)

(assert (=> b!1476551 m!1362961))

(assert (=> b!1476553 m!1362781))

(declare-fun m!1362963 () Bool)

(assert (=> b!1476553 m!1362963))

(declare-fun m!1362965 () Bool)

(assert (=> d!156155 m!1362965))

(declare-fun m!1362967 () Bool)

(assert (=> d!156155 m!1362967))

(declare-fun m!1362969 () Bool)

(assert (=> d!156155 m!1362969))

(assert (=> d!156155 m!1362781))

(assert (=> d!156155 m!1362805))

(assert (=> d!156155 m!1362805))

(assert (=> d!156155 m!1362781))

(assert (=> d!156155 m!1362807))

(assert (=> d!156155 m!1362791))

(assert (=> b!1476389 d!156155))

(declare-fun call!67854 () Bool)

(declare-fun bm!67851 () Bool)

(assert (=> bm!67851 (= call!67854 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1476565 () Bool)

(declare-fun e!828522 () Bool)

(assert (=> b!1476565 (= e!828522 call!67854)))

(declare-fun b!1476566 () Bool)

(declare-fun e!828520 () Bool)

(assert (=> b!1476566 (= e!828520 call!67854)))

(declare-fun d!156157 () Bool)

(declare-fun res!1002566 () Bool)

(declare-fun e!828521 () Bool)

(assert (=> d!156157 (=> res!1002566 e!828521)))

(assert (=> d!156157 (= res!1002566 (bvsge j!93 (size!48489 a!2862)))))

(assert (=> d!156157 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!828521)))

(declare-fun b!1476567 () Bool)

(assert (=> b!1476567 (= e!828521 e!828522)))

(declare-fun c!136525 () Bool)

(assert (=> b!1476567 (= c!136525 (validKeyInArray!0 (select (arr!47938 a!2862) j!93)))))

(declare-fun b!1476568 () Bool)

(assert (=> b!1476568 (= e!828522 e!828520)))

(declare-fun lt!645030 () (_ BitVec 64))

(assert (=> b!1476568 (= lt!645030 (select (arr!47938 a!2862) j!93))))

(declare-fun lt!645029 () Unit!49523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99319 (_ BitVec 64) (_ BitVec 32)) Unit!49523)

(assert (=> b!1476568 (= lt!645029 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645030 j!93))))

(declare-fun arrayContainsKey!0 (array!99319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1476568 (arrayContainsKey!0 a!2862 lt!645030 #b00000000000000000000000000000000)))

(declare-fun lt!645031 () Unit!49523)

(assert (=> b!1476568 (= lt!645031 lt!645029)))

(declare-fun res!1002565 () Bool)

(assert (=> b!1476568 (= res!1002565 (= (seekEntryOrOpen!0 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) (Found!12075 j!93)))))

(assert (=> b!1476568 (=> (not res!1002565) (not e!828520))))

(assert (= (and d!156157 (not res!1002566)) b!1476567))

(assert (= (and b!1476567 c!136525) b!1476568))

(assert (= (and b!1476567 (not c!136525)) b!1476565))

(assert (= (and b!1476568 res!1002565) b!1476566))

(assert (= (or b!1476566 b!1476565) bm!67851))

(declare-fun m!1362971 () Bool)

(assert (=> bm!67851 m!1362971))

(assert (=> b!1476567 m!1362781))

(assert (=> b!1476567 m!1362781))

(assert (=> b!1476567 m!1362829))

(assert (=> b!1476568 m!1362781))

(declare-fun m!1362973 () Bool)

(assert (=> b!1476568 m!1362973))

(declare-fun m!1362975 () Bool)

(assert (=> b!1476568 m!1362975))

(assert (=> b!1476568 m!1362781))

(assert (=> b!1476568 m!1362817))

(assert (=> b!1476389 d!156157))

(declare-fun d!156161 () Bool)

(assert (=> d!156161 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!645034 () Unit!49523)

(declare-fun choose!38 (array!99319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49523)

(assert (=> d!156161 (= lt!645034 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156161 (validMask!0 mask!2687)))

(assert (=> d!156161 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!645034)))

(declare-fun bs!42574 () Bool)

(assert (= bs!42574 d!156161))

(assert (=> bs!42574 m!1362819))

(declare-fun m!1362977 () Bool)

(assert (=> bs!42574 m!1362977))

(assert (=> bs!42574 m!1362791))

(assert (=> b!1476389 d!156161))

(declare-fun b!1476569 () Bool)

(declare-fun e!828523 () Bool)

(declare-fun lt!645035 () SeekEntryResult!12075)

(assert (=> b!1476569 (= e!828523 (bvsge (x!132456 lt!645035) #b01111111111111111111111111111110))))

(declare-fun e!828525 () SeekEntryResult!12075)

(declare-fun b!1476570 () Bool)

(assert (=> b!1476570 (= e!828525 (Intermediate!12075 true (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476571 () Bool)

(declare-fun e!828524 () SeekEntryResult!12075)

(assert (=> b!1476571 (= e!828524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476572 () Bool)

(assert (=> b!1476572 (and (bvsge (index!50694 lt!645035) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645035) (size!48489 a!2862)))))

(declare-fun e!828526 () Bool)

(assert (=> b!1476572 (= e!828526 (= (select (arr!47938 a!2862) (index!50694 lt!645035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156163 () Bool)

(assert (=> d!156163 e!828523))

(declare-fun c!136527 () Bool)

(assert (=> d!156163 (= c!136527 (and ((_ is Intermediate!12075) lt!645035) (undefined!12887 lt!645035)))))

(assert (=> d!156163 (= lt!645035 e!828525)))

(declare-fun c!136526 () Bool)

(assert (=> d!156163 (= c!136526 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!645036 () (_ BitVec 64))

(assert (=> d!156163 (= lt!645036 (select (arr!47938 a!2862) (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687)))))

(assert (=> d!156163 (validMask!0 mask!2687)))

(assert (=> d!156163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645035)))

(declare-fun b!1476573 () Bool)

(assert (=> b!1476573 (= e!828525 e!828524)))

(declare-fun c!136528 () Bool)

(assert (=> b!1476573 (= c!136528 (or (= lt!645036 (select (arr!47938 a!2862) j!93)) (= (bvadd lt!645036 lt!645036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476574 () Bool)

(assert (=> b!1476574 (= e!828524 (Intermediate!12075 false (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476575 () Bool)

(assert (=> b!1476575 (and (bvsge (index!50694 lt!645035) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645035) (size!48489 a!2862)))))

(declare-fun res!1002567 () Bool)

(assert (=> b!1476575 (= res!1002567 (= (select (arr!47938 a!2862) (index!50694 lt!645035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476575 (=> res!1002567 e!828526)))

(declare-fun b!1476576 () Bool)

(assert (=> b!1476576 (and (bvsge (index!50694 lt!645035) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645035) (size!48489 a!2862)))))

(declare-fun res!1002569 () Bool)

(assert (=> b!1476576 (= res!1002569 (= (select (arr!47938 a!2862) (index!50694 lt!645035)) (select (arr!47938 a!2862) j!93)))))

(assert (=> b!1476576 (=> res!1002569 e!828526)))

(declare-fun e!828527 () Bool)

(assert (=> b!1476576 (= e!828527 e!828526)))

(declare-fun b!1476577 () Bool)

(assert (=> b!1476577 (= e!828523 e!828527)))

(declare-fun res!1002568 () Bool)

(assert (=> b!1476577 (= res!1002568 (and ((_ is Intermediate!12075) lt!645035) (not (undefined!12887 lt!645035)) (bvslt (x!132456 lt!645035) #b01111111111111111111111111111110) (bvsge (x!132456 lt!645035) #b00000000000000000000000000000000) (bvsge (x!132456 lt!645035) #b00000000000000000000000000000000)))))

(assert (=> b!1476577 (=> (not res!1002568) (not e!828527))))

(assert (= (and d!156163 c!136526) b!1476570))

(assert (= (and d!156163 (not c!136526)) b!1476573))

(assert (= (and b!1476573 c!136528) b!1476574))

(assert (= (and b!1476573 (not c!136528)) b!1476571))

(assert (= (and d!156163 c!136527) b!1476569))

(assert (= (and d!156163 (not c!136527)) b!1476577))

(assert (= (and b!1476577 res!1002568) b!1476576))

(assert (= (and b!1476576 (not res!1002569)) b!1476575))

(assert (= (and b!1476575 (not res!1002567)) b!1476572))

(assert (=> b!1476571 m!1362805))

(declare-fun m!1362979 () Bool)

(assert (=> b!1476571 m!1362979))

(assert (=> b!1476571 m!1362979))

(assert (=> b!1476571 m!1362781))

(declare-fun m!1362981 () Bool)

(assert (=> b!1476571 m!1362981))

(declare-fun m!1362983 () Bool)

(assert (=> b!1476575 m!1362983))

(assert (=> d!156163 m!1362805))

(declare-fun m!1362985 () Bool)

(assert (=> d!156163 m!1362985))

(assert (=> d!156163 m!1362791))

(assert (=> b!1476572 m!1362983))

(assert (=> b!1476576 m!1362983))

(assert (=> b!1476390 d!156163))

(declare-fun d!156165 () Bool)

(declare-fun lt!645042 () (_ BitVec 32))

(declare-fun lt!645041 () (_ BitVec 32))

(assert (=> d!156165 (= lt!645042 (bvmul (bvxor lt!645041 (bvlshr lt!645041 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156165 (= lt!645041 ((_ extract 31 0) (bvand (bvxor (select (arr!47938 a!2862) j!93) (bvlshr (select (arr!47938 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156165 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002570 (let ((h!35798 ((_ extract 31 0) (bvand (bvxor (select (arr!47938 a!2862) j!93) (bvlshr (select (arr!47938 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132461 (bvmul (bvxor h!35798 (bvlshr h!35798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132461 (bvlshr x!132461 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002570 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002570 #b00000000000000000000000000000000))))))

(assert (=> d!156165 (= (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (bvand (bvxor lt!645042 (bvlshr lt!645042 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1476390 d!156165))

(declare-fun b!1476578 () Bool)

(declare-fun e!828528 () Bool)

(declare-fun lt!645043 () SeekEntryResult!12075)

(assert (=> b!1476578 (= e!828528 (bvsge (x!132456 lt!645043) #b01111111111111111111111111111110))))

(declare-fun b!1476579 () Bool)

(declare-fun e!828530 () SeekEntryResult!12075)

(assert (=> b!1476579 (= e!828530 (Intermediate!12075 true (toIndex!0 lt!644959 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476580 () Bool)

(declare-fun e!828529 () SeekEntryResult!12075)

(assert (=> b!1476580 (= e!828529 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644959 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!644959 lt!644957 mask!2687))))

(declare-fun b!1476581 () Bool)

(assert (=> b!1476581 (and (bvsge (index!50694 lt!645043) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645043) (size!48489 lt!644957)))))

(declare-fun e!828531 () Bool)

(assert (=> b!1476581 (= e!828531 (= (select (arr!47938 lt!644957) (index!50694 lt!645043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156171 () Bool)

(assert (=> d!156171 e!828528))

(declare-fun c!136530 () Bool)

(assert (=> d!156171 (= c!136530 (and ((_ is Intermediate!12075) lt!645043) (undefined!12887 lt!645043)))))

(assert (=> d!156171 (= lt!645043 e!828530)))

(declare-fun c!136529 () Bool)

(assert (=> d!156171 (= c!136529 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!645044 () (_ BitVec 64))

(assert (=> d!156171 (= lt!645044 (select (arr!47938 lt!644957) (toIndex!0 lt!644959 mask!2687)))))

(assert (=> d!156171 (validMask!0 mask!2687)))

(assert (=> d!156171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644959 mask!2687) lt!644959 lt!644957 mask!2687) lt!645043)))

(declare-fun b!1476582 () Bool)

(assert (=> b!1476582 (= e!828530 e!828529)))

(declare-fun c!136531 () Bool)

(assert (=> b!1476582 (= c!136531 (or (= lt!645044 lt!644959) (= (bvadd lt!645044 lt!645044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476583 () Bool)

(assert (=> b!1476583 (= e!828529 (Intermediate!12075 false (toIndex!0 lt!644959 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476584 () Bool)

(assert (=> b!1476584 (and (bvsge (index!50694 lt!645043) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645043) (size!48489 lt!644957)))))

(declare-fun res!1002571 () Bool)

(assert (=> b!1476584 (= res!1002571 (= (select (arr!47938 lt!644957) (index!50694 lt!645043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476584 (=> res!1002571 e!828531)))

(declare-fun b!1476585 () Bool)

(assert (=> b!1476585 (and (bvsge (index!50694 lt!645043) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645043) (size!48489 lt!644957)))))

(declare-fun res!1002573 () Bool)

(assert (=> b!1476585 (= res!1002573 (= (select (arr!47938 lt!644957) (index!50694 lt!645043)) lt!644959))))

(assert (=> b!1476585 (=> res!1002573 e!828531)))

(declare-fun e!828532 () Bool)

(assert (=> b!1476585 (= e!828532 e!828531)))

(declare-fun b!1476586 () Bool)

(assert (=> b!1476586 (= e!828528 e!828532)))

(declare-fun res!1002572 () Bool)

(assert (=> b!1476586 (= res!1002572 (and ((_ is Intermediate!12075) lt!645043) (not (undefined!12887 lt!645043)) (bvslt (x!132456 lt!645043) #b01111111111111111111111111111110) (bvsge (x!132456 lt!645043) #b00000000000000000000000000000000) (bvsge (x!132456 lt!645043) #b00000000000000000000000000000000)))))

(assert (=> b!1476586 (=> (not res!1002572) (not e!828532))))

(assert (= (and d!156171 c!136529) b!1476579))

(assert (= (and d!156171 (not c!136529)) b!1476582))

(assert (= (and b!1476582 c!136531) b!1476583))

(assert (= (and b!1476582 (not c!136531)) b!1476580))

(assert (= (and d!156171 c!136530) b!1476578))

(assert (= (and d!156171 (not c!136530)) b!1476586))

(assert (= (and b!1476586 res!1002572) b!1476585))

(assert (= (and b!1476585 (not res!1002573)) b!1476584))

(assert (= (and b!1476584 (not res!1002571)) b!1476581))

(assert (=> b!1476580 m!1362821))

(declare-fun m!1362987 () Bool)

(assert (=> b!1476580 m!1362987))

(assert (=> b!1476580 m!1362987))

(declare-fun m!1362989 () Bool)

(assert (=> b!1476580 m!1362989))

(declare-fun m!1362991 () Bool)

(assert (=> b!1476584 m!1362991))

(assert (=> d!156171 m!1362821))

(declare-fun m!1362993 () Bool)

(assert (=> d!156171 m!1362993))

(assert (=> d!156171 m!1362791))

(assert (=> b!1476581 m!1362991))

(assert (=> b!1476585 m!1362991))

(assert (=> b!1476386 d!156171))

(declare-fun d!156175 () Bool)

(declare-fun lt!645046 () (_ BitVec 32))

(declare-fun lt!645045 () (_ BitVec 32))

(assert (=> d!156175 (= lt!645046 (bvmul (bvxor lt!645045 (bvlshr lt!645045 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156175 (= lt!645045 ((_ extract 31 0) (bvand (bvxor lt!644959 (bvlshr lt!644959 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156175 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002570 (let ((h!35798 ((_ extract 31 0) (bvand (bvxor lt!644959 (bvlshr lt!644959 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132461 (bvmul (bvxor h!35798 (bvlshr h!35798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132461 (bvlshr x!132461 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002570 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002570 #b00000000000000000000000000000000))))))

(assert (=> d!156175 (= (toIndex!0 lt!644959 mask!2687) (bvand (bvxor lt!645046 (bvlshr lt!645046 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1476386 d!156175))

(declare-fun bm!67852 () Bool)

(declare-fun call!67855 () Bool)

(assert (=> bm!67852 (= call!67855 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1476587 () Bool)

(declare-fun e!828535 () Bool)

(assert (=> b!1476587 (= e!828535 call!67855)))

(declare-fun b!1476588 () Bool)

(declare-fun e!828533 () Bool)

(assert (=> b!1476588 (= e!828533 call!67855)))

(declare-fun d!156177 () Bool)

(declare-fun res!1002575 () Bool)

(declare-fun e!828534 () Bool)

(assert (=> d!156177 (=> res!1002575 e!828534)))

(assert (=> d!156177 (= res!1002575 (bvsge #b00000000000000000000000000000000 (size!48489 a!2862)))))

(assert (=> d!156177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!828534)))

(declare-fun b!1476589 () Bool)

(assert (=> b!1476589 (= e!828534 e!828535)))

(declare-fun c!136532 () Bool)

(assert (=> b!1476589 (= c!136532 (validKeyInArray!0 (select (arr!47938 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1476590 () Bool)

(assert (=> b!1476590 (= e!828535 e!828533)))

(declare-fun lt!645048 () (_ BitVec 64))

(assert (=> b!1476590 (= lt!645048 (select (arr!47938 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!645047 () Unit!49523)

(assert (=> b!1476590 (= lt!645047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645048 #b00000000000000000000000000000000))))

(assert (=> b!1476590 (arrayContainsKey!0 a!2862 lt!645048 #b00000000000000000000000000000000)))

(declare-fun lt!645049 () Unit!49523)

(assert (=> b!1476590 (= lt!645049 lt!645047)))

(declare-fun res!1002574 () Bool)

(assert (=> b!1476590 (= res!1002574 (= (seekEntryOrOpen!0 (select (arr!47938 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12075 #b00000000000000000000000000000000)))))

(assert (=> b!1476590 (=> (not res!1002574) (not e!828533))))

(assert (= (and d!156177 (not res!1002575)) b!1476589))

(assert (= (and b!1476589 c!136532) b!1476590))

(assert (= (and b!1476589 (not c!136532)) b!1476587))

(assert (= (and b!1476590 res!1002574) b!1476588))

(assert (= (or b!1476588 b!1476587) bm!67852))

(declare-fun m!1362995 () Bool)

(assert (=> bm!67852 m!1362995))

(declare-fun m!1362997 () Bool)

(assert (=> b!1476589 m!1362997))

(assert (=> b!1476589 m!1362997))

(declare-fun m!1362999 () Bool)

(assert (=> b!1476589 m!1362999))

(assert (=> b!1476590 m!1362997))

(declare-fun m!1363001 () Bool)

(assert (=> b!1476590 m!1363001))

(declare-fun m!1363003 () Bool)

(assert (=> b!1476590 m!1363003))

(assert (=> b!1476590 m!1362997))

(declare-fun m!1363005 () Bool)

(assert (=> b!1476590 m!1363005))

(assert (=> b!1476376 d!156177))

(declare-fun d!156179 () Bool)

(assert (=> d!156179 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126204 d!156179))

(declare-fun d!156183 () Bool)

(assert (=> d!156183 (= (array_inv!37219 a!2862) (bvsge (size!48489 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126204 d!156183))

(declare-fun d!156185 () Bool)

(assert (=> d!156185 (= (validKeyInArray!0 (select (arr!47938 a!2862) i!1006)) (and (not (= (select (arr!47938 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47938 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1476387 d!156185))

(declare-fun b!1476603 () Bool)

(declare-fun e!828545 () Bool)

(declare-fun lt!645059 () SeekEntryResult!12075)

(assert (=> b!1476603 (= e!828545 (bvsge (x!132456 lt!645059) #b01111111111111111111111111111110))))

(declare-fun b!1476604 () Bool)

(declare-fun e!828547 () SeekEntryResult!12075)

(assert (=> b!1476604 (= e!828547 (Intermediate!12075 true index!646 x!665))))

(declare-fun b!1476605 () Bool)

(declare-fun e!828546 () SeekEntryResult!12075)

(assert (=> b!1476605 (= e!828546 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!644959 lt!644957 mask!2687))))

(declare-fun b!1476606 () Bool)

(assert (=> b!1476606 (and (bvsge (index!50694 lt!645059) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645059) (size!48489 lt!644957)))))

(declare-fun e!828548 () Bool)

(assert (=> b!1476606 (= e!828548 (= (select (arr!47938 lt!644957) (index!50694 lt!645059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156187 () Bool)

(assert (=> d!156187 e!828545))

(declare-fun c!136537 () Bool)

(assert (=> d!156187 (= c!136537 (and ((_ is Intermediate!12075) lt!645059) (undefined!12887 lt!645059)))))

(assert (=> d!156187 (= lt!645059 e!828547)))

(declare-fun c!136536 () Bool)

(assert (=> d!156187 (= c!136536 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645060 () (_ BitVec 64))

(assert (=> d!156187 (= lt!645060 (select (arr!47938 lt!644957) index!646))))

(assert (=> d!156187 (validMask!0 mask!2687)))

(assert (=> d!156187 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644959 lt!644957 mask!2687) lt!645059)))

(declare-fun b!1476607 () Bool)

(assert (=> b!1476607 (= e!828547 e!828546)))

(declare-fun c!136538 () Bool)

(assert (=> b!1476607 (= c!136538 (or (= lt!645060 lt!644959) (= (bvadd lt!645060 lt!645060) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476608 () Bool)

(assert (=> b!1476608 (= e!828546 (Intermediate!12075 false index!646 x!665))))

(declare-fun b!1476609 () Bool)

(assert (=> b!1476609 (and (bvsge (index!50694 lt!645059) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645059) (size!48489 lt!644957)))))

(declare-fun res!1002582 () Bool)

(assert (=> b!1476609 (= res!1002582 (= (select (arr!47938 lt!644957) (index!50694 lt!645059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476609 (=> res!1002582 e!828548)))

(declare-fun b!1476610 () Bool)

(assert (=> b!1476610 (and (bvsge (index!50694 lt!645059) #b00000000000000000000000000000000) (bvslt (index!50694 lt!645059) (size!48489 lt!644957)))))

(declare-fun res!1002584 () Bool)

(assert (=> b!1476610 (= res!1002584 (= (select (arr!47938 lt!644957) (index!50694 lt!645059)) lt!644959))))

(assert (=> b!1476610 (=> res!1002584 e!828548)))

(declare-fun e!828549 () Bool)

(assert (=> b!1476610 (= e!828549 e!828548)))

(declare-fun b!1476611 () Bool)

(assert (=> b!1476611 (= e!828545 e!828549)))

(declare-fun res!1002583 () Bool)

(assert (=> b!1476611 (= res!1002583 (and ((_ is Intermediate!12075) lt!645059) (not (undefined!12887 lt!645059)) (bvslt (x!132456 lt!645059) #b01111111111111111111111111111110) (bvsge (x!132456 lt!645059) #b00000000000000000000000000000000) (bvsge (x!132456 lt!645059) x!665)))))

(assert (=> b!1476611 (=> (not res!1002583) (not e!828549))))

(assert (= (and d!156187 c!136536) b!1476604))

(assert (= (and d!156187 (not c!136536)) b!1476607))

(assert (= (and b!1476607 c!136538) b!1476608))

(assert (= (and b!1476607 (not c!136538)) b!1476605))

(assert (= (and d!156187 c!136537) b!1476603))

(assert (= (and d!156187 (not c!136537)) b!1476611))

(assert (= (and b!1476611 res!1002583) b!1476610))

(assert (= (and b!1476610 (not res!1002584)) b!1476609))

(assert (= (and b!1476609 (not res!1002582)) b!1476606))

(assert (=> b!1476605 m!1362937))

(assert (=> b!1476605 m!1362937))

(declare-fun m!1363019 () Bool)

(assert (=> b!1476605 m!1363019))

(declare-fun m!1363021 () Bool)

(assert (=> b!1476609 m!1363021))

(assert (=> d!156187 m!1362949))

(assert (=> d!156187 m!1362791))

(assert (=> b!1476606 m!1363021))

(assert (=> b!1476610 m!1363021))

(assert (=> b!1476388 d!156187))

(declare-fun d!156189 () Bool)

(declare-fun res!1002601 () Bool)

(declare-fun e!828581 () Bool)

(assert (=> d!156189 (=> res!1002601 e!828581)))

(assert (=> d!156189 (= res!1002601 (bvsge #b00000000000000000000000000000000 (size!48489 a!2862)))))

(assert (=> d!156189 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34423) e!828581)))

(declare-fun b!1476661 () Bool)

(declare-fun e!828582 () Bool)

(declare-fun call!67861 () Bool)

(assert (=> b!1476661 (= e!828582 call!67861)))

(declare-fun b!1476662 () Bool)

(declare-fun e!828579 () Bool)

(assert (=> b!1476662 (= e!828579 e!828582)))

(declare-fun c!136556 () Bool)

(assert (=> b!1476662 (= c!136556 (validKeyInArray!0 (select (arr!47938 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67858 () Bool)

(assert (=> bm!67858 (= call!67861 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136556 (Cons!34422 (select (arr!47938 a!2862) #b00000000000000000000000000000000) Nil!34423) Nil!34423)))))

(declare-fun b!1476663 () Bool)

(declare-fun e!828580 () Bool)

(declare-fun contains!9951 (List!34426 (_ BitVec 64)) Bool)

(assert (=> b!1476663 (= e!828580 (contains!9951 Nil!34423 (select (arr!47938 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1476664 () Bool)

(assert (=> b!1476664 (= e!828581 e!828579)))

(declare-fun res!1002602 () Bool)

(assert (=> b!1476664 (=> (not res!1002602) (not e!828579))))

(assert (=> b!1476664 (= res!1002602 (not e!828580))))

(declare-fun res!1002600 () Bool)

(assert (=> b!1476664 (=> (not res!1002600) (not e!828580))))

(assert (=> b!1476664 (= res!1002600 (validKeyInArray!0 (select (arr!47938 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1476665 () Bool)

(assert (=> b!1476665 (= e!828582 call!67861)))

(assert (= (and d!156189 (not res!1002601)) b!1476664))

(assert (= (and b!1476664 res!1002600) b!1476663))

(assert (= (and b!1476664 res!1002602) b!1476662))

(assert (= (and b!1476662 c!136556) b!1476665))

(assert (= (and b!1476662 (not c!136556)) b!1476661))

(assert (= (or b!1476665 b!1476661) bm!67858))

(assert (=> b!1476662 m!1362997))

(assert (=> b!1476662 m!1362997))

(assert (=> b!1476662 m!1362999))

(assert (=> bm!67858 m!1362997))

(declare-fun m!1363031 () Bool)

(assert (=> bm!67858 m!1363031))

(assert (=> b!1476663 m!1362997))

(assert (=> b!1476663 m!1362997))

(declare-fun m!1363033 () Bool)

(assert (=> b!1476663 m!1363033))

(assert (=> b!1476664 m!1362997))

(assert (=> b!1476664 m!1362997))

(assert (=> b!1476664 m!1362999))

(assert (=> b!1476377 d!156189))

(declare-fun b!1476667 () Bool)

(declare-fun e!828583 () SeekEntryResult!12075)

(assert (=> b!1476667 (= e!828583 Undefined!12075)))

(declare-fun b!1476668 () Bool)

(declare-fun e!828584 () SeekEntryResult!12075)

(assert (=> b!1476668 (= e!828584 (Found!12075 index!646))))

(declare-fun b!1476669 () Bool)

(declare-fun e!828585 () SeekEntryResult!12075)

(assert (=> b!1476669 (= e!828585 (MissingVacant!12075 index!646))))

(declare-fun b!1476670 () Bool)

(assert (=> b!1476670 (= e!828585 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1476671 () Bool)

(declare-fun c!136559 () Bool)

(declare-fun lt!645071 () (_ BitVec 64))

(assert (=> b!1476671 (= c!136559 (= lt!645071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476671 (= e!828584 e!828585)))

(declare-fun lt!645072 () SeekEntryResult!12075)

(declare-fun d!156193 () Bool)

(assert (=> d!156193 (and (or ((_ is Undefined!12075) lt!645072) (not ((_ is Found!12075) lt!645072)) (and (bvsge (index!50693 lt!645072) #b00000000000000000000000000000000) (bvslt (index!50693 lt!645072) (size!48489 a!2862)))) (or ((_ is Undefined!12075) lt!645072) ((_ is Found!12075) lt!645072) (not ((_ is MissingVacant!12075) lt!645072)) (not (= (index!50695 lt!645072) index!646)) (and (bvsge (index!50695 lt!645072) #b00000000000000000000000000000000) (bvslt (index!50695 lt!645072) (size!48489 a!2862)))) (or ((_ is Undefined!12075) lt!645072) (ite ((_ is Found!12075) lt!645072) (= (select (arr!47938 a!2862) (index!50693 lt!645072)) (select (arr!47938 a!2862) j!93)) (and ((_ is MissingVacant!12075) lt!645072) (= (index!50695 lt!645072) index!646) (= (select (arr!47938 a!2862) (index!50695 lt!645072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156193 (= lt!645072 e!828583)))

(declare-fun c!136557 () Bool)

(assert (=> d!156193 (= c!136557 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156193 (= lt!645071 (select (arr!47938 a!2862) index!646))))

(assert (=> d!156193 (validMask!0 mask!2687)))

(assert (=> d!156193 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645072)))

(declare-fun b!1476666 () Bool)

(assert (=> b!1476666 (= e!828583 e!828584)))

(declare-fun c!136558 () Bool)

(assert (=> b!1476666 (= c!136558 (= lt!645071 (select (arr!47938 a!2862) j!93)))))

(assert (= (and d!156193 c!136557) b!1476667))

(assert (= (and d!156193 (not c!136557)) b!1476666))

(assert (= (and b!1476666 c!136558) b!1476668))

(assert (= (and b!1476666 (not c!136558)) b!1476671))

(assert (= (and b!1476671 c!136559) b!1476669))

(assert (= (and b!1476671 (not c!136559)) b!1476670))

(assert (=> b!1476670 m!1362937))

(assert (=> b!1476670 m!1362937))

(assert (=> b!1476670 m!1362781))

(declare-fun m!1363035 () Bool)

(assert (=> b!1476670 m!1363035))

(declare-fun m!1363037 () Bool)

(assert (=> d!156193 m!1363037))

(declare-fun m!1363039 () Bool)

(assert (=> d!156193 m!1363039))

(assert (=> d!156193 m!1362815))

(assert (=> d!156193 m!1362791))

(assert (=> b!1476383 d!156193))

(check-sat (not d!156163) (not b!1476664) (not bm!67858) (not d!156149) (not d!156161) (not b!1476662) (not b!1476589) (not d!156155) (not b!1476553) (not b!1476568) (not b!1476547) (not b!1476663) (not bm!67851) (not d!156151) (not b!1476580) (not b!1476605) (not b!1476508) (not b!1476531) (not d!156187) (not b!1476590) (not d!156153) (not b!1476571) (not b!1476567) (not bm!67852) (not b!1476670) (not d!156193) (not d!156171))
(check-sat)
