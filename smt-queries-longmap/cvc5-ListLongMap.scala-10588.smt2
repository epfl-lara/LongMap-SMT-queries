; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124666 () Bool)

(assert start!124666)

(declare-fun b!1444432 () Bool)

(declare-fun res!976436 () Bool)

(declare-fun e!813834 () Bool)

(assert (=> b!1444432 (=> (not res!976436) (not e!813834))))

(declare-datatypes ((array!98114 0))(
  ( (array!98115 (arr!47345 (Array (_ BitVec 32) (_ BitVec 64))) (size!47895 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98114)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444432 (= res!976436 (validKeyInArray!0 (select (arr!47345 a!2862) i!1006)))))

(declare-fun b!1444433 () Bool)

(declare-fun e!813836 () Bool)

(declare-fun e!813832 () Bool)

(assert (=> b!1444433 (= e!813836 (not e!813832))))

(declare-fun res!976424 () Bool)

(assert (=> b!1444433 (=> res!976424 e!813832)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444433 (= res!976424 (or (not (= (select (arr!47345 a!2862) index!646) (select (store (arr!47345 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47345 a!2862) index!646) (select (arr!47345 a!2862) j!93)))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11597 0))(
  ( (MissingZero!11597 (index!48780 (_ BitVec 32))) (Found!11597 (index!48781 (_ BitVec 32))) (Intermediate!11597 (undefined!12409 Bool) (index!48782 (_ BitVec 32)) (x!130478 (_ BitVec 32))) (Undefined!11597) (MissingVacant!11597 (index!48783 (_ BitVec 32))) )
))
(declare-fun lt!634197 () SeekEntryResult!11597)

(assert (=> b!1444433 (and (= lt!634197 (Found!11597 j!93)) (or (= (select (arr!47345 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47345 a!2862) intermediateBeforeIndex!19) (select (arr!47345 a!2862) j!93))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98114 (_ BitVec 32)) SeekEntryResult!11597)

(assert (=> b!1444433 (= lt!634197 (seekEntryOrOpen!0 (select (arr!47345 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98114 (_ BitVec 32)) Bool)

(assert (=> b!1444433 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48690 0))(
  ( (Unit!48691) )
))
(declare-fun lt!634198 () Unit!48690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48690)

(assert (=> b!1444433 (= lt!634198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444434 () Bool)

(declare-fun res!976430 () Bool)

(assert (=> b!1444434 (=> (not res!976430) (not e!813836))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444434 (= res!976430 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444436 () Bool)

(declare-fun res!976434 () Bool)

(assert (=> b!1444436 (=> res!976434 e!813832)))

(assert (=> b!1444436 (= res!976434 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444437 () Bool)

(declare-fun e!813830 () Bool)

(assert (=> b!1444437 (= e!813830 e!813836)))

(declare-fun res!976423 () Bool)

(assert (=> b!1444437 (=> (not res!976423) (not e!813836))))

(declare-fun lt!634199 () SeekEntryResult!11597)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444437 (= res!976423 (= lt!634199 (Intermediate!11597 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634196 () array!98114)

(declare-fun lt!634195 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98114 (_ BitVec 32)) SeekEntryResult!11597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444437 (= lt!634199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634195 mask!2687) lt!634195 lt!634196 mask!2687))))

(assert (=> b!1444437 (= lt!634195 (select (store (arr!47345 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444438 () Bool)

(declare-fun e!813835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98114 (_ BitVec 32)) SeekEntryResult!11597)

(assert (=> b!1444438 (= e!813835 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634195 lt!634196 mask!2687) (seekEntryOrOpen!0 lt!634195 lt!634196 mask!2687)))))

(declare-fun b!1444439 () Bool)

(declare-fun res!976432 () Bool)

(assert (=> b!1444439 (=> (not res!976432) (not e!813834))))

(assert (=> b!1444439 (= res!976432 (and (= (size!47895 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47895 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47895 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444440 () Bool)

(declare-fun res!976427 () Bool)

(assert (=> b!1444440 (=> (not res!976427) (not e!813834))))

(assert (=> b!1444440 (= res!976427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444441 () Bool)

(declare-fun res!976438 () Bool)

(assert (=> b!1444441 (=> res!976438 e!813832)))

(assert (=> b!1444441 (= res!976438 (not (= lt!634197 (seekEntryOrOpen!0 lt!634195 lt!634196 mask!2687))))))

(declare-fun b!1444442 () Bool)

(declare-fun res!976433 () Bool)

(assert (=> b!1444442 (=> (not res!976433) (not e!813834))))

(assert (=> b!1444442 (= res!976433 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47895 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47895 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47895 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444443 () Bool)

(declare-fun res!976425 () Bool)

(assert (=> b!1444443 (=> (not res!976425) (not e!813830))))

(declare-fun lt!634200 () SeekEntryResult!11597)

(assert (=> b!1444443 (= res!976425 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47345 a!2862) j!93) a!2862 mask!2687) lt!634200))))

(declare-fun b!1444444 () Bool)

(declare-fun res!976429 () Bool)

(assert (=> b!1444444 (=> (not res!976429) (not e!813834))))

(declare-datatypes ((List!33846 0))(
  ( (Nil!33843) (Cons!33842 (h!35192 (_ BitVec 64)) (t!48540 List!33846)) )
))
(declare-fun arrayNoDuplicates!0 (array!98114 (_ BitVec 32) List!33846) Bool)

(assert (=> b!1444444 (= res!976429 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33843))))

(declare-fun b!1444445 () Bool)

(declare-fun res!976437 () Bool)

(assert (=> b!1444445 (=> (not res!976437) (not e!813836))))

(assert (=> b!1444445 (= res!976437 e!813835)))

(declare-fun c!133515 () Bool)

(assert (=> b!1444445 (= c!133515 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444446 () Bool)

(declare-fun e!813831 () Bool)

(assert (=> b!1444446 (= e!813831 e!813830)))

(declare-fun res!976435 () Bool)

(assert (=> b!1444446 (=> (not res!976435) (not e!813830))))

(assert (=> b!1444446 (= res!976435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47345 a!2862) j!93) mask!2687) (select (arr!47345 a!2862) j!93) a!2862 mask!2687) lt!634200))))

(assert (=> b!1444446 (= lt!634200 (Intermediate!11597 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444447 () Bool)

(assert (=> b!1444447 (= e!813832 (validKeyInArray!0 lt!634195))))

(declare-fun b!1444448 () Bool)

(assert (=> b!1444448 (= e!813834 e!813831)))

(declare-fun res!976426 () Bool)

(assert (=> b!1444448 (=> (not res!976426) (not e!813831))))

(assert (=> b!1444448 (= res!976426 (= (select (store (arr!47345 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444448 (= lt!634196 (array!98115 (store (arr!47345 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47895 a!2862)))))

(declare-fun b!1444449 () Bool)

(declare-fun res!976428 () Bool)

(assert (=> b!1444449 (=> (not res!976428) (not e!813834))))

(assert (=> b!1444449 (= res!976428 (validKeyInArray!0 (select (arr!47345 a!2862) j!93)))))

(declare-fun res!976431 () Bool)

(assert (=> start!124666 (=> (not res!976431) (not e!813834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124666 (= res!976431 (validMask!0 mask!2687))))

(assert (=> start!124666 e!813834))

(assert (=> start!124666 true))

(declare-fun array_inv!36373 (array!98114) Bool)

(assert (=> start!124666 (array_inv!36373 a!2862)))

(declare-fun b!1444435 () Bool)

(assert (=> b!1444435 (= e!813835 (= lt!634199 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634195 lt!634196 mask!2687)))))

(assert (= (and start!124666 res!976431) b!1444439))

(assert (= (and b!1444439 res!976432) b!1444432))

(assert (= (and b!1444432 res!976436) b!1444449))

(assert (= (and b!1444449 res!976428) b!1444440))

(assert (= (and b!1444440 res!976427) b!1444444))

(assert (= (and b!1444444 res!976429) b!1444442))

(assert (= (and b!1444442 res!976433) b!1444448))

(assert (= (and b!1444448 res!976426) b!1444446))

(assert (= (and b!1444446 res!976435) b!1444443))

(assert (= (and b!1444443 res!976425) b!1444437))

(assert (= (and b!1444437 res!976423) b!1444445))

(assert (= (and b!1444445 c!133515) b!1444435))

(assert (= (and b!1444445 (not c!133515)) b!1444438))

(assert (= (and b!1444445 res!976437) b!1444434))

(assert (= (and b!1444434 res!976430) b!1444433))

(assert (= (and b!1444433 (not res!976424)) b!1444441))

(assert (= (and b!1444441 (not res!976438)) b!1444436))

(assert (= (and b!1444436 (not res!976434)) b!1444447))

(declare-fun m!1333453 () Bool)

(assert (=> b!1444437 m!1333453))

(assert (=> b!1444437 m!1333453))

(declare-fun m!1333455 () Bool)

(assert (=> b!1444437 m!1333455))

(declare-fun m!1333457 () Bool)

(assert (=> b!1444437 m!1333457))

(declare-fun m!1333459 () Bool)

(assert (=> b!1444437 m!1333459))

(declare-fun m!1333461 () Bool)

(assert (=> b!1444433 m!1333461))

(assert (=> b!1444433 m!1333457))

(declare-fun m!1333463 () Bool)

(assert (=> b!1444433 m!1333463))

(declare-fun m!1333465 () Bool)

(assert (=> b!1444433 m!1333465))

(declare-fun m!1333467 () Bool)

(assert (=> b!1444433 m!1333467))

(declare-fun m!1333469 () Bool)

(assert (=> b!1444433 m!1333469))

(declare-fun m!1333471 () Bool)

(assert (=> b!1444433 m!1333471))

(declare-fun m!1333473 () Bool)

(assert (=> b!1444433 m!1333473))

(assert (=> b!1444433 m!1333469))

(declare-fun m!1333475 () Bool)

(assert (=> b!1444438 m!1333475))

(declare-fun m!1333477 () Bool)

(assert (=> b!1444438 m!1333477))

(assert (=> b!1444441 m!1333477))

(assert (=> b!1444449 m!1333469))

(assert (=> b!1444449 m!1333469))

(declare-fun m!1333479 () Bool)

(assert (=> b!1444449 m!1333479))

(assert (=> b!1444448 m!1333457))

(declare-fun m!1333481 () Bool)

(assert (=> b!1444448 m!1333481))

(declare-fun m!1333483 () Bool)

(assert (=> b!1444447 m!1333483))

(declare-fun m!1333485 () Bool)

(assert (=> b!1444440 m!1333485))

(declare-fun m!1333487 () Bool)

(assert (=> b!1444432 m!1333487))

(assert (=> b!1444432 m!1333487))

(declare-fun m!1333489 () Bool)

(assert (=> b!1444432 m!1333489))

(declare-fun m!1333491 () Bool)

(assert (=> b!1444444 m!1333491))

(assert (=> b!1444446 m!1333469))

(assert (=> b!1444446 m!1333469))

(declare-fun m!1333493 () Bool)

(assert (=> b!1444446 m!1333493))

(assert (=> b!1444446 m!1333493))

(assert (=> b!1444446 m!1333469))

(declare-fun m!1333495 () Bool)

(assert (=> b!1444446 m!1333495))

(assert (=> b!1444443 m!1333469))

(assert (=> b!1444443 m!1333469))

(declare-fun m!1333497 () Bool)

(assert (=> b!1444443 m!1333497))

(declare-fun m!1333499 () Bool)

(assert (=> start!124666 m!1333499))

(declare-fun m!1333501 () Bool)

(assert (=> start!124666 m!1333501))

(declare-fun m!1333503 () Bool)

(assert (=> b!1444435 m!1333503))

(push 1)

