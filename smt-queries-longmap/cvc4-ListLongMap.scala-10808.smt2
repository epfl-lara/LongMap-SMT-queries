; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126500 () Bool)

(assert start!126500)

(declare-fun b!1483540 () Bool)

(declare-fun res!1008403 () Bool)

(declare-fun e!831848 () Bool)

(assert (=> b!1483540 (=> (not res!1008403) (not e!831848))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483540 (= res!1008403 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!831850 () Bool)

(declare-fun b!1483541 () Bool)

(declare-fun lt!647461 () (_ BitVec 64))

(declare-datatypes ((array!99462 0))(
  ( (array!99463 (arr!48007 (Array (_ BitVec 32) (_ BitVec 64))) (size!48557 (_ BitVec 32))) )
))
(declare-fun lt!647460 () array!99462)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12247 0))(
  ( (MissingZero!12247 (index!51380 (_ BitVec 32))) (Found!12247 (index!51381 (_ BitVec 32))) (Intermediate!12247 (undefined!13059 Bool) (index!51382 (_ BitVec 32)) (x!132963 (_ BitVec 32))) (Undefined!12247) (MissingVacant!12247 (index!51383 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99462 (_ BitVec 32)) SeekEntryResult!12247)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99462 (_ BitVec 32)) SeekEntryResult!12247)

(assert (=> b!1483541 (= e!831850 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647461 lt!647460 mask!2687) (seekEntryOrOpen!0 lt!647461 lt!647460 mask!2687)))))

(declare-fun b!1483542 () Bool)

(declare-fun lt!647465 () SeekEntryResult!12247)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99462 (_ BitVec 32)) SeekEntryResult!12247)

(assert (=> b!1483542 (= e!831850 (= lt!647465 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647461 lt!647460 mask!2687)))))

(declare-fun b!1483543 () Bool)

(declare-fun res!1008408 () Bool)

(declare-fun e!831851 () Bool)

(assert (=> b!1483543 (=> (not res!1008408) (not e!831851))))

(declare-fun a!2862 () array!99462)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483543 (= res!1008408 (= (seekEntryOrOpen!0 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) (Found!12247 j!93)))))

(declare-fun b!1483544 () Bool)

(declare-fun res!1008419 () Bool)

(assert (=> b!1483544 (=> (not res!1008419) (not e!831851))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483544 (= res!1008419 (or (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) (select (arr!48007 a!2862) j!93))))))

(declare-fun b!1483545 () Bool)

(declare-fun res!1008404 () Bool)

(declare-fun e!831855 () Bool)

