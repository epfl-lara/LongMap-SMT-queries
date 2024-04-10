; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125368 () Bool)

(assert start!125368)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!823520 () Bool)

(declare-fun b!1465617 () Bool)

(declare-datatypes ((array!98816 0))(
  ( (array!98817 (arr!47696 (Array (_ BitVec 32) (_ BitVec 64))) (size!48246 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98816)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465617 (= e!823520 (or (= (select (arr!47696 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47696 a!2862) intermediateBeforeIndex!19) (select (arr!47696 a!2862) j!93))))))

(declare-fun b!1465618 () Bool)

(declare-fun e!823518 () Bool)

(declare-fun e!823511 () Bool)

(assert (=> b!1465618 (= e!823518 e!823511)))

(declare-fun res!994477 () Bool)

(assert (=> b!1465618 (=> (not res!994477) (not e!823511))))

(declare-datatypes ((SeekEntryResult!11948 0))(
  ( (MissingZero!11948 (index!50184 (_ BitVec 32))) (Found!11948 (index!50185 (_ BitVec 32))) (Intermediate!11948 (undefined!12760 Bool) (index!50186 (_ BitVec 32)) (x!131765 (_ BitVec 32))) (Undefined!11948) (MissingVacant!11948 (index!50187 (_ BitVec 32))) )
))
(declare-fun lt!641463 () SeekEntryResult!11948)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98816 (_ BitVec 32)) SeekEntryResult!11948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465618 (= res!994477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47696 a!2862) j!93) mask!2687) (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!641463))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465618 (= lt!641463 (Intermediate!11948 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465619 () Bool)

(declare-fun res!994479 () Bool)

(declare-fun e!823512 () Bool)

(assert (=> b!1465619 (=> (not res!994479) (not e!823512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465619 (= res!994479 (validKeyInArray!0 (select (arr!47696 a!2862) j!93)))))

(declare-fun b!1465620 () Bool)

(declare-fun res!994472 () Bool)

(assert (=> b!1465620 (=> (not res!994472) (not e!823511))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1465620 (= res!994472 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!641463))))

(declare-fun b!1465621 () Bool)

(declare-fun res!994480 () Bool)

(assert (=> b!1465621 (=> (not res!994480) (not e!823512))))

(declare-datatypes ((List!34197 0))(
  ( (Nil!34194) (Cons!34193 (h!35543 (_ BitVec 64)) (t!48891 List!34197)) )
))
(declare-fun arrayNoDuplicates!0 (array!98816 (_ BitVec 32) List!34197) Bool)

(assert (=> b!1465621 (= res!994480 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34194))))

(declare-fun res!994489 () Bool)

(assert (=> start!125368 (=> (not res!994489) (not e!823512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125368 (= res!994489 (validMask!0 mask!2687))))

(assert (=> start!125368 e!823512))

(assert (=> start!125368 true))

(declare-fun array_inv!36724 (array!98816) Bool)

(assert (=> start!125368 (array_inv!36724 a!2862)))

(declare-fun lt!641461 () array!98816)

(declare-fun b!1465622 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641462 () (_ BitVec 64))

(declare-fun e!823517 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98816 (_ BitVec 32)) SeekEntryResult!11948)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98816 (_ BitVec 32)) SeekEntryResult!11948)

(assert (=> b!1465622 (= e!823517 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641462 lt!641461 mask!2687) (seekEntryOrOpen!0 lt!641462 lt!641461 mask!2687)))))

(declare-fun b!1465623 () Bool)

(declare-fun res!994487 () Bool)

