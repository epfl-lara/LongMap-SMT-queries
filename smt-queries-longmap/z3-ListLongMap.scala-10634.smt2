; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124944 () Bool)

(assert start!124944)

(declare-fun b!1452104 () Bool)

(declare-fun res!983274 () Bool)

(declare-fun e!817496 () Bool)

(assert (=> b!1452104 (=> (not res!983274) (not e!817496))))

(declare-fun e!817499 () Bool)

(assert (=> b!1452104 (= res!983274 e!817499)))

(declare-fun c!133932 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452104 (= c!133932 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452105 () Bool)

(declare-fun res!983271 () Bool)

(declare-fun e!817498 () Bool)

(assert (=> b!1452105 (=> (not res!983271) (not e!817498))))

(declare-datatypes ((array!98392 0))(
  ( (array!98393 (arr!47484 (Array (_ BitVec 32) (_ BitVec 64))) (size!48034 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98392)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98392 (_ BitVec 32)) Bool)

(assert (=> b!1452105 (= res!983271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!983272 () Bool)

(assert (=> start!124944 (=> (not res!983272) (not e!817498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124944 (= res!983272 (validMask!0 mask!2687))))

(assert (=> start!124944 e!817498))

(assert (=> start!124944 true))

(declare-fun array_inv!36512 (array!98392) Bool)

(assert (=> start!124944 (array_inv!36512 a!2862)))

(declare-fun b!1452106 () Bool)

(declare-fun res!983263 () Bool)

(assert (=> b!1452106 (=> (not res!983263) (not e!817498))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452106 (= res!983263 (validKeyInArray!0 (select (arr!47484 a!2862) i!1006)))))

(declare-fun b!1452107 () Bool)

(declare-fun res!983268 () Bool)

(assert (=> b!1452107 (=> (not res!983268) (not e!817498))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452107 (= res!983268 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48034 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48034 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48034 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452108 () Bool)

(declare-fun res!983264 () Bool)

(assert (=> b!1452108 (=> (not res!983264) (not e!817498))))

(declare-datatypes ((List!33985 0))(
  ( (Nil!33982) (Cons!33981 (h!35331 (_ BitVec 64)) (t!48679 List!33985)) )
))
(declare-fun arrayNoDuplicates!0 (array!98392 (_ BitVec 32) List!33985) Bool)

(assert (=> b!1452108 (= res!983264 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33982))))

(declare-fun b!1452109 () Bool)

(declare-fun e!817497 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1452109 (= e!817497 (and (or (= (select (arr!47484 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47484 a!2862) intermediateBeforeIndex!19) (select (arr!47484 a!2862) j!93))) (or (and (= (select (arr!47484 a!2862) index!646) (select (store (arr!47484 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47484 a!2862) index!646) (select (arr!47484 a!2862) j!93))) (= (select (arr!47484 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47484 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452110 () Bool)

(declare-fun res!983265 () Bool)

(assert (=> b!1452110 (=> (not res!983265) (not e!817498))))

(assert (=> b!1452110 (= res!983265 (and (= (size!48034 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48034 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48034 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452111 () Bool)

(declare-fun res!983270 () Bool)

(assert (=> b!1452111 (=> (not res!983270) (not e!817496))))

(assert (=> b!1452111 (= res!983270 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452112 () Bool)

(declare-fun e!817502 () Bool)

(assert (=> b!1452112 (= e!817502 e!817496)))

(declare-fun res!983261 () Bool)

(assert (=> b!1452112 (=> (not res!983261) (not e!817496))))

(declare-datatypes ((SeekEntryResult!11736 0))(
  ( (MissingZero!11736 (index!49336 (_ BitVec 32))) (Found!11736 (index!49337 (_ BitVec 32))) (Intermediate!11736 (undefined!12548 Bool) (index!49338 (_ BitVec 32)) (x!130985 (_ BitVec 32))) (Undefined!11736) (MissingVacant!11736 (index!49339 (_ BitVec 32))) )
))
(declare-fun lt!636847 () SeekEntryResult!11736)

(assert (=> b!1452112 (= res!983261 (= lt!636847 (Intermediate!11736 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636848 () array!98392)

(declare-fun lt!636846 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452112 (= lt!636847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636846 mask!2687) lt!636846 lt!636848 mask!2687))))

(assert (=> b!1452112 (= lt!636846 (select (store (arr!47484 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452113 () Bool)

(declare-fun e!817501 () Bool)

(assert (=> b!1452113 (= e!817501 e!817502)))

(declare-fun res!983275 () Bool)

(assert (=> b!1452113 (=> (not res!983275) (not e!817502))))

(declare-fun lt!636849 () SeekEntryResult!11736)

(assert (=> b!1452113 (= res!983275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47484 a!2862) j!93) mask!2687) (select (arr!47484 a!2862) j!93) a!2862 mask!2687) lt!636849))))

(assert (=> b!1452113 (= lt!636849 (Intermediate!11736 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452114 () Bool)

(assert (=> b!1452114 (= e!817496 (not true))))

(assert (=> b!1452114 e!817497))

(declare-fun res!983273 () Bool)

(assert (=> b!1452114 (=> (not res!983273) (not e!817497))))

(assert (=> b!1452114 (= res!983273 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48968 0))(
  ( (Unit!48969) )
))
(declare-fun lt!636845 () Unit!48968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48968)

(assert (=> b!1452114 (= lt!636845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11736)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98392 (_ BitVec 32)) SeekEntryResult!11736)

(assert (=> b!1452115 (= e!817499 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636846 lt!636848 mask!2687) (seekEntryOrOpen!0 lt!636846 lt!636848 mask!2687)))))

(declare-fun b!1452116 () Bool)

(declare-fun res!983266 () Bool)

(assert (=> b!1452116 (=> (not res!983266) (not e!817502))))

(assert (=> b!1452116 (= res!983266 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47484 a!2862) j!93) a!2862 mask!2687) lt!636849))))

(declare-fun b!1452117 () Bool)

(declare-fun res!983262 () Bool)

(assert (=> b!1452117 (=> (not res!983262) (not e!817497))))

(assert (=> b!1452117 (= res!983262 (= (seekEntryOrOpen!0 (select (arr!47484 a!2862) j!93) a!2862 mask!2687) (Found!11736 j!93)))))

(declare-fun b!1452118 () Bool)

(assert (=> b!1452118 (= e!817499 (= lt!636847 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636846 lt!636848 mask!2687)))))

(declare-fun b!1452119 () Bool)

(assert (=> b!1452119 (= e!817498 e!817501)))

(declare-fun res!983267 () Bool)

(assert (=> b!1452119 (=> (not res!983267) (not e!817501))))

(assert (=> b!1452119 (= res!983267 (= (select (store (arr!47484 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452119 (= lt!636848 (array!98393 (store (arr!47484 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48034 a!2862)))))

(declare-fun b!1452120 () Bool)

(declare-fun res!983269 () Bool)

(assert (=> b!1452120 (=> (not res!983269) (not e!817498))))

(assert (=> b!1452120 (= res!983269 (validKeyInArray!0 (select (arr!47484 a!2862) j!93)))))

(assert (= (and start!124944 res!983272) b!1452110))

(assert (= (and b!1452110 res!983265) b!1452106))

(assert (= (and b!1452106 res!983263) b!1452120))

(assert (= (and b!1452120 res!983269) b!1452105))

(assert (= (and b!1452105 res!983271) b!1452108))

(assert (= (and b!1452108 res!983264) b!1452107))

(assert (= (and b!1452107 res!983268) b!1452119))

(assert (= (and b!1452119 res!983267) b!1452113))

(assert (= (and b!1452113 res!983275) b!1452116))

(assert (= (and b!1452116 res!983266) b!1452112))

(assert (= (and b!1452112 res!983261) b!1452104))

(assert (= (and b!1452104 c!133932) b!1452118))

(assert (= (and b!1452104 (not c!133932)) b!1452115))

(assert (= (and b!1452104 res!983274) b!1452111))

(assert (= (and b!1452111 res!983270) b!1452114))

(assert (= (and b!1452114 res!983273) b!1452117))

(assert (= (and b!1452117 res!983262) b!1452109))

(declare-fun m!1340685 () Bool)

(assert (=> b!1452113 m!1340685))

(assert (=> b!1452113 m!1340685))

(declare-fun m!1340687 () Bool)

(assert (=> b!1452113 m!1340687))

(assert (=> b!1452113 m!1340687))

(assert (=> b!1452113 m!1340685))

(declare-fun m!1340689 () Bool)

(assert (=> b!1452113 m!1340689))

(declare-fun m!1340691 () Bool)

(assert (=> b!1452114 m!1340691))

(declare-fun m!1340693 () Bool)

(assert (=> b!1452114 m!1340693))

(declare-fun m!1340695 () Bool)

(assert (=> b!1452106 m!1340695))

(assert (=> b!1452106 m!1340695))

(declare-fun m!1340697 () Bool)

(assert (=> b!1452106 m!1340697))

(declare-fun m!1340699 () Bool)

(assert (=> start!124944 m!1340699))

(declare-fun m!1340701 () Bool)

(assert (=> start!124944 m!1340701))

(assert (=> b!1452116 m!1340685))

(assert (=> b!1452116 m!1340685))

(declare-fun m!1340703 () Bool)

(assert (=> b!1452116 m!1340703))

(assert (=> b!1452117 m!1340685))

(assert (=> b!1452117 m!1340685))

(declare-fun m!1340705 () Bool)

(assert (=> b!1452117 m!1340705))

(declare-fun m!1340707 () Bool)

(assert (=> b!1452105 m!1340707))

(declare-fun m!1340709 () Bool)

(assert (=> b!1452119 m!1340709))

(declare-fun m!1340711 () Bool)

(assert (=> b!1452119 m!1340711))

(assert (=> b!1452109 m!1340709))

(declare-fun m!1340713 () Bool)

(assert (=> b!1452109 m!1340713))

(declare-fun m!1340715 () Bool)

(assert (=> b!1452109 m!1340715))

(declare-fun m!1340717 () Bool)

(assert (=> b!1452109 m!1340717))

(assert (=> b!1452109 m!1340685))

(assert (=> b!1452120 m!1340685))

(assert (=> b!1452120 m!1340685))

(declare-fun m!1340719 () Bool)

(assert (=> b!1452120 m!1340719))

(declare-fun m!1340721 () Bool)

(assert (=> b!1452112 m!1340721))

(assert (=> b!1452112 m!1340721))

(declare-fun m!1340723 () Bool)

(assert (=> b!1452112 m!1340723))

(assert (=> b!1452112 m!1340709))

(declare-fun m!1340725 () Bool)

(assert (=> b!1452112 m!1340725))

(declare-fun m!1340727 () Bool)

(assert (=> b!1452108 m!1340727))

(declare-fun m!1340729 () Bool)

(assert (=> b!1452118 m!1340729))

(declare-fun m!1340731 () Bool)

(assert (=> b!1452115 m!1340731))

(declare-fun m!1340733 () Bool)

(assert (=> b!1452115 m!1340733))

(check-sat (not b!1452105) (not b!1452106) (not b!1452120) (not start!124944) (not b!1452114) (not b!1452112) (not b!1452116) (not b!1452115) (not b!1452117) (not b!1452108) (not b!1452118) (not b!1452113))
(check-sat)
