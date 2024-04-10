; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124224 () Bool)

(assert start!124224)

(declare-fun b!1437826 () Bool)

(declare-fun res!970612 () Bool)

(declare-fun e!811137 () Bool)

(assert (=> b!1437826 (=> (not res!970612) (not e!811137))))

(declare-datatypes ((array!97789 0))(
  ( (array!97790 (arr!47187 (Array (_ BitVec 32) (_ BitVec 64))) (size!47737 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97789)

(declare-datatypes ((List!33688 0))(
  ( (Nil!33685) (Cons!33684 (h!35025 (_ BitVec 64)) (t!48382 List!33688)) )
))
(declare-fun arrayNoDuplicates!0 (array!97789 (_ BitVec 32) List!33688) Bool)

(assert (=> b!1437826 (= res!970612 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33685))))

(declare-fun b!1437827 () Bool)

(declare-fun res!970605 () Bool)

(assert (=> b!1437827 (=> (not res!970605) (not e!811137))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1437827 (= res!970605 (and (= (size!47737 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47737 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47737 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437828 () Bool)

(declare-fun res!970607 () Bool)

(assert (=> b!1437828 (=> (not res!970607) (not e!811137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97789 (_ BitVec 32)) Bool)

(assert (=> b!1437828 (= res!970607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970610 () Bool)

(assert (=> start!124224 (=> (not res!970610) (not e!811137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124224 (= res!970610 (validMask!0 mask!2687))))

(assert (=> start!124224 e!811137))

(assert (=> start!124224 true))

(declare-fun array_inv!36215 (array!97789) Bool)

(assert (=> start!124224 (array_inv!36215 a!2862)))

(declare-fun b!1437829 () Bool)

(declare-fun res!970604 () Bool)

(assert (=> b!1437829 (=> (not res!970604) (not e!811137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437829 (= res!970604 (validKeyInArray!0 (select (arr!47187 a!2862) j!93)))))

(declare-fun b!1437830 () Bool)

(declare-fun e!811138 () Bool)

(assert (=> b!1437830 (= e!811137 e!811138)))

(declare-fun res!970608 () Bool)

(assert (=> b!1437830 (=> (not res!970608) (not e!811138))))

(declare-datatypes ((SeekEntryResult!11439 0))(
  ( (MissingZero!11439 (index!48148 (_ BitVec 32))) (Found!11439 (index!48149 (_ BitVec 32))) (Intermediate!11439 (undefined!12251 Bool) (index!48150 (_ BitVec 32)) (x!129878 (_ BitVec 32))) (Undefined!11439) (MissingVacant!11439 (index!48151 (_ BitVec 32))) )
))
(declare-fun lt!632400 () SeekEntryResult!11439)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97789 (_ BitVec 32)) SeekEntryResult!11439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437830 (= res!970608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) (select (arr!47187 a!2862) j!93) a!2862 mask!2687) lt!632400))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437830 (= lt!632400 (Intermediate!11439 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437831 () Bool)

(declare-fun res!970609 () Bool)

(assert (=> b!1437831 (=> (not res!970609) (not e!811138))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437831 (= res!970609 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47187 a!2862) j!93) a!2862 mask!2687) lt!632400))))

(declare-fun b!1437832 () Bool)

(declare-fun res!970611 () Bool)

(assert (=> b!1437832 (=> (not res!970611) (not e!811137))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437832 (= res!970611 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47737 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47737 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47737 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437833 () Bool)

(declare-fun res!970606 () Bool)

(assert (=> b!1437833 (=> (not res!970606) (not e!811137))))

(assert (=> b!1437833 (= res!970606 (validKeyInArray!0 (select (arr!47187 a!2862) i!1006)))))

(declare-fun b!1437834 () Bool)

(declare-fun lt!632399 () (_ BitVec 32))

(assert (=> b!1437834 (= e!811138 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632399 #b00000000000000000000000000000000) (bvsge lt!632399 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1437834 (= lt!632399 (toIndex!0 (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124224 res!970610) b!1437827))

(assert (= (and b!1437827 res!970605) b!1437833))

(assert (= (and b!1437833 res!970606) b!1437829))

(assert (= (and b!1437829 res!970604) b!1437828))

(assert (= (and b!1437828 res!970607) b!1437826))

(assert (= (and b!1437826 res!970612) b!1437832))

(assert (= (and b!1437832 res!970611) b!1437830))

(assert (= (and b!1437830 res!970608) b!1437831))

(assert (= (and b!1437831 res!970609) b!1437834))

(declare-fun m!1327081 () Bool)

(assert (=> start!124224 m!1327081))

(declare-fun m!1327083 () Bool)

(assert (=> start!124224 m!1327083))

(declare-fun m!1327085 () Bool)

(assert (=> b!1437832 m!1327085))

(declare-fun m!1327087 () Bool)

(assert (=> b!1437832 m!1327087))

(declare-fun m!1327089 () Bool)

(assert (=> b!1437830 m!1327089))

(assert (=> b!1437830 m!1327089))

(declare-fun m!1327091 () Bool)

(assert (=> b!1437830 m!1327091))

(assert (=> b!1437830 m!1327091))

(assert (=> b!1437830 m!1327089))

(declare-fun m!1327093 () Bool)

(assert (=> b!1437830 m!1327093))

(assert (=> b!1437831 m!1327089))

(assert (=> b!1437831 m!1327089))

(declare-fun m!1327095 () Bool)

(assert (=> b!1437831 m!1327095))

(declare-fun m!1327097 () Bool)

(assert (=> b!1437833 m!1327097))

(assert (=> b!1437833 m!1327097))

(declare-fun m!1327099 () Bool)

(assert (=> b!1437833 m!1327099))

(declare-fun m!1327101 () Bool)

(assert (=> b!1437828 m!1327101))

(assert (=> b!1437834 m!1327085))

(declare-fun m!1327103 () Bool)

(assert (=> b!1437834 m!1327103))

(assert (=> b!1437834 m!1327103))

(declare-fun m!1327105 () Bool)

(assert (=> b!1437834 m!1327105))

(declare-fun m!1327107 () Bool)

(assert (=> b!1437826 m!1327107))

(assert (=> b!1437829 m!1327089))

(assert (=> b!1437829 m!1327089))

(declare-fun m!1327109 () Bool)

(assert (=> b!1437829 m!1327109))

(check-sat (not b!1437828) (not b!1437831) (not b!1437833) (not b!1437830) (not b!1437826) (not b!1437834) (not b!1437829) (not start!124224))
(check-sat)
(get-model)

(declare-fun d!154699 () Bool)

(assert (=> d!154699 (= (validKeyInArray!0 (select (arr!47187 a!2862) i!1006)) (and (not (= (select (arr!47187 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47187 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437833 d!154699))

(declare-fun b!1437870 () Bool)

(declare-fun e!811155 () Bool)

(declare-fun e!811156 () Bool)

(assert (=> b!1437870 (= e!811155 e!811156)))

(declare-fun lt!632415 () (_ BitVec 64))

(assert (=> b!1437870 (= lt!632415 (select (arr!47187 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48560 0))(
  ( (Unit!48561) )
))
(declare-fun lt!632413 () Unit!48560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97789 (_ BitVec 64) (_ BitVec 32)) Unit!48560)

(assert (=> b!1437870 (= lt!632413 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632415 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437870 (arrayContainsKey!0 a!2862 lt!632415 #b00000000000000000000000000000000)))

(declare-fun lt!632414 () Unit!48560)

(assert (=> b!1437870 (= lt!632414 lt!632413)))

(declare-fun res!970644 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97789 (_ BitVec 32)) SeekEntryResult!11439)

(assert (=> b!1437870 (= res!970644 (= (seekEntryOrOpen!0 (select (arr!47187 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11439 #b00000000000000000000000000000000)))))

(assert (=> b!1437870 (=> (not res!970644) (not e!811156))))

(declare-fun b!1437871 () Bool)

(declare-fun call!67645 () Bool)

(assert (=> b!1437871 (= e!811156 call!67645)))

(declare-fun b!1437872 () Bool)

(declare-fun e!811157 () Bool)

(assert (=> b!1437872 (= e!811157 e!811155)))

(declare-fun c!133119 () Bool)

(assert (=> b!1437872 (= c!133119 (validKeyInArray!0 (select (arr!47187 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437873 () Bool)

(assert (=> b!1437873 (= e!811155 call!67645)))

(declare-fun d!154701 () Bool)

(declare-fun res!970645 () Bool)

(assert (=> d!154701 (=> res!970645 e!811157)))

(assert (=> d!154701 (= res!970645 (bvsge #b00000000000000000000000000000000 (size!47737 a!2862)))))

(assert (=> d!154701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811157)))

(declare-fun bm!67642 () Bool)

(assert (=> bm!67642 (= call!67645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154701 (not res!970645)) b!1437872))

(assert (= (and b!1437872 c!133119) b!1437870))

(assert (= (and b!1437872 (not c!133119)) b!1437873))

(assert (= (and b!1437870 res!970644) b!1437871))

(assert (= (or b!1437871 b!1437873) bm!67642))

(declare-fun m!1327141 () Bool)

(assert (=> b!1437870 m!1327141))

(declare-fun m!1327143 () Bool)

(assert (=> b!1437870 m!1327143))

(declare-fun m!1327145 () Bool)

(assert (=> b!1437870 m!1327145))

(assert (=> b!1437870 m!1327141))

(declare-fun m!1327147 () Bool)

(assert (=> b!1437870 m!1327147))

(assert (=> b!1437872 m!1327141))

(assert (=> b!1437872 m!1327141))

(declare-fun m!1327149 () Bool)

(assert (=> b!1437872 m!1327149))

(declare-fun m!1327151 () Bool)

(assert (=> bm!67642 m!1327151))

(assert (=> b!1437828 d!154701))

(declare-fun b!1437884 () Bool)

(declare-fun e!811169 () Bool)

(declare-fun contains!9888 (List!33688 (_ BitVec 64)) Bool)

(assert (=> b!1437884 (= e!811169 (contains!9888 Nil!33685 (select (arr!47187 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437885 () Bool)

(declare-fun e!811168 () Bool)

(declare-fun call!67648 () Bool)

(assert (=> b!1437885 (= e!811168 call!67648)))

(declare-fun b!1437886 () Bool)

(declare-fun e!811166 () Bool)

(assert (=> b!1437886 (= e!811166 e!811168)))

(declare-fun c!133122 () Bool)

(assert (=> b!1437886 (= c!133122 (validKeyInArray!0 (select (arr!47187 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437887 () Bool)

(declare-fun e!811167 () Bool)

(assert (=> b!1437887 (= e!811167 e!811166)))

(declare-fun res!970653 () Bool)

(assert (=> b!1437887 (=> (not res!970653) (not e!811166))))

(assert (=> b!1437887 (= res!970653 (not e!811169))))

(declare-fun res!970654 () Bool)

(assert (=> b!1437887 (=> (not res!970654) (not e!811169))))

(assert (=> b!1437887 (= res!970654 (validKeyInArray!0 (select (arr!47187 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67645 () Bool)

(assert (=> bm!67645 (= call!67648 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133122 (Cons!33684 (select (arr!47187 a!2862) #b00000000000000000000000000000000) Nil!33685) Nil!33685)))))

(declare-fun d!154703 () Bool)

(declare-fun res!970652 () Bool)

(assert (=> d!154703 (=> res!970652 e!811167)))

(assert (=> d!154703 (= res!970652 (bvsge #b00000000000000000000000000000000 (size!47737 a!2862)))))

(assert (=> d!154703 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33685) e!811167)))

(declare-fun b!1437888 () Bool)

(assert (=> b!1437888 (= e!811168 call!67648)))

(assert (= (and d!154703 (not res!970652)) b!1437887))

(assert (= (and b!1437887 res!970654) b!1437884))

(assert (= (and b!1437887 res!970653) b!1437886))

(assert (= (and b!1437886 c!133122) b!1437885))

(assert (= (and b!1437886 (not c!133122)) b!1437888))

(assert (= (or b!1437885 b!1437888) bm!67645))

(assert (=> b!1437884 m!1327141))

(assert (=> b!1437884 m!1327141))

(declare-fun m!1327153 () Bool)

(assert (=> b!1437884 m!1327153))

(assert (=> b!1437886 m!1327141))

(assert (=> b!1437886 m!1327141))

(assert (=> b!1437886 m!1327149))

(assert (=> b!1437887 m!1327141))

(assert (=> b!1437887 m!1327141))

(assert (=> b!1437887 m!1327149))

(assert (=> bm!67645 m!1327141))

(declare-fun m!1327155 () Bool)

(assert (=> bm!67645 m!1327155))

(assert (=> b!1437826 d!154703))

(declare-fun b!1437943 () Bool)

(declare-fun e!811201 () SeekEntryResult!11439)

(assert (=> b!1437943 (= e!811201 (Intermediate!11439 true (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!811203 () SeekEntryResult!11439)

(declare-fun b!1437944 () Bool)

(assert (=> b!1437944 (= e!811203 (Intermediate!11439 false (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437945 () Bool)

(assert (=> b!1437945 (= e!811201 e!811203)))

(declare-fun c!133142 () Bool)

(declare-fun lt!632428 () (_ BitVec 64))

(assert (=> b!1437945 (= c!133142 (or (= lt!632428 (select (arr!47187 a!2862) j!93)) (= (bvadd lt!632428 lt!632428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437946 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437946 (= e!811203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47187 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437947 () Bool)

(declare-fun e!811200 () Bool)

(declare-fun lt!632429 () SeekEntryResult!11439)

(assert (=> b!1437947 (= e!811200 (bvsge (x!129878 lt!632429) #b01111111111111111111111111111110))))

(declare-fun b!1437948 () Bool)

(assert (=> b!1437948 (and (bvsge (index!48150 lt!632429) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632429) (size!47737 a!2862)))))

(declare-fun res!970674 () Bool)

(assert (=> b!1437948 (= res!970674 (= (select (arr!47187 a!2862) (index!48150 lt!632429)) (select (arr!47187 a!2862) j!93)))))

(declare-fun e!811202 () Bool)

(assert (=> b!1437948 (=> res!970674 e!811202)))

(declare-fun e!811204 () Bool)

(assert (=> b!1437948 (= e!811204 e!811202)))

(declare-fun d!154705 () Bool)

(assert (=> d!154705 e!811200))

(declare-fun c!133141 () Bool)

(get-info :version)

(assert (=> d!154705 (= c!133141 (and ((_ is Intermediate!11439) lt!632429) (undefined!12251 lt!632429)))))

(assert (=> d!154705 (= lt!632429 e!811201)))

(declare-fun c!133143 () Bool)

(assert (=> d!154705 (= c!133143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154705 (= lt!632428 (select (arr!47187 a!2862) (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687)))))

(assert (=> d!154705 (validMask!0 mask!2687)))

(assert (=> d!154705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) (select (arr!47187 a!2862) j!93) a!2862 mask!2687) lt!632429)))

(declare-fun b!1437949 () Bool)

(assert (=> b!1437949 (and (bvsge (index!48150 lt!632429) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632429) (size!47737 a!2862)))))

(assert (=> b!1437949 (= e!811202 (= (select (arr!47187 a!2862) (index!48150 lt!632429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437950 () Bool)

(assert (=> b!1437950 (and (bvsge (index!48150 lt!632429) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632429) (size!47737 a!2862)))))

(declare-fun res!970675 () Bool)

(assert (=> b!1437950 (= res!970675 (= (select (arr!47187 a!2862) (index!48150 lt!632429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437950 (=> res!970675 e!811202)))

(declare-fun b!1437951 () Bool)

(assert (=> b!1437951 (= e!811200 e!811204)))

(declare-fun res!970673 () Bool)

(assert (=> b!1437951 (= res!970673 (and ((_ is Intermediate!11439) lt!632429) (not (undefined!12251 lt!632429)) (bvslt (x!129878 lt!632429) #b01111111111111111111111111111110) (bvsge (x!129878 lt!632429) #b00000000000000000000000000000000) (bvsge (x!129878 lt!632429) #b00000000000000000000000000000000)))))

(assert (=> b!1437951 (=> (not res!970673) (not e!811204))))

(assert (= (and d!154705 c!133143) b!1437943))

(assert (= (and d!154705 (not c!133143)) b!1437945))

(assert (= (and b!1437945 c!133142) b!1437944))

(assert (= (and b!1437945 (not c!133142)) b!1437946))

(assert (= (and d!154705 c!133141) b!1437947))

(assert (= (and d!154705 (not c!133141)) b!1437951))

(assert (= (and b!1437951 res!970673) b!1437948))

(assert (= (and b!1437948 (not res!970674)) b!1437950))

(assert (= (and b!1437950 (not res!970675)) b!1437949))

(assert (=> b!1437946 m!1327091))

(declare-fun m!1327157 () Bool)

(assert (=> b!1437946 m!1327157))

(assert (=> b!1437946 m!1327157))

(assert (=> b!1437946 m!1327089))

(declare-fun m!1327159 () Bool)

(assert (=> b!1437946 m!1327159))

(declare-fun m!1327161 () Bool)

(assert (=> b!1437950 m!1327161))

(assert (=> b!1437948 m!1327161))

(assert (=> b!1437949 m!1327161))

(assert (=> d!154705 m!1327091))

(declare-fun m!1327163 () Bool)

(assert (=> d!154705 m!1327163))

(assert (=> d!154705 m!1327081))

(assert (=> b!1437830 d!154705))

(declare-fun d!154713 () Bool)

(declare-fun lt!632439 () (_ BitVec 32))

(declare-fun lt!632438 () (_ BitVec 32))

(assert (=> d!154713 (= lt!632439 (bvmul (bvxor lt!632438 (bvlshr lt!632438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154713 (= lt!632438 ((_ extract 31 0) (bvand (bvxor (select (arr!47187 a!2862) j!93) (bvlshr (select (arr!47187 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154713 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970676 (let ((h!35027 ((_ extract 31 0) (bvand (bvxor (select (arr!47187 a!2862) j!93) (bvlshr (select (arr!47187 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129883 (bvmul (bvxor h!35027 (bvlshr h!35027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129883 (bvlshr x!129883 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970676 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970676 #b00000000000000000000000000000000))))))

(assert (=> d!154713 (= (toIndex!0 (select (arr!47187 a!2862) j!93) mask!2687) (bvand (bvxor lt!632439 (bvlshr lt!632439 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437830 d!154713))

(declare-fun b!1437970 () Bool)

(declare-fun e!811216 () SeekEntryResult!11439)

(assert (=> b!1437970 (= e!811216 (Intermediate!11439 true index!646 x!665))))

(declare-fun b!1437971 () Bool)

(declare-fun e!811218 () SeekEntryResult!11439)

(assert (=> b!1437971 (= e!811218 (Intermediate!11439 false index!646 x!665))))

(declare-fun b!1437972 () Bool)

(assert (=> b!1437972 (= e!811216 e!811218)))

(declare-fun lt!632440 () (_ BitVec 64))

(declare-fun c!133151 () Bool)

(assert (=> b!1437972 (= c!133151 (or (= lt!632440 (select (arr!47187 a!2862) j!93)) (= (bvadd lt!632440 lt!632440) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437973 () Bool)

(assert (=> b!1437973 (= e!811218 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47187 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437974 () Bool)

(declare-fun e!811215 () Bool)

(declare-fun lt!632441 () SeekEntryResult!11439)

(assert (=> b!1437974 (= e!811215 (bvsge (x!129878 lt!632441) #b01111111111111111111111111111110))))

(declare-fun b!1437975 () Bool)

(assert (=> b!1437975 (and (bvsge (index!48150 lt!632441) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632441) (size!47737 a!2862)))))

(declare-fun res!970686 () Bool)

(assert (=> b!1437975 (= res!970686 (= (select (arr!47187 a!2862) (index!48150 lt!632441)) (select (arr!47187 a!2862) j!93)))))

(declare-fun e!811217 () Bool)

(assert (=> b!1437975 (=> res!970686 e!811217)))

(declare-fun e!811219 () Bool)

(assert (=> b!1437975 (= e!811219 e!811217)))

(declare-fun d!154719 () Bool)

(assert (=> d!154719 e!811215))

(declare-fun c!133150 () Bool)

(assert (=> d!154719 (= c!133150 (and ((_ is Intermediate!11439) lt!632441) (undefined!12251 lt!632441)))))

(assert (=> d!154719 (= lt!632441 e!811216)))

(declare-fun c!133152 () Bool)

(assert (=> d!154719 (= c!133152 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154719 (= lt!632440 (select (arr!47187 a!2862) index!646))))

(assert (=> d!154719 (validMask!0 mask!2687)))

(assert (=> d!154719 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47187 a!2862) j!93) a!2862 mask!2687) lt!632441)))

(declare-fun b!1437976 () Bool)

(assert (=> b!1437976 (and (bvsge (index!48150 lt!632441) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632441) (size!47737 a!2862)))))

(assert (=> b!1437976 (= e!811217 (= (select (arr!47187 a!2862) (index!48150 lt!632441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437977 () Bool)

(assert (=> b!1437977 (and (bvsge (index!48150 lt!632441) #b00000000000000000000000000000000) (bvslt (index!48150 lt!632441) (size!47737 a!2862)))))

(declare-fun res!970687 () Bool)

(assert (=> b!1437977 (= res!970687 (= (select (arr!47187 a!2862) (index!48150 lt!632441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437977 (=> res!970687 e!811217)))

(declare-fun b!1437978 () Bool)

(assert (=> b!1437978 (= e!811215 e!811219)))

(declare-fun res!970685 () Bool)

(assert (=> b!1437978 (= res!970685 (and ((_ is Intermediate!11439) lt!632441) (not (undefined!12251 lt!632441)) (bvslt (x!129878 lt!632441) #b01111111111111111111111111111110) (bvsge (x!129878 lt!632441) #b00000000000000000000000000000000) (bvsge (x!129878 lt!632441) x!665)))))

(assert (=> b!1437978 (=> (not res!970685) (not e!811219))))

(assert (= (and d!154719 c!133152) b!1437970))

(assert (= (and d!154719 (not c!133152)) b!1437972))

(assert (= (and b!1437972 c!133151) b!1437971))

(assert (= (and b!1437972 (not c!133151)) b!1437973))

(assert (= (and d!154719 c!133150) b!1437974))

(assert (= (and d!154719 (not c!133150)) b!1437978))

(assert (= (and b!1437978 res!970685) b!1437975))

(assert (= (and b!1437975 (not res!970686)) b!1437977))

(assert (= (and b!1437977 (not res!970687)) b!1437976))

(declare-fun m!1327181 () Bool)

(assert (=> b!1437973 m!1327181))

(assert (=> b!1437973 m!1327181))

(assert (=> b!1437973 m!1327089))

(declare-fun m!1327183 () Bool)

(assert (=> b!1437973 m!1327183))

(declare-fun m!1327185 () Bool)

(assert (=> b!1437977 m!1327185))

(assert (=> b!1437975 m!1327185))

(assert (=> b!1437976 m!1327185))

(declare-fun m!1327187 () Bool)

(assert (=> d!154719 m!1327187))

(assert (=> d!154719 m!1327081))

(assert (=> b!1437831 d!154719))

(declare-fun d!154721 () Bool)

(assert (=> d!154721 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124224 d!154721))

(declare-fun d!154739 () Bool)

(assert (=> d!154739 (= (array_inv!36215 a!2862) (bvsge (size!47737 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124224 d!154739))

(declare-fun d!154741 () Bool)

(assert (=> d!154741 (= (validKeyInArray!0 (select (arr!47187 a!2862) j!93)) (and (not (= (select (arr!47187 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47187 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437829 d!154741))

(declare-fun d!154743 () Bool)

(declare-fun lt!632468 () (_ BitVec 32))

(declare-fun lt!632467 () (_ BitVec 32))

(assert (=> d!154743 (= lt!632468 (bvmul (bvxor lt!632467 (bvlshr lt!632467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154743 (= lt!632467 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154743 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970676 (let ((h!35027 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129883 (bvmul (bvxor h!35027 (bvlshr h!35027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129883 (bvlshr x!129883 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970676 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970676 #b00000000000000000000000000000000))))))

(assert (=> d!154743 (= (toIndex!0 (select (store (arr!47187 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632468 (bvlshr lt!632468 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437834 d!154743))

(check-sat (not d!154705) (not b!1437884) (not b!1437887) (not b!1437886) (not d!154719) (not b!1437973) (not bm!67645) (not b!1437870) (not bm!67642) (not b!1437946) (not b!1437872))
(check-sat)