(assert (=> b!1465623 (=> (not res!994487) (not e!823512))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465623 (= res!994487 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48246 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48246 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48246 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465624 () Bool)

(declare-fun e!823519 () Bool)

(declare-fun e!823515 () Bool)

(assert (=> b!1465624 (= e!823519 e!823515)))

(declare-fun res!994482 () Bool)

(assert (=> b!1465624 (=> res!994482 e!823515)))

(declare-fun lt!641465 () (_ BitVec 32))

(assert (=> b!1465624 (= res!994482 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641465 #b00000000000000000000000000000000) (bvsge lt!641465 (size!48246 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465624 (= lt!641465 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!823513 () Bool)

(declare-fun lt!641460 () SeekEntryResult!11948)

(declare-fun b!1465625 () Bool)

(assert (=> b!1465625 (= e!823513 (not (= lt!641460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641465 lt!641462 lt!641461 mask!2687))))))

(declare-fun b!1465626 () Bool)

(declare-fun res!994484 () Bool)

(declare-fun e!823514 () Bool)

(assert (=> b!1465626 (=> (not res!994484) (not e!823514))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465626 (= res!994484 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465627 () Bool)

(declare-fun res!994475 () Bool)

(assert (=> b!1465627 (=> (not res!994475) (not e!823512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98816 (_ BitVec 32)) Bool)

(assert (=> b!1465627 (= res!994475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465628 () Bool)

(declare-fun res!994481 () Bool)

(assert (=> b!1465628 (=> (not res!994481) (not e!823512))))

(assert (=> b!1465628 (= res!994481 (and (= (size!48246 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48246 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48246 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465629 () Bool)

(assert (=> b!1465629 (= e!823511 e!823514)))

(declare-fun res!994486 () Bool)

(assert (=> b!1465629 (=> (not res!994486) (not e!823514))))

(assert (=> b!1465629 (= res!994486 (= lt!641460 (Intermediate!11948 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465629 (= lt!641460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641462 mask!2687) lt!641462 lt!641461 mask!2687))))

(assert (=> b!1465629 (= lt!641462 (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465630 () Bool)

(assert (=> b!1465630 (= e!823512 e!823518)))

(declare-fun res!994488 () Bool)

(assert (=> b!1465630 (=> (not res!994488) (not e!823518))))

(assert (=> b!1465630 (= res!994488 (= (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465630 (= lt!641461 (array!98817 (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48246 a!2862)))))

(declare-fun b!1465631 () Bool)

(assert (=> b!1465631 (= e!823517 (= lt!641460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641462 lt!641461 mask!2687)))))

(declare-fun b!1465632 () Bool)

(assert (=> b!1465632 (= e!823513 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641465 intermediateAfterIndex!19 lt!641462 lt!641461 mask!2687) (seekEntryOrOpen!0 lt!641462 lt!641461 mask!2687))))))

(declare-fun b!1465633 () Bool)

(declare-fun res!994473 () Bool)

(assert (=> b!1465633 (=> (not res!994473) (not e!823520))))

(assert (=> b!1465633 (= res!994473 (= (seekEntryOrOpen!0 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) (Found!11948 j!93)))))

(declare-fun b!1465634 () Bool)

(declare-fun res!994476 () Bool)

(assert (=> b!1465634 (=> (not res!994476) (not e!823514))))

(assert (=> b!1465634 (= res!994476 e!823517)))

(declare-fun c!135084 () Bool)

(assert (=> b!1465634 (= c!135084 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465635 () Bool)

(assert (=> b!1465635 (= e!823515 true)))

(declare-fun lt!641466 () Bool)

(assert (=> b!1465635 (= lt!641466 e!823513)))

(declare-fun c!135083 () Bool)

(assert (=> b!1465635 (= c!135083 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465636 () Bool)

(declare-fun res!994478 () Bool)

(assert (=> b!1465636 (=> res!994478 e!823515)))

(assert (=> b!1465636 (= res!994478 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641465 (select (arr!47696 a!2862) j!93) a!2862 mask!2687) lt!641463)))))

(declare-fun b!1465637 () Bool)

(declare-fun res!994485 () Bool)

(assert (=> b!1465637 (=> (not res!994485) (not e!823512))))

(assert (=> b!1465637 (= res!994485 (validKeyInArray!0 (select (arr!47696 a!2862) i!1006)))))

(declare-fun b!1465638 () Bool)

(assert (=> b!1465638 (= e!823514 (not e!823519))))

(declare-fun res!994483 () Bool)

(assert (=> b!1465638 (=> res!994483 e!823519)))

(assert (=> b!1465638 (= res!994483 (or (and (= (select (arr!47696 a!2862) index!646) (select (store (arr!47696 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47696 a!2862) index!646) (select (arr!47696 a!2862) j!93))) (= (select (arr!47696 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465638 e!823520))

(declare-fun res!994474 () Bool)

(assert (=> b!1465638 (=> (not res!994474) (not e!823520))))

(assert (=> b!1465638 (= res!994474 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49392 0))(
  ( (Unit!49393) )
))
(declare-fun lt!641464 () Unit!49392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49392)

(assert (=> b!1465638 (= lt!641464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125368 res!994489) b!1465628))

(assert (= (and b!1465628 res!994481) b!1465637))

(assert (= (and b!1465637 res!994485) b!1465619))

(assert (= (and b!1465619 res!994479) b!1465627))

(assert (= (and b!1465627 res!994475) b!1465621))

(assert (= (and b!1465621 res!994480) b!1465623))

(assert (= (and b!1465623 res!994487) b!1465630))

(assert (= (and b!1465630 res!994488) b!1465618))

(assert (= (and b!1465618 res!994477) b!1465620))

(assert (= (and b!1465620 res!994472) b!1465629))

(assert (= (and b!1465629 res!994486) b!1465634))

(assert (= (and b!1465634 c!135084) b!1465631))

(assert (= (and b!1465634 (not c!135084)) b!1465622))

(assert (= (and b!1465634 res!994476) b!1465626))

(assert (= (and b!1465626 res!994484) b!1465638))

(assert (= (and b!1465638 res!994474) b!1465633))

(assert (= (and b!1465633 res!994473) b!1465617))

(assert (= (and b!1465638 (not res!994483)) b!1465624))

(assert (= (and b!1465624 (not res!994482)) b!1465636))

(assert (= (and b!1465636 (not res!994478)) b!1465635))

(assert (= (and b!1465635 c!135083) b!1465625))

(assert (= (and b!1465635 (not c!135083)) b!1465632))

(declare-fun m!1352689 () Bool)

(assert (=> b!1465631 m!1352689))

(declare-fun m!1352691 () Bool)

(assert (=> b!1465620 m!1352691))

(assert (=> b!1465620 m!1352691))

(declare-fun m!1352693 () Bool)

(assert (=> b!1465620 m!1352693))

(declare-fun m!1352695 () Bool)

(assert (=> b!1465621 m!1352695))

(declare-fun m!1352697 () Bool)

(assert (=> b!1465632 m!1352697))

(declare-fun m!1352699 () Bool)

(assert (=> b!1465632 m!1352699))

(declare-fun m!1352701 () Bool)

(assert (=> b!1465638 m!1352701))

(declare-fun m!1352703 () Bool)

(assert (=> b!1465638 m!1352703))

(declare-fun m!1352705 () Bool)

(assert (=> b!1465638 m!1352705))

(declare-fun m!1352707 () Bool)

(assert (=> b!1465638 m!1352707))

(declare-fun m!1352709 () Bool)

(assert (=> b!1465638 m!1352709))

(assert (=> b!1465638 m!1352691))

(declare-fun m!1352711 () Bool)

(assert (=> b!1465637 m!1352711))

(assert (=> b!1465637 m!1352711))

(declare-fun m!1352713 () Bool)

(assert (=> b!1465637 m!1352713))

(assert (=> b!1465618 m!1352691))

(assert (=> b!1465618 m!1352691))

(declare-fun m!1352715 () Bool)

(assert (=> b!1465618 m!1352715))

(assert (=> b!1465618 m!1352715))

(assert (=> b!1465618 m!1352691))

(declare-fun m!1352717 () Bool)

(assert (=> b!1465618 m!1352717))

(declare-fun m!1352719 () Bool)

(assert (=> b!1465622 m!1352719))

(assert (=> b!1465622 m!1352699))

(declare-fun m!1352721 () Bool)

(assert (=> b!1465617 m!1352721))

(assert (=> b!1465617 m!1352691))

(declare-fun m!1352723 () Bool)

(assert (=> b!1465625 m!1352723))

(assert (=> b!1465633 m!1352691))

(assert (=> b!1465633 m!1352691))

(declare-fun m!1352725 () Bool)

(assert (=> b!1465633 m!1352725))

(declare-fun m!1352727 () Bool)

(assert (=> b!1465629 m!1352727))

(assert (=> b!1465629 m!1352727))

(declare-fun m!1352729 () Bool)

(assert (=> b!1465629 m!1352729))

(assert (=> b!1465629 m!1352703))

(declare-fun m!1352731 () Bool)

(assert (=> b!1465629 m!1352731))

(assert (=> b!1465619 m!1352691))

(assert (=> b!1465619 m!1352691))

(declare-fun m!1352733 () Bool)

(assert (=> b!1465619 m!1352733))

(declare-fun m!1352735 () Bool)

(assert (=> start!125368 m!1352735))

(declare-fun m!1352737 () Bool)

(assert (=> start!125368 m!1352737))

(assert (=> b!1465636 m!1352691))

(assert (=> b!1465636 m!1352691))

(declare-fun m!1352739 () Bool)

(assert (=> b!1465636 m!1352739))

(declare-fun m!1352741 () Bool)

(assert (=> b!1465624 m!1352741))

(assert (=> b!1465630 m!1352703))

(declare-fun m!1352743 () Bool)

(assert (=> b!1465630 m!1352743))

(declare-fun m!1352745 () Bool)

(assert (=> b!1465627 m!1352745))

(push 1)

