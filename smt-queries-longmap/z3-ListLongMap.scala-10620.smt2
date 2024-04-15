; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124828 () Bool)

(assert start!124828)

(declare-fun b!1449488 () Bool)

(declare-fun res!981024 () Bool)

(declare-fun e!816256 () Bool)

(assert (=> b!1449488 (=> (not res!981024) (not e!816256))))

(declare-datatypes ((array!98254 0))(
  ( (array!98255 (arr!47416 (Array (_ BitVec 32) (_ BitVec 64))) (size!47968 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98254)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449488 (= res!981024 (validKeyInArray!0 (select (arr!47416 a!2862) i!1006)))))

(declare-fun res!981033 () Bool)

(assert (=> start!124828 (=> (not res!981033) (not e!816256))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124828 (= res!981033 (validMask!0 mask!2687))))

(assert (=> start!124828 e!816256))

(assert (=> start!124828 true))

(declare-fun array_inv!36649 (array!98254) Bool)

(assert (=> start!124828 (array_inv!36649 a!2862)))

(declare-fun b!1449489 () Bool)

(declare-fun res!981023 () Bool)

(declare-fun e!816250 () Bool)

(assert (=> b!1449489 (=> (not res!981023) (not e!816250))))

(declare-datatypes ((SeekEntryResult!11693 0))(
  ( (MissingZero!11693 (index!49164 (_ BitVec 32))) (Found!11693 (index!49165 (_ BitVec 32))) (Intermediate!11693 (undefined!12505 Bool) (index!49166 (_ BitVec 32)) (x!130825 (_ BitVec 32))) (Undefined!11693) (MissingVacant!11693 (index!49167 (_ BitVec 32))) )
))
(declare-fun lt!635761 () SeekEntryResult!11693)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11693)

(assert (=> b!1449489 (= res!981023 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!635761))))

(declare-fun b!1449490 () Bool)

(declare-fun res!981022 () Bool)

