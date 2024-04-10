; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124626 () Bool)

(assert start!124626)

(declare-fun b!1443370 () Bool)

(declare-fun res!975484 () Bool)

(declare-fun e!813376 () Bool)

(assert (=> b!1443370 (=> (not res!975484) (not e!813376))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98074 0))(
  ( (array!98075 (arr!47325 (Array (_ BitVec 32) (_ BitVec 64))) (size!47875 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98074)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443370 (= res!975484 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47875 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47875 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47875 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443371 () Bool)

(declare-fun res!975489 () Bool)

(declare-fun e!813377 () Bool)

(assert (=> b!1443371 (=> (not res!975489) (not e!813377))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443371 (= res!975489 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!975496 () Bool)

(assert (=> start!124626 (=> (not res!975496) (not e!813376))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124626 (= res!975496 (validMask!0 mask!2687))))

(assert (=> start!124626 e!813376))

(assert (=> start!124626 true))

(declare-fun array_inv!36353 (array!98074) Bool)

(assert (=> start!124626 (array_inv!36353 a!2862)))

(declare-fun b!1443372 () Bool)

(declare-fun res!975488 () Bool)

(declare-fun e!813373 () Bool)

(assert (=> b!1443372 (=> (not res!975488) (not e!813373))))

(declare-datatypes ((SeekEntryResult!11577 0))(
  ( (MissingZero!11577 (index!48700 (_ BitVec 32))) (Found!11577 (index!48701 (_ BitVec 32))) (Intermediate!11577 (undefined!12389 Bool) (index!48702 (_ BitVec 32)) (x!130402 (_ BitVec 32))) (Undefined!11577) (MissingVacant!11577 (index!48703 (_ BitVec 32))) )
))
(declare-fun lt!633838 () SeekEntryResult!11577)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11577)

(assert (=> b!1443372 (= res!975488 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47325 a!2862) j!93) a!2862 mask!2687) lt!633838))))

(declare-fun b!1443373 () Bool)

(declare-fun res!975493 () Bool)

(assert (=> b!1443373 (=> (not res!975493) (not e!813377))))

(declare-fun e!813372 () Bool)

(assert (=> b!1443373 (= res!975493 e!813372)))

(declare-fun c!133455 () Bool)

