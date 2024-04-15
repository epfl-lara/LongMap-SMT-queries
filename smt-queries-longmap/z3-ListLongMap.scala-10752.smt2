; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125740 () Bool)

(assert start!125740)

(declare-fun b!1471610 () Bool)

(declare-fun res!999466 () Bool)

(declare-fun e!825973 () Bool)

(assert (=> b!1471610 (=> (not res!999466) (not e!825973))))

(declare-datatypes ((array!99052 0))(
  ( (array!99053 (arr!47812 (Array (_ BitVec 32) (_ BitVec 64))) (size!48364 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99052)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99052 (_ BitVec 32)) Bool)

(assert (=> b!1471610 (= res!999466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471611 () Bool)

(declare-fun res!999465 () Bool)

(declare-fun e!825977 () Bool)

(assert (=> b!1471611 (=> (not res!999465) (not e!825977))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12077 0))(
  ( (MissingZero!12077 (index!50700 (_ BitVec 32))) (Found!12077 (index!50701 (_ BitVec 32))) (Intermediate!12077 (undefined!12889 Bool) (index!50702 (_ BitVec 32)) (x!132283 (_ BitVec 32))) (Undefined!12077) (MissingVacant!12077 (index!50703 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12077)

(assert (=> b!1471611 (= res!999465 (= (seekEntryOrOpen!0 (select (arr!47812 a!2862) j!93) a!2862 mask!2687) (Found!12077 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1471612 () Bool)

(assert (=> b!1471612 (= e!825977 (or (= (select (arr!47812 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47812 a!2862) intermediateBeforeIndex!19) (select (arr!47812 a!2862) j!93))))))

(declare-fun b!1471613 () Bool)

(declare-fun res!999474 () Bool)

(assert (=> b!1471613 (=> (not res!999474) (not e!825973))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471613 (= res!999474 (validKeyInArray!0 (select (arr!47812 a!2862) i!1006)))))

(declare-fun b!1471614 () Bool)

(declare-fun e!825974 () Bool)

(assert (=> b!1471614 (= e!825974 (not true))))

(assert (=> b!1471614 e!825977))

(declare-fun res!999467 () Bool)

(assert (=> b!1471614 (=> (not res!999467) (not e!825977))))

(assert (=> b!1471614 (= res!999467 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49335 0))(
  ( (Unit!49336) )
))
(declare-fun lt!643152 () Unit!49335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49335)

(assert (=> b!1471614 (= lt!643152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471615 () Bool)

(declare-fun e!825975 () Bool)

(assert (=> b!1471615 (= e!825973 e!825975)))

(declare-fun res!999469 () Bool)

(assert (=> b!1471615 (=> (not res!999469) (not e!825975))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471615 (= res!999469 (= (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643153 () array!99052)

(assert (=> b!1471615 (= lt!643153 (array!99053 (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48364 a!2862)))))

(declare-fun b!1471616 () Bool)

(declare-fun e!825972 () Bool)

(assert (=> b!1471616 (= e!825975 e!825972)))

(declare-fun res!999476 () Bool)

(assert (=> b!1471616 (=> (not res!999476) (not e!825972))))

(declare-fun lt!643151 () SeekEntryResult!12077)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471616 (= res!999476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47812 a!2862) j!93) mask!2687) (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!643151))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471616 (= lt!643151 (Intermediate!12077 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643155 () (_ BitVec 64))

(declare-fun b!1471618 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643154 () SeekEntryResult!12077)

(declare-fun e!825976 () Bool)

(assert (=> b!1471618 (= e!825976 (= lt!643154 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643155 lt!643153 mask!2687)))))

(declare-fun b!1471619 () Bool)

(declare-fun res!999468 () Bool)

(assert (=> b!1471619 (=> (not res!999468) (not e!825973))))

(declare-datatypes ((List!34391 0))(
  ( (Nil!34388) (Cons!34387 (h!35743 (_ BitVec 64)) (t!49077 List!34391)) )
))
(declare-fun arrayNoDuplicates!0 (array!99052 (_ BitVec 32) List!34391) Bool)

(assert (=> b!1471619 (= res!999468 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34388))))

(declare-fun b!1471620 () Bool)

(declare-fun res!999475 () Bool)

(assert (=> b!1471620 (=> (not res!999475) (not e!825973))))

(assert (=> b!1471620 (= res!999475 (and (= (size!48364 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48364 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48364 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471621 () Bool)

(declare-fun res!999471 () Bool)

(assert (=> b!1471621 (=> (not res!999471) (not e!825973))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471621 (= res!999471 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48364 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48364 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48364 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471622 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12077)

(assert (=> b!1471622 (= e!825976 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643155 lt!643153 mask!2687) (seekEntryOrOpen!0 lt!643155 lt!643153 mask!2687)))))

(declare-fun b!1471623 () Bool)

(declare-fun res!999473 () Bool)

(assert (=> b!1471623 (=> (not res!999473) (not e!825973))))

(assert (=> b!1471623 (= res!999473 (validKeyInArray!0 (select (arr!47812 a!2862) j!93)))))

(declare-fun b!1471624 () Bool)

(assert (=> b!1471624 (= e!825972 e!825974)))

(declare-fun res!999477 () Bool)

(assert (=> b!1471624 (=> (not res!999477) (not e!825974))))

(assert (=> b!1471624 (= res!999477 (= lt!643154 (Intermediate!12077 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471624 (= lt!643154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643155 mask!2687) lt!643155 lt!643153 mask!2687))))

(assert (=> b!1471624 (= lt!643155 (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471625 () Bool)

(declare-fun res!999472 () Bool)

(assert (=> b!1471625 (=> (not res!999472) (not e!825972))))

(assert (=> b!1471625 (= res!999472 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!643151))))

(declare-fun b!1471626 () Bool)

(declare-fun res!999464 () Bool)

(assert (=> b!1471626 (=> (not res!999464) (not e!825974))))

(assert (=> b!1471626 (= res!999464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!999478 () Bool)

(assert (=> start!125740 (=> (not res!999478) (not e!825973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125740 (= res!999478 (validMask!0 mask!2687))))

(assert (=> start!125740 e!825973))

(assert (=> start!125740 true))

(declare-fun array_inv!37045 (array!99052) Bool)

(assert (=> start!125740 (array_inv!37045 a!2862)))

(declare-fun b!1471617 () Bool)

(declare-fun res!999470 () Bool)

(assert (=> b!1471617 (=> (not res!999470) (not e!825974))))

(assert (=> b!1471617 (= res!999470 e!825976)))

(declare-fun c!135589 () Bool)

(assert (=> b!1471617 (= c!135589 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125740 res!999478) b!1471620))

(assert (= (and b!1471620 res!999475) b!1471613))

(assert (= (and b!1471613 res!999474) b!1471623))

(assert (= (and b!1471623 res!999473) b!1471610))

(assert (= (and b!1471610 res!999466) b!1471619))

(assert (= (and b!1471619 res!999468) b!1471621))

(assert (= (and b!1471621 res!999471) b!1471615))

(assert (= (and b!1471615 res!999469) b!1471616))

(assert (= (and b!1471616 res!999476) b!1471625))

(assert (= (and b!1471625 res!999472) b!1471624))

(assert (= (and b!1471624 res!999477) b!1471617))

(assert (= (and b!1471617 c!135589) b!1471618))

(assert (= (and b!1471617 (not c!135589)) b!1471622))

(assert (= (and b!1471617 res!999470) b!1471626))

(assert (= (and b!1471626 res!999464) b!1471614))

(assert (= (and b!1471614 res!999467) b!1471611))

(assert (= (and b!1471611 res!999465) b!1471612))

(declare-fun m!1357905 () Bool)

(assert (=> b!1471615 m!1357905))

(declare-fun m!1357907 () Bool)

(assert (=> b!1471615 m!1357907))

(declare-fun m!1357909 () Bool)

(assert (=> b!1471612 m!1357909))

(declare-fun m!1357911 () Bool)

(assert (=> b!1471612 m!1357911))

(declare-fun m!1357913 () Bool)

(assert (=> start!125740 m!1357913))

(declare-fun m!1357915 () Bool)

(assert (=> start!125740 m!1357915))

(assert (=> b!1471616 m!1357911))

(assert (=> b!1471616 m!1357911))

(declare-fun m!1357917 () Bool)

(assert (=> b!1471616 m!1357917))

(assert (=> b!1471616 m!1357917))

(assert (=> b!1471616 m!1357911))

(declare-fun m!1357919 () Bool)

(assert (=> b!1471616 m!1357919))

(declare-fun m!1357921 () Bool)

(assert (=> b!1471613 m!1357921))

(assert (=> b!1471613 m!1357921))

(declare-fun m!1357923 () Bool)

(assert (=> b!1471613 m!1357923))

(declare-fun m!1357925 () Bool)

(assert (=> b!1471618 m!1357925))

(assert (=> b!1471623 m!1357911))

(assert (=> b!1471623 m!1357911))

(declare-fun m!1357927 () Bool)

(assert (=> b!1471623 m!1357927))

(declare-fun m!1357929 () Bool)

(assert (=> b!1471614 m!1357929))

(declare-fun m!1357931 () Bool)

(assert (=> b!1471614 m!1357931))

(declare-fun m!1357933 () Bool)

(assert (=> b!1471624 m!1357933))

(assert (=> b!1471624 m!1357933))

(declare-fun m!1357935 () Bool)

(assert (=> b!1471624 m!1357935))

(assert (=> b!1471624 m!1357905))

(declare-fun m!1357937 () Bool)

(assert (=> b!1471624 m!1357937))

(declare-fun m!1357939 () Bool)

(assert (=> b!1471619 m!1357939))

(assert (=> b!1471625 m!1357911))

(assert (=> b!1471625 m!1357911))

(declare-fun m!1357941 () Bool)

(assert (=> b!1471625 m!1357941))

(declare-fun m!1357943 () Bool)

(assert (=> b!1471622 m!1357943))

(declare-fun m!1357945 () Bool)

(assert (=> b!1471622 m!1357945))

(declare-fun m!1357947 () Bool)

(assert (=> b!1471610 m!1357947))

(assert (=> b!1471611 m!1357911))

(assert (=> b!1471611 m!1357911))

(declare-fun m!1357949 () Bool)

(assert (=> b!1471611 m!1357949))

(check-sat (not b!1471610) (not b!1471622) (not b!1471611) (not b!1471618) (not start!125740) (not b!1471625) (not b!1471624) (not b!1471613) (not b!1471616) (not b!1471623) (not b!1471619) (not b!1471614))
(check-sat)
