; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124628 () Bool)

(assert start!124628)

(declare-fun res!975535 () Bool)

(declare-fun e!813398 () Bool)

(assert (=> start!124628 (=> (not res!975535) (not e!813398))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124628 (= res!975535 (validMask!0 mask!2687))))

(assert (=> start!124628 e!813398))

(assert (=> start!124628 true))

(declare-datatypes ((array!98076 0))(
  ( (array!98077 (arr!47326 (Array (_ BitVec 32) (_ BitVec 64))) (size!47876 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98076)

(declare-fun array_inv!36354 (array!98076) Bool)

(assert (=> start!124628 (array_inv!36354 a!2862)))

(declare-fun b!1443424 () Bool)

(declare-fun res!975544 () Bool)

(assert (=> b!1443424 (=> (not res!975544) (not e!813398))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443424 (= res!975544 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47876 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47876 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47876 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443425 () Bool)

(declare-fun e!813397 () Bool)

(assert (=> b!1443425 (= e!813397 true)))

(declare-datatypes ((SeekEntryResult!11578 0))(
  ( (MissingZero!11578 (index!48704 (_ BitVec 32))) (Found!11578 (index!48705 (_ BitVec 32))) (Intermediate!11578 (undefined!12390 Bool) (index!48706 (_ BitVec 32)) (x!130403 (_ BitVec 32))) (Undefined!11578) (MissingVacant!11578 (index!48707 (_ BitVec 32))) )
))
(declare-fun lt!633855 () SeekEntryResult!11578)

(declare-fun lt!633854 () array!98076)

(declare-fun lt!633856 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98076 (_ BitVec 32)) SeekEntryResult!11578)

(assert (=> b!1443425 (= lt!633855 (seekEntryOrOpen!0 lt!633856 lt!633854 mask!2687))))

(declare-fun b!1443426 () Bool)

(declare-fun e!813401 () Bool)

(declare-fun e!813400 () Bool)

(assert (=> b!1443426 (= e!813401 e!813400)))

(declare-fun res!975541 () Bool)

(assert (=> b!1443426 (=> (not res!975541) (not e!813400))))

(declare-fun lt!633853 () SeekEntryResult!11578)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98076 (_ BitVec 32)) SeekEntryResult!11578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443426 (= res!975541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47326 a!2862) j!93) mask!2687) (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!633853))))

