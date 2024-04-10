; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125082 () Bool)

(assert start!125082)

(declare-fun b!1456350 () Bool)

(declare-fun res!986859 () Bool)

(declare-fun e!819395 () Bool)

(assert (=> b!1456350 (=> (not res!986859) (not e!819395))))

(declare-fun e!819397 () Bool)

(assert (=> b!1456350 (= res!986859 e!819397)))

(declare-fun c!134262 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456350 (= c!134262 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456351 () Bool)

(declare-fun e!819393 () Bool)

(declare-fun e!819392 () Bool)

(assert (=> b!1456351 (= e!819393 e!819392)))

(declare-fun res!986857 () Bool)

(assert (=> b!1456351 (=> (not res!986857) (not e!819392))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98530 0))(
  ( (array!98531 (arr!47553 (Array (_ BitVec 32) (_ BitVec 64))) (size!48103 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98530)

(assert (=> b!1456351 (= res!986857 (= (select (store (arr!47553 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638285 () array!98530)

(assert (=> b!1456351 (= lt!638285 (array!98531 (store (arr!47553 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48103 a!2862)))))

(declare-fun b!1456352 () Bool)

(declare-fun lt!638284 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11805 0))(
  ( (MissingZero!11805 (index!49612 (_ BitVec 32))) (Found!11805 (index!49613 (_ BitVec 32))) (Intermediate!11805 (undefined!12617 Bool) (index!49614 (_ BitVec 32)) (x!131238 (_ BitVec 32))) (Undefined!11805) (MissingVacant!11805 (index!49615 (_ BitVec 32))) )
))
(declare-fun lt!638283 () SeekEntryResult!11805)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11805)

(assert (=> b!1456352 (= e!819397 (= lt!638283 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638284 lt!638285 mask!2687)))))

(declare-fun lt!638289 () (_ BitVec 32))

(declare-fun lt!638286 () SeekEntryResult!11805)

(declare-fun e!819394 () Bool)

(declare-fun b!1456353 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11805)

(assert (=> b!1456353 (= e!819394 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638289 intermediateAfterIndex!19 lt!638284 lt!638285 mask!2687) lt!638286)))))

(declare-fun b!1456354 () Bool)

(declare-fun res!986864 () Bool)

(assert (=> b!1456354 (=> (not res!986864) (not e!819393))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456354 (= res!986864 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48103 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48103 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48103 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456355 () Bool)

(declare-fun res!986863 () Bool)

(assert (=> b!1456355 (=> (not res!986863) (not e!819395))))

(assert (=> b!1456355 (= res!986863 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456357 () Bool)

(declare-fun e!819398 () Bool)

(assert (=> b!1456357 (= e!819392 e!819398)))

(declare-fun res!986849 () Bool)

(assert (=> b!1456357 (=> (not res!986849) (not e!819398))))

(declare-fun lt!638287 () SeekEntryResult!11805)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456357 (= res!986849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47553 a!2862) j!93) mask!2687) (select (arr!47553 a!2862) j!93) a!2862 mask!2687) lt!638287))))

(assert (=> b!1456357 (= lt!638287 (Intermediate!11805 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456358 () Bool)

(declare-fun e!819400 () Bool)

(declare-fun e!819399 () Bool)

(assert (=> b!1456358 (= e!819400 e!819399)))

(declare-fun res!986852 () Bool)

(assert (=> b!1456358 (=> res!986852 e!819399)))

(assert (=> b!1456358 (= res!986852 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638289 #b00000000000000000000000000000000) (bvsge lt!638289 (size!48103 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456358 (= lt!638289 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456358 (= lt!638286 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638284 lt!638285 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98530 (_ BitVec 32)) SeekEntryResult!11805)

(assert (=> b!1456358 (= lt!638286 (seekEntryOrOpen!0 lt!638284 lt!638285 mask!2687))))

(declare-fun b!1456359 () Bool)

(assert (=> b!1456359 (= e!819399 true)))

(declare-fun lt!638288 () Bool)

(assert (=> b!1456359 (= lt!638288 e!819394)))

(declare-fun c!134261 () Bool)

(assert (=> b!1456359 (= c!134261 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456360 () Bool)

(assert (=> b!1456360 (= e!819394 (not (= lt!638283 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638289 lt!638284 lt!638285 mask!2687))))))

(declare-fun b!1456361 () Bool)

(assert (=> b!1456361 (= e!819398 e!819395)))

(declare-fun res!986851 () Bool)

(assert (=> b!1456361 (=> (not res!986851) (not e!819395))))

(assert (=> b!1456361 (= res!986851 (= lt!638283 (Intermediate!11805 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456361 (= lt!638283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638284 mask!2687) lt!638284 lt!638285 mask!2687))))

(assert (=> b!1456361 (= lt!638284 (select (store (arr!47553 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456362 () Bool)

(declare-fun res!986854 () Bool)

(assert (=> b!1456362 (=> (not res!986854) (not e!819393))))

(assert (=> b!1456362 (= res!986854 (and (= (size!48103 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48103 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48103 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456363 () Bool)

(assert (=> b!1456363 (= e!819395 (not e!819400))))

(declare-fun res!986865 () Bool)

(assert (=> b!1456363 (=> res!986865 e!819400)))

(assert (=> b!1456363 (= res!986865 (or (and (= (select (arr!47553 a!2862) index!646) (select (store (arr!47553 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47553 a!2862) index!646) (select (arr!47553 a!2862) j!93))) (= (select (arr!47553 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819396 () Bool)

(assert (=> b!1456363 e!819396))

(declare-fun res!986861 () Bool)

(assert (=> b!1456363 (=> (not res!986861) (not e!819396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98530 (_ BitVec 32)) Bool)

(assert (=> b!1456363 (= res!986861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49106 0))(
  ( (Unit!49107) )
))
(declare-fun lt!638282 () Unit!49106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49106)

(assert (=> b!1456363 (= lt!638282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456364 () Bool)

(assert (=> b!1456364 (= e!819397 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638284 lt!638285 mask!2687) (seekEntryOrOpen!0 lt!638284 lt!638285 mask!2687)))))

(declare-fun b!1456365 () Bool)

(declare-fun res!986858 () Bool)

(assert (=> b!1456365 (=> (not res!986858) (not e!819393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456365 (= res!986858 (validKeyInArray!0 (select (arr!47553 a!2862) i!1006)))))

(declare-fun b!1456356 () Bool)

(declare-fun res!986850 () Bool)

(assert (=> b!1456356 (=> (not res!986850) (not e!819393))))

(assert (=> b!1456356 (= res!986850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!986866 () Bool)

(assert (=> start!125082 (=> (not res!986866) (not e!819393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125082 (= res!986866 (validMask!0 mask!2687))))

(assert (=> start!125082 e!819393))

(assert (=> start!125082 true))

(declare-fun array_inv!36581 (array!98530) Bool)

(assert (=> start!125082 (array_inv!36581 a!2862)))

(declare-fun b!1456366 () Bool)

(declare-fun res!986860 () Bool)

(assert (=> b!1456366 (=> res!986860 e!819399)))

(assert (=> b!1456366 (= res!986860 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638289 (select (arr!47553 a!2862) j!93) a!2862 mask!2687) lt!638287)))))

(declare-fun b!1456367 () Bool)

(declare-fun res!986853 () Bool)

(assert (=> b!1456367 (=> (not res!986853) (not e!819398))))

(assert (=> b!1456367 (= res!986853 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47553 a!2862) j!93) a!2862 mask!2687) lt!638287))))

(declare-fun b!1456368 () Bool)

(declare-fun res!986855 () Bool)

(assert (=> b!1456368 (=> (not res!986855) (not e!819393))))

(declare-datatypes ((List!34054 0))(
  ( (Nil!34051) (Cons!34050 (h!35400 (_ BitVec 64)) (t!48748 List!34054)) )
))
(declare-fun arrayNoDuplicates!0 (array!98530 (_ BitVec 32) List!34054) Bool)

(assert (=> b!1456368 (= res!986855 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34051))))

(declare-fun b!1456369 () Bool)

(assert (=> b!1456369 (= e!819396 (and (or (= (select (arr!47553 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47553 a!2862) intermediateBeforeIndex!19) (select (arr!47553 a!2862) j!93))) (let ((bdg!53236 (select (store (arr!47553 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47553 a!2862) index!646) bdg!53236) (= (select (arr!47553 a!2862) index!646) (select (arr!47553 a!2862) j!93))) (= (select (arr!47553 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53236 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456370 () Bool)

(declare-fun res!986862 () Bool)

(assert (=> b!1456370 (=> (not res!986862) (not e!819393))))

(assert (=> b!1456370 (= res!986862 (validKeyInArray!0 (select (arr!47553 a!2862) j!93)))))

(declare-fun b!1456371 () Bool)

(declare-fun res!986856 () Bool)

(assert (=> b!1456371 (=> (not res!986856) (not e!819396))))

(assert (=> b!1456371 (= res!986856 (= (seekEntryOrOpen!0 (select (arr!47553 a!2862) j!93) a!2862 mask!2687) (Found!11805 j!93)))))

(assert (= (and start!125082 res!986866) b!1456362))

(assert (= (and b!1456362 res!986854) b!1456365))

(assert (= (and b!1456365 res!986858) b!1456370))

(assert (= (and b!1456370 res!986862) b!1456356))

(assert (= (and b!1456356 res!986850) b!1456368))

(assert (= (and b!1456368 res!986855) b!1456354))

(assert (= (and b!1456354 res!986864) b!1456351))

(assert (= (and b!1456351 res!986857) b!1456357))

(assert (= (and b!1456357 res!986849) b!1456367))

(assert (= (and b!1456367 res!986853) b!1456361))

(assert (= (and b!1456361 res!986851) b!1456350))

(assert (= (and b!1456350 c!134262) b!1456352))

(assert (= (and b!1456350 (not c!134262)) b!1456364))

(assert (= (and b!1456350 res!986859) b!1456355))

(assert (= (and b!1456355 res!986863) b!1456363))

(assert (= (and b!1456363 res!986861) b!1456371))

(assert (= (and b!1456371 res!986856) b!1456369))

(assert (= (and b!1456363 (not res!986865)) b!1456358))

(assert (= (and b!1456358 (not res!986852)) b!1456366))

(assert (= (and b!1456366 (not res!986860)) b!1456359))

(assert (= (and b!1456359 c!134261) b!1456360))

(assert (= (and b!1456359 (not c!134261)) b!1456353))

(declare-fun m!1344461 () Bool)

(assert (=> b!1456371 m!1344461))

(assert (=> b!1456371 m!1344461))

(declare-fun m!1344463 () Bool)

(assert (=> b!1456371 m!1344463))

(declare-fun m!1344465 () Bool)

(assert (=> b!1456358 m!1344465))

(declare-fun m!1344467 () Bool)

(assert (=> b!1456358 m!1344467))

(declare-fun m!1344469 () Bool)

(assert (=> b!1456358 m!1344469))

(assert (=> b!1456367 m!1344461))

(assert (=> b!1456367 m!1344461))

(declare-fun m!1344471 () Bool)

(assert (=> b!1456367 m!1344471))

(declare-fun m!1344473 () Bool)

(assert (=> start!125082 m!1344473))

(declare-fun m!1344475 () Bool)

(assert (=> start!125082 m!1344475))

(declare-fun m!1344477 () Bool)

(assert (=> b!1456363 m!1344477))

(declare-fun m!1344479 () Bool)

(assert (=> b!1456363 m!1344479))

(declare-fun m!1344481 () Bool)

(assert (=> b!1456363 m!1344481))

(declare-fun m!1344483 () Bool)

(assert (=> b!1456363 m!1344483))

(declare-fun m!1344485 () Bool)

(assert (=> b!1456363 m!1344485))

(assert (=> b!1456363 m!1344461))

(declare-fun m!1344487 () Bool)

(assert (=> b!1456356 m!1344487))

(assert (=> b!1456364 m!1344467))

(assert (=> b!1456364 m!1344469))

(assert (=> b!1456351 m!1344479))

(declare-fun m!1344489 () Bool)

(assert (=> b!1456351 m!1344489))

(assert (=> b!1456370 m!1344461))

(assert (=> b!1456370 m!1344461))

(declare-fun m!1344491 () Bool)

(assert (=> b!1456370 m!1344491))

(assert (=> b!1456369 m!1344479))

(declare-fun m!1344493 () Bool)

(assert (=> b!1456369 m!1344493))

(assert (=> b!1456369 m!1344481))

(assert (=> b!1456369 m!1344483))

(assert (=> b!1456369 m!1344461))

(declare-fun m!1344495 () Bool)

(assert (=> b!1456361 m!1344495))

(assert (=> b!1456361 m!1344495))

(declare-fun m!1344497 () Bool)

(assert (=> b!1456361 m!1344497))

(assert (=> b!1456361 m!1344479))

(declare-fun m!1344499 () Bool)

(assert (=> b!1456361 m!1344499))

(declare-fun m!1344501 () Bool)

(assert (=> b!1456353 m!1344501))

(assert (=> b!1456366 m!1344461))

(assert (=> b!1456366 m!1344461))

(declare-fun m!1344503 () Bool)

(assert (=> b!1456366 m!1344503))

(declare-fun m!1344505 () Bool)

(assert (=> b!1456360 m!1344505))

(assert (=> b!1456357 m!1344461))

(assert (=> b!1456357 m!1344461))

(declare-fun m!1344507 () Bool)

(assert (=> b!1456357 m!1344507))

(assert (=> b!1456357 m!1344507))

(assert (=> b!1456357 m!1344461))

(declare-fun m!1344509 () Bool)

(assert (=> b!1456357 m!1344509))

(declare-fun m!1344511 () Bool)

(assert (=> b!1456368 m!1344511))

(declare-fun m!1344513 () Bool)

(assert (=> b!1456352 m!1344513))

(declare-fun m!1344515 () Bool)

(assert (=> b!1456365 m!1344515))

(assert (=> b!1456365 m!1344515))

(declare-fun m!1344517 () Bool)

(assert (=> b!1456365 m!1344517))

(check-sat (not b!1456361) (not b!1456353) (not b!1456363) (not start!125082) (not b!1456358) (not b!1456356) (not b!1456371) (not b!1456365) (not b!1456364) (not b!1456360) (not b!1456370) (not b!1456352) (not b!1456357) (not b!1456366) (not b!1456367) (not b!1456368))
(check-sat)
