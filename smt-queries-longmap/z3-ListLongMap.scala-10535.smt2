; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124440 () Bool)

(assert start!124440)

(declare-fun b!1439126 () Bool)

(declare-fun res!971081 () Bool)

(declare-fun e!811966 () Bool)

(assert (=> b!1439126 (=> (not res!971081) (not e!811966))))

(declare-datatypes ((array!97900 0))(
  ( (array!97901 (arr!47239 (Array (_ BitVec 32) (_ BitVec 64))) (size!47790 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97900)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439126 (= res!971081 (validKeyInArray!0 (select (arr!47239 a!2862) j!93)))))

(declare-fun res!971079 () Bool)

(assert (=> start!124440 (=> (not res!971079) (not e!811966))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124440 (= res!971079 (validMask!0 mask!2687))))

(assert (=> start!124440 e!811966))

(assert (=> start!124440 true))

(declare-fun array_inv!36520 (array!97900) Bool)

(assert (=> start!124440 (array_inv!36520 a!2862)))

(declare-fun b!1439127 () Bool)

(declare-fun res!971080 () Bool)

(assert (=> b!1439127 (=> (not res!971080) (not e!811966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97900 (_ BitVec 32)) Bool)

(assert (=> b!1439127 (= res!971080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439128 () Bool)

(declare-fun res!971087 () Bool)

(assert (=> b!1439128 (=> (not res!971087) (not e!811966))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439128 (= res!971087 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47790 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47790 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47790 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439129 () Bool)

(declare-fun e!811967 () Bool)

(declare-fun lt!632871 () (_ BitVec 32))

(assert (=> b!1439129 (= e!811967 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632871 #b00000000000000000000000000000000) (bvsge lt!632871 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439129 (= lt!632871 (toIndex!0 (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439130 () Bool)

(assert (=> b!1439130 (= e!811966 e!811967)))

(declare-fun res!971084 () Bool)

(assert (=> b!1439130 (=> (not res!971084) (not e!811967))))

(declare-datatypes ((SeekEntryResult!11388 0))(
  ( (MissingZero!11388 (index!47944 (_ BitVec 32))) (Found!11388 (index!47945 (_ BitVec 32))) (Intermediate!11388 (undefined!12200 Bool) (index!47946 (_ BitVec 32)) (x!129851 (_ BitVec 32))) (Undefined!11388) (MissingVacant!11388 (index!47947 (_ BitVec 32))) )
))
(declare-fun lt!632872 () SeekEntryResult!11388)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97900 (_ BitVec 32)) SeekEntryResult!11388)

(assert (=> b!1439130 (= res!971084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632872))))

(assert (=> b!1439130 (= lt!632872 (Intermediate!11388 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439131 () Bool)

(declare-fun res!971086 () Bool)

(assert (=> b!1439131 (=> (not res!971086) (not e!811967))))

(assert (=> b!1439131 (= res!971086 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632872))))

(declare-fun b!1439132 () Bool)

(declare-fun res!971085 () Bool)

(assert (=> b!1439132 (=> (not res!971085) (not e!811966))))

(assert (=> b!1439132 (= res!971085 (and (= (size!47790 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47790 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47790 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439133 () Bool)

(declare-fun res!971082 () Bool)

(assert (=> b!1439133 (=> (not res!971082) (not e!811966))))

(assert (=> b!1439133 (= res!971082 (validKeyInArray!0 (select (arr!47239 a!2862) i!1006)))))

(declare-fun b!1439134 () Bool)

(declare-fun res!971083 () Bool)

(assert (=> b!1439134 (=> (not res!971083) (not e!811966))))

(declare-datatypes ((List!33727 0))(
  ( (Nil!33724) (Cons!33723 (h!35075 (_ BitVec 64)) (t!48413 List!33727)) )
))
(declare-fun arrayNoDuplicates!0 (array!97900 (_ BitVec 32) List!33727) Bool)

(assert (=> b!1439134 (= res!971083 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33724))))

(assert (= (and start!124440 res!971079) b!1439132))

(assert (= (and b!1439132 res!971085) b!1439133))

(assert (= (and b!1439133 res!971082) b!1439126))

(assert (= (and b!1439126 res!971081) b!1439127))

(assert (= (and b!1439127 res!971080) b!1439134))

(assert (= (and b!1439134 res!971083) b!1439128))

(assert (= (and b!1439128 res!971087) b!1439130))

(assert (= (and b!1439130 res!971084) b!1439131))

(assert (= (and b!1439131 res!971086) b!1439129))

(declare-fun m!1328491 () Bool)

(assert (=> b!1439130 m!1328491))

(assert (=> b!1439130 m!1328491))

(declare-fun m!1328493 () Bool)

(assert (=> b!1439130 m!1328493))

(assert (=> b!1439130 m!1328493))

(assert (=> b!1439130 m!1328491))

(declare-fun m!1328495 () Bool)

(assert (=> b!1439130 m!1328495))

(declare-fun m!1328497 () Bool)

(assert (=> b!1439127 m!1328497))

(assert (=> b!1439126 m!1328491))

(assert (=> b!1439126 m!1328491))

(declare-fun m!1328499 () Bool)

(assert (=> b!1439126 m!1328499))

(assert (=> b!1439131 m!1328491))

(assert (=> b!1439131 m!1328491))

(declare-fun m!1328501 () Bool)

(assert (=> b!1439131 m!1328501))

(declare-fun m!1328503 () Bool)

(assert (=> b!1439134 m!1328503))

(declare-fun m!1328505 () Bool)

(assert (=> b!1439129 m!1328505))

(declare-fun m!1328507 () Bool)

(assert (=> b!1439129 m!1328507))

(assert (=> b!1439129 m!1328507))

(declare-fun m!1328509 () Bool)

(assert (=> b!1439129 m!1328509))

(declare-fun m!1328511 () Bool)

(assert (=> b!1439133 m!1328511))

(assert (=> b!1439133 m!1328511))

(declare-fun m!1328513 () Bool)

(assert (=> b!1439133 m!1328513))

(declare-fun m!1328515 () Bool)

(assert (=> start!124440 m!1328515))

(declare-fun m!1328517 () Bool)

(assert (=> start!124440 m!1328517))

(assert (=> b!1439128 m!1328505))

(declare-fun m!1328519 () Bool)

(assert (=> b!1439128 m!1328519))

(check-sat (not start!124440) (not b!1439130) (not b!1439134) (not b!1439126) (not b!1439133) (not b!1439131) (not b!1439127) (not b!1439129))
(check-sat)
(get-model)

(declare-fun d!155081 () Bool)

(assert (=> d!155081 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124440 d!155081))

(declare-fun d!155083 () Bool)

(assert (=> d!155083 (= (array_inv!36520 a!2862) (bvsge (size!47790 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124440 d!155083))

(declare-fun d!155085 () Bool)

(declare-fun lt!632890 () (_ BitVec 32))

(declare-fun lt!632889 () (_ BitVec 32))

(assert (=> d!155085 (= lt!632890 (bvmul (bvxor lt!632889 (bvlshr lt!632889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155085 (= lt!632889 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155085 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971142 (let ((h!35078 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129854 (bvmul (bvxor h!35078 (bvlshr h!35078 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129854 (bvlshr x!129854 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971142 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971142 #b00000000000000000000000000000000))))))

(assert (=> d!155085 (= (toIndex!0 (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632890 (bvlshr lt!632890 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1439129 d!155085))

(declare-fun b!1439199 () Bool)

(declare-fun e!811997 () Bool)

(declare-fun call!67716 () Bool)

(assert (=> b!1439199 (= e!811997 call!67716)))

(declare-fun b!1439200 () Bool)

(assert (=> b!1439200 (= e!811997 call!67716)))

(declare-fun d!155087 () Bool)

(declare-fun res!971151 () Bool)

(declare-fun e!811996 () Bool)

(assert (=> d!155087 (=> res!971151 e!811996)))

(assert (=> d!155087 (= res!971151 (bvsge #b00000000000000000000000000000000 (size!47790 a!2862)))))

(assert (=> d!155087 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33724) e!811996)))

(declare-fun b!1439201 () Bool)

(declare-fun e!811995 () Bool)

(declare-fun contains!9933 (List!33727 (_ BitVec 64)) Bool)

(assert (=> b!1439201 (= e!811995 (contains!9933 Nil!33724 (select (arr!47239 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439202 () Bool)

(declare-fun e!811998 () Bool)

(assert (=> b!1439202 (= e!811996 e!811998)))

(declare-fun res!971150 () Bool)

(assert (=> b!1439202 (=> (not res!971150) (not e!811998))))

(assert (=> b!1439202 (= res!971150 (not e!811995))))

(declare-fun res!971149 () Bool)

(assert (=> b!1439202 (=> (not res!971149) (not e!811995))))

(assert (=> b!1439202 (= res!971149 (validKeyInArray!0 (select (arr!47239 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439203 () Bool)

(assert (=> b!1439203 (= e!811998 e!811997)))

(declare-fun c!133540 () Bool)

(assert (=> b!1439203 (= c!133540 (validKeyInArray!0 (select (arr!47239 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67713 () Bool)

(assert (=> bm!67713 (= call!67716 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133540 (Cons!33723 (select (arr!47239 a!2862) #b00000000000000000000000000000000) Nil!33724) Nil!33724)))))

(assert (= (and d!155087 (not res!971151)) b!1439202))

(assert (= (and b!1439202 res!971149) b!1439201))

(assert (= (and b!1439202 res!971150) b!1439203))

(assert (= (and b!1439203 c!133540) b!1439199))

(assert (= (and b!1439203 (not c!133540)) b!1439200))

(assert (= (or b!1439199 b!1439200) bm!67713))

(declare-fun m!1328581 () Bool)

(assert (=> b!1439201 m!1328581))

(assert (=> b!1439201 m!1328581))

(declare-fun m!1328583 () Bool)

(assert (=> b!1439201 m!1328583))

(assert (=> b!1439202 m!1328581))

(assert (=> b!1439202 m!1328581))

(declare-fun m!1328585 () Bool)

(assert (=> b!1439202 m!1328585))

(assert (=> b!1439203 m!1328581))

(assert (=> b!1439203 m!1328581))

(assert (=> b!1439203 m!1328585))

(assert (=> bm!67713 m!1328581))

(declare-fun m!1328587 () Bool)

(assert (=> bm!67713 m!1328587))

(assert (=> b!1439134 d!155087))

(declare-fun d!155089 () Bool)

(assert (=> d!155089 (= (validKeyInArray!0 (select (arr!47239 a!2862) i!1006)) (and (not (= (select (arr!47239 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47239 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1439133 d!155089))

(declare-fun b!1439232 () Bool)

(declare-fun e!812022 () Bool)

(declare-fun e!812023 () Bool)

(assert (=> b!1439232 (= e!812022 e!812023)))

(declare-fun c!133547 () Bool)

(assert (=> b!1439232 (= c!133547 (validKeyInArray!0 (select (arr!47239 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155091 () Bool)

(declare-fun res!971168 () Bool)

(assert (=> d!155091 (=> res!971168 e!812022)))

(assert (=> d!155091 (= res!971168 (bvsge #b00000000000000000000000000000000 (size!47790 a!2862)))))

(assert (=> d!155091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!812022)))

(declare-fun b!1439233 () Bool)

(declare-fun call!67723 () Bool)

(assert (=> b!1439233 (= e!812023 call!67723)))

(declare-fun bm!67720 () Bool)

(assert (=> bm!67720 (= call!67723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1439234 () Bool)

(declare-fun e!812021 () Bool)

(assert (=> b!1439234 (= e!812021 call!67723)))

(declare-fun b!1439235 () Bool)

(assert (=> b!1439235 (= e!812023 e!812021)))

(declare-fun lt!632897 () (_ BitVec 64))

(assert (=> b!1439235 (= lt!632897 (select (arr!47239 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48493 0))(
  ( (Unit!48494) )
))
(declare-fun lt!632898 () Unit!48493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97900 (_ BitVec 64) (_ BitVec 32)) Unit!48493)

(assert (=> b!1439235 (= lt!632898 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632897 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1439235 (arrayContainsKey!0 a!2862 lt!632897 #b00000000000000000000000000000000)))

(declare-fun lt!632899 () Unit!48493)

(assert (=> b!1439235 (= lt!632899 lt!632898)))

(declare-fun res!971169 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97900 (_ BitVec 32)) SeekEntryResult!11388)

(assert (=> b!1439235 (= res!971169 (= (seekEntryOrOpen!0 (select (arr!47239 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11388 #b00000000000000000000000000000000)))))

(assert (=> b!1439235 (=> (not res!971169) (not e!812021))))

(assert (= (and d!155091 (not res!971168)) b!1439232))

(assert (= (and b!1439232 c!133547) b!1439235))

(assert (= (and b!1439232 (not c!133547)) b!1439233))

(assert (= (and b!1439235 res!971169) b!1439234))

(assert (= (or b!1439234 b!1439233) bm!67720))

(assert (=> b!1439232 m!1328581))

(assert (=> b!1439232 m!1328581))

(assert (=> b!1439232 m!1328585))

(declare-fun m!1328589 () Bool)

(assert (=> bm!67720 m!1328589))

(assert (=> b!1439235 m!1328581))

(declare-fun m!1328591 () Bool)

(assert (=> b!1439235 m!1328591))

(declare-fun m!1328593 () Bool)

(assert (=> b!1439235 m!1328593))

(assert (=> b!1439235 m!1328581))

(declare-fun m!1328595 () Bool)

(assert (=> b!1439235 m!1328595))

(assert (=> b!1439127 d!155091))

(declare-fun d!155097 () Bool)

(assert (=> d!155097 (= (validKeyInArray!0 (select (arr!47239 a!2862) j!93)) (and (not (= (select (arr!47239 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47239 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1439126 d!155097))

(declare-fun b!1439294 () Bool)

(declare-fun e!812061 () Bool)

(declare-fun lt!632924 () SeekEntryResult!11388)

(assert (=> b!1439294 (= e!812061 (bvsge (x!129851 lt!632924) #b01111111111111111111111111111110))))

(declare-fun b!1439295 () Bool)

(declare-fun e!812062 () SeekEntryResult!11388)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439295 (= e!812062 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439296 () Bool)

(assert (=> b!1439296 (and (bvsge (index!47946 lt!632924) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632924) (size!47790 a!2862)))))

(declare-fun res!971196 () Bool)

(assert (=> b!1439296 (= res!971196 (= (select (arr!47239 a!2862) (index!47946 lt!632924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!812063 () Bool)

(assert (=> b!1439296 (=> res!971196 e!812063)))

(declare-fun b!1439297 () Bool)

(assert (=> b!1439297 (and (bvsge (index!47946 lt!632924) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632924) (size!47790 a!2862)))))

(declare-fun res!971197 () Bool)

(assert (=> b!1439297 (= res!971197 (= (select (arr!47239 a!2862) (index!47946 lt!632924)) (select (arr!47239 a!2862) j!93)))))

(assert (=> b!1439297 (=> res!971197 e!812063)))

(declare-fun e!812065 () Bool)

(assert (=> b!1439297 (= e!812065 e!812063)))

(declare-fun b!1439298 () Bool)

(assert (=> b!1439298 (and (bvsge (index!47946 lt!632924) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632924) (size!47790 a!2862)))))

(assert (=> b!1439298 (= e!812063 (= (select (arr!47239 a!2862) (index!47946 lt!632924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439299 () Bool)

(declare-fun e!812064 () SeekEntryResult!11388)

(assert (=> b!1439299 (= e!812064 (Intermediate!11388 true index!646 x!665))))

(declare-fun b!1439300 () Bool)

(assert (=> b!1439300 (= e!812064 e!812062)))

(declare-fun c!133567 () Bool)

(declare-fun lt!632923 () (_ BitVec 64))

(assert (=> b!1439300 (= c!133567 (or (= lt!632923 (select (arr!47239 a!2862) j!93)) (= (bvadd lt!632923 lt!632923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439302 () Bool)

(assert (=> b!1439302 (= e!812061 e!812065)))

(declare-fun res!971195 () Bool)

(get-info :version)

(assert (=> b!1439302 (= res!971195 (and ((_ is Intermediate!11388) lt!632924) (not (undefined!12200 lt!632924)) (bvslt (x!129851 lt!632924) #b01111111111111111111111111111110) (bvsge (x!129851 lt!632924) #b00000000000000000000000000000000) (bvsge (x!129851 lt!632924) x!665)))))

(assert (=> b!1439302 (=> (not res!971195) (not e!812065))))

(declare-fun b!1439301 () Bool)

(assert (=> b!1439301 (= e!812062 (Intermediate!11388 false index!646 x!665))))

(declare-fun d!155099 () Bool)

(assert (=> d!155099 e!812061))

(declare-fun c!133566 () Bool)

(assert (=> d!155099 (= c!133566 (and ((_ is Intermediate!11388) lt!632924) (undefined!12200 lt!632924)))))

(assert (=> d!155099 (= lt!632924 e!812064)))

(declare-fun c!133565 () Bool)

(assert (=> d!155099 (= c!133565 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155099 (= lt!632923 (select (arr!47239 a!2862) index!646))))

(assert (=> d!155099 (validMask!0 mask!2687)))

(assert (=> d!155099 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632924)))

(assert (= (and d!155099 c!133565) b!1439299))

(assert (= (and d!155099 (not c!133565)) b!1439300))

(assert (= (and b!1439300 c!133567) b!1439301))

(assert (= (and b!1439300 (not c!133567)) b!1439295))

(assert (= (and d!155099 c!133566) b!1439294))

(assert (= (and d!155099 (not c!133566)) b!1439302))

(assert (= (and b!1439302 res!971195) b!1439297))

(assert (= (and b!1439297 (not res!971197)) b!1439296))

(assert (= (and b!1439296 (not res!971196)) b!1439298))

(declare-fun m!1328621 () Bool)

(assert (=> b!1439298 m!1328621))

(assert (=> b!1439297 m!1328621))

(declare-fun m!1328623 () Bool)

(assert (=> b!1439295 m!1328623))

(assert (=> b!1439295 m!1328623))

(assert (=> b!1439295 m!1328491))

(declare-fun m!1328625 () Bool)

(assert (=> b!1439295 m!1328625))

(declare-fun m!1328627 () Bool)

(assert (=> d!155099 m!1328627))

(assert (=> d!155099 m!1328515))

(assert (=> b!1439296 m!1328621))

(assert (=> b!1439131 d!155099))

(declare-fun b!1439312 () Bool)

(declare-fun e!812071 () Bool)

(declare-fun lt!632928 () SeekEntryResult!11388)

(assert (=> b!1439312 (= e!812071 (bvsge (x!129851 lt!632928) #b01111111111111111111111111111110))))

(declare-fun b!1439313 () Bool)

(declare-fun e!812072 () SeekEntryResult!11388)

(assert (=> b!1439313 (= e!812072 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439314 () Bool)

(assert (=> b!1439314 (and (bvsge (index!47946 lt!632928) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632928) (size!47790 a!2862)))))

(declare-fun res!971202 () Bool)

(assert (=> b!1439314 (= res!971202 (= (select (arr!47239 a!2862) (index!47946 lt!632928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!812073 () Bool)

(assert (=> b!1439314 (=> res!971202 e!812073)))

(declare-fun b!1439315 () Bool)

(assert (=> b!1439315 (and (bvsge (index!47946 lt!632928) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632928) (size!47790 a!2862)))))

(declare-fun res!971203 () Bool)

(assert (=> b!1439315 (= res!971203 (= (select (arr!47239 a!2862) (index!47946 lt!632928)) (select (arr!47239 a!2862) j!93)))))

(assert (=> b!1439315 (=> res!971203 e!812073)))

(declare-fun e!812075 () Bool)

(assert (=> b!1439315 (= e!812075 e!812073)))

(declare-fun b!1439316 () Bool)

(assert (=> b!1439316 (and (bvsge (index!47946 lt!632928) #b00000000000000000000000000000000) (bvslt (index!47946 lt!632928) (size!47790 a!2862)))))

(assert (=> b!1439316 (= e!812073 (= (select (arr!47239 a!2862) (index!47946 lt!632928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439317 () Bool)

(declare-fun e!812074 () SeekEntryResult!11388)

(assert (=> b!1439317 (= e!812074 (Intermediate!11388 true (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439318 () Bool)

(assert (=> b!1439318 (= e!812074 e!812072)))

(declare-fun c!133573 () Bool)

(declare-fun lt!632927 () (_ BitVec 64))

(assert (=> b!1439318 (= c!133573 (or (= lt!632927 (select (arr!47239 a!2862) j!93)) (= (bvadd lt!632927 lt!632927) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439320 () Bool)

(assert (=> b!1439320 (= e!812071 e!812075)))

(declare-fun res!971201 () Bool)

(assert (=> b!1439320 (= res!971201 (and ((_ is Intermediate!11388) lt!632928) (not (undefined!12200 lt!632928)) (bvslt (x!129851 lt!632928) #b01111111111111111111111111111110) (bvsge (x!129851 lt!632928) #b00000000000000000000000000000000) (bvsge (x!129851 lt!632928) #b00000000000000000000000000000000)))))

(assert (=> b!1439320 (=> (not res!971201) (not e!812075))))

(declare-fun b!1439319 () Bool)

(assert (=> b!1439319 (= e!812072 (Intermediate!11388 false (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155109 () Bool)

(assert (=> d!155109 e!812071))

(declare-fun c!133572 () Bool)

(assert (=> d!155109 (= c!133572 (and ((_ is Intermediate!11388) lt!632928) (undefined!12200 lt!632928)))))

(assert (=> d!155109 (= lt!632928 e!812074)))

(declare-fun c!133571 () Bool)

(assert (=> d!155109 (= c!133571 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155109 (= lt!632927 (select (arr!47239 a!2862) (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687)))))

(assert (=> d!155109 (validMask!0 mask!2687)))

(assert (=> d!155109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632928)))

(assert (= (and d!155109 c!133571) b!1439317))

(assert (= (and d!155109 (not c!133571)) b!1439318))

(assert (= (and b!1439318 c!133573) b!1439319))

(assert (= (and b!1439318 (not c!133573)) b!1439313))

(assert (= (and d!155109 c!133572) b!1439312))

(assert (= (and d!155109 (not c!133572)) b!1439320))

(assert (= (and b!1439320 res!971201) b!1439315))

(assert (= (and b!1439315 (not res!971203)) b!1439314))

(assert (= (and b!1439314 (not res!971202)) b!1439316))

(declare-fun m!1328637 () Bool)

(assert (=> b!1439316 m!1328637))

(assert (=> b!1439315 m!1328637))

(assert (=> b!1439313 m!1328493))

(declare-fun m!1328639 () Bool)

(assert (=> b!1439313 m!1328639))

(assert (=> b!1439313 m!1328639))

(assert (=> b!1439313 m!1328491))

(declare-fun m!1328641 () Bool)

(assert (=> b!1439313 m!1328641))

(assert (=> d!155109 m!1328493))

(declare-fun m!1328643 () Bool)

(assert (=> d!155109 m!1328643))

(assert (=> d!155109 m!1328515))

(assert (=> b!1439314 m!1328637))

(assert (=> b!1439130 d!155109))

(declare-fun d!155113 () Bool)

(declare-fun lt!632930 () (_ BitVec 32))

(declare-fun lt!632929 () (_ BitVec 32))

(assert (=> d!155113 (= lt!632930 (bvmul (bvxor lt!632929 (bvlshr lt!632929 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155113 (= lt!632929 ((_ extract 31 0) (bvand (bvxor (select (arr!47239 a!2862) j!93) (bvlshr (select (arr!47239 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155113 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971142 (let ((h!35078 ((_ extract 31 0) (bvand (bvxor (select (arr!47239 a!2862) j!93) (bvlshr (select (arr!47239 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129854 (bvmul (bvxor h!35078 (bvlshr h!35078 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129854 (bvlshr x!129854 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971142 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971142 #b00000000000000000000000000000000))))))

(assert (=> d!155113 (= (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (bvand (bvxor lt!632930 (bvlshr lt!632930 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1439130 d!155113))

(check-sat (not d!155109) (not b!1439235) (not b!1439201) (not b!1439313) (not bm!67713) (not b!1439203) (not b!1439202) (not b!1439295) (not bm!67720) (not b!1439232) (not d!155099))
(check-sat)
