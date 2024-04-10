; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124858 () Bool)

(assert start!124858)

(declare-fun res!981108 () Bool)

(declare-fun e!816365 () Bool)

(assert (=> start!124858 (=> (not res!981108) (not e!816365))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124858 (= res!981108 (validMask!0 mask!2687))))

(assert (=> start!124858 e!816365))

(assert (=> start!124858 true))

(declare-datatypes ((array!98306 0))(
  ( (array!98307 (arr!47441 (Array (_ BitVec 32) (_ BitVec 64))) (size!47991 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98306)

(declare-fun array_inv!36469 (array!98306) Bool)

(assert (=> start!124858 (array_inv!36469 a!2862)))

(declare-fun b!1449683 () Bool)

(declare-fun res!981105 () Bool)

(assert (=> b!1449683 (=> (not res!981105) (not e!816365))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449683 (= res!981105 (validKeyInArray!0 (select (arr!47441 a!2862) j!93)))))

(declare-fun b!1449684 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635992 () (_ BitVec 64))

(declare-fun e!816367 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11693 0))(
  ( (MissingZero!11693 (index!49164 (_ BitVec 32))) (Found!11693 (index!49165 (_ BitVec 32))) (Intermediate!11693 (undefined!12505 Bool) (index!49166 (_ BitVec 32)) (x!130830 (_ BitVec 32))) (Undefined!11693) (MissingVacant!11693 (index!49167 (_ BitVec 32))) )
))
(declare-fun lt!635990 () SeekEntryResult!11693)

(declare-fun lt!635997 () array!98306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98306 (_ BitVec 32)) SeekEntryResult!11693)

(assert (=> b!1449684 (= e!816367 (= lt!635990 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635992 lt!635997 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1449685 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816369 () Bool)

(assert (=> b!1449685 (= e!816369 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449686 () Bool)

(declare-fun e!816370 () Bool)

(assert (=> b!1449686 (= e!816365 e!816370)))

(declare-fun res!981112 () Bool)

(assert (=> b!1449686 (=> (not res!981112) (not e!816370))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449686 (= res!981112 (= (select (store (arr!47441 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449686 (= lt!635997 (array!98307 (store (arr!47441 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47991 a!2862)))))

(declare-fun b!1449687 () Bool)

(declare-fun res!981099 () Bool)

(assert (=> b!1449687 (=> (not res!981099) (not e!816365))))

(assert (=> b!1449687 (= res!981099 (validKeyInArray!0 (select (arr!47441 a!2862) i!1006)))))

(declare-fun b!1449688 () Bool)

(declare-fun res!981101 () Bool)

(assert (=> b!1449688 (=> (not res!981101) (not e!816365))))

(declare-datatypes ((List!33942 0))(
  ( (Nil!33939) (Cons!33938 (h!35288 (_ BitVec 64)) (t!48636 List!33942)) )
))
(declare-fun arrayNoDuplicates!0 (array!98306 (_ BitVec 32) List!33942) Bool)

(assert (=> b!1449688 (= res!981101 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33939))))

(declare-fun b!1449689 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98306 (_ BitVec 32)) SeekEntryResult!11693)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98306 (_ BitVec 32)) SeekEntryResult!11693)

(assert (=> b!1449689 (= e!816367 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635992 lt!635997 mask!2687) (seekEntryOrOpen!0 lt!635992 lt!635997 mask!2687)))))

(declare-fun b!1449690 () Bool)

(declare-fun res!981098 () Bool)

(declare-fun e!816366 () Bool)

(assert (=> b!1449690 (=> (not res!981098) (not e!816366))))

(assert (=> b!1449690 (= res!981098 e!816367)))

(declare-fun c!133803 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449690 (= c!133803 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449691 () Bool)

(declare-fun e!816372 () Bool)

(assert (=> b!1449691 (= e!816366 (not e!816372))))

(declare-fun res!981106 () Bool)

(assert (=> b!1449691 (=> res!981106 e!816372)))

(assert (=> b!1449691 (= res!981106 (or (and (= (select (arr!47441 a!2862) index!646) (select (store (arr!47441 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47441 a!2862) index!646) (select (arr!47441 a!2862) j!93))) (not (= (select (arr!47441 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47441 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816371 () Bool)

(assert (=> b!1449691 e!816371))

(declare-fun res!981113 () Bool)

(assert (=> b!1449691 (=> (not res!981113) (not e!816371))))

(declare-fun lt!635996 () SeekEntryResult!11693)

(declare-fun lt!635993 () SeekEntryResult!11693)

(assert (=> b!1449691 (= res!981113 (and (= lt!635996 lt!635993) (or (= (select (arr!47441 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47441 a!2862) intermediateBeforeIndex!19) (select (arr!47441 a!2862) j!93)))))))

(assert (=> b!1449691 (= lt!635993 (Found!11693 j!93))))

(assert (=> b!1449691 (= lt!635996 (seekEntryOrOpen!0 (select (arr!47441 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98306 (_ BitVec 32)) Bool)

(assert (=> b!1449691 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48882 0))(
  ( (Unit!48883) )
))
(declare-fun lt!635991 () Unit!48882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48882)

(assert (=> b!1449691 (= lt!635991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449692 () Bool)

(declare-fun res!981103 () Bool)

(declare-fun e!816368 () Bool)

(assert (=> b!1449692 (=> (not res!981103) (not e!816368))))

(declare-fun lt!635994 () SeekEntryResult!11693)

(assert (=> b!1449692 (= res!981103 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47441 a!2862) j!93) a!2862 mask!2687) lt!635994))))

(declare-fun b!1449693 () Bool)

(declare-fun res!981100 () Bool)

(assert (=> b!1449693 (=> (not res!981100) (not e!816365))))

(assert (=> b!1449693 (= res!981100 (and (= (size!47991 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47991 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47991 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449694 () Bool)

(assert (=> b!1449694 (= e!816370 e!816368)))

(declare-fun res!981111 () Bool)

(assert (=> b!1449694 (=> (not res!981111) (not e!816368))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449694 (= res!981111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47441 a!2862) j!93) mask!2687) (select (arr!47441 a!2862) j!93) a!2862 mask!2687) lt!635994))))

(assert (=> b!1449694 (= lt!635994 (Intermediate!11693 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449695 () Bool)

(assert (=> b!1449695 (= e!816372 true)))

(assert (=> b!1449695 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635992 lt!635997 mask!2687) lt!635993)))

(declare-fun lt!635995 () Unit!48882)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48882)

(assert (=> b!1449695 (= lt!635995 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449696 () Bool)

(assert (=> b!1449696 (= e!816368 e!816366)))

(declare-fun res!981114 () Bool)

(assert (=> b!1449696 (=> (not res!981114) (not e!816366))))

(assert (=> b!1449696 (= res!981114 (= lt!635990 (Intermediate!11693 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449696 (= lt!635990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635992 mask!2687) lt!635992 lt!635997 mask!2687))))

(assert (=> b!1449696 (= lt!635992 (select (store (arr!47441 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449697 () Bool)

(declare-fun res!981102 () Bool)

(assert (=> b!1449697 (=> (not res!981102) (not e!816365))))

(assert (=> b!1449697 (= res!981102 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47991 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47991 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47991 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449698 () Bool)

(declare-fun e!816374 () Bool)

(assert (=> b!1449698 (= e!816374 e!816369)))

(declare-fun res!981115 () Bool)

(assert (=> b!1449698 (=> (not res!981115) (not e!816369))))

(assert (=> b!1449698 (= res!981115 (= lt!635996 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47441 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449699 () Bool)

(assert (=> b!1449699 (= e!816371 e!816374)))

(declare-fun res!981107 () Bool)

(assert (=> b!1449699 (=> res!981107 e!816374)))

(assert (=> b!1449699 (= res!981107 (or (and (= (select (arr!47441 a!2862) index!646) (select (store (arr!47441 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47441 a!2862) index!646) (select (arr!47441 a!2862) j!93))) (not (= (select (arr!47441 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449700 () Bool)

(declare-fun res!981109 () Bool)

(assert (=> b!1449700 (=> res!981109 e!816372)))

(assert (=> b!1449700 (= res!981109 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47441 a!2862) j!93) a!2862 mask!2687) lt!635993)))))

(declare-fun b!1449701 () Bool)

(declare-fun res!981104 () Bool)

(assert (=> b!1449701 (=> (not res!981104) (not e!816366))))

(assert (=> b!1449701 (= res!981104 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449702 () Bool)

(declare-fun res!981110 () Bool)

(assert (=> b!1449702 (=> (not res!981110) (not e!816365))))

(assert (=> b!1449702 (= res!981110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124858 res!981108) b!1449693))

(assert (= (and b!1449693 res!981100) b!1449687))

(assert (= (and b!1449687 res!981099) b!1449683))

(assert (= (and b!1449683 res!981105) b!1449702))

(assert (= (and b!1449702 res!981110) b!1449688))

(assert (= (and b!1449688 res!981101) b!1449697))

(assert (= (and b!1449697 res!981102) b!1449686))

(assert (= (and b!1449686 res!981112) b!1449694))

(assert (= (and b!1449694 res!981111) b!1449692))

(assert (= (and b!1449692 res!981103) b!1449696))

(assert (= (and b!1449696 res!981114) b!1449690))

(assert (= (and b!1449690 c!133803) b!1449684))

(assert (= (and b!1449690 (not c!133803)) b!1449689))

(assert (= (and b!1449690 res!981098) b!1449701))

(assert (= (and b!1449701 res!981104) b!1449691))

(assert (= (and b!1449691 res!981113) b!1449699))

(assert (= (and b!1449699 (not res!981107)) b!1449698))

(assert (= (and b!1449698 res!981115) b!1449685))

(assert (= (and b!1449691 (not res!981106)) b!1449700))

(assert (= (and b!1449700 (not res!981109)) b!1449695))

(declare-fun m!1338379 () Bool)

(assert (=> b!1449699 m!1338379))

(declare-fun m!1338381 () Bool)

(assert (=> b!1449699 m!1338381))

(declare-fun m!1338383 () Bool)

(assert (=> b!1449699 m!1338383))

(declare-fun m!1338385 () Bool)

(assert (=> b!1449699 m!1338385))

(assert (=> b!1449692 m!1338385))

(assert (=> b!1449692 m!1338385))

(declare-fun m!1338387 () Bool)

(assert (=> b!1449692 m!1338387))

(declare-fun m!1338389 () Bool)

(assert (=> b!1449696 m!1338389))

(assert (=> b!1449696 m!1338389))

(declare-fun m!1338391 () Bool)

(assert (=> b!1449696 m!1338391))

(assert (=> b!1449696 m!1338381))

(declare-fun m!1338393 () Bool)

(assert (=> b!1449696 m!1338393))

(declare-fun m!1338395 () Bool)

(assert (=> b!1449689 m!1338395))

(declare-fun m!1338397 () Bool)

(assert (=> b!1449689 m!1338397))

(declare-fun m!1338399 () Bool)

(assert (=> start!124858 m!1338399))

(declare-fun m!1338401 () Bool)

(assert (=> start!124858 m!1338401))

(assert (=> b!1449695 m!1338395))

(declare-fun m!1338403 () Bool)

(assert (=> b!1449695 m!1338403))

(assert (=> b!1449694 m!1338385))

(assert (=> b!1449694 m!1338385))

(declare-fun m!1338405 () Bool)

(assert (=> b!1449694 m!1338405))

(assert (=> b!1449694 m!1338405))

(assert (=> b!1449694 m!1338385))

(declare-fun m!1338407 () Bool)

(assert (=> b!1449694 m!1338407))

(assert (=> b!1449700 m!1338385))

(assert (=> b!1449700 m!1338385))

(declare-fun m!1338409 () Bool)

(assert (=> b!1449700 m!1338409))

(assert (=> b!1449686 m!1338381))

(declare-fun m!1338411 () Bool)

(assert (=> b!1449686 m!1338411))

(declare-fun m!1338413 () Bool)

(assert (=> b!1449688 m!1338413))

(assert (=> b!1449698 m!1338385))

(assert (=> b!1449698 m!1338385))

(declare-fun m!1338415 () Bool)

(assert (=> b!1449698 m!1338415))

(declare-fun m!1338417 () Bool)

(assert (=> b!1449684 m!1338417))

(declare-fun m!1338419 () Bool)

(assert (=> b!1449691 m!1338419))

(assert (=> b!1449691 m!1338381))

(declare-fun m!1338421 () Bool)

(assert (=> b!1449691 m!1338421))

(assert (=> b!1449691 m!1338383))

(assert (=> b!1449691 m!1338379))

(assert (=> b!1449691 m!1338385))

(declare-fun m!1338423 () Bool)

(assert (=> b!1449691 m!1338423))

(declare-fun m!1338425 () Bool)

(assert (=> b!1449691 m!1338425))

(assert (=> b!1449691 m!1338385))

(declare-fun m!1338427 () Bool)

(assert (=> b!1449702 m!1338427))

(assert (=> b!1449683 m!1338385))

(assert (=> b!1449683 m!1338385))

(declare-fun m!1338429 () Bool)

(assert (=> b!1449683 m!1338429))

(declare-fun m!1338431 () Bool)

(assert (=> b!1449687 m!1338431))

(assert (=> b!1449687 m!1338431))

(declare-fun m!1338433 () Bool)

(assert (=> b!1449687 m!1338433))

(push 1)

