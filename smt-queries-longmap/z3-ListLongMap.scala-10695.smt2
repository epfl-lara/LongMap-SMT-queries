; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125586 () Bool)

(assert start!125586)

(declare-fun b!1465345 () Bool)

(declare-fun res!993472 () Bool)

(declare-fun e!823676 () Bool)

(assert (=> b!1465345 (=> (not res!993472) (not e!823676))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465345 (= res!993472 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465346 () Bool)

(declare-fun res!993463 () Bool)

(declare-fun e!823674 () Bool)

(assert (=> b!1465346 (=> (not res!993463) (not e!823674))))

(declare-datatypes ((SeekEntryResult!11868 0))(
  ( (MissingZero!11868 (index!49864 (_ BitVec 32))) (Found!11868 (index!49865 (_ BitVec 32))) (Intermediate!11868 (undefined!12680 Bool) (index!49866 (_ BitVec 32)) (x!131638 (_ BitVec 32))) (Undefined!11868) (MissingVacant!11868 (index!49867 (_ BitVec 32))) )
))
(declare-fun lt!641467 () SeekEntryResult!11868)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98872 0))(
  ( (array!98873 (arr!47719 (Array (_ BitVec 32) (_ BitVec 64))) (size!48270 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98872)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98872 (_ BitVec 32)) SeekEntryResult!11868)

(assert (=> b!1465346 (= res!993463 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!641467))))

(declare-fun lt!641471 () array!98872)

(declare-fun e!823683 () Bool)

(declare-fun lt!641473 () SeekEntryResult!11868)

(declare-fun lt!641468 () (_ BitVec 64))

(declare-fun b!1465347 () Bool)

(assert (=> b!1465347 (= e!823683 (= lt!641473 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641468 lt!641471 mask!2687)))))

(declare-fun b!1465348 () Bool)

(declare-fun res!993471 () Bool)

(assert (=> b!1465348 (=> (not res!993471) (not e!823676))))

(assert (=> b!1465348 (= res!993471 e!823683)))