(assert (=> b!1443426 (= lt!633853 (Intermediate!11578 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443427 () Bool)

(declare-fun res!975532 () Bool)

(assert (=> b!1443427 (=> (not res!975532) (not e!813398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443427 (= res!975532 (validKeyInArray!0 (select (arr!47326 a!2862) j!93)))))

(declare-fun b!1443428 () Bool)

(assert (=> b!1443428 (= e!813398 e!813401)))

(declare-fun res!975536 () Bool)

(assert (=> b!1443428 (=> (not res!975536) (not e!813401))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443428 (= res!975536 (= (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443428 (= lt!633854 (array!98077 (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47876 a!2862)))))

(declare-fun b!1443429 () Bool)

(declare-fun res!975542 () Bool)

(assert (=> b!1443429 (=> (not res!975542) (not e!813398))))

(assert (=> b!1443429 (= res!975542 (validKeyInArray!0 (select (arr!47326 a!2862) i!1006)))))

(declare-fun b!1443430 () Bool)

(declare-fun res!975530 () Bool)

(assert (=> b!1443430 (=> (not res!975530) (not e!813400))))

(assert (=> b!1443430 (= res!975530 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!633853))))

(declare-fun b!1443431 () Bool)

(declare-fun res!975534 () Bool)

(declare-fun e!813395 () Bool)

(assert (=> b!1443431 (=> (not res!975534) (not e!813395))))

(assert (=> b!1443431 (= res!975534 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443432 () Bool)

(declare-fun res!975537 () Bool)

(assert (=> b!1443432 (=> (not res!975537) (not e!813398))))

(assert (=> b!1443432 (= res!975537 (and (= (size!47876 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47876 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47876 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443433 () Bool)

(declare-fun res!975533 () Bool)

(assert (=> b!1443433 (=> (not res!975533) (not e!813395))))

(declare-fun e!813399 () Bool)

(assert (=> b!1443433 (= res!975533 e!813399)))

(declare-fun c!133458 () Bool)

(assert (=> b!1443433 (= c!133458 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443434 () Bool)

(assert (=> b!1443434 (= e!813400 e!813395)))

(declare-fun res!975538 () Bool)

(assert (=> b!1443434 (=> (not res!975538) (not e!813395))))

(declare-fun lt!633857 () SeekEntryResult!11578)

(assert (=> b!1443434 (= res!975538 (= lt!633857 (Intermediate!11578 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443434 (= lt!633857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633856 mask!2687) lt!633856 lt!633854 mask!2687))))

(assert (=> b!1443434 (= lt!633856 (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!813396 () Bool)

(declare-fun b!1443435 () Bool)

(assert (=> b!1443435 (= e!813396 (or (= (select (arr!47326 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47326 a!2862) intermediateBeforeIndex!19) (select (arr!47326 a!2862) j!93))))))

(declare-fun b!1443436 () Bool)

(declare-fun res!975529 () Bool)

(assert (=> b!1443436 (=> (not res!975529) (not e!813396))))

(assert (=> b!1443436 (= res!975529 (= (seekEntryOrOpen!0 (select (arr!47326 a!2862) j!93) a!2862 mask!2687) (Found!11578 j!93)))))

(declare-fun b!1443437 () Bool)

(declare-fun res!975543 () Bool)

(assert (=> b!1443437 (=> (not res!975543) (not e!813398))))

(declare-datatypes ((List!33827 0))(
  ( (Nil!33824) (Cons!33823 (h!35173 (_ BitVec 64)) (t!48521 List!33827)) )
))
(declare-fun arrayNoDuplicates!0 (array!98076 (_ BitVec 32) List!33827) Bool)

(assert (=> b!1443437 (= res!975543 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33824))))

(declare-fun b!1443438 () Bool)

(assert (=> b!1443438 (= e!813395 (not e!813397))))

(declare-fun res!975531 () Bool)

(assert (=> b!1443438 (=> res!975531 e!813397)))

(assert (=> b!1443438 (= res!975531 (or (not (= (select (arr!47326 a!2862) index!646) (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47326 a!2862) index!646) (select (arr!47326 a!2862) j!93)))))))

(assert (=> b!1443438 e!813396))

(declare-fun res!975540 () Bool)

(assert (=> b!1443438 (=> (not res!975540) (not e!813396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98076 (_ BitVec 32)) Bool)

(assert (=> b!1443438 (= res!975540 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48652 0))(
  ( (Unit!48653) )
))
(declare-fun lt!633858 () Unit!48652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48652)

(assert (=> b!1443438 (= lt!633858 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443439 () Bool)

(declare-fun res!975539 () Bool)

(assert (=> b!1443439 (=> (not res!975539) (not e!813398))))

(assert (=> b!1443439 (= res!975539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443440 () Bool)

(assert (=> b!1443440 (= e!813399 (= lt!633857 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633856 lt!633854 mask!2687)))))

(declare-fun b!1443441 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98076 (_ BitVec 32)) SeekEntryResult!11578)

(assert (=> b!1443441 (= e!813399 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633856 lt!633854 mask!2687) (seekEntryOrOpen!0 lt!633856 lt!633854 mask!2687)))))

(assert (= (and start!124628 res!975535) b!1443432))

(assert (= (and b!1443432 res!975537) b!1443429))

(assert (= (and b!1443429 res!975542) b!1443427))

(assert (= (and b!1443427 res!975532) b!1443439))

(assert (= (and b!1443439 res!975539) b!1443437))

(assert (= (and b!1443437 res!975543) b!1443424))

(assert (= (and b!1443424 res!975544) b!1443428))

(assert (= (and b!1443428 res!975536) b!1443426))

(assert (= (and b!1443426 res!975541) b!1443430))

(assert (= (and b!1443430 res!975530) b!1443434))

(assert (= (and b!1443434 res!975538) b!1443433))

(assert (= (and b!1443433 c!133458) b!1443440))

(assert (= (and b!1443433 (not c!133458)) b!1443441))

(assert (= (and b!1443433 res!975533) b!1443431))

(assert (= (and b!1443431 res!975534) b!1443438))

(assert (= (and b!1443438 res!975540) b!1443436))

(assert (= (and b!1443436 res!975529) b!1443435))

(assert (= (and b!1443438 (not res!975531)) b!1443425))

(declare-fun m!1332503 () Bool)

(assert (=> b!1443428 m!1332503))

(declare-fun m!1332505 () Bool)

(assert (=> b!1443428 m!1332505))

(declare-fun m!1332507 () Bool)

(assert (=> b!1443438 m!1332507))

(assert (=> b!1443438 m!1332503))

(declare-fun m!1332509 () Bool)

(assert (=> b!1443438 m!1332509))

(declare-fun m!1332511 () Bool)

(assert (=> b!1443438 m!1332511))

(declare-fun m!1332513 () Bool)

(assert (=> b!1443438 m!1332513))

(declare-fun m!1332515 () Bool)

(assert (=> b!1443438 m!1332515))

(declare-fun m!1332517 () Bool)

(assert (=> b!1443434 m!1332517))

(assert (=> b!1443434 m!1332517))

(declare-fun m!1332519 () Bool)

(assert (=> b!1443434 m!1332519))

(assert (=> b!1443434 m!1332503))

(declare-fun m!1332521 () Bool)

(assert (=> b!1443434 m!1332521))

(assert (=> b!1443436 m!1332515))

(assert (=> b!1443436 m!1332515))

(declare-fun m!1332523 () Bool)

(assert (=> b!1443436 m!1332523))

(assert (=> b!1443430 m!1332515))

(assert (=> b!1443430 m!1332515))

(declare-fun m!1332525 () Bool)

(assert (=> b!1443430 m!1332525))

(declare-fun m!1332527 () Bool)

(assert (=> start!124628 m!1332527))

(declare-fun m!1332529 () Bool)

(assert (=> start!124628 m!1332529))

(declare-fun m!1332531 () Bool)

(assert (=> b!1443439 m!1332531))

(declare-fun m!1332533 () Bool)

(assert (=> b!1443435 m!1332533))

(assert (=> b!1443435 m!1332515))

(declare-fun m!1332535 () Bool)

(assert (=> b!1443429 m!1332535))

(assert (=> b!1443429 m!1332535))

(declare-fun m!1332537 () Bool)

(assert (=> b!1443429 m!1332537))

(declare-fun m!1332539 () Bool)

(assert (=> b!1443441 m!1332539))

(declare-fun m!1332541 () Bool)

(assert (=> b!1443441 m!1332541))

(assert (=> b!1443425 m!1332541))

(declare-fun m!1332543 () Bool)

(assert (=> b!1443437 m!1332543))

(assert (=> b!1443426 m!1332515))

(assert (=> b!1443426 m!1332515))

(declare-fun m!1332545 () Bool)

(assert (=> b!1443426 m!1332545))

(assert (=> b!1443426 m!1332545))

(assert (=> b!1443426 m!1332515))

(declare-fun m!1332547 () Bool)

(assert (=> b!1443426 m!1332547))

(assert (=> b!1443427 m!1332515))

(assert (=> b!1443427 m!1332515))

(declare-fun m!1332549 () Bool)

(assert (=> b!1443427 m!1332549))

(declare-fun m!1332551 () Bool)

(assert (=> b!1443440 m!1332551))

(push 1)

