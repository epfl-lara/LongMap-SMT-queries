; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124226 () Bool)

(assert start!124226)

(declare-fun b!1437548 () Bool)

(declare-fun res!969672 () Bool)

(declare-fun e!811355 () Bool)

(assert (=> b!1437548 (=> (not res!969672) (not e!811355))))

(declare-datatypes ((array!97783 0))(
  ( (array!97784 (arr!47185 (Array (_ BitVec 32) (_ BitVec 64))) (size!47736 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97783)

(declare-datatypes ((List!33673 0))(
  ( (Nil!33670) (Cons!33669 (h!35015 (_ BitVec 64)) (t!48359 List!33673)) )
))
(declare-fun arrayNoDuplicates!0 (array!97783 (_ BitVec 32) List!33673) Bool)

(assert (=> b!1437548 (= res!969672 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33670))))

(declare-fun b!1437549 () Bool)

(declare-fun res!969669 () Bool)

(assert (=> b!1437549 (=> (not res!969669) (not e!811355))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437549 (= res!969669 (validKeyInArray!0 (select (arr!47185 a!2862) j!93)))))

(declare-fun b!1437550 () Bool)

(declare-fun res!969674 () Bool)

(assert (=> b!1437550 (=> (not res!969674) (not e!811355))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97783 (_ BitVec 32)) Bool)

(assert (=> b!1437550 (= res!969674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1437551 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437551 (= e!811355 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47736 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47736 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47736 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun res!969673 () Bool)

(assert (=> start!124226 (=> (not res!969673) (not e!811355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124226 (= res!969673 (validMask!0 mask!2687))))

(assert (=> start!124226 e!811355))

(assert (=> start!124226 true))

(declare-fun array_inv!36466 (array!97783) Bool)

(assert (=> start!124226 (array_inv!36466 a!2862)))

(declare-fun b!1437552 () Bool)

(declare-fun res!969670 () Bool)

(assert (=> b!1437552 (=> (not res!969670) (not e!811355))))

(assert (=> b!1437552 (= res!969670 (validKeyInArray!0 (select (arr!47185 a!2862) i!1006)))))

(declare-fun b!1437553 () Bool)

(declare-fun res!969671 () Bool)

(assert (=> b!1437553 (=> (not res!969671) (not e!811355))))

(assert (=> b!1437553 (= res!969671 (and (= (size!47736 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47736 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47736 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124226 res!969673) b!1437553))

(assert (= (and b!1437553 res!969671) b!1437552))

(assert (= (and b!1437552 res!969670) b!1437549))

(assert (= (and b!1437549 res!969669) b!1437550))

(assert (= (and b!1437550 res!969674) b!1437548))

(assert (= (and b!1437548 res!969672) b!1437551))

(declare-fun m!1327009 () Bool)

(assert (=> b!1437548 m!1327009))

(declare-fun m!1327011 () Bool)

(assert (=> b!1437550 m!1327011))

(declare-fun m!1327013 () Bool)

(assert (=> b!1437552 m!1327013))

(assert (=> b!1437552 m!1327013))

(declare-fun m!1327015 () Bool)

(assert (=> b!1437552 m!1327015))

(declare-fun m!1327017 () Bool)

(assert (=> b!1437549 m!1327017))

(assert (=> b!1437549 m!1327017))

(declare-fun m!1327019 () Bool)

(assert (=> b!1437549 m!1327019))

(declare-fun m!1327021 () Bool)

(assert (=> start!124226 m!1327021))

(declare-fun m!1327023 () Bool)

(assert (=> start!124226 m!1327023))

(declare-fun m!1327025 () Bool)

(assert (=> b!1437551 m!1327025))

(declare-fun m!1327027 () Bool)

(assert (=> b!1437551 m!1327027))

(check-sat (not start!124226) (not b!1437549) (not b!1437550) (not b!1437548) (not b!1437552))
(check-sat)
(get-model)

(declare-fun d!154917 () Bool)

(assert (=> d!154917 (= (validKeyInArray!0 (select (arr!47185 a!2862) i!1006)) (and (not (= (select (arr!47185 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47185 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437552 d!154917))

(declare-fun b!1437600 () Bool)

(declare-fun e!811377 () Bool)

(declare-fun call!67665 () Bool)

(assert (=> b!1437600 (= e!811377 call!67665)))

(declare-fun b!1437601 () Bool)

(declare-fun e!811378 () Bool)

(assert (=> b!1437601 (= e!811378 e!811377)))

(declare-fun c!133453 () Bool)

(assert (=> b!1437601 (= c!133453 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437602 () Bool)

(declare-fun e!811379 () Bool)

(declare-fun contains!9928 (List!33673 (_ BitVec 64)) Bool)

(assert (=> b!1437602 (= e!811379 (contains!9928 Nil!33670 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437603 () Bool)

(declare-fun e!811380 () Bool)

(assert (=> b!1437603 (= e!811380 e!811378)))

(declare-fun res!969717 () Bool)

(assert (=> b!1437603 (=> (not res!969717) (not e!811378))))

(assert (=> b!1437603 (= res!969717 (not e!811379))))

(declare-fun res!969719 () Bool)

(assert (=> b!1437603 (=> (not res!969719) (not e!811379))))

(assert (=> b!1437603 (= res!969719 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437604 () Bool)

(assert (=> b!1437604 (= e!811377 call!67665)))

(declare-fun d!154919 () Bool)

(declare-fun res!969718 () Bool)

(assert (=> d!154919 (=> res!969718 e!811380)))

(assert (=> d!154919 (= res!969718 (bvsge #b00000000000000000000000000000000 (size!47736 a!2862)))))

(assert (=> d!154919 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33670) e!811380)))

(declare-fun bm!67662 () Bool)

(assert (=> bm!67662 (= call!67665 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133453 (Cons!33669 (select (arr!47185 a!2862) #b00000000000000000000000000000000) Nil!33670) Nil!33670)))))

(assert (= (and d!154919 (not res!969718)) b!1437603))

(assert (= (and b!1437603 res!969719) b!1437602))

(assert (= (and b!1437603 res!969717) b!1437601))

(assert (= (and b!1437601 c!133453) b!1437600))

(assert (= (and b!1437601 (not c!133453)) b!1437604))

(assert (= (or b!1437600 b!1437604) bm!67662))

(declare-fun m!1327069 () Bool)

(assert (=> b!1437601 m!1327069))

(assert (=> b!1437601 m!1327069))

(declare-fun m!1327071 () Bool)

(assert (=> b!1437601 m!1327071))

(assert (=> b!1437602 m!1327069))

(assert (=> b!1437602 m!1327069))

(declare-fun m!1327073 () Bool)

(assert (=> b!1437602 m!1327073))

(assert (=> b!1437603 m!1327069))

(assert (=> b!1437603 m!1327069))

(assert (=> b!1437603 m!1327071))

(assert (=> bm!67662 m!1327069))

(declare-fun m!1327075 () Bool)

(assert (=> bm!67662 m!1327075))

(assert (=> b!1437548 d!154919))

(declare-fun d!154921 () Bool)

(assert (=> d!154921 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124226 d!154921))

(declare-fun d!154923 () Bool)

(assert (=> d!154923 (= (array_inv!36466 a!2862) (bvsge (size!47736 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124226 d!154923))

(declare-fun d!154925 () Bool)

(assert (=> d!154925 (= (validKeyInArray!0 (select (arr!47185 a!2862) j!93)) (and (not (= (select (arr!47185 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47185 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437549 d!154925))

(declare-fun b!1437613 () Bool)

(declare-fun e!811389 () Bool)

(declare-fun call!67668 () Bool)

(assert (=> b!1437613 (= e!811389 call!67668)))

(declare-fun bm!67665 () Bool)

(assert (=> bm!67665 (= call!67668 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1437614 () Bool)

(declare-fun e!811388 () Bool)

(declare-fun e!811387 () Bool)

(assert (=> b!1437614 (= e!811388 e!811387)))

(declare-fun c!133456 () Bool)

(assert (=> b!1437614 (= c!133456 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437615 () Bool)

(assert (=> b!1437615 (= e!811387 call!67668)))

(declare-fun d!154927 () Bool)

(declare-fun res!969725 () Bool)

(assert (=> d!154927 (=> res!969725 e!811388)))

(assert (=> d!154927 (= res!969725 (bvsge #b00000000000000000000000000000000 (size!47736 a!2862)))))

(assert (=> d!154927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811388)))

(declare-fun b!1437616 () Bool)

(assert (=> b!1437616 (= e!811387 e!811389)))

(declare-fun lt!632580 () (_ BitVec 64))

(assert (=> b!1437616 (= lt!632580 (select (arr!47185 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48483 0))(
  ( (Unit!48484) )
))
(declare-fun lt!632581 () Unit!48483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97783 (_ BitVec 64) (_ BitVec 32)) Unit!48483)

(assert (=> b!1437616 (= lt!632581 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632580 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437616 (arrayContainsKey!0 a!2862 lt!632580 #b00000000000000000000000000000000)))

(declare-fun lt!632579 () Unit!48483)

(assert (=> b!1437616 (= lt!632579 lt!632581)))

(declare-fun res!969724 () Bool)

(declare-datatypes ((SeekEntryResult!11352 0))(
  ( (MissingZero!11352 (index!47800 (_ BitVec 32))) (Found!11352 (index!47801 (_ BitVec 32))) (Intermediate!11352 (undefined!12164 Bool) (index!47802 (_ BitVec 32)) (x!129662 (_ BitVec 32))) (Undefined!11352) (MissingVacant!11352 (index!47803 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97783 (_ BitVec 32)) SeekEntryResult!11352)

(assert (=> b!1437616 (= res!969724 (= (seekEntryOrOpen!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11352 #b00000000000000000000000000000000)))))

(assert (=> b!1437616 (=> (not res!969724) (not e!811389))))

(assert (= (and d!154927 (not res!969725)) b!1437614))

(assert (= (and b!1437614 c!133456) b!1437616))

(assert (= (and b!1437614 (not c!133456)) b!1437615))

(assert (= (and b!1437616 res!969724) b!1437613))

(assert (= (or b!1437613 b!1437615) bm!67665))

(declare-fun m!1327077 () Bool)

(assert (=> bm!67665 m!1327077))

(assert (=> b!1437614 m!1327069))

(assert (=> b!1437614 m!1327069))

(assert (=> b!1437614 m!1327071))

(assert (=> b!1437616 m!1327069))

(declare-fun m!1327079 () Bool)

(assert (=> b!1437616 m!1327079))

(declare-fun m!1327081 () Bool)

(assert (=> b!1437616 m!1327081))

(assert (=> b!1437616 m!1327069))

(declare-fun m!1327083 () Bool)

(assert (=> b!1437616 m!1327083))

(assert (=> b!1437550 d!154927))

(check-sat (not b!1437616) (not b!1437602) (not bm!67662) (not b!1437601) (not b!1437603) (not b!1437614) (not bm!67665))
(check-sat)
