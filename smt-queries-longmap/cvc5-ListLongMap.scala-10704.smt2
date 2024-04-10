; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125362 () Bool)

(assert start!125362)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98810 0))(
  ( (array!98811 (arr!47693 (Array (_ BitVec 32) (_ BitVec 64))) (size!48243 (_ BitVec 32))) )
))
(declare-fun lt!641402 () array!98810)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1465419 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11945 0))(
  ( (MissingZero!11945 (index!50172 (_ BitVec 32))) (Found!11945 (index!50173 (_ BitVec 32))) (Intermediate!11945 (undefined!12757 Bool) (index!50174 (_ BitVec 32)) (x!131754 (_ BitVec 32))) (Undefined!11945) (MissingVacant!11945 (index!50175 (_ BitVec 32))) )
))
(declare-fun lt!641400 () SeekEntryResult!11945)

(declare-fun lt!641401 () (_ BitVec 64))

(declare-fun e!823421 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98810 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465419 (= e!823421 (= lt!641400 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641401 lt!641402 mask!2687)))))

(declare-fun res!994320 () Bool)

(declare-fun e!823426 () Bool)

(assert (=> start!125362 (=> (not res!994320) (not e!823426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125362 (= res!994320 (validMask!0 mask!2687))))

(assert (=> start!125362 e!823426))

(assert (=> start!125362 true))

(declare-fun a!2862 () array!98810)

(declare-fun array_inv!36721 (array!98810) Bool)

(assert (=> start!125362 (array_inv!36721 a!2862)))

(declare-fun b!1465420 () Bool)

(declare-fun e!823423 () Bool)

(declare-fun e!823425 () Bool)

(assert (=> b!1465420 (= e!823423 (not e!823425))))

(declare-fun res!994317 () Bool)

(assert (=> b!1465420 (=> res!994317 e!823425)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465420 (= res!994317 (or (and (= (select (arr!47693 a!2862) index!646) (select (store (arr!47693 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47693 a!2862) index!646) (select (arr!47693 a!2862) j!93))) (= (select (arr!47693 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823424 () Bool)

(assert (=> b!1465420 e!823424))

(declare-fun res!994321 () Bool)

(assert (=> b!1465420 (=> (not res!994321) (not e!823424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98810 (_ BitVec 32)) Bool)

(assert (=> b!1465420 (= res!994321 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49386 0))(
  ( (Unit!49387) )
))
(declare-fun lt!641403 () Unit!49386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49386)

(assert (=> b!1465420 (= lt!641403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465421 () Bool)

(declare-fun res!994323 () Bool)

(assert (=> b!1465421 (=> (not res!994323) (not e!823424))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98810 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465421 (= res!994323 (= (seekEntryOrOpen!0 (select (arr!47693 a!2862) j!93) a!2862 mask!2687) (Found!11945 j!93)))))

(declare-fun b!1465422 () Bool)

(declare-fun e!823422 () Bool)

(assert (=> b!1465422 (= e!823422 e!823423)))

(declare-fun res!994324 () Bool)

(assert (=> b!1465422 (=> (not res!994324) (not e!823423))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465422 (= res!994324 (= lt!641400 (Intermediate!11945 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465422 (= lt!641400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641401 mask!2687) lt!641401 lt!641402 mask!2687))))

(assert (=> b!1465422 (= lt!641401 (select (store (arr!47693 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!641399 () (_ BitVec 32))

(declare-fun b!1465423 () Bool)

(declare-fun e!823427 () Bool)

(assert (=> b!1465423 (= e!823427 (not (= lt!641400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641399 lt!641401 lt!641402 mask!2687))))))

(declare-fun b!1465424 () Bool)

(declare-fun e!823428 () Bool)

(assert (=> b!1465424 (= e!823425 e!823428)))

(declare-fun res!994311 () Bool)

(assert (=> b!1465424 (=> res!994311 e!823428)))

(assert (=> b!1465424 (= res!994311 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641399 #b00000000000000000000000000000000) (bvsge lt!641399 (size!48243 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465424 (= lt!641399 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465425 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98810 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465425 (= e!823421 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641401 lt!641402 mask!2687) (seekEntryOrOpen!0 lt!641401 lt!641402 mask!2687)))))

(declare-fun b!1465426 () Bool)

(declare-fun res!994327 () Bool)

(assert (=> b!1465426 (=> (not res!994327) (not e!823426))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465426 (= res!994327 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48243 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48243 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48243 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465427 () Bool)

(assert (=> b!1465427 (= e!823424 (or (= (select (arr!47693 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47693 a!2862) intermediateBeforeIndex!19) (select (arr!47693 a!2862) j!93))))))

(declare-fun b!1465428 () Bool)

(declare-fun res!994312 () Bool)

(assert (=> b!1465428 (=> (not res!994312) (not e!823422))))

(declare-fun lt!641398 () SeekEntryResult!11945)

(assert (=> b!1465428 (= res!994312 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47693 a!2862) j!93) a!2862 mask!2687) lt!641398))))

(declare-fun b!1465429 () Bool)

(declare-fun res!994326 () Bool)

(assert (=> b!1465429 (=> (not res!994326) (not e!823426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465429 (= res!994326 (validKeyInArray!0 (select (arr!47693 a!2862) i!1006)))))

(declare-fun b!1465430 () Bool)

(assert (=> b!1465430 (= e!823428 true)))

(declare-fun lt!641397 () Bool)

(assert (=> b!1465430 (= lt!641397 e!823427)))

(declare-fun c!135065 () Bool)

(assert (=> b!1465430 (= c!135065 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465431 () Bool)

(declare-fun res!994318 () Bool)

(assert (=> b!1465431 (=> (not res!994318) (not e!823426))))

(declare-datatypes ((List!34194 0))(
  ( (Nil!34191) (Cons!34190 (h!35540 (_ BitVec 64)) (t!48888 List!34194)) )
))
(declare-fun arrayNoDuplicates!0 (array!98810 (_ BitVec 32) List!34194) Bool)

(assert (=> b!1465431 (= res!994318 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34191))))

(declare-fun b!1465432 () Bool)

(declare-fun res!994315 () Bool)

(assert (=> b!1465432 (=> (not res!994315) (not e!823426))))

(assert (=> b!1465432 (= res!994315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465433 () Bool)

(declare-fun e!823430 () Bool)

(assert (=> b!1465433 (= e!823430 e!823422)))

(declare-fun res!994310 () Bool)

(assert (=> b!1465433 (=> (not res!994310) (not e!823422))))

(assert (=> b!1465433 (= res!994310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47693 a!2862) j!93) mask!2687) (select (arr!47693 a!2862) j!93) a!2862 mask!2687) lt!641398))))

(assert (=> b!1465433 (= lt!641398 (Intermediate!11945 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465434 () Bool)

(declare-fun res!994325 () Bool)

(assert (=> b!1465434 (=> (not res!994325) (not e!823426))))

(assert (=> b!1465434 (= res!994325 (and (= (size!48243 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48243 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48243 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465435 () Bool)

(declare-fun res!994322 () Bool)

(assert (=> b!1465435 (=> (not res!994322) (not e!823423))))

(assert (=> b!1465435 (= res!994322 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465436 () Bool)

(declare-fun res!994316 () Bool)

(assert (=> b!1465436 (=> (not res!994316) (not e!823426))))

(assert (=> b!1465436 (= res!994316 (validKeyInArray!0 (select (arr!47693 a!2862) j!93)))))

(declare-fun b!1465437 () Bool)

(declare-fun res!994319 () Bool)

(assert (=> b!1465437 (=> res!994319 e!823428)))

(assert (=> b!1465437 (= res!994319 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641399 (select (arr!47693 a!2862) j!93) a!2862 mask!2687) lt!641398)))))

(declare-fun b!1465438 () Bool)

(assert (=> b!1465438 (= e!823427 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641399 intermediateAfterIndex!19 lt!641401 lt!641402 mask!2687) (seekEntryOrOpen!0 lt!641401 lt!641402 mask!2687))))))

(declare-fun b!1465439 () Bool)

(assert (=> b!1465439 (= e!823426 e!823430)))

(declare-fun res!994313 () Bool)

(assert (=> b!1465439 (=> (not res!994313) (not e!823430))))

(assert (=> b!1465439 (= res!994313 (= (select (store (arr!47693 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465439 (= lt!641402 (array!98811 (store (arr!47693 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48243 a!2862)))))

(declare-fun b!1465440 () Bool)

(declare-fun res!994314 () Bool)

(assert (=> b!1465440 (=> (not res!994314) (not e!823423))))

(assert (=> b!1465440 (= res!994314 e!823421)))

(declare-fun c!135066 () Bool)

(assert (=> b!1465440 (= c!135066 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125362 res!994320) b!1465434))

(assert (= (and b!1465434 res!994325) b!1465429))

(assert (= (and b!1465429 res!994326) b!1465436))

(assert (= (and b!1465436 res!994316) b!1465432))

(assert (= (and b!1465432 res!994315) b!1465431))

(assert (= (and b!1465431 res!994318) b!1465426))

(assert (= (and b!1465426 res!994327) b!1465439))

(assert (= (and b!1465439 res!994313) b!1465433))

(assert (= (and b!1465433 res!994310) b!1465428))

(assert (= (and b!1465428 res!994312) b!1465422))

(assert (= (and b!1465422 res!994324) b!1465440))

(assert (= (and b!1465440 c!135066) b!1465419))

(assert (= (and b!1465440 (not c!135066)) b!1465425))

(assert (= (and b!1465440 res!994314) b!1465435))

(assert (= (and b!1465435 res!994322) b!1465420))

(assert (= (and b!1465420 res!994321) b!1465421))

(assert (= (and b!1465421 res!994323) b!1465427))

(assert (= (and b!1465420 (not res!994317)) b!1465424))

(assert (= (and b!1465424 (not res!994311)) b!1465437))

(assert (= (and b!1465437 (not res!994319)) b!1465430))

(assert (= (and b!1465430 c!135065) b!1465423))

(assert (= (and b!1465430 (not c!135065)) b!1465438))

(declare-fun m!1352515 () Bool)

(assert (=> b!1465419 m!1352515))

(declare-fun m!1352517 () Bool)

(assert (=> b!1465429 m!1352517))

(assert (=> b!1465429 m!1352517))

(declare-fun m!1352519 () Bool)

(assert (=> b!1465429 m!1352519))

(declare-fun m!1352521 () Bool)

(assert (=> start!125362 m!1352521))

(declare-fun m!1352523 () Bool)

(assert (=> start!125362 m!1352523))

(declare-fun m!1352525 () Bool)

(assert (=> b!1465423 m!1352525))

(declare-fun m!1352527 () Bool)

(assert (=> b!1465424 m!1352527))

(declare-fun m!1352529 () Bool)

(assert (=> b!1465439 m!1352529))

(declare-fun m!1352531 () Bool)

(assert (=> b!1465439 m!1352531))

(declare-fun m!1352533 () Bool)

(assert (=> b!1465436 m!1352533))

(assert (=> b!1465436 m!1352533))

(declare-fun m!1352535 () Bool)

(assert (=> b!1465436 m!1352535))

(declare-fun m!1352537 () Bool)

(assert (=> b!1465425 m!1352537))

(declare-fun m!1352539 () Bool)

(assert (=> b!1465425 m!1352539))

(declare-fun m!1352541 () Bool)

(assert (=> b!1465427 m!1352541))

(assert (=> b!1465427 m!1352533))

(assert (=> b!1465421 m!1352533))

(assert (=> b!1465421 m!1352533))

(declare-fun m!1352543 () Bool)

(assert (=> b!1465421 m!1352543))

(declare-fun m!1352545 () Bool)

(assert (=> b!1465432 m!1352545))

(assert (=> b!1465433 m!1352533))

(assert (=> b!1465433 m!1352533))

(declare-fun m!1352547 () Bool)

(assert (=> b!1465433 m!1352547))

(assert (=> b!1465433 m!1352547))

(assert (=> b!1465433 m!1352533))

(declare-fun m!1352549 () Bool)

(assert (=> b!1465433 m!1352549))

(declare-fun m!1352551 () Bool)

(assert (=> b!1465438 m!1352551))

(assert (=> b!1465438 m!1352539))

(assert (=> b!1465437 m!1352533))

(assert (=> b!1465437 m!1352533))

(declare-fun m!1352553 () Bool)

(assert (=> b!1465437 m!1352553))

(declare-fun m!1352555 () Bool)

(assert (=> b!1465431 m!1352555))

(assert (=> b!1465428 m!1352533))

(assert (=> b!1465428 m!1352533))

(declare-fun m!1352557 () Bool)

(assert (=> b!1465428 m!1352557))

(declare-fun m!1352559 () Bool)

(assert (=> b!1465420 m!1352559))

(assert (=> b!1465420 m!1352529))

(declare-fun m!1352561 () Bool)

(assert (=> b!1465420 m!1352561))

(declare-fun m!1352563 () Bool)

(assert (=> b!1465420 m!1352563))

(declare-fun m!1352565 () Bool)

(assert (=> b!1465420 m!1352565))

(assert (=> b!1465420 m!1352533))

(declare-fun m!1352567 () Bool)

(assert (=> b!1465422 m!1352567))

(assert (=> b!1465422 m!1352567))

(declare-fun m!1352569 () Bool)

(assert (=> b!1465422 m!1352569))

(assert (=> b!1465422 m!1352529))

(declare-fun m!1352571 () Bool)

(assert (=> b!1465422 m!1352571))

(push 1)