(declare-fun c!135462 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465348 (= c!135462 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465349 () Bool)

(declare-fun res!993466 () Bool)

(declare-fun e!823680 () Bool)

(assert (=> b!1465349 (=> (not res!993466) (not e!823680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465349 (= res!993466 (validKeyInArray!0 (select (arr!47719 a!2862) i!1006)))))

(declare-fun b!1465350 () Bool)

(declare-fun lt!641469 () (_ BitVec 32))

(declare-fun e!823681 () Bool)

(assert (=> b!1465350 (= e!823681 (not (= lt!641473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641469 lt!641468 lt!641471 mask!2687))))))

(declare-fun b!1465351 () Bool)

(declare-fun res!993468 () Bool)

(assert (=> b!1465351 (=> (not res!993468) (not e!823680))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1465351 (= res!993468 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48270 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48270 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48270 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465352 () Bool)

(declare-fun res!993478 () Bool)

(declare-fun e!823678 () Bool)

(assert (=> b!1465352 (=> (not res!993478) (not e!823678))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98872 (_ BitVec 32)) SeekEntryResult!11868)

(assert (=> b!1465352 (= res!993478 (= (seekEntryOrOpen!0 (select (arr!47719 a!2862) j!93) a!2862 mask!2687) (Found!11868 j!93)))))

(declare-fun b!1465353 () Bool)

(declare-fun e!823677 () Bool)

(assert (=> b!1465353 (= e!823676 (not e!823677))))

(declare-fun res!993467 () Bool)

(assert (=> b!1465353 (=> res!993467 e!823677)))

(assert (=> b!1465353 (= res!993467 (or (and (= (select (arr!47719 a!2862) index!646) (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47719 a!2862) index!646) (select (arr!47719 a!2862) j!93))) (= (select (arr!47719 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465353 e!823678))

(declare-fun res!993477 () Bool)

(assert (=> b!1465353 (=> (not res!993477) (not e!823678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98872 (_ BitVec 32)) Bool)

(assert (=> b!1465353 (= res!993477 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49265 0))(
  ( (Unit!49266) )
))
(declare-fun lt!641470 () Unit!49265)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49265)

(assert (=> b!1465353 (= lt!641470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465354 () Bool)

(declare-fun e!823679 () Bool)

(assert (=> b!1465354 (= e!823679 e!823674)))

(declare-fun res!993462 () Bool)

(assert (=> b!1465354 (=> (not res!993462) (not e!823674))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465354 (= res!993462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47719 a!2862) j!93) mask!2687) (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!641467))))

(assert (=> b!1465354 (= lt!641467 (Intermediate!11868 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465356 () Bool)

(declare-fun e!823682 () Bool)

(assert (=> b!1465356 (= e!823677 e!823682)))

(declare-fun res!993473 () Bool)

(assert (=> b!1465356 (=> res!993473 e!823682)))

(assert (=> b!1465356 (= res!993473 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641469 #b00000000000000000000000000000000) (bvsge lt!641469 (size!48270 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465356 (= lt!641469 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1465357 () Bool)

(declare-fun res!993474 () Bool)

(assert (=> b!1465357 (=> res!993474 e!823682)))

(assert (=> b!1465357 (= res!993474 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641469 (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!641467)))))

(declare-fun b!1465358 () Bool)

(assert (=> b!1465358 (= e!823682 true)))

(declare-fun lt!641472 () Bool)

(assert (=> b!1465358 (= lt!641472 e!823681)))

(declare-fun c!135463 () Bool)

(assert (=> b!1465358 (= c!135463 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465359 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98872 (_ BitVec 32)) SeekEntryResult!11868)

(assert (=> b!1465359 (= e!823683 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641468 lt!641471 mask!2687) (seekEntryOrOpen!0 lt!641468 lt!641471 mask!2687)))))

(declare-fun b!1465360 () Bool)

(declare-fun res!993476 () Bool)

(assert (=> b!1465360 (=> (not res!993476) (not e!823680))))

(assert (=> b!1465360 (= res!993476 (validKeyInArray!0 (select (arr!47719 a!2862) j!93)))))

(declare-fun b!1465361 () Bool)

(assert (=> b!1465361 (= e!823680 e!823679)))

(declare-fun res!993470 () Bool)

(assert (=> b!1465361 (=> (not res!993470) (not e!823679))))

(assert (=> b!1465361 (= res!993470 (= (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465361 (= lt!641471 (array!98873 (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48270 a!2862)))))

(declare-fun b!1465355 () Bool)

(declare-fun res!993465 () Bool)

(assert (=> b!1465355 (=> (not res!993465) (not e!823680))))

(assert (=> b!1465355 (= res!993465 (and (= (size!48270 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48270 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48270 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!993464 () Bool)

(assert (=> start!125586 (=> (not res!993464) (not e!823680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125586 (= res!993464 (validMask!0 mask!2687))))

(assert (=> start!125586 e!823680))

(assert (=> start!125586 true))

(declare-fun array_inv!37000 (array!98872) Bool)

(assert (=> start!125586 (array_inv!37000 a!2862)))

(declare-fun b!1465362 () Bool)

(declare-fun res!993475 () Bool)

(assert (=> b!1465362 (=> (not res!993475) (not e!823680))))

(assert (=> b!1465362 (= res!993475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465363 () Bool)

(declare-fun res!993469 () Bool)

(assert (=> b!1465363 (=> (not res!993469) (not e!823680))))

(declare-datatypes ((List!34207 0))(
  ( (Nil!34204) (Cons!34203 (h!35567 (_ BitVec 64)) (t!48893 List!34207)) )
))
(declare-fun arrayNoDuplicates!0 (array!98872 (_ BitVec 32) List!34207) Bool)

(assert (=> b!1465363 (= res!993469 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34204))))

(declare-fun b!1465364 () Bool)

(assert (=> b!1465364 (= e!823678 (or (= (select (arr!47719 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47719 a!2862) intermediateBeforeIndex!19) (select (arr!47719 a!2862) j!93))))))

(declare-fun b!1465365 () Bool)

(assert (=> b!1465365 (= e!823674 e!823676)))

(declare-fun res!993479 () Bool)

(assert (=> b!1465365 (=> (not res!993479) (not e!823676))))

(assert (=> b!1465365 (= res!993479 (= lt!641473 (Intermediate!11868 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465365 (= lt!641473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641468 mask!2687) lt!641468 lt!641471 mask!2687))))

(assert (=> b!1465365 (= lt!641468 (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465366 () Bool)

(assert (=> b!1465366 (= e!823681 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641469 intermediateAfterIndex!19 lt!641468 lt!641471 mask!2687) (seekEntryOrOpen!0 lt!641468 lt!641471 mask!2687))))))

(assert (= (and start!125586 res!993464) b!1465355))

(assert (= (and b!1465355 res!993465) b!1465349))

(assert (= (and b!1465349 res!993466) b!1465360))

(assert (= (and b!1465360 res!993476) b!1465362))

(assert (= (and b!1465362 res!993475) b!1465363))

(assert (= (and b!1465363 res!993469) b!1465351))

(assert (= (and b!1465351 res!993468) b!1465361))

(assert (= (and b!1465361 res!993470) b!1465354))

(assert (= (and b!1465354 res!993462) b!1465346))

(assert (= (and b!1465346 res!993463) b!1465365))

(assert (= (and b!1465365 res!993479) b!1465348))

(assert (= (and b!1465348 c!135462) b!1465347))

(assert (= (and b!1465348 (not c!135462)) b!1465359))

(assert (= (and b!1465348 res!993471) b!1465345))

(assert (= (and b!1465345 res!993472) b!1465353))

(assert (= (and b!1465353 res!993477) b!1465352))

(assert (= (and b!1465352 res!993478) b!1465364))

(assert (= (and b!1465353 (not res!993467)) b!1465356))

(assert (= (and b!1465356 (not res!993473)) b!1465357))

(assert (= (and b!1465357 (not res!993474)) b!1465358))

(assert (= (and b!1465358 c!135463) b!1465350))

(assert (= (and b!1465358 (not c!135463)) b!1465366))

(declare-fun m!1352635 () Bool)

(assert (=> b!1465346 m!1352635))

(assert (=> b!1465346 m!1352635))

(declare-fun m!1352637 () Bool)

(assert (=> b!1465346 m!1352637))

(declare-fun m!1352639 () Bool)

(assert (=> b!1465349 m!1352639))

(assert (=> b!1465349 m!1352639))

(declare-fun m!1352641 () Bool)

(assert (=> b!1465349 m!1352641))

(declare-fun m!1352643 () Bool)

(assert (=> b!1465364 m!1352643))

(assert (=> b!1465364 m!1352635))

(declare-fun m!1352645 () Bool)

(assert (=> b!1465363 m!1352645))

(assert (=> b!1465357 m!1352635))

(assert (=> b!1465357 m!1352635))

(declare-fun m!1352647 () Bool)

(assert (=> b!1465357 m!1352647))

(declare-fun m!1352649 () Bool)

(assert (=> start!125586 m!1352649))

(declare-fun m!1352651 () Bool)

(assert (=> start!125586 m!1352651))

(declare-fun m!1352653 () Bool)

(assert (=> b!1465359 m!1352653))

(declare-fun m!1352655 () Bool)

(assert (=> b!1465359 m!1352655))

(declare-fun m!1352657 () Bool)

(assert (=> b!1465347 m!1352657))

(declare-fun m!1352659 () Bool)

(assert (=> b!1465353 m!1352659))

(declare-fun m!1352661 () Bool)

(assert (=> b!1465353 m!1352661))

(declare-fun m!1352663 () Bool)

(assert (=> b!1465353 m!1352663))

(declare-fun m!1352665 () Bool)

(assert (=> b!1465353 m!1352665))

(declare-fun m!1352667 () Bool)

(assert (=> b!1465353 m!1352667))

(assert (=> b!1465353 m!1352635))

(assert (=> b!1465360 m!1352635))

(assert (=> b!1465360 m!1352635))

(declare-fun m!1352669 () Bool)

(assert (=> b!1465360 m!1352669))

(assert (=> b!1465361 m!1352661))

(declare-fun m!1352671 () Bool)

(assert (=> b!1465361 m!1352671))

(declare-fun m!1352673 () Bool)

(assert (=> b!1465356 m!1352673))

(declare-fun m!1352675 () Bool)

(assert (=> b!1465350 m!1352675))

(declare-fun m!1352677 () Bool)

(assert (=> b!1465366 m!1352677))

(assert (=> b!1465366 m!1352655))

(assert (=> b!1465354 m!1352635))

(assert (=> b!1465354 m!1352635))

(declare-fun m!1352679 () Bool)

(assert (=> b!1465354 m!1352679))

(assert (=> b!1465354 m!1352679))

(assert (=> b!1465354 m!1352635))

(declare-fun m!1352681 () Bool)

(assert (=> b!1465354 m!1352681))

(declare-fun m!1352683 () Bool)

(assert (=> b!1465365 m!1352683))

(assert (=> b!1465365 m!1352683))

(declare-fun m!1352685 () Bool)

(assert (=> b!1465365 m!1352685))

(assert (=> b!1465365 m!1352661))

(declare-fun m!1352687 () Bool)

(assert (=> b!1465365 m!1352687))

(declare-fun m!1352689 () Bool)

(assert (=> b!1465362 m!1352689))

(assert (=> b!1465352 m!1352635))

(assert (=> b!1465352 m!1352635))

(declare-fun m!1352691 () Bool)

(assert (=> b!1465352 m!1352691))

(check-sat (not b!1465350) (not b!1465347) (not b!1465354) (not b!1465352) (not b!1465362) (not start!125586) (not b!1465357) (not b!1465356) (not b!1465349) (not b!1465353) (not b!1465363) (not b!1465365) (not b!1465359) (not b!1465360) (not b!1465346) (not b!1465366))
(check-sat)