(assert (=> b!1443373 (= c!133455 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443374 () Bool)

(declare-fun e!813374 () Bool)

(assert (=> b!1443374 (= e!813376 e!813374)))

(declare-fun res!975485 () Bool)

(assert (=> b!1443374 (=> (not res!975485) (not e!813374))))

(assert (=> b!1443374 (= res!975485 (= (select (store (arr!47325 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633835 () array!98074)

(assert (=> b!1443374 (= lt!633835 (array!98075 (store (arr!47325 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47875 a!2862)))))

(declare-fun b!1443375 () Bool)

(declare-fun e!813375 () Bool)

(assert (=> b!1443375 (= e!813375 (or (= (select (arr!47325 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47325 a!2862) intermediateBeforeIndex!19) (select (arr!47325 a!2862) j!93))))))

(declare-fun b!1443376 () Bool)

(declare-fun res!975491 () Bool)

(assert (=> b!1443376 (=> (not res!975491) (not e!813375))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11577)

(assert (=> b!1443376 (= res!975491 (= (seekEntryOrOpen!0 (select (arr!47325 a!2862) j!93) a!2862 mask!2687) (Found!11577 j!93)))))

(declare-fun b!1443377 () Bool)

(declare-fun lt!633840 () (_ BitVec 64))

(declare-fun lt!633839 () SeekEntryResult!11577)

(assert (=> b!1443377 (= e!813372 (= lt!633839 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633840 lt!633835 mask!2687)))))

(declare-fun b!1443378 () Bool)

(assert (=> b!1443378 (= e!813373 e!813377)))

(declare-fun res!975494 () Bool)

(assert (=> b!1443378 (=> (not res!975494) (not e!813377))))

(assert (=> b!1443378 (= res!975494 (= lt!633839 (Intermediate!11577 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443378 (= lt!633839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633840 mask!2687) lt!633840 lt!633835 mask!2687))))

(assert (=> b!1443378 (= lt!633840 (select (store (arr!47325 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443379 () Bool)

(declare-fun res!975483 () Bool)

(assert (=> b!1443379 (=> (not res!975483) (not e!813376))))

(declare-datatypes ((List!33826 0))(
  ( (Nil!33823) (Cons!33822 (h!35172 (_ BitVec 64)) (t!48520 List!33826)) )
))
(declare-fun arrayNoDuplicates!0 (array!98074 (_ BitVec 32) List!33826) Bool)

(assert (=> b!1443379 (= res!975483 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33823))))

(declare-fun b!1443380 () Bool)

(declare-fun res!975487 () Bool)

(assert (=> b!1443380 (=> (not res!975487) (not e!813376))))

(assert (=> b!1443380 (= res!975487 (and (= (size!47875 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47875 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47875 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443381 () Bool)

(declare-fun res!975486 () Bool)

(assert (=> b!1443381 (=> (not res!975486) (not e!813376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443381 (= res!975486 (validKeyInArray!0 (select (arr!47325 a!2862) i!1006)))))

(declare-fun b!1443382 () Bool)

(declare-fun res!975492 () Bool)

(assert (=> b!1443382 (=> (not res!975492) (not e!813376))))

(assert (=> b!1443382 (= res!975492 (validKeyInArray!0 (select (arr!47325 a!2862) j!93)))))

(declare-fun b!1443383 () Bool)

(assert (=> b!1443383 (= e!813374 e!813373)))

(declare-fun res!975481 () Bool)

(assert (=> b!1443383 (=> (not res!975481) (not e!813373))))

(assert (=> b!1443383 (= res!975481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47325 a!2862) j!93) mask!2687) (select (arr!47325 a!2862) j!93) a!2862 mask!2687) lt!633838))))

(assert (=> b!1443383 (= lt!633838 (Intermediate!11577 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443384 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11577)

(assert (=> b!1443384 (= e!813372 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633840 lt!633835 mask!2687) (seekEntryOrOpen!0 lt!633840 lt!633835 mask!2687)))))

(declare-fun b!1443385 () Bool)

(declare-fun e!813370 () Bool)

(assert (=> b!1443385 (= e!813377 (not e!813370))))

(declare-fun res!975495 () Bool)

(assert (=> b!1443385 (=> res!975495 e!813370)))

(assert (=> b!1443385 (= res!975495 (or (not (= (select (arr!47325 a!2862) index!646) (select (store (arr!47325 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47325 a!2862) index!646) (select (arr!47325 a!2862) j!93)))))))

(assert (=> b!1443385 e!813375))

(declare-fun res!975490 () Bool)

(assert (=> b!1443385 (=> (not res!975490) (not e!813375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98074 (_ BitVec 32)) Bool)

(assert (=> b!1443385 (= res!975490 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48650 0))(
  ( (Unit!48651) )
))
(declare-fun lt!633836 () Unit!48650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48650)

(assert (=> b!1443385 (= lt!633836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443386 () Bool)

(assert (=> b!1443386 (= e!813370 true)))

(declare-fun lt!633837 () SeekEntryResult!11577)

(assert (=> b!1443386 (= lt!633837 (seekEntryOrOpen!0 lt!633840 lt!633835 mask!2687))))

(declare-fun b!1443387 () Bool)

(declare-fun res!975482 () Bool)

(assert (=> b!1443387 (=> (not res!975482) (not e!813376))))

(assert (=> b!1443387 (= res!975482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124626 res!975496) b!1443380))

(assert (= (and b!1443380 res!975487) b!1443381))

(assert (= (and b!1443381 res!975486) b!1443382))

(assert (= (and b!1443382 res!975492) b!1443387))

(assert (= (and b!1443387 res!975482) b!1443379))

(assert (= (and b!1443379 res!975483) b!1443370))

(assert (= (and b!1443370 res!975484) b!1443374))

(assert (= (and b!1443374 res!975485) b!1443383))

(assert (= (and b!1443383 res!975481) b!1443372))

(assert (= (and b!1443372 res!975488) b!1443378))

(assert (= (and b!1443378 res!975494) b!1443373))

(assert (= (and b!1443373 c!133455) b!1443377))

(assert (= (and b!1443373 (not c!133455)) b!1443384))

(assert (= (and b!1443373 res!975493) b!1443371))

(assert (= (and b!1443371 res!975489) b!1443385))

(assert (= (and b!1443385 res!975490) b!1443376))

(assert (= (and b!1443376 res!975491) b!1443375))

(assert (= (and b!1443385 (not res!975495)) b!1443386))

(declare-fun m!1332453 () Bool)

(assert (=> b!1443374 m!1332453))

(declare-fun m!1332455 () Bool)

(assert (=> b!1443374 m!1332455))

(declare-fun m!1332457 () Bool)

(assert (=> b!1443381 m!1332457))

(assert (=> b!1443381 m!1332457))

(declare-fun m!1332459 () Bool)

(assert (=> b!1443381 m!1332459))

(declare-fun m!1332461 () Bool)

(assert (=> b!1443385 m!1332461))

(assert (=> b!1443385 m!1332453))

(declare-fun m!1332463 () Bool)

(assert (=> b!1443385 m!1332463))

(declare-fun m!1332465 () Bool)

(assert (=> b!1443385 m!1332465))

(declare-fun m!1332467 () Bool)

(assert (=> b!1443385 m!1332467))

(declare-fun m!1332469 () Bool)

(assert (=> b!1443385 m!1332469))

(declare-fun m!1332471 () Bool)

(assert (=> b!1443387 m!1332471))

(assert (=> b!1443382 m!1332469))

(assert (=> b!1443382 m!1332469))

(declare-fun m!1332473 () Bool)

(assert (=> b!1443382 m!1332473))

(declare-fun m!1332475 () Bool)

(assert (=> start!124626 m!1332475))

(declare-fun m!1332477 () Bool)

(assert (=> start!124626 m!1332477))

(assert (=> b!1443372 m!1332469))

(assert (=> b!1443372 m!1332469))

(declare-fun m!1332479 () Bool)

(assert (=> b!1443372 m!1332479))

(assert (=> b!1443376 m!1332469))

(assert (=> b!1443376 m!1332469))

(declare-fun m!1332481 () Bool)

(assert (=> b!1443376 m!1332481))

(declare-fun m!1332483 () Bool)

(assert (=> b!1443384 m!1332483))

(declare-fun m!1332485 () Bool)

(assert (=> b!1443384 m!1332485))

(assert (=> b!1443383 m!1332469))

(assert (=> b!1443383 m!1332469))

(declare-fun m!1332487 () Bool)

(assert (=> b!1443383 m!1332487))

(assert (=> b!1443383 m!1332487))

(assert (=> b!1443383 m!1332469))

(declare-fun m!1332489 () Bool)

(assert (=> b!1443383 m!1332489))

(declare-fun m!1332491 () Bool)

(assert (=> b!1443379 m!1332491))

(declare-fun m!1332493 () Bool)

(assert (=> b!1443378 m!1332493))

(assert (=> b!1443378 m!1332493))

(declare-fun m!1332495 () Bool)

(assert (=> b!1443378 m!1332495))

(assert (=> b!1443378 m!1332453))

(declare-fun m!1332497 () Bool)

(assert (=> b!1443378 m!1332497))

(declare-fun m!1332499 () Bool)

(assert (=> b!1443375 m!1332499))

(assert (=> b!1443375 m!1332469))

(assert (=> b!1443386 m!1332485))

(declare-fun m!1332501 () Bool)

(assert (=> b!1443377 m!1332501))

(check-sat (not b!1443384) (not b!1443381) (not b!1443378) (not b!1443377) (not b!1443372) (not b!1443383) (not b!1443387) (not b!1443386) (not b!1443376) (not b!1443385) (not b!1443379) (not start!124626) (not b!1443382))
(check-sat)
