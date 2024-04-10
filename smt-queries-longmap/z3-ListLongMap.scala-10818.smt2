; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126558 () Bool)

(assert start!126558)

(declare-fun b!1485367 () Bool)

(declare-fun res!1010057 () Bool)

(declare-fun e!832724 () Bool)

(assert (=> b!1485367 (=> (not res!1010057) (not e!832724))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12276 0))(
  ( (MissingZero!12276 (index!51496 (_ BitVec 32))) (Found!12276 (index!51497 (_ BitVec 32))) (Intermediate!12276 (undefined!13088 Bool) (index!51498 (_ BitVec 32)) (x!133072 (_ BitVec 32))) (Undefined!12276) (MissingVacant!12276 (index!51499 (_ BitVec 32))) )
))
(declare-fun lt!648069 () SeekEntryResult!12276)

(declare-datatypes ((array!99520 0))(
  ( (array!99521 (arr!48036 (Array (_ BitVec 32) (_ BitVec 64))) (size!48586 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99520)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99520 (_ BitVec 32)) SeekEntryResult!12276)

(assert (=> b!1485367 (= res!1010057 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48036 a!2862) j!93) a!2862 mask!2687) lt!648069))))

(declare-fun b!1485368 () Bool)

(declare-fun res!1010072 () Bool)

(declare-fun e!832722 () Bool)

