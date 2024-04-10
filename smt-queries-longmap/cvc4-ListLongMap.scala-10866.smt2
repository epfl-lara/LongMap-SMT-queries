; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127372 () Bool)

(assert start!127372)

(declare-fun res!1018582 () Bool)

(declare-fun e!838549 () Bool)

(assert (=> start!127372 (=> (not res!1018582) (not e!838549))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127372 (= res!1018582 (validMask!0 mask!2687))))

(assert (=> start!127372 e!838549))

(assert (=> start!127372 true))

(declare-datatypes ((array!99834 0))(
  ( (array!99835 (arr!48181 (Array (_ BitVec 32) (_ BitVec 64))) (size!48731 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99834)

(declare-fun array_inv!37209 (array!99834) Bool)

(assert (=> start!127372 (array_inv!37209 a!2862)))

(declare-fun b!1497395 () Bool)

(declare-fun res!1018580 () Bool)

(declare-fun e!838547 () Bool)

(assert (=> b!1497395 (=> res!1018580 e!838547)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497395 (= res!1018580 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497396 () Bool)

(declare-fun res!1018579 () Bool)

(assert (=> b!1497396 (=> res!1018579 e!838547)))

(declare-fun e!838550 () Bool)

(assert (=> b!1497396 (= res!1018579 e!838550)))

(declare-fun c!138949 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497396 (= c!138949 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497397 () Bool)

(declare-fun e!838546 () Bool)

(assert (=> b!1497397 (= e!838549 e!838546)))

(declare-fun res!1018576 () Bool)

(assert (=> b!1497397 (=> (not res!1018576) (not e!838546))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497397 (= res!1018576 (= (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!652431 () array!99834)

(assert (=> b!1497397 (= lt!652431 (array!99835 (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48731 a!2862)))))

(declare-fun b!1497398 () Bool)

(declare-fun res!1018571 () Bool)

(assert (=> b!1497398 (=> res!1018571 e!838547)))

(declare-datatypes ((SeekEntryResult!12421 0))(
  ( (MissingZero!12421 (index!52076 (_ BitVec 32))) (Found!12421 (index!52077 (_ BitVec 32))) (Intermediate!12421 (undefined!13233 Bool) (index!52078 (_ BitVec 32)) (x!133695 (_ BitVec 32))) (Undefined!12421) (MissingVacant!12421 (index!52079 (_ BitVec 32))) )
))
(declare-fun lt!652426 () SeekEntryResult!12421)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!652432 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99834 (_ BitVec 32)) SeekEntryResult!12421)

(assert (=> b!1497398 (= res!1018571 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652432 (select (arr!48181 a!2862) j!93) a!2862 mask!2687) lt!652426)))))

(declare-fun b!1497399 () Bool)

(declare-fun lt!652425 () (_ BitVec 64))

(declare-fun lt!652430 () SeekEntryResult!12421)

(assert (=> b!1497399 (= e!838550 (not (= lt!652430 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652432 lt!652425 lt!652431 mask!2687))))))

(declare-fun b!1497400 () Bool)

(assert (=> b!1497400 (= e!838547 true)))

(declare-fun lt!652429 () SeekEntryResult!12421)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99834 (_ BitVec 32)) SeekEntryResult!12421)

(assert (=> b!1497400 (= lt!652429 (seekEntryOrOpen!0 lt!652425 lt!652431 mask!2687))))

(declare-datatypes ((Unit!50182 0))(
  ( (Unit!50183) )
))
(declare-fun lt!652428 () Unit!50182)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50182)

(assert (=> b!1497400 (= lt!652428 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652432 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497401 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99834 (_ BitVec 32)) SeekEntryResult!12421)

(assert (=> b!1497401 (= e!838550 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652432 intermediateAfterIndex!19 lt!652425 lt!652431 mask!2687) (seekEntryOrOpen!0 lt!652425 lt!652431 mask!2687))))))

(declare-fun b!1497402 () Bool)

(declare-fun res!1018569 () Bool)

