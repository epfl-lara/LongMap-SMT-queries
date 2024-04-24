; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124866 () Bool)

(assert start!124866)

(declare-fun e!814470 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1445282 () Bool)

(declare-datatypes ((array!98209 0))(
  ( (array!98210 (arr!47389 (Array (_ BitVec 32) (_ BitVec 64))) (size!47940 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98209)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445282 (= e!814470 (or (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) (select (arr!47389 a!2862) j!93))))))

(declare-fun b!1445283 () Bool)

(declare-fun res!976517 () Bool)

(declare-fun e!814469 () Bool)

(assert (=> b!1445283 (=> (not res!976517) (not e!814469))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445283 (= res!976517 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47940 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47940 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47940 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!634514 () array!98209)

(declare-fun b!1445284 () Bool)

(declare-fun lt!634511 () (_ BitVec 64))

(declare-fun e!814465 () Bool)

(declare-datatypes ((SeekEntryResult!11538 0))(
  ( (MissingZero!11538 (index!48544 (_ BitVec 32))) (Found!11538 (index!48545 (_ BitVec 32))) (Intermediate!11538 (undefined!12350 Bool) (index!48546 (_ BitVec 32)) (x!130419 (_ BitVec 32))) (Undefined!11538) (MissingVacant!11538 (index!48547 (_ BitVec 32))) )
))
(declare-fun lt!634513 () SeekEntryResult!11538)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98209 (_ BitVec 32)) SeekEntryResult!11538)

(assert (=> b!1445284 (= e!814465 (= lt!634513 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634511 lt!634514 mask!2687)))))

(declare-fun b!1445285 () Bool)

(declare-fun res!976509 () Bool)

(assert (=> b!1445285 (=> (not res!976509) (not e!814469))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445285 (= res!976509 (validKeyInArray!0 (select (arr!47389 a!2862) i!1006)))))

(declare-fun b!1445286 () Bool)

(declare-fun res!976503 () Bool)

(declare-fun e!814463 () Bool)

(assert (=> b!1445286 (=> (not res!976503) (not e!814463))))