(assert (=> b!1485368 (=> (not res!1010072) (not e!832722))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485368 (= res!1010072 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485369 () Bool)

(declare-fun e!832718 () Bool)

(assert (=> b!1485369 (= e!832718 true)))

(declare-fun lt!648073 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485369 (= lt!648073 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485370 () Bool)

(declare-fun res!1010074 () Bool)

(declare-fun e!832726 () Bool)

(assert (=> b!1485370 (=> (not res!1010074) (not e!832726))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99520 (_ BitVec 32)) SeekEntryResult!12276)

(assert (=> b!1485370 (= res!1010074 (= (seekEntryOrOpen!0 (select (arr!48036 a!2862) j!93) a!2862 mask!2687) (Found!12276 j!93)))))

(declare-fun e!832725 () Bool)

(declare-fun lt!648070 () SeekEntryResult!12276)

(declare-fun lt!648074 () array!99520)

(declare-fun lt!648075 () (_ BitVec 64))

(declare-fun b!1485371 () Bool)

(assert (=> b!1485371 (= e!832725 (= lt!648070 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648075 lt!648074 mask!2687)))))

(declare-fun b!1485372 () Bool)

(assert (=> b!1485372 (= e!832722 (not e!832718))))

(declare-fun res!1010058 () Bool)

(assert (=> b!1485372 (=> res!1010058 e!832718)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485372 (= res!1010058 (or (and (= (select (arr!48036 a!2862) index!646) (select (store (arr!48036 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48036 a!2862) index!646) (select (arr!48036 a!2862) j!93))) (= (select (arr!48036 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485372 e!832726))

(declare-fun res!1010064 () Bool)

(assert (=> b!1485372 (=> (not res!1010064) (not e!832726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99520 (_ BitVec 32)) Bool)

(assert (=> b!1485372 (= res!1010064 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49892 0))(
  ( (Unit!49893) )
))
(declare-fun lt!648072 () Unit!49892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49892)

(assert (=> b!1485372 (= lt!648072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485373 () Bool)

(declare-fun res!1010071 () Bool)

(declare-fun e!832721 () Bool)

(assert (=> b!1485373 (=> (not res!1010071) (not e!832721))))

(assert (=> b!1485373 (= res!1010071 (and (= (size!48586 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48586 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48586 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485374 () Bool)

(declare-fun e!832720 () Bool)

(declare-fun e!832727 () Bool)

(assert (=> b!1485374 (= e!832720 e!832727)))

(declare-fun res!1010060 () Bool)

(assert (=> b!1485374 (=> (not res!1010060) (not e!832727))))

(declare-fun lt!648071 () (_ BitVec 64))

(assert (=> b!1485374 (= res!1010060 (and (= index!646 intermediateAfterIndex!19) (= lt!648071 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485376 () Bool)

(declare-fun res!1010067 () Bool)

(assert (=> b!1485376 (=> (not res!1010067) (not e!832721))))

(assert (=> b!1485376 (= res!1010067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485377 () Bool)

(declare-fun res!1010059 () Bool)

(assert (=> b!1485377 (=> (not res!1010059) (not e!832721))))

(declare-datatypes ((List!34537 0))(
  ( (Nil!34534) (Cons!34533 (h!35907 (_ BitVec 64)) (t!49231 List!34537)) )
))
(declare-fun arrayNoDuplicates!0 (array!99520 (_ BitVec 32) List!34537) Bool)

(assert (=> b!1485377 (= res!1010059 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34534))))

(declare-fun b!1485378 () Bool)

(declare-fun e!832723 () Bool)

(assert (=> b!1485378 (= e!832721 e!832723)))

(declare-fun res!1010068 () Bool)

(assert (=> b!1485378 (=> (not res!1010068) (not e!832723))))

(assert (=> b!1485378 (= res!1010068 (= (select (store (arr!48036 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485378 (= lt!648074 (array!99521 (store (arr!48036 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48586 a!2862)))))

(declare-fun b!1485379 () Bool)

(assert (=> b!1485379 (= e!832724 e!832722)))

(declare-fun res!1010056 () Bool)

(assert (=> b!1485379 (=> (not res!1010056) (not e!832722))))

(assert (=> b!1485379 (= res!1010056 (= lt!648070 (Intermediate!12276 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485379 (= lt!648070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648075 mask!2687) lt!648075 lt!648074 mask!2687))))

(assert (=> b!1485379 (= lt!648075 (select (store (arr!48036 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485380 () Bool)

(declare-fun res!1010069 () Bool)

(assert (=> b!1485380 (=> (not res!1010069) (not e!832726))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485380 (= res!1010069 (or (= (select (arr!48036 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48036 a!2862) intermediateBeforeIndex!19) (select (arr!48036 a!2862) j!93))))))

(declare-fun b!1485381 () Bool)

(declare-fun res!1010061 () Bool)

(assert (=> b!1485381 (=> (not res!1010061) (not e!832721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485381 (= res!1010061 (validKeyInArray!0 (select (arr!48036 a!2862) i!1006)))))

(declare-fun b!1485382 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99520 (_ BitVec 32)) SeekEntryResult!12276)

(assert (=> b!1485382 (= e!832725 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648075 lt!648074 mask!2687) (seekEntryOrOpen!0 lt!648075 lt!648074 mask!2687)))))

(declare-fun b!1485383 () Bool)

(declare-fun res!1010065 () Bool)

(assert (=> b!1485383 (=> (not res!1010065) (not e!832721))))

(assert (=> b!1485383 (= res!1010065 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48586 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48586 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48586 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485384 () Bool)

(assert (=> b!1485384 (= e!832726 e!832720)))

(declare-fun res!1010066 () Bool)

(assert (=> b!1485384 (=> res!1010066 e!832720)))

(assert (=> b!1485384 (= res!1010066 (or (and (= (select (arr!48036 a!2862) index!646) lt!648071) (= (select (arr!48036 a!2862) index!646) (select (arr!48036 a!2862) j!93))) (= (select (arr!48036 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485384 (= lt!648071 (select (store (arr!48036 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485385 () Bool)

(declare-fun res!1010073 () Bool)

(assert (=> b!1485385 (=> (not res!1010073) (not e!832722))))

(assert (=> b!1485385 (= res!1010073 e!832725)))

(declare-fun c!137178 () Bool)

(assert (=> b!1485385 (= c!137178 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485375 () Bool)

(declare-fun res!1010063 () Bool)

(assert (=> b!1485375 (=> (not res!1010063) (not e!832721))))

(assert (=> b!1485375 (= res!1010063 (validKeyInArray!0 (select (arr!48036 a!2862) j!93)))))

(declare-fun res!1010070 () Bool)

(assert (=> start!126558 (=> (not res!1010070) (not e!832721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126558 (= res!1010070 (validMask!0 mask!2687))))

(assert (=> start!126558 e!832721))

(assert (=> start!126558 true))

(declare-fun array_inv!37064 (array!99520) Bool)

(assert (=> start!126558 (array_inv!37064 a!2862)))

(declare-fun b!1485386 () Bool)

(assert (=> b!1485386 (= e!832727 (= (seekEntryOrOpen!0 lt!648075 lt!648074 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648075 lt!648074 mask!2687)))))

(declare-fun b!1485387 () Bool)

(assert (=> b!1485387 (= e!832723 e!832724)))

(declare-fun res!1010062 () Bool)

(assert (=> b!1485387 (=> (not res!1010062) (not e!832724))))

(assert (=> b!1485387 (= res!1010062 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48036 a!2862) j!93) mask!2687) (select (arr!48036 a!2862) j!93) a!2862 mask!2687) lt!648069))))

(assert (=> b!1485387 (= lt!648069 (Intermediate!12276 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126558 res!1010070) b!1485373))

(assert (= (and b!1485373 res!1010071) b!1485381))

(assert (= (and b!1485381 res!1010061) b!1485375))

(assert (= (and b!1485375 res!1010063) b!1485376))

(assert (= (and b!1485376 res!1010067) b!1485377))

(assert (= (and b!1485377 res!1010059) b!1485383))

(assert (= (and b!1485383 res!1010065) b!1485378))

(assert (= (and b!1485378 res!1010068) b!1485387))

(assert (= (and b!1485387 res!1010062) b!1485367))

(assert (= (and b!1485367 res!1010057) b!1485379))

(assert (= (and b!1485379 res!1010056) b!1485385))

(assert (= (and b!1485385 c!137178) b!1485371))

(assert (= (and b!1485385 (not c!137178)) b!1485382))

(assert (= (and b!1485385 res!1010073) b!1485368))

(assert (= (and b!1485368 res!1010072) b!1485372))

(assert (= (and b!1485372 res!1010064) b!1485370))

(assert (= (and b!1485370 res!1010074) b!1485380))

(assert (= (and b!1485380 res!1010069) b!1485384))

(assert (= (and b!1485384 (not res!1010066)) b!1485374))

(assert (= (and b!1485374 res!1010060) b!1485386))

(assert (= (and b!1485372 (not res!1010058)) b!1485369))

(declare-fun m!1370513 () Bool)

(assert (=> b!1485376 m!1370513))

(declare-fun m!1370515 () Bool)

(assert (=> start!126558 m!1370515))

(declare-fun m!1370517 () Bool)

(assert (=> start!126558 m!1370517))

(declare-fun m!1370519 () Bool)

(assert (=> b!1485380 m!1370519))

(declare-fun m!1370521 () Bool)

(assert (=> b!1485380 m!1370521))

(declare-fun m!1370523 () Bool)

(assert (=> b!1485372 m!1370523))

(declare-fun m!1370525 () Bool)

(assert (=> b!1485372 m!1370525))

(declare-fun m!1370527 () Bool)

(assert (=> b!1485372 m!1370527))

(declare-fun m!1370529 () Bool)

(assert (=> b!1485372 m!1370529))

(declare-fun m!1370531 () Bool)

(assert (=> b!1485372 m!1370531))

(assert (=> b!1485372 m!1370521))

(assert (=> b!1485367 m!1370521))

(assert (=> b!1485367 m!1370521))

(declare-fun m!1370533 () Bool)

(assert (=> b!1485367 m!1370533))

(assert (=> b!1485384 m!1370529))

(assert (=> b!1485384 m!1370521))

(assert (=> b!1485384 m!1370525))

(assert (=> b!1485384 m!1370527))

(declare-fun m!1370535 () Bool)

(assert (=> b!1485381 m!1370535))

(assert (=> b!1485381 m!1370535))

(declare-fun m!1370537 () Bool)

(assert (=> b!1485381 m!1370537))

(declare-fun m!1370539 () Bool)

(assert (=> b!1485386 m!1370539))

(declare-fun m!1370541 () Bool)

(assert (=> b!1485386 m!1370541))

(assert (=> b!1485387 m!1370521))

(assert (=> b!1485387 m!1370521))

(declare-fun m!1370543 () Bool)

(assert (=> b!1485387 m!1370543))

(assert (=> b!1485387 m!1370543))

(assert (=> b!1485387 m!1370521))

(declare-fun m!1370545 () Bool)

(assert (=> b!1485387 m!1370545))

(declare-fun m!1370547 () Bool)

(assert (=> b!1485379 m!1370547))

(assert (=> b!1485379 m!1370547))

(declare-fun m!1370549 () Bool)

(assert (=> b!1485379 m!1370549))

(assert (=> b!1485379 m!1370525))

(declare-fun m!1370551 () Bool)

(assert (=> b!1485379 m!1370551))

(declare-fun m!1370553 () Bool)

(assert (=> b!1485377 m!1370553))

(declare-fun m!1370555 () Bool)

(assert (=> b!1485369 m!1370555))

(assert (=> b!1485382 m!1370541))

(assert (=> b!1485382 m!1370539))

(assert (=> b!1485375 m!1370521))

(assert (=> b!1485375 m!1370521))

(declare-fun m!1370557 () Bool)

(assert (=> b!1485375 m!1370557))

(assert (=> b!1485370 m!1370521))

(assert (=> b!1485370 m!1370521))

(declare-fun m!1370559 () Bool)

(assert (=> b!1485370 m!1370559))

(declare-fun m!1370561 () Bool)

(assert (=> b!1485371 m!1370561))

(assert (=> b!1485378 m!1370525))

(declare-fun m!1370563 () Bool)

(assert (=> b!1485378 m!1370563))

(check-sat (not b!1485376) (not b!1485372) (not b!1485377) (not b!1485369) (not b!1485386) (not start!126558) (not b!1485375) (not b!1485367) (not b!1485382) (not b!1485379) (not b!1485370) (not b!1485387) (not b!1485371) (not b!1485381))
(check-sat)