(assert (=> b!1483545 (=> (not res!1008404) (not e!831855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99462 (_ BitVec 32)) Bool)

(assert (=> b!1483545 (= res!1008404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483546 () Bool)

(declare-fun e!831852 () Bool)

(declare-fun e!831854 () Bool)

(assert (=> b!1483546 (= e!831852 e!831854)))

(declare-fun res!1008407 () Bool)

(assert (=> b!1483546 (=> (not res!1008407) (not e!831854))))

(declare-fun lt!647463 () (_ BitVec 64))

(assert (=> b!1483546 (= res!1008407 (and (= index!646 intermediateAfterIndex!19) (= lt!647463 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1008421 () Bool)

(assert (=> start!126500 (=> (not res!1008421) (not e!831855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126500 (= res!1008421 (validMask!0 mask!2687))))

(assert (=> start!126500 e!831855))

(assert (=> start!126500 true))

(declare-fun array_inv!37035 (array!99462) Bool)

(assert (=> start!126500 (array_inv!37035 a!2862)))

(declare-fun b!1483547 () Bool)

(declare-fun res!1008413 () Bool)

(assert (=> b!1483547 (=> (not res!1008413) (not e!831855))))

(assert (=> b!1483547 (= res!1008413 (and (= (size!48557 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48557 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48557 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483548 () Bool)

(declare-fun e!831856 () Bool)

(assert (=> b!1483548 (= e!831855 e!831856)))

(declare-fun res!1008409 () Bool)

(assert (=> b!1483548 (=> (not res!1008409) (not e!831856))))

(assert (=> b!1483548 (= res!1008409 (= (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483548 (= lt!647460 (array!99463 (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48557 a!2862)))))

(declare-fun b!1483549 () Bool)

(declare-fun e!831857 () Bool)

(assert (=> b!1483549 (= e!831857 true)))

(declare-fun lt!647462 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483549 (= lt!647462 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483550 () Bool)

(declare-fun res!1008410 () Bool)

(assert (=> b!1483550 (=> (not res!1008410) (not e!831855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483550 (= res!1008410 (validKeyInArray!0 (select (arr!48007 a!2862) j!93)))))

(declare-fun b!1483551 () Bool)

(declare-fun e!831853 () Bool)

(assert (=> b!1483551 (= e!831853 e!831848)))

(declare-fun res!1008405 () Bool)

(assert (=> b!1483551 (=> (not res!1008405) (not e!831848))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483551 (= res!1008405 (= lt!647465 (Intermediate!12247 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483551 (= lt!647465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647461 mask!2687) lt!647461 lt!647460 mask!2687))))

(assert (=> b!1483551 (= lt!647461 (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483552 () Bool)

(declare-fun res!1008406 () Bool)

(assert (=> b!1483552 (=> (not res!1008406) (not e!831855))))

(assert (=> b!1483552 (= res!1008406 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48557 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48557 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48557 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483553 () Bool)

(declare-fun res!1008411 () Bool)

(assert (=> b!1483553 (=> (not res!1008411) (not e!831848))))

(assert (=> b!1483553 (= res!1008411 e!831850)))

(declare-fun c!137091 () Bool)

(assert (=> b!1483553 (= c!137091 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483554 () Bool)

(declare-fun res!1008412 () Bool)

(assert (=> b!1483554 (=> (not res!1008412) (not e!831855))))

(assert (=> b!1483554 (= res!1008412 (validKeyInArray!0 (select (arr!48007 a!2862) i!1006)))))

(declare-fun b!1483555 () Bool)

(declare-fun res!1008420 () Bool)

(assert (=> b!1483555 (=> (not res!1008420) (not e!831853))))

(declare-fun lt!647464 () SeekEntryResult!12247)

(assert (=> b!1483555 (= res!1008420 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!647464))))

(declare-fun b!1483556 () Bool)

(assert (=> b!1483556 (= e!831851 e!831852)))

(declare-fun res!1008415 () Bool)

(assert (=> b!1483556 (=> res!1008415 e!831852)))

(assert (=> b!1483556 (= res!1008415 (or (and (= (select (arr!48007 a!2862) index!646) lt!647463) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483556 (= lt!647463 (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483557 () Bool)

(assert (=> b!1483557 (= e!831856 e!831853)))

(declare-fun res!1008418 () Bool)

(assert (=> b!1483557 (=> (not res!1008418) (not e!831853))))

(assert (=> b!1483557 (= res!1008418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48007 a!2862) j!93) mask!2687) (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!647464))))

(assert (=> b!1483557 (= lt!647464 (Intermediate!12247 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483558 () Bool)

(assert (=> b!1483558 (= e!831854 (= (seekEntryOrOpen!0 lt!647461 lt!647460 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647461 lt!647460 mask!2687)))))

(declare-fun b!1483559 () Bool)

(assert (=> b!1483559 (= e!831848 (not e!831857))))

(declare-fun res!1008417 () Bool)

(assert (=> b!1483559 (=> res!1008417 e!831857)))

(assert (=> b!1483559 (= res!1008417 (or (and (= (select (arr!48007 a!2862) index!646) (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483559 e!831851))

(declare-fun res!1008414 () Bool)

(assert (=> b!1483559 (=> (not res!1008414) (not e!831851))))

(assert (=> b!1483559 (= res!1008414 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49834 0))(
  ( (Unit!49835) )
))
(declare-fun lt!647466 () Unit!49834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49834)

(assert (=> b!1483559 (= lt!647466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483560 () Bool)

(declare-fun res!1008416 () Bool)

(assert (=> b!1483560 (=> (not res!1008416) (not e!831855))))

(declare-datatypes ((List!34508 0))(
  ( (Nil!34505) (Cons!34504 (h!35878 (_ BitVec 64)) (t!49202 List!34508)) )
))
(declare-fun arrayNoDuplicates!0 (array!99462 (_ BitVec 32) List!34508) Bool)

(assert (=> b!1483560 (= res!1008416 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34505))))

(assert (= (and start!126500 res!1008421) b!1483547))

(assert (= (and b!1483547 res!1008413) b!1483554))

(assert (= (and b!1483554 res!1008412) b!1483550))

(assert (= (and b!1483550 res!1008410) b!1483545))

(assert (= (and b!1483545 res!1008404) b!1483560))

(assert (= (and b!1483560 res!1008416) b!1483552))

(assert (= (and b!1483552 res!1008406) b!1483548))

(assert (= (and b!1483548 res!1008409) b!1483557))

(assert (= (and b!1483557 res!1008418) b!1483555))

(assert (= (and b!1483555 res!1008420) b!1483551))

(assert (= (and b!1483551 res!1008405) b!1483553))

(assert (= (and b!1483553 c!137091) b!1483542))

(assert (= (and b!1483553 (not c!137091)) b!1483541))

(assert (= (and b!1483553 res!1008411) b!1483540))

(assert (= (and b!1483540 res!1008403) b!1483559))

(assert (= (and b!1483559 res!1008414) b!1483543))

(assert (= (and b!1483543 res!1008408) b!1483544))

(assert (= (and b!1483544 res!1008419) b!1483556))

(assert (= (and b!1483556 (not res!1008415)) b!1483546))

(assert (= (and b!1483546 res!1008407) b!1483558))

(assert (= (and b!1483559 (not res!1008417)) b!1483549))

(declare-fun m!1369005 () Bool)

(assert (=> b!1483558 m!1369005))

(declare-fun m!1369007 () Bool)

(assert (=> b!1483558 m!1369007))

(declare-fun m!1369009 () Bool)

(assert (=> b!1483554 m!1369009))

(assert (=> b!1483554 m!1369009))

(declare-fun m!1369011 () Bool)

(assert (=> b!1483554 m!1369011))

(declare-fun m!1369013 () Bool)

(assert (=> b!1483559 m!1369013))

(declare-fun m!1369015 () Bool)

(assert (=> b!1483559 m!1369015))

(declare-fun m!1369017 () Bool)

(assert (=> b!1483559 m!1369017))

(declare-fun m!1369019 () Bool)

(assert (=> b!1483559 m!1369019))

(declare-fun m!1369021 () Bool)

(assert (=> b!1483559 m!1369021))

(declare-fun m!1369023 () Bool)

(assert (=> b!1483559 m!1369023))

(assert (=> b!1483556 m!1369019))

(assert (=> b!1483556 m!1369023))

(assert (=> b!1483556 m!1369015))

(assert (=> b!1483556 m!1369017))

(declare-fun m!1369025 () Bool)

(assert (=> b!1483560 m!1369025))

(assert (=> b!1483550 m!1369023))

(assert (=> b!1483550 m!1369023))

(declare-fun m!1369027 () Bool)

(assert (=> b!1483550 m!1369027))

(declare-fun m!1369029 () Bool)

(assert (=> b!1483544 m!1369029))

(assert (=> b!1483544 m!1369023))

(assert (=> b!1483557 m!1369023))

(assert (=> b!1483557 m!1369023))

(declare-fun m!1369031 () Bool)

(assert (=> b!1483557 m!1369031))

(assert (=> b!1483557 m!1369031))

(assert (=> b!1483557 m!1369023))

(declare-fun m!1369033 () Bool)

(assert (=> b!1483557 m!1369033))

(declare-fun m!1369035 () Bool)

(assert (=> b!1483542 m!1369035))

(assert (=> b!1483548 m!1369015))

(declare-fun m!1369037 () Bool)

(assert (=> b!1483548 m!1369037))

(declare-fun m!1369039 () Bool)

(assert (=> b!1483545 m!1369039))

(assert (=> b!1483541 m!1369007))

(assert (=> b!1483541 m!1369005))

(assert (=> b!1483543 m!1369023))

(assert (=> b!1483543 m!1369023))

(declare-fun m!1369041 () Bool)

(assert (=> b!1483543 m!1369041))

(declare-fun m!1369043 () Bool)

(assert (=> b!1483549 m!1369043))

(declare-fun m!1369045 () Bool)

(assert (=> b!1483551 m!1369045))

(assert (=> b!1483551 m!1369045))

(declare-fun m!1369047 () Bool)

(assert (=> b!1483551 m!1369047))

(assert (=> b!1483551 m!1369015))

(declare-fun m!1369049 () Bool)

(assert (=> b!1483551 m!1369049))

(declare-fun m!1369051 () Bool)

(assert (=> start!126500 m!1369051))

(declare-fun m!1369053 () Bool)

(assert (=> start!126500 m!1369053))

(assert (=> b!1483555 m!1369023))

(assert (=> b!1483555 m!1369023))

(declare-fun m!1369055 () Bool)

(assert (=> b!1483555 m!1369055))

(push 1)

