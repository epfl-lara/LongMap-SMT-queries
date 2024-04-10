; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125760 () Bool)

(assert start!125760)

(declare-fun b!1471550 () Bool)

(declare-fun e!825987 () Bool)

(declare-fun e!825988 () Bool)

(assert (=> b!1471550 (= e!825987 e!825988)))

(declare-fun res!999318 () Bool)

(assert (=> b!1471550 (=> (not res!999318) (not e!825988))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99094 0))(
  ( (array!99095 (arr!47832 (Array (_ BitVec 32) (_ BitVec 64))) (size!48382 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99094)

(assert (=> b!1471550 (= res!999318 (= (select (store (arr!47832 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643313 () array!99094)

(assert (=> b!1471550 (= lt!643313 (array!99095 (store (arr!47832 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48382 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1471551 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!825986 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!643311 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12072 0))(
  ( (MissingZero!12072 (index!50680 (_ BitVec 32))) (Found!12072 (index!50681 (_ BitVec 32))) (Intermediate!12072 (undefined!12884 Bool) (index!50682 (_ BitVec 32)) (x!132267 (_ BitVec 32))) (Undefined!12072) (MissingVacant!12072 (index!50683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12072)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12072)

(assert (=> b!1471551 (= e!825986 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643311 lt!643313 mask!2687) (seekEntryOrOpen!0 lt!643311 lt!643313 mask!2687)))))

(declare-fun b!1471552 () Bool)

(declare-fun e!825984 () Bool)

(declare-fun e!825989 () Bool)

(assert (=> b!1471552 (= e!825984 e!825989)))

(declare-fun res!999325 () Bool)

(assert (=> b!1471552 (=> (not res!999325) (not e!825989))))

(declare-fun lt!643314 () SeekEntryResult!12072)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471552 (= res!999325 (= lt!643314 (Intermediate!12072 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12072)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471552 (= lt!643314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643311 mask!2687) lt!643311 lt!643313 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1471552 (= lt!643311 (select (store (arr!47832 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471553 () Bool)

(declare-fun res!999321 () Bool)

(assert (=> b!1471553 (=> (not res!999321) (not e!825987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471553 (= res!999321 (validKeyInArray!0 (select (arr!47832 a!2862) j!93)))))

(declare-fun res!999326 () Bool)

(assert (=> start!125760 (=> (not res!999326) (not e!825987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125760 (= res!999326 (validMask!0 mask!2687))))

(assert (=> start!125760 e!825987))

(assert (=> start!125760 true))

(declare-fun array_inv!36860 (array!99094) Bool)

(assert (=> start!125760 (array_inv!36860 a!2862)))

(declare-fun b!1471554 () Bool)

(declare-fun res!999331 () Bool)

(assert (=> b!1471554 (=> (not res!999331) (not e!825987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99094 (_ BitVec 32)) Bool)

(assert (=> b!1471554 (= res!999331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471555 () Bool)

(declare-fun res!999324 () Bool)

(assert (=> b!1471555 (=> (not res!999324) (not e!825989))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471555 (= res!999324 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471556 () Bool)

(declare-fun res!999323 () Bool)

(assert (=> b!1471556 (=> (not res!999323) (not e!825987))))

(assert (=> b!1471556 (= res!999323 (validKeyInArray!0 (select (arr!47832 a!2862) i!1006)))))

(declare-fun b!1471557 () Bool)

(assert (=> b!1471557 (= e!825988 e!825984)))

(declare-fun res!999317 () Bool)

(assert (=> b!1471557 (=> (not res!999317) (not e!825984))))

(declare-fun lt!643310 () SeekEntryResult!12072)

(assert (=> b!1471557 (= res!999317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47832 a!2862) j!93) mask!2687) (select (arr!47832 a!2862) j!93) a!2862 mask!2687) lt!643310))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1471557 (= lt!643310 (Intermediate!12072 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!825985 () Bool)

(declare-fun b!1471558 () Bool)

(assert (=> b!1471558 (= e!825985 (or (= (select (arr!47832 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47832 a!2862) intermediateBeforeIndex!19) (select (arr!47832 a!2862) j!93))))))

(declare-fun b!1471559 () Bool)

(declare-fun res!999320 () Bool)

(assert (=> b!1471559 (=> (not res!999320) (not e!825987))))

(assert (=> b!1471559 (= res!999320 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48382 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48382 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48382 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471560 () Bool)

(declare-fun res!999322 () Bool)

(assert (=> b!1471560 (=> (not res!999322) (not e!825984))))

(assert (=> b!1471560 (= res!999322 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47832 a!2862) j!93) a!2862 mask!2687) lt!643310))))

(declare-fun b!1471561 () Bool)

(assert (=> b!1471561 (= e!825989 (not true))))

(assert (=> b!1471561 e!825985))

(declare-fun res!999319 () Bool)

(assert (=> b!1471561 (=> (not res!999319) (not e!825985))))

(assert (=> b!1471561 (= res!999319 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49484 0))(
  ( (Unit!49485) )
))
(declare-fun lt!643312 () Unit!49484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49484)

(assert (=> b!1471561 (= lt!643312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471562 () Bool)

(declare-fun res!999330 () Bool)

(assert (=> b!1471562 (=> (not res!999330) (not e!825987))))

(assert (=> b!1471562 (= res!999330 (and (= (size!48382 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48382 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48382 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471563 () Bool)

(declare-fun res!999328 () Bool)

(assert (=> b!1471563 (=> (not res!999328) (not e!825985))))

(assert (=> b!1471563 (= res!999328 (= (seekEntryOrOpen!0 (select (arr!47832 a!2862) j!93) a!2862 mask!2687) (Found!12072 j!93)))))

(declare-fun b!1471564 () Bool)

(assert (=> b!1471564 (= e!825986 (= lt!643314 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643311 lt!643313 mask!2687)))))

(declare-fun b!1471565 () Bool)

(declare-fun res!999329 () Bool)

(assert (=> b!1471565 (=> (not res!999329) (not e!825987))))

(declare-datatypes ((List!34333 0))(
  ( (Nil!34330) (Cons!34329 (h!35685 (_ BitVec 64)) (t!49027 List!34333)) )
))
(declare-fun arrayNoDuplicates!0 (array!99094 (_ BitVec 32) List!34333) Bool)

(assert (=> b!1471565 (= res!999329 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34330))))

(declare-fun b!1471566 () Bool)

(declare-fun res!999327 () Bool)

(assert (=> b!1471566 (=> (not res!999327) (not e!825989))))

(assert (=> b!1471566 (= res!999327 e!825986)))

(declare-fun c!135630 () Bool)

(assert (=> b!1471566 (= c!135630 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125760 res!999326) b!1471562))

(assert (= (and b!1471562 res!999330) b!1471556))

(assert (= (and b!1471556 res!999323) b!1471553))

(assert (= (and b!1471553 res!999321) b!1471554))

(assert (= (and b!1471554 res!999331) b!1471565))

(assert (= (and b!1471565 res!999329) b!1471559))

(assert (= (and b!1471559 res!999320) b!1471550))

(assert (= (and b!1471550 res!999318) b!1471557))

(assert (= (and b!1471557 res!999317) b!1471560))

(assert (= (and b!1471560 res!999322) b!1471552))

(assert (= (and b!1471552 res!999325) b!1471566))

(assert (= (and b!1471566 c!135630) b!1471564))

(assert (= (and b!1471566 (not c!135630)) b!1471551))

(assert (= (and b!1471566 res!999327) b!1471555))

(assert (= (and b!1471555 res!999324) b!1471561))

(assert (= (and b!1471561 res!999319) b!1471563))

(assert (= (and b!1471563 res!999328) b!1471558))

(declare-fun m!1358351 () Bool)

(assert (=> b!1471552 m!1358351))

(assert (=> b!1471552 m!1358351))

(declare-fun m!1358353 () Bool)

(assert (=> b!1471552 m!1358353))

(declare-fun m!1358355 () Bool)

(assert (=> b!1471552 m!1358355))

(declare-fun m!1358357 () Bool)

(assert (=> b!1471552 m!1358357))

(declare-fun m!1358359 () Bool)

(assert (=> b!1471564 m!1358359))

(declare-fun m!1358361 () Bool)

(assert (=> b!1471556 m!1358361))

(assert (=> b!1471556 m!1358361))

(declare-fun m!1358363 () Bool)

(assert (=> b!1471556 m!1358363))

(declare-fun m!1358365 () Bool)

(assert (=> b!1471563 m!1358365))

(assert (=> b!1471563 m!1358365))

(declare-fun m!1358367 () Bool)

(assert (=> b!1471563 m!1358367))

(assert (=> b!1471560 m!1358365))

(assert (=> b!1471560 m!1358365))

(declare-fun m!1358369 () Bool)

(assert (=> b!1471560 m!1358369))

(assert (=> b!1471550 m!1358355))

(declare-fun m!1358371 () Bool)

(assert (=> b!1471550 m!1358371))

(declare-fun m!1358373 () Bool)

(assert (=> b!1471554 m!1358373))

(declare-fun m!1358375 () Bool)

(assert (=> b!1471558 m!1358375))

(assert (=> b!1471558 m!1358365))

(assert (=> b!1471557 m!1358365))

(assert (=> b!1471557 m!1358365))

(declare-fun m!1358377 () Bool)

(assert (=> b!1471557 m!1358377))

(assert (=> b!1471557 m!1358377))

(assert (=> b!1471557 m!1358365))

(declare-fun m!1358379 () Bool)

(assert (=> b!1471557 m!1358379))

(declare-fun m!1358381 () Bool)

(assert (=> b!1471561 m!1358381))

(declare-fun m!1358383 () Bool)

(assert (=> b!1471561 m!1358383))

(declare-fun m!1358385 () Bool)

(assert (=> b!1471565 m!1358385))

(declare-fun m!1358387 () Bool)

(assert (=> start!125760 m!1358387))

(declare-fun m!1358389 () Bool)

(assert (=> start!125760 m!1358389))

(declare-fun m!1358391 () Bool)

(assert (=> b!1471551 m!1358391))

(declare-fun m!1358393 () Bool)

(assert (=> b!1471551 m!1358393))

(assert (=> b!1471553 m!1358365))

(assert (=> b!1471553 m!1358365))

(declare-fun m!1358395 () Bool)

(assert (=> b!1471553 m!1358395))

(check-sat (not b!1471564) (not b!1471554) (not b!1471561) (not b!1471560) (not b!1471552) (not b!1471557) (not start!125760) (not b!1471551) (not b!1471553) (not b!1471565) (not b!1471563) (not b!1471556))
(check-sat)
