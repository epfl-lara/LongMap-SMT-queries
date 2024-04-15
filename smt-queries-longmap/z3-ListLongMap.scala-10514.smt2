; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123908 () Bool)

(assert start!123908)

(declare-fun b!1435729 () Bool)

(declare-fun res!968823 () Bool)

(declare-fun e!810236 () Bool)

(assert (=> b!1435729 (=> (not res!968823) (not e!810236))))

(declare-datatypes ((array!97596 0))(
  ( (array!97597 (arr!47098 (Array (_ BitVec 32) (_ BitVec 64))) (size!47650 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97596)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435729 (= res!968823 (validKeyInArray!0 (select (arr!47098 a!2862) i!1006)))))

(declare-fun b!1435730 () Bool)

(declare-fun res!968822 () Bool)

(assert (=> b!1435730 (=> (not res!968822) (not e!810236))))

(assert (=> b!1435730 (= res!968822 (and (bvsle #b00000000000000000000000000000000 (size!47650 a!2862)) (bvslt (size!47650 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435732 () Bool)

(declare-fun res!968827 () Bool)

(assert (=> b!1435732 (=> (not res!968827) (not e!810236))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1435732 (= res!968827 (and (= (size!47650 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47650 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47650 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435733 () Bool)

(declare-fun res!968824 () Bool)

(assert (=> b!1435733 (=> (not res!968824) (not e!810236))))

(assert (=> b!1435733 (= res!968824 (validKeyInArray!0 (select (arr!47098 a!2862) j!93)))))

(declare-fun b!1435734 () Bool)

(declare-datatypes ((List!33677 0))(
  ( (Nil!33674) (Cons!33673 (h!35008 (_ BitVec 64)) (t!48363 List!33677)) )
))
(declare-fun noDuplicate!2634 (List!33677) Bool)

(assert (=> b!1435734 (= e!810236 (not (noDuplicate!2634 Nil!33674)))))

(declare-fun b!1435731 () Bool)

(declare-fun res!968826 () Bool)

(assert (=> b!1435731 (=> (not res!968826) (not e!810236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97596 (_ BitVec 32)) Bool)

(assert (=> b!1435731 (= res!968826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!968825 () Bool)

(assert (=> start!123908 (=> (not res!968825) (not e!810236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123908 (= res!968825 (validMask!0 mask!2687))))

(assert (=> start!123908 e!810236))

(assert (=> start!123908 true))

(declare-fun array_inv!36331 (array!97596) Bool)

(assert (=> start!123908 (array_inv!36331 a!2862)))

(assert (= (and start!123908 res!968825) b!1435732))

(assert (= (and b!1435732 res!968827) b!1435729))

(assert (= (and b!1435729 res!968823) b!1435733))

(assert (= (and b!1435733 res!968824) b!1435731))

(assert (= (and b!1435731 res!968826) b!1435730))

(assert (= (and b!1435730 res!968822) b!1435734))

(declare-fun m!1324607 () Bool)

(assert (=> start!123908 m!1324607))

(declare-fun m!1324609 () Bool)

(assert (=> start!123908 m!1324609))

(declare-fun m!1324611 () Bool)

(assert (=> b!1435733 m!1324611))

(assert (=> b!1435733 m!1324611))

(declare-fun m!1324613 () Bool)

(assert (=> b!1435733 m!1324613))

(declare-fun m!1324615 () Bool)

(assert (=> b!1435731 m!1324615))

(declare-fun m!1324617 () Bool)

(assert (=> b!1435734 m!1324617))

(declare-fun m!1324619 () Bool)

(assert (=> b!1435729 m!1324619))

(assert (=> b!1435729 m!1324619))

(declare-fun m!1324621 () Bool)

(assert (=> b!1435729 m!1324621))

(check-sat (not b!1435733) (not b!1435729) (not start!123908) (not b!1435734) (not b!1435731))
(check-sat)
(get-model)

(declare-fun d!154279 () Bool)

(assert (=> d!154279 (= (validKeyInArray!0 (select (arr!47098 a!2862) i!1006)) (and (not (= (select (arr!47098 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47098 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435729 d!154279))

(declare-fun d!154281 () Bool)

(declare-fun res!968868 () Bool)

(declare-fun e!810254 () Bool)

(assert (=> d!154281 (=> res!968868 e!810254)))

(get-info :version)

(assert (=> d!154281 (= res!968868 ((_ is Nil!33674) Nil!33674))))

(assert (=> d!154281 (= (noDuplicate!2634 Nil!33674) e!810254)))

(declare-fun b!1435775 () Bool)

(declare-fun e!810255 () Bool)

(assert (=> b!1435775 (= e!810254 e!810255)))

(declare-fun res!968869 () Bool)

(assert (=> b!1435775 (=> (not res!968869) (not e!810255))))

(declare-fun contains!9839 (List!33677 (_ BitVec 64)) Bool)

(assert (=> b!1435775 (= res!968869 (not (contains!9839 (t!48363 Nil!33674) (h!35008 Nil!33674))))))

(declare-fun b!1435776 () Bool)

(assert (=> b!1435776 (= e!810255 (noDuplicate!2634 (t!48363 Nil!33674)))))

(assert (= (and d!154281 (not res!968868)) b!1435775))

(assert (= (and b!1435775 res!968869) b!1435776))

(declare-fun m!1324655 () Bool)

(assert (=> b!1435775 m!1324655))

(declare-fun m!1324657 () Bool)

(assert (=> b!1435776 m!1324657))

(assert (=> b!1435734 d!154281))

(declare-fun d!154283 () Bool)

(assert (=> d!154283 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123908 d!154283))

(declare-fun d!154295 () Bool)

(assert (=> d!154295 (= (array_inv!36331 a!2862) (bvsge (size!47650 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123908 d!154295))

(declare-fun b!1435809 () Bool)

(declare-fun e!810284 () Bool)

(declare-fun e!810285 () Bool)

(assert (=> b!1435809 (= e!810284 e!810285)))

(declare-fun c!132964 () Bool)

(assert (=> b!1435809 (= c!132964 (validKeyInArray!0 (select (arr!47098 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1435810 () Bool)

(declare-fun call!67553 () Bool)

(assert (=> b!1435810 (= e!810285 call!67553)))

(declare-fun d!154297 () Bool)

(declare-fun res!968892 () Bool)

(assert (=> d!154297 (=> res!968892 e!810284)))

(assert (=> d!154297 (= res!968892 (bvsge #b00000000000000000000000000000000 (size!47650 a!2862)))))

(assert (=> d!154297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810284)))

(declare-fun b!1435811 () Bool)

(declare-fun e!810283 () Bool)

(assert (=> b!1435811 (= e!810285 e!810283)))

(declare-fun lt!631811 () (_ BitVec 64))

(assert (=> b!1435811 (= lt!631811 (select (arr!47098 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48379 0))(
  ( (Unit!48380) )
))
(declare-fun lt!631810 () Unit!48379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97596 (_ BitVec 64) (_ BitVec 32)) Unit!48379)

(assert (=> b!1435811 (= lt!631810 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!631811 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435811 (arrayContainsKey!0 a!2862 lt!631811 #b00000000000000000000000000000000)))

(declare-fun lt!631812 () Unit!48379)

(assert (=> b!1435811 (= lt!631812 lt!631810)))

(declare-fun res!968893 () Bool)

(declare-datatypes ((SeekEntryResult!11397 0))(
  ( (MissingZero!11397 (index!47980 (_ BitVec 32))) (Found!11397 (index!47981 (_ BitVec 32))) (Intermediate!11397 (undefined!12209 Bool) (index!47982 (_ BitVec 32)) (x!129654 (_ BitVec 32))) (Undefined!11397) (MissingVacant!11397 (index!47983 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97596 (_ BitVec 32)) SeekEntryResult!11397)

(assert (=> b!1435811 (= res!968893 (= (seekEntryOrOpen!0 (select (arr!47098 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11397 #b00000000000000000000000000000000)))))

(assert (=> b!1435811 (=> (not res!968893) (not e!810283))))

(declare-fun bm!67550 () Bool)

(assert (=> bm!67550 (= call!67553 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1435812 () Bool)

(assert (=> b!1435812 (= e!810283 call!67553)))

(assert (= (and d!154297 (not res!968892)) b!1435809))

(assert (= (and b!1435809 c!132964) b!1435811))

(assert (= (and b!1435809 (not c!132964)) b!1435810))

(assert (= (and b!1435811 res!968893) b!1435812))

(assert (= (or b!1435812 b!1435810) bm!67550))

(declare-fun m!1324679 () Bool)

(assert (=> b!1435809 m!1324679))

(assert (=> b!1435809 m!1324679))

(declare-fun m!1324681 () Bool)

(assert (=> b!1435809 m!1324681))

(assert (=> b!1435811 m!1324679))

(declare-fun m!1324683 () Bool)

(assert (=> b!1435811 m!1324683))

(declare-fun m!1324685 () Bool)

(assert (=> b!1435811 m!1324685))

(assert (=> b!1435811 m!1324679))

(declare-fun m!1324687 () Bool)

(assert (=> b!1435811 m!1324687))

(declare-fun m!1324689 () Bool)

(assert (=> bm!67550 m!1324689))

(assert (=> b!1435731 d!154297))

(declare-fun d!154309 () Bool)

(assert (=> d!154309 (= (validKeyInArray!0 (select (arr!47098 a!2862) j!93)) (and (not (= (select (arr!47098 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47098 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435733 d!154309))

(check-sat (not b!1435775) (not bm!67550) (not b!1435809) (not b!1435811) (not b!1435776))
(check-sat)
