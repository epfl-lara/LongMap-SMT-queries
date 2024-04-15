; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124258 () Bool)

(assert start!124258)

(declare-fun b!1438137 () Bool)

(declare-fun res!970936 () Bool)

(declare-fun e!811252 () Bool)

(assert (=> b!1438137 (=> (not res!970936) (not e!811252))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97762 0))(
  ( (array!97763 (arr!47173 (Array (_ BitVec 32) (_ BitVec 64))) (size!47725 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97762)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11450 0))(
  ( (MissingZero!11450 (index!48192 (_ BitVec 32))) (Found!11450 (index!48193 (_ BitVec 32))) (Intermediate!11450 (undefined!12262 Bool) (index!48194 (_ BitVec 32)) (x!129922 (_ BitVec 32))) (Undefined!11450) (MissingVacant!11450 (index!48195 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97762 (_ BitVec 32)) SeekEntryResult!11450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438137 (= res!970936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)) mask!2687) (Intermediate!11450 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438138 () Bool)

(declare-fun res!970934 () Bool)

(declare-fun e!811253 () Bool)

(assert (=> b!1438138 (=> (not res!970934) (not e!811253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438138 (= res!970934 (validKeyInArray!0 (select (arr!47173 a!2862) i!1006)))))

(declare-fun b!1438139 () Bool)

(declare-fun res!970929 () Bool)

(assert (=> b!1438139 (=> (not res!970929) (not e!811252))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632295 () SeekEntryResult!11450)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438139 (= res!970929 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632295))))

(declare-fun b!1438140 () Bool)

(declare-fun res!970933 () Bool)

(assert (=> b!1438140 (=> (not res!970933) (not e!811253))))

(assert (=> b!1438140 (= res!970933 (validKeyInArray!0 (select (arr!47173 a!2862) j!93)))))

(declare-fun b!1438141 () Bool)

(declare-fun res!970932 () Bool)

(assert (=> b!1438141 (=> (not res!970932) (not e!811253))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438141 (= res!970932 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47725 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47725 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47725 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438142 () Bool)

(assert (=> b!1438142 (= e!811252 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1438143 () Bool)

(assert (=> b!1438143 (= e!811253 e!811252)))

(declare-fun res!970930 () Bool)

(assert (=> b!1438143 (=> (not res!970930) (not e!811252))))

(assert (=> b!1438143 (= res!970930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632295))))

(assert (=> b!1438143 (= lt!632295 (Intermediate!11450 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438144 () Bool)

(declare-fun res!970931 () Bool)

(assert (=> b!1438144 (=> (not res!970931) (not e!811253))))

(assert (=> b!1438144 (= res!970931 (and (= (size!47725 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47725 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47725 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!970935 () Bool)

(assert (=> start!124258 (=> (not res!970935) (not e!811253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124258 (= res!970935 (validMask!0 mask!2687))))

(assert (=> start!124258 e!811253))

(assert (=> start!124258 true))

(declare-fun array_inv!36406 (array!97762) Bool)

(assert (=> start!124258 (array_inv!36406 a!2862)))

(declare-fun b!1438145 () Bool)

(declare-fun res!970928 () Bool)

(assert (=> b!1438145 (=> (not res!970928) (not e!811253))))

(declare-datatypes ((List!33752 0))(
  ( (Nil!33749) (Cons!33748 (h!35092 (_ BitVec 64)) (t!48438 List!33752)) )
))
(declare-fun arrayNoDuplicates!0 (array!97762 (_ BitVec 32) List!33752) Bool)

(assert (=> b!1438145 (= res!970928 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33749))))

(declare-fun b!1438146 () Bool)

(declare-fun res!970927 () Bool)

(assert (=> b!1438146 (=> (not res!970927) (not e!811253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97762 (_ BitVec 32)) Bool)

(assert (=> b!1438146 (= res!970927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124258 res!970935) b!1438144))

(assert (= (and b!1438144 res!970931) b!1438138))

(assert (= (and b!1438138 res!970934) b!1438140))

(assert (= (and b!1438140 res!970933) b!1438146))

(assert (= (and b!1438146 res!970927) b!1438145))

(assert (= (and b!1438145 res!970928) b!1438141))

(assert (= (and b!1438141 res!970932) b!1438143))

(assert (= (and b!1438143 res!970930) b!1438139))

(assert (= (and b!1438139 res!970929) b!1438137))

(assert (= (and b!1438137 res!970936) b!1438142))

(declare-fun m!1326843 () Bool)

(assert (=> b!1438138 m!1326843))

(assert (=> b!1438138 m!1326843))

(declare-fun m!1326845 () Bool)

(assert (=> b!1438138 m!1326845))

(declare-fun m!1326847 () Bool)

(assert (=> b!1438146 m!1326847))

(declare-fun m!1326849 () Bool)

(assert (=> b!1438137 m!1326849))

(declare-fun m!1326851 () Bool)

(assert (=> b!1438137 m!1326851))

(assert (=> b!1438137 m!1326851))

(declare-fun m!1326853 () Bool)

(assert (=> b!1438137 m!1326853))

(assert (=> b!1438137 m!1326853))

(assert (=> b!1438137 m!1326851))

(declare-fun m!1326855 () Bool)

(assert (=> b!1438137 m!1326855))

(declare-fun m!1326857 () Bool)

(assert (=> b!1438143 m!1326857))

(assert (=> b!1438143 m!1326857))

(declare-fun m!1326859 () Bool)

(assert (=> b!1438143 m!1326859))

(assert (=> b!1438143 m!1326859))

(assert (=> b!1438143 m!1326857))

(declare-fun m!1326861 () Bool)

(assert (=> b!1438143 m!1326861))

(declare-fun m!1326863 () Bool)

(assert (=> b!1438145 m!1326863))

(declare-fun m!1326865 () Bool)

(assert (=> start!124258 m!1326865))

(declare-fun m!1326867 () Bool)

(assert (=> start!124258 m!1326867))

(assert (=> b!1438139 m!1326857))

(assert (=> b!1438139 m!1326857))

(declare-fun m!1326869 () Bool)

(assert (=> b!1438139 m!1326869))

(assert (=> b!1438140 m!1326857))

(assert (=> b!1438140 m!1326857))

(declare-fun m!1326871 () Bool)

(assert (=> b!1438140 m!1326871))

(assert (=> b!1438141 m!1326849))

(declare-fun m!1326873 () Bool)

(assert (=> b!1438141 m!1326873))

(check-sat (not b!1438139) (not b!1438138) (not b!1438140) (not b!1438137) (not b!1438145) (not b!1438146) (not b!1438143) (not start!124258))
(check-sat)
(get-model)

(declare-fun b!1438225 () Bool)

(declare-fun e!811286 () SeekEntryResult!11450)

(assert (=> b!1438225 (= e!811286 (Intermediate!11450 false (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154585 () Bool)

(declare-fun e!811287 () Bool)

(assert (=> d!154585 e!811287))

(declare-fun c!133123 () Bool)

(declare-fun lt!632306 () SeekEntryResult!11450)

(get-info :version)

(assert (=> d!154585 (= c!133123 (and ((_ is Intermediate!11450) lt!632306) (undefined!12262 lt!632306)))))

(declare-fun e!811284 () SeekEntryResult!11450)

(assert (=> d!154585 (= lt!632306 e!811284)))

(declare-fun c!133121 () Bool)

(assert (=> d!154585 (= c!133121 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632307 () (_ BitVec 64))

(assert (=> d!154585 (= lt!632307 (select (arr!47173 a!2862) (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687)))))

(assert (=> d!154585 (validMask!0 mask!2687)))

(assert (=> d!154585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632306)))

(declare-fun b!1438226 () Bool)

(assert (=> b!1438226 (= e!811287 (bvsge (x!129922 lt!632306) #b01111111111111111111111111111110))))

(declare-fun b!1438227 () Bool)

(assert (=> b!1438227 (= e!811284 e!811286)))

(declare-fun c!133122 () Bool)

(assert (=> b!1438227 (= c!133122 (or (= lt!632307 (select (arr!47173 a!2862) j!93)) (= (bvadd lt!632307 lt!632307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438228 () Bool)

(assert (=> b!1438228 (= e!811284 (Intermediate!11450 true (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438229 () Bool)

(declare-fun e!811285 () Bool)

(assert (=> b!1438229 (= e!811287 e!811285)))

(declare-fun res!971005 () Bool)

(assert (=> b!1438229 (= res!971005 (and ((_ is Intermediate!11450) lt!632306) (not (undefined!12262 lt!632306)) (bvslt (x!129922 lt!632306) #b01111111111111111111111111111110) (bvsge (x!129922 lt!632306) #b00000000000000000000000000000000) (bvsge (x!129922 lt!632306) #b00000000000000000000000000000000)))))

(assert (=> b!1438229 (=> (not res!971005) (not e!811285))))

(declare-fun b!1438230 () Bool)

(assert (=> b!1438230 (and (bvsge (index!48194 lt!632306) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632306) (size!47725 a!2862)))))

(declare-fun res!971003 () Bool)

(assert (=> b!1438230 (= res!971003 (= (select (arr!47173 a!2862) (index!48194 lt!632306)) (select (arr!47173 a!2862) j!93)))))

(declare-fun e!811283 () Bool)

(assert (=> b!1438230 (=> res!971003 e!811283)))

(assert (=> b!1438230 (= e!811285 e!811283)))

(declare-fun b!1438231 () Bool)

(assert (=> b!1438231 (and (bvsge (index!48194 lt!632306) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632306) (size!47725 a!2862)))))

(assert (=> b!1438231 (= e!811283 (= (select (arr!47173 a!2862) (index!48194 lt!632306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438232 () Bool)

(assert (=> b!1438232 (and (bvsge (index!48194 lt!632306) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632306) (size!47725 a!2862)))))

(declare-fun res!971004 () Bool)

(assert (=> b!1438232 (= res!971004 (= (select (arr!47173 a!2862) (index!48194 lt!632306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438232 (=> res!971004 e!811283)))

(declare-fun b!1438233 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438233 (= e!811286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47173 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154585 c!133121) b!1438228))

(assert (= (and d!154585 (not c!133121)) b!1438227))

(assert (= (and b!1438227 c!133122) b!1438225))

(assert (= (and b!1438227 (not c!133122)) b!1438233))

(assert (= (and d!154585 c!133123) b!1438226))

(assert (= (and d!154585 (not c!133123)) b!1438229))

(assert (= (and b!1438229 res!971005) b!1438230))

(assert (= (and b!1438230 (not res!971003)) b!1438232))

(assert (= (and b!1438232 (not res!971004)) b!1438231))

(assert (=> d!154585 m!1326859))

(declare-fun m!1326939 () Bool)

(assert (=> d!154585 m!1326939))

(assert (=> d!154585 m!1326865))

(declare-fun m!1326941 () Bool)

(assert (=> b!1438230 m!1326941))

(assert (=> b!1438233 m!1326859))

(declare-fun m!1326943 () Bool)

(assert (=> b!1438233 m!1326943))

(assert (=> b!1438233 m!1326943))

(assert (=> b!1438233 m!1326857))

(declare-fun m!1326945 () Bool)

(assert (=> b!1438233 m!1326945))

(assert (=> b!1438232 m!1326941))

(assert (=> b!1438231 m!1326941))

(assert (=> b!1438143 d!154585))

(declare-fun d!154587 () Bool)

(declare-fun lt!632313 () (_ BitVec 32))

(declare-fun lt!632312 () (_ BitVec 32))

(assert (=> d!154587 (= lt!632313 (bvmul (bvxor lt!632312 (bvlshr lt!632312 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154587 (= lt!632312 ((_ extract 31 0) (bvand (bvxor (select (arr!47173 a!2862) j!93) (bvlshr (select (arr!47173 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154587 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971006 (let ((h!35095 ((_ extract 31 0) (bvand (bvxor (select (arr!47173 a!2862) j!93) (bvlshr (select (arr!47173 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129926 (bvmul (bvxor h!35095 (bvlshr h!35095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129926 (bvlshr x!129926 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971006 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971006 #b00000000000000000000000000000000))))))

(assert (=> d!154587 (= (toIndex!0 (select (arr!47173 a!2862) j!93) mask!2687) (bvand (bvxor lt!632313 (bvlshr lt!632313 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438143 d!154587))

(declare-fun d!154589 () Bool)

(assert (=> d!154589 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124258 d!154589))

(declare-fun d!154593 () Bool)

(assert (=> d!154593 (= (array_inv!36406 a!2862) (bvsge (size!47725 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124258 d!154593))

(declare-fun d!154597 () Bool)

(assert (=> d!154597 (= (validKeyInArray!0 (select (arr!47173 a!2862) i!1006)) (and (not (= (select (arr!47173 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47173 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438138 d!154597))

(declare-fun e!811291 () SeekEntryResult!11450)

(declare-fun b!1438234 () Bool)

(assert (=> b!1438234 (= e!811291 (Intermediate!11450 false (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154599 () Bool)

(declare-fun e!811292 () Bool)

(assert (=> d!154599 e!811292))

(declare-fun c!133126 () Bool)

(declare-fun lt!632314 () SeekEntryResult!11450)

(assert (=> d!154599 (= c!133126 (and ((_ is Intermediate!11450) lt!632314) (undefined!12262 lt!632314)))))

(declare-fun e!811289 () SeekEntryResult!11450)

(assert (=> d!154599 (= lt!632314 e!811289)))

(declare-fun c!133124 () Bool)

(assert (=> d!154599 (= c!133124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632315 () (_ BitVec 64))

(assert (=> d!154599 (= lt!632315 (select (arr!47173 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862))) (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687)))))

(assert (=> d!154599 (validMask!0 mask!2687)))

(assert (=> d!154599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)) mask!2687) lt!632314)))

(declare-fun b!1438235 () Bool)

(assert (=> b!1438235 (= e!811292 (bvsge (x!129922 lt!632314) #b01111111111111111111111111111110))))

(declare-fun b!1438236 () Bool)

(assert (=> b!1438236 (= e!811289 e!811291)))

(declare-fun c!133125 () Bool)

(assert (=> b!1438236 (= c!133125 (or (= lt!632315 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632315 lt!632315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438237 () Bool)

(assert (=> b!1438237 (= e!811289 (Intermediate!11450 true (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438238 () Bool)

(declare-fun e!811290 () Bool)

(assert (=> b!1438238 (= e!811292 e!811290)))

(declare-fun res!971009 () Bool)

(assert (=> b!1438238 (= res!971009 (and ((_ is Intermediate!11450) lt!632314) (not (undefined!12262 lt!632314)) (bvslt (x!129922 lt!632314) #b01111111111111111111111111111110) (bvsge (x!129922 lt!632314) #b00000000000000000000000000000000) (bvsge (x!129922 lt!632314) #b00000000000000000000000000000000)))))

(assert (=> b!1438238 (=> (not res!971009) (not e!811290))))

(declare-fun b!1438239 () Bool)

(assert (=> b!1438239 (and (bvsge (index!48194 lt!632314) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632314) (size!47725 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)))))))

(declare-fun res!971007 () Bool)

(assert (=> b!1438239 (= res!971007 (= (select (arr!47173 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862))) (index!48194 lt!632314)) (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(declare-fun e!811288 () Bool)

(assert (=> b!1438239 (=> res!971007 e!811288)))

(assert (=> b!1438239 (= e!811290 e!811288)))

(declare-fun b!1438240 () Bool)

(assert (=> b!1438240 (and (bvsge (index!48194 lt!632314) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632314) (size!47725 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)))))))

(assert (=> b!1438240 (= e!811288 (= (select (arr!47173 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862))) (index!48194 lt!632314)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438241 () Bool)

(assert (=> b!1438241 (and (bvsge (index!48194 lt!632314) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632314) (size!47725 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)))))))

(declare-fun res!971008 () Bool)

(assert (=> b!1438241 (= res!971008 (= (select (arr!47173 (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862))) (index!48194 lt!632314)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438241 (=> res!971008 e!811288)))

(declare-fun b!1438242 () Bool)

(assert (=> b!1438242 (= e!811291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97763 (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47725 a!2862)) mask!2687))))

(assert (= (and d!154599 c!133124) b!1438237))

(assert (= (and d!154599 (not c!133124)) b!1438236))

(assert (= (and b!1438236 c!133125) b!1438234))

(assert (= (and b!1438236 (not c!133125)) b!1438242))

(assert (= (and d!154599 c!133126) b!1438235))

(assert (= (and d!154599 (not c!133126)) b!1438238))

(assert (= (and b!1438238 res!971009) b!1438239))

(assert (= (and b!1438239 (not res!971007)) b!1438241))

(assert (= (and b!1438241 (not res!971008)) b!1438240))

(assert (=> d!154599 m!1326853))

(declare-fun m!1326947 () Bool)

(assert (=> d!154599 m!1326947))

(assert (=> d!154599 m!1326865))

(declare-fun m!1326949 () Bool)

(assert (=> b!1438239 m!1326949))

(assert (=> b!1438242 m!1326853))

(declare-fun m!1326951 () Bool)

(assert (=> b!1438242 m!1326951))

(assert (=> b!1438242 m!1326951))

(assert (=> b!1438242 m!1326851))

(declare-fun m!1326953 () Bool)

(assert (=> b!1438242 m!1326953))

(assert (=> b!1438241 m!1326949))

(assert (=> b!1438240 m!1326949))

(assert (=> b!1438137 d!154599))

(declare-fun d!154603 () Bool)

(declare-fun lt!632317 () (_ BitVec 32))

(declare-fun lt!632316 () (_ BitVec 32))

(assert (=> d!154603 (= lt!632317 (bvmul (bvxor lt!632316 (bvlshr lt!632316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154603 (= lt!632316 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154603 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971006 (let ((h!35095 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129926 (bvmul (bvxor h!35095 (bvlshr h!35095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129926 (bvlshr x!129926 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971006 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971006 #b00000000000000000000000000000000))))))

(assert (=> d!154603 (= (toIndex!0 (select (store (arr!47173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632317 (bvlshr lt!632317 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438137 d!154603))

(declare-fun bm!67631 () Bool)

(declare-fun call!67634 () Bool)

(assert (=> bm!67631 (= call!67634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154607 () Bool)

(declare-fun res!971014 () Bool)

(declare-fun e!811301 () Bool)

(assert (=> d!154607 (=> res!971014 e!811301)))

(assert (=> d!154607 (= res!971014 (bvsge #b00000000000000000000000000000000 (size!47725 a!2862)))))

(assert (=> d!154607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811301)))

(declare-fun b!1438251 () Bool)

(declare-fun e!811299 () Bool)

(assert (=> b!1438251 (= e!811301 e!811299)))

(declare-fun c!133129 () Bool)

(assert (=> b!1438251 (= c!133129 (validKeyInArray!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438252 () Bool)

(declare-fun e!811300 () Bool)

(assert (=> b!1438252 (= e!811300 call!67634)))

(declare-fun b!1438253 () Bool)

(assert (=> b!1438253 (= e!811299 e!811300)))

(declare-fun lt!632325 () (_ BitVec 64))

(assert (=> b!1438253 (= lt!632325 (select (arr!47173 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48405 0))(
  ( (Unit!48406) )
))
(declare-fun lt!632324 () Unit!48405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97762 (_ BitVec 64) (_ BitVec 32)) Unit!48405)

(assert (=> b!1438253 (= lt!632324 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632325 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438253 (arrayContainsKey!0 a!2862 lt!632325 #b00000000000000000000000000000000)))

(declare-fun lt!632326 () Unit!48405)

(assert (=> b!1438253 (= lt!632326 lt!632324)))

(declare-fun res!971015 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97762 (_ BitVec 32)) SeekEntryResult!11450)

(assert (=> b!1438253 (= res!971015 (= (seekEntryOrOpen!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11450 #b00000000000000000000000000000000)))))

(assert (=> b!1438253 (=> (not res!971015) (not e!811300))))

(declare-fun b!1438254 () Bool)

(assert (=> b!1438254 (= e!811299 call!67634)))

(assert (= (and d!154607 (not res!971014)) b!1438251))

(assert (= (and b!1438251 c!133129) b!1438253))

(assert (= (and b!1438251 (not c!133129)) b!1438254))

(assert (= (and b!1438253 res!971015) b!1438252))

(assert (= (or b!1438252 b!1438254) bm!67631))

(declare-fun m!1326955 () Bool)

(assert (=> bm!67631 m!1326955))

(declare-fun m!1326957 () Bool)

(assert (=> b!1438251 m!1326957))

(assert (=> b!1438251 m!1326957))

(declare-fun m!1326959 () Bool)

(assert (=> b!1438251 m!1326959))

(assert (=> b!1438253 m!1326957))

(declare-fun m!1326961 () Bool)

(assert (=> b!1438253 m!1326961))

(declare-fun m!1326963 () Bool)

(assert (=> b!1438253 m!1326963))

(assert (=> b!1438253 m!1326957))

(declare-fun m!1326965 () Bool)

(assert (=> b!1438253 m!1326965))

(assert (=> b!1438146 d!154607))

(declare-fun b!1438255 () Bool)

(declare-fun e!811305 () SeekEntryResult!11450)

(assert (=> b!1438255 (= e!811305 (Intermediate!11450 false index!646 x!665))))

(declare-fun d!154615 () Bool)

(declare-fun e!811306 () Bool)

(assert (=> d!154615 e!811306))

(declare-fun c!133132 () Bool)

(declare-fun lt!632327 () SeekEntryResult!11450)

(assert (=> d!154615 (= c!133132 (and ((_ is Intermediate!11450) lt!632327) (undefined!12262 lt!632327)))))

(declare-fun e!811303 () SeekEntryResult!11450)

(assert (=> d!154615 (= lt!632327 e!811303)))

(declare-fun c!133130 () Bool)

(assert (=> d!154615 (= c!133130 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632328 () (_ BitVec 64))

(assert (=> d!154615 (= lt!632328 (select (arr!47173 a!2862) index!646))))

(assert (=> d!154615 (validMask!0 mask!2687)))

(assert (=> d!154615 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47173 a!2862) j!93) a!2862 mask!2687) lt!632327)))

(declare-fun b!1438256 () Bool)

(assert (=> b!1438256 (= e!811306 (bvsge (x!129922 lt!632327) #b01111111111111111111111111111110))))

(declare-fun b!1438257 () Bool)

(assert (=> b!1438257 (= e!811303 e!811305)))

(declare-fun c!133131 () Bool)

(assert (=> b!1438257 (= c!133131 (or (= lt!632328 (select (arr!47173 a!2862) j!93)) (= (bvadd lt!632328 lt!632328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438258 () Bool)

(assert (=> b!1438258 (= e!811303 (Intermediate!11450 true index!646 x!665))))

(declare-fun b!1438259 () Bool)

(declare-fun e!811304 () Bool)

(assert (=> b!1438259 (= e!811306 e!811304)))

(declare-fun res!971018 () Bool)

(assert (=> b!1438259 (= res!971018 (and ((_ is Intermediate!11450) lt!632327) (not (undefined!12262 lt!632327)) (bvslt (x!129922 lt!632327) #b01111111111111111111111111111110) (bvsge (x!129922 lt!632327) #b00000000000000000000000000000000) (bvsge (x!129922 lt!632327) x!665)))))

(assert (=> b!1438259 (=> (not res!971018) (not e!811304))))

(declare-fun b!1438260 () Bool)

(assert (=> b!1438260 (and (bvsge (index!48194 lt!632327) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632327) (size!47725 a!2862)))))

(declare-fun res!971016 () Bool)

(assert (=> b!1438260 (= res!971016 (= (select (arr!47173 a!2862) (index!48194 lt!632327)) (select (arr!47173 a!2862) j!93)))))

(declare-fun e!811302 () Bool)

(assert (=> b!1438260 (=> res!971016 e!811302)))

(assert (=> b!1438260 (= e!811304 e!811302)))

(declare-fun b!1438261 () Bool)

(assert (=> b!1438261 (and (bvsge (index!48194 lt!632327) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632327) (size!47725 a!2862)))))

(assert (=> b!1438261 (= e!811302 (= (select (arr!47173 a!2862) (index!48194 lt!632327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438262 () Bool)

(assert (=> b!1438262 (and (bvsge (index!48194 lt!632327) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632327) (size!47725 a!2862)))))

(declare-fun res!971017 () Bool)

(assert (=> b!1438262 (= res!971017 (= (select (arr!47173 a!2862) (index!48194 lt!632327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438262 (=> res!971017 e!811302)))

(declare-fun b!1438263 () Bool)

(assert (=> b!1438263 (= e!811305 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47173 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154615 c!133130) b!1438258))

(assert (= (and d!154615 (not c!133130)) b!1438257))

(assert (= (and b!1438257 c!133131) b!1438255))

(assert (= (and b!1438257 (not c!133131)) b!1438263))

(assert (= (and d!154615 c!133132) b!1438256))

(assert (= (and d!154615 (not c!133132)) b!1438259))

(assert (= (and b!1438259 res!971018) b!1438260))

(assert (= (and b!1438260 (not res!971016)) b!1438262))

(assert (= (and b!1438262 (not res!971017)) b!1438261))

(declare-fun m!1326967 () Bool)

(assert (=> d!154615 m!1326967))

(assert (=> d!154615 m!1326865))

(declare-fun m!1326969 () Bool)

(assert (=> b!1438260 m!1326969))

(declare-fun m!1326971 () Bool)

(assert (=> b!1438263 m!1326971))

(assert (=> b!1438263 m!1326971))

(assert (=> b!1438263 m!1326857))

(declare-fun m!1326973 () Bool)

(assert (=> b!1438263 m!1326973))

(assert (=> b!1438262 m!1326969))

(assert (=> b!1438261 m!1326969))

(assert (=> b!1438139 d!154615))

(declare-fun bm!67637 () Bool)

(declare-fun call!67640 () Bool)

(declare-fun c!133138 () Bool)

(assert (=> bm!67637 (= call!67640 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133138 (Cons!33748 (select (arr!47173 a!2862) #b00000000000000000000000000000000) Nil!33749) Nil!33749)))))

(declare-fun b!1438290 () Bool)

(declare-fun e!811329 () Bool)

(declare-fun e!811327 () Bool)

(assert (=> b!1438290 (= e!811329 e!811327)))

(declare-fun res!971035 () Bool)

(assert (=> b!1438290 (=> (not res!971035) (not e!811327))))

(declare-fun e!811328 () Bool)

(assert (=> b!1438290 (= res!971035 (not e!811328))))

(declare-fun res!971034 () Bool)

(assert (=> b!1438290 (=> (not res!971034) (not e!811328))))

(assert (=> b!1438290 (= res!971034 (validKeyInArray!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438291 () Bool)

(declare-fun e!811330 () Bool)

(assert (=> b!1438291 (= e!811327 e!811330)))

(assert (=> b!1438291 (= c!133138 (validKeyInArray!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438292 () Bool)

(declare-fun contains!9854 (List!33752 (_ BitVec 64)) Bool)

(assert (=> b!1438292 (= e!811328 (contains!9854 Nil!33749 (select (arr!47173 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438293 () Bool)

(assert (=> b!1438293 (= e!811330 call!67640)))

(declare-fun d!154619 () Bool)

(declare-fun res!971036 () Bool)

(assert (=> d!154619 (=> res!971036 e!811329)))

(assert (=> d!154619 (= res!971036 (bvsge #b00000000000000000000000000000000 (size!47725 a!2862)))))

(assert (=> d!154619 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33749) e!811329)))

(declare-fun b!1438289 () Bool)

(assert (=> b!1438289 (= e!811330 call!67640)))

(assert (= (and d!154619 (not res!971036)) b!1438290))

(assert (= (and b!1438290 res!971034) b!1438292))

(assert (= (and b!1438290 res!971035) b!1438291))

(assert (= (and b!1438291 c!133138) b!1438293))

(assert (= (and b!1438291 (not c!133138)) b!1438289))

(assert (= (or b!1438293 b!1438289) bm!67637))

(assert (=> bm!67637 m!1326957))

(declare-fun m!1326983 () Bool)

(assert (=> bm!67637 m!1326983))

(assert (=> b!1438290 m!1326957))

(assert (=> b!1438290 m!1326957))

(assert (=> b!1438290 m!1326959))

(assert (=> b!1438291 m!1326957))

(assert (=> b!1438291 m!1326957))

(assert (=> b!1438291 m!1326959))

(assert (=> b!1438292 m!1326957))

(assert (=> b!1438292 m!1326957))

(declare-fun m!1326985 () Bool)

(assert (=> b!1438292 m!1326985))

(assert (=> b!1438145 d!154619))

(declare-fun d!154625 () Bool)

(assert (=> d!154625 (= (validKeyInArray!0 (select (arr!47173 a!2862) j!93)) (and (not (= (select (arr!47173 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47173 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438140 d!154625))

(check-sat (not b!1438251) (not b!1438233) (not b!1438290) (not b!1438291) (not d!154585) (not b!1438253) (not bm!67637) (not d!154615) (not b!1438242) (not d!154599) (not bm!67631) (not b!1438263) (not b!1438292))
(check-sat)