(assert (=> b!1445286 (= res!976503 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445287 () Bool)

(declare-fun res!976511 () Bool)

(assert (=> b!1445287 (=> (not res!976511) (not e!814463))))

(assert (=> b!1445287 (= res!976511 e!814465)))

(declare-fun c!133909 () Bool)

(assert (=> b!1445287 (= c!133909 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445288 () Bool)

(declare-fun res!976512 () Bool)

(assert (=> b!1445288 (=> (not res!976512) (not e!814469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98209 (_ BitVec 32)) Bool)

(assert (=> b!1445288 (= res!976512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445289 () Bool)

(declare-fun e!814467 () Bool)

(assert (=> b!1445289 (= e!814467 e!814463)))

(declare-fun res!976505 () Bool)

(assert (=> b!1445289 (=> (not res!976505) (not e!814463))))

(assert (=> b!1445289 (= res!976505 (= lt!634513 (Intermediate!11538 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445289 (= lt!634513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634511 mask!2687) lt!634511 lt!634514 mask!2687))))

(assert (=> b!1445289 (= lt!634511 (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!976507 () Bool)

(assert (=> start!124866 (=> (not res!976507) (not e!814469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124866 (= res!976507 (validMask!0 mask!2687))))

(assert (=> start!124866 e!814469))

(assert (=> start!124866 true))

(declare-fun array_inv!36670 (array!98209) Bool)

(assert (=> start!124866 (array_inv!36670 a!2862)))

(declare-fun b!1445290 () Bool)

(declare-fun res!976513 () Bool)

(assert (=> b!1445290 (=> (not res!976513) (not e!814469))))

(declare-datatypes ((List!33877 0))(
  ( (Nil!33874) (Cons!33873 (h!35234 (_ BitVec 64)) (t!48563 List!33877)) )
))
(declare-fun arrayNoDuplicates!0 (array!98209 (_ BitVec 32) List!33877) Bool)

(assert (=> b!1445290 (= res!976513 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33874))))

(declare-fun b!1445291 () Bool)

(declare-fun res!976506 () Bool)

(assert (=> b!1445291 (=> (not res!976506) (not e!814467))))

(declare-fun lt!634516 () SeekEntryResult!11538)

(assert (=> b!1445291 (= res!976506 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!634516))))

(declare-fun b!1445292 () Bool)

(declare-fun e!814464 () Bool)

(assert (=> b!1445292 (= e!814464 e!814467)))

(declare-fun res!976515 () Bool)

(assert (=> b!1445292 (=> (not res!976515) (not e!814467))))

(assert (=> b!1445292 (= res!976515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47389 a!2862) j!93) mask!2687) (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!634516))))

(assert (=> b!1445292 (= lt!634516 (Intermediate!11538 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445293 () Bool)

(assert (=> b!1445293 (= e!814469 e!814464)))

(declare-fun res!976508 () Bool)

(assert (=> b!1445293 (=> (not res!976508) (not e!814464))))

(assert (=> b!1445293 (= res!976508 (= (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445293 (= lt!634514 (array!98210 (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47940 a!2862)))))

(declare-fun b!1445294 () Bool)

(declare-fun e!814468 () Bool)

(assert (=> b!1445294 (= e!814468 true)))

(declare-fun lt!634515 () SeekEntryResult!11538)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98209 (_ BitVec 32)) SeekEntryResult!11538)

(assert (=> b!1445294 (= lt!634515 (seekEntryOrOpen!0 lt!634511 lt!634514 mask!2687))))

(declare-fun b!1445295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98209 (_ BitVec 32)) SeekEntryResult!11538)

(assert (=> b!1445295 (= e!814465 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634511 lt!634514 mask!2687) (seekEntryOrOpen!0 lt!634511 lt!634514 mask!2687)))))

(declare-fun b!1445296 () Bool)

(declare-fun res!976504 () Bool)

(assert (=> b!1445296 (=> (not res!976504) (not e!814469))))

(assert (=> b!1445296 (= res!976504 (validKeyInArray!0 (select (arr!47389 a!2862) j!93)))))

(declare-fun b!1445297 () Bool)

(assert (=> b!1445297 (= e!814463 (not e!814468))))

(declare-fun res!976502 () Bool)

(assert (=> b!1445297 (=> res!976502 e!814468)))

(assert (=> b!1445297 (= res!976502 (or (not (= (select (arr!47389 a!2862) index!646) (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47389 a!2862) index!646) (select (arr!47389 a!2862) j!93)))))))

(assert (=> b!1445297 e!814470))

(declare-fun res!976510 () Bool)

(assert (=> b!1445297 (=> (not res!976510) (not e!814470))))

(assert (=> b!1445297 (= res!976510 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48605 0))(
  ( (Unit!48606) )
))
(declare-fun lt!634512 () Unit!48605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48605)

(assert (=> b!1445297 (= lt!634512 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445298 () Bool)

(declare-fun res!976514 () Bool)

(assert (=> b!1445298 (=> (not res!976514) (not e!814469))))

(assert (=> b!1445298 (= res!976514 (and (= (size!47940 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47940 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47940 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445299 () Bool)

(declare-fun res!976516 () Bool)

(assert (=> b!1445299 (=> (not res!976516) (not e!814470))))

(assert (=> b!1445299 (= res!976516 (= (seekEntryOrOpen!0 (select (arr!47389 a!2862) j!93) a!2862 mask!2687) (Found!11538 j!93)))))

(assert (= (and start!124866 res!976507) b!1445298))

(assert (= (and b!1445298 res!976514) b!1445285))

(assert (= (and b!1445285 res!976509) b!1445296))

(assert (= (and b!1445296 res!976504) b!1445288))

(assert (= (and b!1445288 res!976512) b!1445290))

(assert (= (and b!1445290 res!976513) b!1445283))

(assert (= (and b!1445283 res!976517) b!1445293))

(assert (= (and b!1445293 res!976508) b!1445292))

(assert (= (and b!1445292 res!976515) b!1445291))

(assert (= (and b!1445291 res!976506) b!1445289))

(assert (= (and b!1445289 res!976505) b!1445287))

(assert (= (and b!1445287 c!133909) b!1445284))

(assert (= (and b!1445287 (not c!133909)) b!1445295))

(assert (= (and b!1445287 res!976511) b!1445286))

(assert (= (and b!1445286 res!976503) b!1445297))

(assert (= (and b!1445297 res!976510) b!1445299))

(assert (= (and b!1445299 res!976516) b!1445282))

(assert (= (and b!1445297 (not res!976502)) b!1445294))

(declare-fun m!1334443 () Bool)

(assert (=> b!1445299 m!1334443))

(assert (=> b!1445299 m!1334443))

(declare-fun m!1334445 () Bool)

(assert (=> b!1445299 m!1334445))

(assert (=> b!1445292 m!1334443))

(assert (=> b!1445292 m!1334443))

(declare-fun m!1334447 () Bool)

(assert (=> b!1445292 m!1334447))

(assert (=> b!1445292 m!1334447))

(assert (=> b!1445292 m!1334443))

(declare-fun m!1334449 () Bool)

(assert (=> b!1445292 m!1334449))

(declare-fun m!1334451 () Bool)

(assert (=> b!1445294 m!1334451))

(declare-fun m!1334453 () Bool)

(assert (=> b!1445295 m!1334453))

(assert (=> b!1445295 m!1334451))

(declare-fun m!1334455 () Bool)

(assert (=> start!124866 m!1334455))

(declare-fun m!1334457 () Bool)

(assert (=> start!124866 m!1334457))

(declare-fun m!1334459 () Bool)

(assert (=> b!1445290 m!1334459))

(declare-fun m!1334461 () Bool)

(assert (=> b!1445282 m!1334461))

(assert (=> b!1445282 m!1334443))

(assert (=> b!1445296 m!1334443))

(assert (=> b!1445296 m!1334443))

(declare-fun m!1334463 () Bool)

(assert (=> b!1445296 m!1334463))

(declare-fun m!1334465 () Bool)

(assert (=> b!1445289 m!1334465))

(assert (=> b!1445289 m!1334465))

(declare-fun m!1334467 () Bool)

(assert (=> b!1445289 m!1334467))

(declare-fun m!1334469 () Bool)

(assert (=> b!1445289 m!1334469))

(declare-fun m!1334471 () Bool)

(assert (=> b!1445289 m!1334471))

(declare-fun m!1334473 () Bool)

(assert (=> b!1445284 m!1334473))

(declare-fun m!1334475 () Bool)

(assert (=> b!1445285 m!1334475))

(assert (=> b!1445285 m!1334475))

(declare-fun m!1334477 () Bool)

(assert (=> b!1445285 m!1334477))

(assert (=> b!1445291 m!1334443))

(assert (=> b!1445291 m!1334443))

(declare-fun m!1334479 () Bool)

(assert (=> b!1445291 m!1334479))

(declare-fun m!1334481 () Bool)

(assert (=> b!1445297 m!1334481))

(assert (=> b!1445297 m!1334469))

(declare-fun m!1334483 () Bool)

(assert (=> b!1445297 m!1334483))

(declare-fun m!1334485 () Bool)

(assert (=> b!1445297 m!1334485))

(declare-fun m!1334487 () Bool)

(assert (=> b!1445297 m!1334487))

(assert (=> b!1445297 m!1334443))

(assert (=> b!1445293 m!1334469))

(declare-fun m!1334489 () Bool)

(assert (=> b!1445293 m!1334489))

(declare-fun m!1334491 () Bool)

(assert (=> b!1445288 m!1334491))

(check-sat (not b!1445295) (not b!1445288) (not b!1445289) (not b!1445297) (not b!1445296) (not b!1445284) (not b!1445291) (not b!1445285) (not b!1445299) (not b!1445292) (not b!1445294) (not start!124866) (not b!1445290))
(check-sat)