(assert (=> b!1497402 (=> (not res!1018569) (not e!838549))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497402 (= res!1018569 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48731 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48731 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48731 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497403 () Bool)

(declare-fun res!1018565 () Bool)

(assert (=> b!1497403 (=> (not res!1018565) (not e!838549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99834 (_ BitVec 32)) Bool)

(assert (=> b!1497403 (= res!1018565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497404 () Bool)

(declare-fun e!838548 () Bool)

(declare-fun e!838551 () Bool)

(assert (=> b!1497404 (= e!838548 e!838551)))

(declare-fun res!1018577 () Bool)

(assert (=> b!1497404 (=> (not res!1018577) (not e!838551))))

(assert (=> b!1497404 (= res!1018577 (= lt!652430 (Intermediate!12421 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497404 (= lt!652430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652425 mask!2687) lt!652425 lt!652431 mask!2687))))

(assert (=> b!1497404 (= lt!652425 (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!838545 () Bool)

(declare-fun b!1497405 () Bool)

(assert (=> b!1497405 (= e!838545 (= lt!652430 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652425 lt!652431 mask!2687)))))

(declare-fun b!1497406 () Bool)

(declare-fun res!1018581 () Bool)

(assert (=> b!1497406 (=> (not res!1018581) (not e!838549))))

(declare-datatypes ((List!34682 0))(
  ( (Nil!34679) (Cons!34678 (h!36075 (_ BitVec 64)) (t!49376 List!34682)) )
))
(declare-fun arrayNoDuplicates!0 (array!99834 (_ BitVec 32) List!34682) Bool)

(assert (=> b!1497406 (= res!1018581 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34679))))

(declare-fun b!1497407 () Bool)

(declare-fun res!1018566 () Bool)

(assert (=> b!1497407 (=> (not res!1018566) (not e!838549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497407 (= res!1018566 (validKeyInArray!0 (select (arr!48181 a!2862) j!93)))))

(declare-fun b!1497408 () Bool)

(declare-fun res!1018568 () Bool)

(assert (=> b!1497408 (=> (not res!1018568) (not e!838551))))

(assert (=> b!1497408 (= res!1018568 e!838545)))

(declare-fun c!138950 () Bool)

(assert (=> b!1497408 (= c!138950 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497409 () Bool)

(declare-fun res!1018578 () Bool)

(assert (=> b!1497409 (=> (not res!1018578) (not e!838548))))

(assert (=> b!1497409 (= res!1018578 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48181 a!2862) j!93) a!2862 mask!2687) lt!652426))))

(declare-fun b!1497410 () Bool)

(declare-fun e!838544 () Bool)

(assert (=> b!1497410 (= e!838544 e!838547)))

(declare-fun res!1018572 () Bool)

(assert (=> b!1497410 (=> res!1018572 e!838547)))

(assert (=> b!1497410 (= res!1018572 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652432 #b00000000000000000000000000000000) (bvsge lt!652432 (size!48731 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497410 (= lt!652432 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497411 () Bool)

(declare-fun res!1018570 () Bool)

(assert (=> b!1497411 (=> (not res!1018570) (not e!838551))))

(assert (=> b!1497411 (= res!1018570 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497412 () Bool)

(declare-fun res!1018573 () Bool)

(assert (=> b!1497412 (=> (not res!1018573) (not e!838549))))

(assert (=> b!1497412 (= res!1018573 (validKeyInArray!0 (select (arr!48181 a!2862) i!1006)))))

(declare-fun b!1497413 () Bool)

(assert (=> b!1497413 (= e!838545 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652425 lt!652431 mask!2687) (seekEntryOrOpen!0 lt!652425 lt!652431 mask!2687)))))

(declare-fun b!1497414 () Bool)

(assert (=> b!1497414 (= e!838551 (not e!838544))))

(declare-fun res!1018575 () Bool)

(assert (=> b!1497414 (=> res!1018575 e!838544)))

(assert (=> b!1497414 (= res!1018575 (or (and (= (select (arr!48181 a!2862) index!646) (select (store (arr!48181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48181 a!2862) index!646) (select (arr!48181 a!2862) j!93))) (= (select (arr!48181 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497414 (and (= lt!652429 (Found!12421 j!93)) (or (= (select (arr!48181 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48181 a!2862) intermediateBeforeIndex!19) (select (arr!48181 a!2862) j!93))))))

(assert (=> b!1497414 (= lt!652429 (seekEntryOrOpen!0 (select (arr!48181 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497414 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652427 () Unit!50182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50182)

(assert (=> b!1497414 (= lt!652427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497415 () Bool)

(declare-fun res!1018574 () Bool)

(assert (=> b!1497415 (=> (not res!1018574) (not e!838549))))

(assert (=> b!1497415 (= res!1018574 (and (= (size!48731 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48731 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48731 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497416 () Bool)

(assert (=> b!1497416 (= e!838546 e!838548)))

(declare-fun res!1018567 () Bool)

(assert (=> b!1497416 (=> (not res!1018567) (not e!838548))))

(assert (=> b!1497416 (= res!1018567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48181 a!2862) j!93) mask!2687) (select (arr!48181 a!2862) j!93) a!2862 mask!2687) lt!652426))))

(assert (=> b!1497416 (= lt!652426 (Intermediate!12421 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127372 res!1018582) b!1497415))

(assert (= (and b!1497415 res!1018574) b!1497412))

(assert (= (and b!1497412 res!1018573) b!1497407))

(assert (= (and b!1497407 res!1018566) b!1497403))

(assert (= (and b!1497403 res!1018565) b!1497406))

(assert (= (and b!1497406 res!1018581) b!1497402))

(assert (= (and b!1497402 res!1018569) b!1497397))

(assert (= (and b!1497397 res!1018576) b!1497416))

(assert (= (and b!1497416 res!1018567) b!1497409))

(assert (= (and b!1497409 res!1018578) b!1497404))

(assert (= (and b!1497404 res!1018577) b!1497408))

(assert (= (and b!1497408 c!138950) b!1497405))

(assert (= (and b!1497408 (not c!138950)) b!1497413))

(assert (= (and b!1497408 res!1018568) b!1497411))

(assert (= (and b!1497411 res!1018570) b!1497414))

(assert (= (and b!1497414 (not res!1018575)) b!1497410))

(assert (= (and b!1497410 (not res!1018572)) b!1497398))

(assert (= (and b!1497398 (not res!1018571)) b!1497396))

(assert (= (and b!1497396 c!138949) b!1497399))

(assert (= (and b!1497396 (not c!138949)) b!1497401))

(assert (= (and b!1497396 (not res!1018579)) b!1497395))

(assert (= (and b!1497395 (not res!1018580)) b!1497400))

(declare-fun m!1380475 () Bool)

(assert (=> b!1497397 m!1380475))

(declare-fun m!1380477 () Bool)

(assert (=> b!1497397 m!1380477))

(declare-fun m!1380479 () Bool)

(assert (=> b!1497407 m!1380479))

(assert (=> b!1497407 m!1380479))

(declare-fun m!1380481 () Bool)

(assert (=> b!1497407 m!1380481))

(declare-fun m!1380483 () Bool)

(assert (=> b!1497413 m!1380483))

(declare-fun m!1380485 () Bool)

(assert (=> b!1497413 m!1380485))

(declare-fun m!1380487 () Bool)

(assert (=> start!127372 m!1380487))

(declare-fun m!1380489 () Bool)

(assert (=> start!127372 m!1380489))

(declare-fun m!1380491 () Bool)

(assert (=> b!1497403 m!1380491))

(declare-fun m!1380493 () Bool)

(assert (=> b!1497406 m!1380493))

(assert (=> b!1497416 m!1380479))

(assert (=> b!1497416 m!1380479))

(declare-fun m!1380495 () Bool)

(assert (=> b!1497416 m!1380495))

(assert (=> b!1497416 m!1380495))

(assert (=> b!1497416 m!1380479))

(declare-fun m!1380497 () Bool)

(assert (=> b!1497416 m!1380497))

(declare-fun m!1380499 () Bool)

(assert (=> b!1497404 m!1380499))

(assert (=> b!1497404 m!1380499))

(declare-fun m!1380501 () Bool)

(assert (=> b!1497404 m!1380501))

(assert (=> b!1497404 m!1380475))

(declare-fun m!1380503 () Bool)

(assert (=> b!1497404 m!1380503))

(declare-fun m!1380505 () Bool)

(assert (=> b!1497401 m!1380505))

(assert (=> b!1497401 m!1380485))

(assert (=> b!1497398 m!1380479))

(assert (=> b!1497398 m!1380479))

(declare-fun m!1380507 () Bool)

(assert (=> b!1497398 m!1380507))

(declare-fun m!1380509 () Bool)

(assert (=> b!1497410 m!1380509))

(assert (=> b!1497400 m!1380485))

(declare-fun m!1380511 () Bool)

(assert (=> b!1497400 m!1380511))

(declare-fun m!1380513 () Bool)

(assert (=> b!1497412 m!1380513))

(assert (=> b!1497412 m!1380513))

(declare-fun m!1380515 () Bool)

(assert (=> b!1497412 m!1380515))

(declare-fun m!1380517 () Bool)

(assert (=> b!1497399 m!1380517))

(declare-fun m!1380519 () Bool)

(assert (=> b!1497414 m!1380519))

(assert (=> b!1497414 m!1380475))

(declare-fun m!1380521 () Bool)

(assert (=> b!1497414 m!1380521))

(declare-fun m!1380523 () Bool)

(assert (=> b!1497414 m!1380523))

(declare-fun m!1380525 () Bool)

(assert (=> b!1497414 m!1380525))

(assert (=> b!1497414 m!1380479))

(declare-fun m!1380527 () Bool)

(assert (=> b!1497414 m!1380527))

(declare-fun m!1380529 () Bool)

(assert (=> b!1497414 m!1380529))

(assert (=> b!1497414 m!1380479))

(declare-fun m!1380531 () Bool)

(assert (=> b!1497405 m!1380531))

(assert (=> b!1497409 m!1380479))

(assert (=> b!1497409 m!1380479))

(declare-fun m!1380533 () Bool)

(assert (=> b!1497409 m!1380533))

(push 1)