(assert (=> b!1449490 (=> (not res!981022) (not e!816256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98254 (_ BitVec 32)) Bool)

(assert (=> b!1449490 (= res!981022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!816253 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1449491 () Bool)

(assert (=> b!1449491 (= e!816253 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449492 () Bool)

(declare-fun res!981035 () Bool)

(assert (=> b!1449492 (=> (not res!981035) (not e!816256))))

(declare-datatypes ((List!33995 0))(
  ( (Nil!33992) (Cons!33991 (h!35341 (_ BitVec 64)) (t!48681 List!33995)) )
))
(declare-fun arrayNoDuplicates!0 (array!98254 (_ BitVec 32) List!33995) Bool)

(assert (=> b!1449492 (= res!981035 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33992))))

(declare-fun b!1449493 () Bool)

(declare-fun res!981037 () Bool)

(assert (=> b!1449493 (=> (not res!981037) (not e!816256))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449493 (= res!981037 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47968 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47968 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47968 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449494 () Bool)

(declare-fun res!981027 () Bool)

(assert (=> b!1449494 (=> (not res!981027) (not e!816256))))

(assert (=> b!1449494 (= res!981027 (validKeyInArray!0 (select (arr!47416 a!2862) j!93)))))

(declare-fun b!1449495 () Bool)

(declare-fun e!816251 () Bool)

(assert (=> b!1449495 (= e!816250 e!816251)))

(declare-fun res!981034 () Bool)

(assert (=> b!1449495 (=> (not res!981034) (not e!816251))))

(declare-fun lt!635762 () SeekEntryResult!11693)

(assert (=> b!1449495 (= res!981034 (= lt!635762 (Intermediate!11693 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635759 () array!98254)

(declare-fun lt!635756 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449495 (= lt!635762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635756 mask!2687) lt!635756 lt!635759 mask!2687))))

(assert (=> b!1449495 (= lt!635756 (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449496 () Bool)

(declare-fun res!981029 () Bool)

(assert (=> b!1449496 (=> (not res!981029) (not e!816251))))

(declare-fun e!816258 () Bool)

(assert (=> b!1449496 (= res!981029 e!816258)))

(declare-fun c!133747 () Bool)

(assert (=> b!1449496 (= c!133747 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449497 () Bool)

(declare-fun res!981031 () Bool)

(assert (=> b!1449497 (=> (not res!981031) (not e!816251))))

(assert (=> b!1449497 (= res!981031 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449498 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11693)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11693)

(assert (=> b!1449498 (= e!816258 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635756 lt!635759 mask!2687) (seekEntryOrOpen!0 lt!635756 lt!635759 mask!2687)))))

(declare-fun b!1449499 () Bool)

(declare-fun e!816252 () Bool)

(assert (=> b!1449499 (= e!816256 e!816252)))

(declare-fun res!981020 () Bool)

(assert (=> b!1449499 (=> (not res!981020) (not e!816252))))

(assert (=> b!1449499 (= res!981020 (= (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449499 (= lt!635759 (array!98255 (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47968 a!2862)))))

(declare-fun b!1449500 () Bool)

(declare-fun e!816257 () Bool)

(assert (=> b!1449500 (= e!816257 e!816253)))

(declare-fun res!981036 () Bool)

(assert (=> b!1449500 (=> (not res!981036) (not e!816253))))

(declare-fun lt!635757 () SeekEntryResult!11693)

(assert (=> b!1449500 (= res!981036 (= lt!635757 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47416 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449501 () Bool)

(assert (=> b!1449501 (= e!816252 e!816250)))

(declare-fun res!981025 () Bool)

(assert (=> b!1449501 (=> (not res!981025) (not e!816250))))

(assert (=> b!1449501 (= res!981025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47416 a!2862) j!93) mask!2687) (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!635761))))

(assert (=> b!1449501 (= lt!635761 (Intermediate!11693 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449502 () Bool)

(declare-fun e!816254 () Bool)

(assert (=> b!1449502 (= e!816254 e!816257)))

(declare-fun res!981030 () Bool)

(assert (=> b!1449502 (=> res!981030 e!816257)))

(assert (=> b!1449502 (= res!981030 (or (and (= (select (arr!47416 a!2862) index!646) (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47416 a!2862) index!646) (select (arr!47416 a!2862) j!93))) (not (= (select (arr!47416 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449503 () Bool)

(assert (=> b!1449503 (= e!816258 (= lt!635762 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635756 lt!635759 mask!2687)))))

(declare-fun b!1449504 () Bool)

(declare-fun e!816249 () Bool)

(assert (=> b!1449504 (= e!816251 (not e!816249))))

(declare-fun res!981028 () Bool)

(assert (=> b!1449504 (=> res!981028 e!816249)))

(assert (=> b!1449504 (= res!981028 (or (and (= (select (arr!47416 a!2862) index!646) (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47416 a!2862) index!646) (select (arr!47416 a!2862) j!93))) (not (= (select (arr!47416 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449504 e!816254))

(declare-fun res!981026 () Bool)

(assert (=> b!1449504 (=> (not res!981026) (not e!816254))))

(declare-fun lt!635763 () SeekEntryResult!11693)

(assert (=> b!1449504 (= res!981026 (and (= lt!635757 lt!635763) (or (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) (select (arr!47416 a!2862) j!93)))))))

(assert (=> b!1449504 (= lt!635763 (Found!11693 j!93))))

(assert (=> b!1449504 (= lt!635757 (seekEntryOrOpen!0 (select (arr!47416 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449504 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48723 0))(
  ( (Unit!48724) )
))
(declare-fun lt!635760 () Unit!48723)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48723)

(assert (=> b!1449504 (= lt!635760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449505 () Bool)

(declare-fun res!981032 () Bool)

(assert (=> b!1449505 (=> (not res!981032) (not e!816256))))

(assert (=> b!1449505 (= res!981032 (and (= (size!47968 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47968 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47968 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449506 () Bool)

(assert (=> b!1449506 (= e!816249 true)))

(assert (=> b!1449506 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635756 lt!635759 mask!2687) lt!635763)))

(declare-fun lt!635758 () Unit!48723)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48723)

(assert (=> b!1449506 (= lt!635758 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449507 () Bool)

(declare-fun res!981021 () Bool)

(assert (=> b!1449507 (=> res!981021 e!816249)))

(assert (=> b!1449507 (= res!981021 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!635763)))))

(assert (= (and start!124828 res!981033) b!1449505))

(assert (= (and b!1449505 res!981032) b!1449488))

(assert (= (and b!1449488 res!981024) b!1449494))

(assert (= (and b!1449494 res!981027) b!1449490))

(assert (= (and b!1449490 res!981022) b!1449492))

(assert (= (and b!1449492 res!981035) b!1449493))

(assert (= (and b!1449493 res!981037) b!1449499))

(assert (= (and b!1449499 res!981020) b!1449501))

(assert (= (and b!1449501 res!981025) b!1449489))

(assert (= (and b!1449489 res!981023) b!1449495))

(assert (= (and b!1449495 res!981034) b!1449496))

(assert (= (and b!1449496 c!133747) b!1449503))

(assert (= (and b!1449496 (not c!133747)) b!1449498))

(assert (= (and b!1449496 res!981029) b!1449497))

(assert (= (and b!1449497 res!981031) b!1449504))

(assert (= (and b!1449504 res!981026) b!1449502))

(assert (= (and b!1449502 (not res!981030)) b!1449500))

(assert (= (and b!1449500 res!981036) b!1449491))

(assert (= (and b!1449504 (not res!981028)) b!1449507))

(assert (= (and b!1449507 (not res!981021)) b!1449506))

(declare-fun m!1337703 () Bool)

(assert (=> b!1449495 m!1337703))

(assert (=> b!1449495 m!1337703))

(declare-fun m!1337705 () Bool)

(assert (=> b!1449495 m!1337705))

(declare-fun m!1337707 () Bool)

(assert (=> b!1449495 m!1337707))

(declare-fun m!1337709 () Bool)

(assert (=> b!1449495 m!1337709))

(declare-fun m!1337711 () Bool)

(assert (=> b!1449488 m!1337711))

(assert (=> b!1449488 m!1337711))

(declare-fun m!1337713 () Bool)

(assert (=> b!1449488 m!1337713))

(declare-fun m!1337715 () Bool)

(assert (=> b!1449489 m!1337715))

(assert (=> b!1449489 m!1337715))

(declare-fun m!1337717 () Bool)

(assert (=> b!1449489 m!1337717))

(declare-fun m!1337719 () Bool)

(assert (=> b!1449498 m!1337719))

(declare-fun m!1337721 () Bool)

(assert (=> b!1449498 m!1337721))

(assert (=> b!1449499 m!1337707))

(declare-fun m!1337723 () Bool)

(assert (=> b!1449499 m!1337723))

(declare-fun m!1337725 () Bool)

(assert (=> b!1449490 m!1337725))

(declare-fun m!1337727 () Bool)

(assert (=> b!1449502 m!1337727))

(assert (=> b!1449502 m!1337707))

(declare-fun m!1337729 () Bool)

(assert (=> b!1449502 m!1337729))

(assert (=> b!1449502 m!1337715))

(assert (=> b!1449507 m!1337715))

(assert (=> b!1449507 m!1337715))

(declare-fun m!1337731 () Bool)

(assert (=> b!1449507 m!1337731))

(assert (=> b!1449500 m!1337715))

(assert (=> b!1449500 m!1337715))

(declare-fun m!1337733 () Bool)

(assert (=> b!1449500 m!1337733))

(declare-fun m!1337735 () Bool)

(assert (=> b!1449504 m!1337735))

(assert (=> b!1449504 m!1337707))

(declare-fun m!1337737 () Bool)

(assert (=> b!1449504 m!1337737))

(assert (=> b!1449504 m!1337729))

(assert (=> b!1449504 m!1337727))

(assert (=> b!1449504 m!1337715))

(declare-fun m!1337739 () Bool)

(assert (=> b!1449504 m!1337739))

(declare-fun m!1337741 () Bool)

(assert (=> b!1449504 m!1337741))

(assert (=> b!1449504 m!1337715))

(declare-fun m!1337743 () Bool)

(assert (=> b!1449503 m!1337743))

(declare-fun m!1337745 () Bool)

(assert (=> b!1449492 m!1337745))

(assert (=> b!1449494 m!1337715))

(assert (=> b!1449494 m!1337715))

(declare-fun m!1337747 () Bool)

(assert (=> b!1449494 m!1337747))

(declare-fun m!1337749 () Bool)

(assert (=> start!124828 m!1337749))

(declare-fun m!1337751 () Bool)

(assert (=> start!124828 m!1337751))

(assert (=> b!1449501 m!1337715))

(assert (=> b!1449501 m!1337715))

(declare-fun m!1337753 () Bool)

(assert (=> b!1449501 m!1337753))

(assert (=> b!1449501 m!1337753))

(assert (=> b!1449501 m!1337715))

(declare-fun m!1337755 () Bool)

(assert (=> b!1449501 m!1337755))

(assert (=> b!1449506 m!1337719))

(declare-fun m!1337757 () Bool)

(assert (=> b!1449506 m!1337757))

(check-sat (not b!1449488) (not b!1449501) (not b!1449503) (not b!1449498) (not b!1449492) (not start!124828) (not b!1449504) (not b!1449506) (not b!1449500) (not b!1449489) (not b!1449494) (not b!1449490) (not b!1449507) (not b!1449495))
(check-sat)
