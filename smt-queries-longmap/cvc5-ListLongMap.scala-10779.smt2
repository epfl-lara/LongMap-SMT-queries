; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126172 () Bool)

(assert start!126172)

(declare-fun res!1003735 () Bool)

(declare-fun e!828938 () Bool)

(assert (=> start!126172 (=> (not res!1003735) (not e!828938))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126172 (= res!1003735 (validMask!0 mask!2687))))

(assert (=> start!126172 e!828938))

(assert (=> start!126172 true))

(declare-datatypes ((array!99278 0))(
  ( (array!99279 (arr!47918 (Array (_ BitVec 32) (_ BitVec 64))) (size!48468 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99278)

(declare-fun array_inv!36946 (array!99278) Bool)

(assert (=> start!126172 (array_inv!36946 a!2862)))

(declare-fun b!1477624 () Bool)

(declare-fun res!1003743 () Bool)

(assert (=> b!1477624 (=> (not res!1003743) (not e!828938))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477624 (= res!1003743 (validKeyInArray!0 (select (arr!47918 a!2862) i!1006)))))

(declare-fun b!1477625 () Bool)

(declare-fun res!1003734 () Bool)

(assert (=> b!1477625 (=> (not res!1003734) (not e!828938))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477625 (= res!1003734 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48468 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48468 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48468 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477626 () Bool)

(declare-fun e!828943 () Bool)

(declare-fun e!828940 () Bool)

(assert (=> b!1477626 (= e!828943 e!828940)))

(declare-fun res!1003732 () Bool)

(assert (=> b!1477626 (=> res!1003732 e!828940)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477626 (= res!1003732 (or (and (= (select (arr!47918 a!2862) index!646) (select (store (arr!47918 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47918 a!2862) index!646) (select (arr!47918 a!2862) j!93))) (not (= (select (arr!47918 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477627 () Bool)

(declare-fun res!1003737 () Bool)

(assert (=> b!1477627 (=> (not res!1003737) (not e!828938))))

(declare-datatypes ((List!34419 0))(
  ( (Nil!34416) (Cons!34415 (h!35783 (_ BitVec 64)) (t!49113 List!34419)) )
))
(declare-fun arrayNoDuplicates!0 (array!99278 (_ BitVec 32) List!34419) Bool)

(assert (=> b!1477627 (= res!1003737 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34416))))

(declare-fun b!1477628 () Bool)

(declare-fun e!828944 () Bool)

(declare-fun e!828937 () Bool)

(assert (=> b!1477628 (= e!828944 e!828937)))

(declare-fun res!1003744 () Bool)

(assert (=> b!1477628 (=> (not res!1003744) (not e!828937))))

(declare-datatypes ((SeekEntryResult!12158 0))(
  ( (MissingZero!12158 (index!51024 (_ BitVec 32))) (Found!12158 (index!51025 (_ BitVec 32))) (Intermediate!12158 (undefined!12970 Bool) (index!51026 (_ BitVec 32)) (x!132621 (_ BitVec 32))) (Undefined!12158) (MissingVacant!12158 (index!51027 (_ BitVec 32))) )
))
(declare-fun lt!645410 () SeekEntryResult!12158)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99278 (_ BitVec 32)) SeekEntryResult!12158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477628 (= res!1003744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47918 a!2862) j!93) mask!2687) (select (arr!47918 a!2862) j!93) a!2862 mask!2687) lt!645410))))

(assert (=> b!1477628 (= lt!645410 (Intermediate!12158 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!828942 () Bool)

(declare-fun lt!645411 () (_ BitVec 64))

(declare-fun lt!645413 () SeekEntryResult!12158)

(declare-fun b!1477629 () Bool)

(declare-fun lt!645412 () array!99278)

(assert (=> b!1477629 (= e!828942 (= lt!645413 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645411 lt!645412 mask!2687)))))

(declare-fun b!1477630 () Bool)

(assert (=> b!1477630 (= e!828938 e!828944)))

(declare-fun res!1003738 () Bool)

(assert (=> b!1477630 (=> (not res!1003738) (not e!828944))))

(assert (=> b!1477630 (= res!1003738 (= (select (store (arr!47918 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477630 (= lt!645412 (array!99279 (store (arr!47918 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48468 a!2862)))))

(declare-fun b!1477631 () Bool)

(declare-fun res!1003730 () Bool)

(assert (=> b!1477631 (=> (not res!1003730) (not e!828938))))

(assert (=> b!1477631 (= res!1003730 (and (= (size!48468 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48468 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48468 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477632 () Bool)

(declare-fun e!828939 () Bool)

(assert (=> b!1477632 (= e!828940 e!828939)))

(declare-fun res!1003742 () Bool)

(assert (=> b!1477632 (=> (not res!1003742) (not e!828939))))

(declare-fun lt!645414 () SeekEntryResult!12158)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99278 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1477632 (= res!1003742 (= lt!645414 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47918 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477633 () Bool)

(declare-fun res!1003739 () Bool)

(declare-fun e!828936 () Bool)

(assert (=> b!1477633 (=> (not res!1003739) (not e!828936))))

(assert (=> b!1477633 (= res!1003739 e!828942)))

(declare-fun c!136467 () Bool)

(assert (=> b!1477633 (= c!136467 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477634 () Bool)

(declare-fun res!1003736 () Bool)

(assert (=> b!1477634 (=> (not res!1003736) (not e!828938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99278 (_ BitVec 32)) Bool)

(assert (=> b!1477634 (= res!1003736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477635 () Bool)

(assert (=> b!1477635 (= e!828939 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477636 () Bool)

(declare-fun res!1003729 () Bool)

(assert (=> b!1477636 (=> (not res!1003729) (not e!828938))))

(assert (=> b!1477636 (= res!1003729 (validKeyInArray!0 (select (arr!47918 a!2862) j!93)))))

(declare-fun b!1477637 () Bool)

(declare-fun res!1003731 () Bool)

(assert (=> b!1477637 (=> (not res!1003731) (not e!828937))))

(assert (=> b!1477637 (= res!1003731 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47918 a!2862) j!93) a!2862 mask!2687) lt!645410))))

(declare-fun b!1477638 () Bool)

(declare-fun res!1003741 () Bool)

(assert (=> b!1477638 (=> (not res!1003741) (not e!828936))))

(assert (=> b!1477638 (= res!1003741 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477639 () Bool)

(assert (=> b!1477639 (= e!828936 (not true))))

(assert (=> b!1477639 e!828943))

(declare-fun res!1003740 () Bool)

(assert (=> b!1477639 (=> (not res!1003740) (not e!828943))))

(assert (=> b!1477639 (= res!1003740 (and (= lt!645414 (Found!12158 j!93)) (or (= (select (arr!47918 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47918 a!2862) intermediateBeforeIndex!19) (select (arr!47918 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99278 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1477639 (= lt!645414 (seekEntryOrOpen!0 (select (arr!47918 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477639 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49656 0))(
  ( (Unit!49657) )
))
(declare-fun lt!645409 () Unit!49656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49656)

(assert (=> b!1477639 (= lt!645409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477640 () Bool)

(assert (=> b!1477640 (= e!828937 e!828936)))

(declare-fun res!1003733 () Bool)

(assert (=> b!1477640 (=> (not res!1003733) (not e!828936))))

(assert (=> b!1477640 (= res!1003733 (= lt!645413 (Intermediate!12158 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477640 (= lt!645413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645411 mask!2687) lt!645411 lt!645412 mask!2687))))

(assert (=> b!1477640 (= lt!645411 (select (store (arr!47918 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477641 () Bool)

(assert (=> b!1477641 (= e!828942 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645411 lt!645412 mask!2687) (seekEntryOrOpen!0 lt!645411 lt!645412 mask!2687)))))

(assert (= (and start!126172 res!1003735) b!1477631))

(assert (= (and b!1477631 res!1003730) b!1477624))

(assert (= (and b!1477624 res!1003743) b!1477636))

(assert (= (and b!1477636 res!1003729) b!1477634))

(assert (= (and b!1477634 res!1003736) b!1477627))

(assert (= (and b!1477627 res!1003737) b!1477625))

(assert (= (and b!1477625 res!1003734) b!1477630))

(assert (= (and b!1477630 res!1003738) b!1477628))

(assert (= (and b!1477628 res!1003744) b!1477637))

(assert (= (and b!1477637 res!1003731) b!1477640))

(assert (= (and b!1477640 res!1003733) b!1477633))

(assert (= (and b!1477633 c!136467) b!1477629))

(assert (= (and b!1477633 (not c!136467)) b!1477641))

(assert (= (and b!1477633 res!1003739) b!1477638))

(assert (= (and b!1477638 res!1003741) b!1477639))

(assert (= (and b!1477639 res!1003740) b!1477626))

(assert (= (and b!1477626 (not res!1003732)) b!1477632))

(assert (= (and b!1477632 res!1003742) b!1477635))

(declare-fun m!1363567 () Bool)

(assert (=> b!1477627 m!1363567))

(declare-fun m!1363569 () Bool)

(assert (=> b!1477629 m!1363569))

(declare-fun m!1363571 () Bool)

(assert (=> b!1477626 m!1363571))

(declare-fun m!1363573 () Bool)

(assert (=> b!1477626 m!1363573))

(declare-fun m!1363575 () Bool)

(assert (=> b!1477626 m!1363575))

(declare-fun m!1363577 () Bool)

(assert (=> b!1477626 m!1363577))

(assert (=> b!1477630 m!1363573))

(declare-fun m!1363579 () Bool)

(assert (=> b!1477630 m!1363579))

(declare-fun m!1363581 () Bool)

(assert (=> b!1477640 m!1363581))

(assert (=> b!1477640 m!1363581))

(declare-fun m!1363583 () Bool)

(assert (=> b!1477640 m!1363583))

(assert (=> b!1477640 m!1363573))

(declare-fun m!1363585 () Bool)

(assert (=> b!1477640 m!1363585))

(declare-fun m!1363587 () Bool)

(assert (=> start!126172 m!1363587))

(declare-fun m!1363589 () Bool)

(assert (=> start!126172 m!1363589))

(assert (=> b!1477636 m!1363577))

(assert (=> b!1477636 m!1363577))

(declare-fun m!1363591 () Bool)

(assert (=> b!1477636 m!1363591))

(declare-fun m!1363593 () Bool)

(assert (=> b!1477641 m!1363593))

(declare-fun m!1363595 () Bool)

(assert (=> b!1477641 m!1363595))

(assert (=> b!1477632 m!1363577))

(assert (=> b!1477632 m!1363577))

(declare-fun m!1363597 () Bool)

(assert (=> b!1477632 m!1363597))

(declare-fun m!1363599 () Bool)

(assert (=> b!1477634 m!1363599))

(declare-fun m!1363601 () Bool)

(assert (=> b!1477639 m!1363601))

(declare-fun m!1363603 () Bool)

(assert (=> b!1477639 m!1363603))

(assert (=> b!1477639 m!1363577))

(declare-fun m!1363605 () Bool)

(assert (=> b!1477639 m!1363605))

(declare-fun m!1363607 () Bool)

(assert (=> b!1477639 m!1363607))

(assert (=> b!1477639 m!1363577))

(declare-fun m!1363609 () Bool)

(assert (=> b!1477624 m!1363609))

(assert (=> b!1477624 m!1363609))

(declare-fun m!1363611 () Bool)

(assert (=> b!1477624 m!1363611))

(assert (=> b!1477628 m!1363577))

(assert (=> b!1477628 m!1363577))

(declare-fun m!1363613 () Bool)

(assert (=> b!1477628 m!1363613))

(assert (=> b!1477628 m!1363613))

(assert (=> b!1477628 m!1363577))

(declare-fun m!1363615 () Bool)

(assert (=> b!1477628 m!1363615))

(assert (=> b!1477637 m!1363577))

(assert (=> b!1477637 m!1363577))

(declare-fun m!1363617 () Bool)

(assert (=> b!1477637 m!1363617))

(push 1)

