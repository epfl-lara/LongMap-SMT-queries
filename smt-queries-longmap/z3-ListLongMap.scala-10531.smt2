; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124126 () Bool)

(assert start!124126)

(declare-fun res!970093 () Bool)

(declare-fun e!810782 () Bool)

(assert (=> start!124126 (=> (not res!970093) (not e!810782))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124126 (= res!970093 (validMask!0 mask!2687))))

(assert (=> start!124126 e!810782))

(assert (=> start!124126 true))

(declare-datatypes ((array!97708 0))(
  ( (array!97709 (arr!47149 (Array (_ BitVec 32) (_ BitVec 64))) (size!47701 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97708)

(declare-fun array_inv!36382 (array!97708) Bool)

(assert (=> start!124126 (array_inv!36382 a!2862)))

(declare-fun b!1437091 () Bool)

(declare-fun res!970091 () Bool)

(assert (=> b!1437091 (=> (not res!970091) (not e!810782))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437091 (= res!970091 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47701 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47701 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47701 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437092 () Bool)

(declare-fun e!810783 () Bool)

(assert (=> b!1437092 (= e!810783 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1437093 () Bool)

(declare-fun res!970099 () Bool)

(assert (=> b!1437093 (=> (not res!970099) (not e!810782))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437093 (= res!970099 (validKeyInArray!0 (select (arr!47149 a!2862) j!93)))))

(declare-fun b!1437094 () Bool)

(declare-fun res!970097 () Bool)

(assert (=> b!1437094 (=> (not res!970097) (not e!810782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97708 (_ BitVec 32)) Bool)

(assert (=> b!1437094 (= res!970097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437095 () Bool)

(declare-fun res!970095 () Bool)

(assert (=> b!1437095 (=> (not res!970095) (not e!810782))))

(assert (=> b!1437095 (= res!970095 (validKeyInArray!0 (select (arr!47149 a!2862) i!1006)))))

(declare-fun b!1437096 () Bool)

(declare-fun res!970098 () Bool)

(assert (=> b!1437096 (=> (not res!970098) (not e!810783))))

(declare-datatypes ((SeekEntryResult!11426 0))(
  ( (MissingZero!11426 (index!48096 (_ BitVec 32))) (Found!11426 (index!48097 (_ BitVec 32))) (Intermediate!11426 (undefined!12238 Bool) (index!48098 (_ BitVec 32)) (x!129822 (_ BitVec 32))) (Undefined!11426) (MissingVacant!11426 (index!48099 (_ BitVec 32))) )
))
(declare-fun lt!632025 () SeekEntryResult!11426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97708 (_ BitVec 32)) SeekEntryResult!11426)

(assert (=> b!1437096 (= res!970098 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47149 a!2862) j!93) a!2862 mask!2687) lt!632025))))

(declare-fun b!1437097 () Bool)

(assert (=> b!1437097 (= e!810782 e!810783)))

(declare-fun res!970092 () Bool)

(assert (=> b!1437097 (=> (not res!970092) (not e!810783))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437097 (= res!970092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) (select (arr!47149 a!2862) j!93) a!2862 mask!2687) lt!632025))))

(assert (=> b!1437097 (= lt!632025 (Intermediate!11426 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437098 () Bool)

(declare-fun res!970094 () Bool)

(assert (=> b!1437098 (=> (not res!970094) (not e!810782))))

(assert (=> b!1437098 (= res!970094 (and (= (size!47701 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47701 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47701 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437099 () Bool)

(declare-fun res!970096 () Bool)

(assert (=> b!1437099 (=> (not res!970096) (not e!810782))))

(declare-datatypes ((List!33728 0))(
  ( (Nil!33725) (Cons!33724 (h!35062 (_ BitVec 64)) (t!48414 List!33728)) )
))
(declare-fun arrayNoDuplicates!0 (array!97708 (_ BitVec 32) List!33728) Bool)

(assert (=> b!1437099 (= res!970096 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33725))))

(assert (= (and start!124126 res!970093) b!1437098))

(assert (= (and b!1437098 res!970094) b!1437095))

(assert (= (and b!1437095 res!970095) b!1437093))

(assert (= (and b!1437093 res!970099) b!1437094))

(assert (= (and b!1437094 res!970097) b!1437099))

(assert (= (and b!1437099 res!970096) b!1437091))

(assert (= (and b!1437091 res!970091) b!1437097))

(assert (= (and b!1437097 res!970092) b!1437096))

(assert (= (and b!1437096 res!970098) b!1437092))

(declare-fun m!1325931 () Bool)

(assert (=> b!1437093 m!1325931))

(assert (=> b!1437093 m!1325931))

(declare-fun m!1325933 () Bool)

(assert (=> b!1437093 m!1325933))

(assert (=> b!1437096 m!1325931))

(assert (=> b!1437096 m!1325931))

(declare-fun m!1325935 () Bool)

(assert (=> b!1437096 m!1325935))

(declare-fun m!1325937 () Bool)

(assert (=> start!124126 m!1325937))

(declare-fun m!1325939 () Bool)

(assert (=> start!124126 m!1325939))

(declare-fun m!1325941 () Bool)

(assert (=> b!1437095 m!1325941))

(assert (=> b!1437095 m!1325941))

(declare-fun m!1325943 () Bool)

(assert (=> b!1437095 m!1325943))

(declare-fun m!1325945 () Bool)

(assert (=> b!1437094 m!1325945))

(declare-fun m!1325947 () Bool)

(assert (=> b!1437099 m!1325947))

(assert (=> b!1437097 m!1325931))

(assert (=> b!1437097 m!1325931))

(declare-fun m!1325949 () Bool)

(assert (=> b!1437097 m!1325949))

(assert (=> b!1437097 m!1325949))

(assert (=> b!1437097 m!1325931))

(declare-fun m!1325951 () Bool)

(assert (=> b!1437097 m!1325951))

(declare-fun m!1325953 () Bool)

(assert (=> b!1437091 m!1325953))

(declare-fun m!1325955 () Bool)

(assert (=> b!1437091 m!1325955))

(check-sat (not b!1437096) (not b!1437097) (not b!1437094) (not b!1437099) (not b!1437093) (not b!1437095) (not start!124126))
(check-sat)
(get-model)

(declare-fun d!154455 () Bool)

(assert (=> d!154455 (= (validKeyInArray!0 (select (arr!47149 a!2862) j!93)) (and (not (= (select (arr!47149 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47149 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437093 d!154455))

(declare-fun b!1437162 () Bool)

(declare-fun e!810808 () Bool)

(declare-fun e!810810 () Bool)

(assert (=> b!1437162 (= e!810808 e!810810)))

(declare-fun lt!632038 () (_ BitVec 64))

(assert (=> b!1437162 (= lt!632038 (select (arr!47149 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48397 0))(
  ( (Unit!48398) )
))
(declare-fun lt!632040 () Unit!48397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97708 (_ BitVec 64) (_ BitVec 32)) Unit!48397)

(assert (=> b!1437162 (= lt!632040 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632038 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437162 (arrayContainsKey!0 a!2862 lt!632038 #b00000000000000000000000000000000)))

(declare-fun lt!632039 () Unit!48397)

(assert (=> b!1437162 (= lt!632039 lt!632040)))

(declare-fun res!970159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97708 (_ BitVec 32)) SeekEntryResult!11426)

(assert (=> b!1437162 (= res!970159 (= (seekEntryOrOpen!0 (select (arr!47149 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11426 #b00000000000000000000000000000000)))))

(assert (=> b!1437162 (=> (not res!970159) (not e!810810))))

(declare-fun d!154457 () Bool)

(declare-fun res!970158 () Bool)

(declare-fun e!810809 () Bool)

(assert (=> d!154457 (=> res!970158 e!810809)))

(assert (=> d!154457 (= res!970158 (bvsge #b00000000000000000000000000000000 (size!47701 a!2862)))))

(assert (=> d!154457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810809)))

(declare-fun b!1437163 () Bool)

(assert (=> b!1437163 (= e!810809 e!810808)))

(declare-fun c!133009 () Bool)

(assert (=> b!1437163 (= c!133009 (validKeyInArray!0 (select (arr!47149 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67595 () Bool)

(declare-fun call!67598 () Bool)

(assert (=> bm!67595 (= call!67598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1437164 () Bool)

(assert (=> b!1437164 (= e!810808 call!67598)))

(declare-fun b!1437165 () Bool)

(assert (=> b!1437165 (= e!810810 call!67598)))

(assert (= (and d!154457 (not res!970158)) b!1437163))

(assert (= (and b!1437163 c!133009) b!1437162))

(assert (= (and b!1437163 (not c!133009)) b!1437164))

(assert (= (and b!1437162 res!970159) b!1437165))

(assert (= (or b!1437165 b!1437164) bm!67595))

(declare-fun m!1326009 () Bool)

(assert (=> b!1437162 m!1326009))

(declare-fun m!1326011 () Bool)

(assert (=> b!1437162 m!1326011))

(declare-fun m!1326013 () Bool)

(assert (=> b!1437162 m!1326013))

(assert (=> b!1437162 m!1326009))

(declare-fun m!1326015 () Bool)

(assert (=> b!1437162 m!1326015))

(assert (=> b!1437163 m!1326009))

(assert (=> b!1437163 m!1326009))

(declare-fun m!1326017 () Bool)

(assert (=> b!1437163 m!1326017))

(declare-fun m!1326019 () Bool)

(assert (=> bm!67595 m!1326019))

(assert (=> b!1437094 d!154457))

(declare-fun d!154459 () Bool)

(declare-fun res!970167 () Bool)

(declare-fun e!810819 () Bool)

(assert (=> d!154459 (=> res!970167 e!810819)))

(assert (=> d!154459 (= res!970167 (bvsge #b00000000000000000000000000000000 (size!47701 a!2862)))))

(assert (=> d!154459 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33725) e!810819)))

(declare-fun b!1437176 () Bool)

(declare-fun e!810822 () Bool)

(declare-fun call!67601 () Bool)

(assert (=> b!1437176 (= e!810822 call!67601)))

(declare-fun b!1437177 () Bool)

(declare-fun e!810821 () Bool)

(declare-fun contains!9848 (List!33728 (_ BitVec 64)) Bool)

(assert (=> b!1437177 (= e!810821 (contains!9848 Nil!33725 (select (arr!47149 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437178 () Bool)

(declare-fun e!810820 () Bool)

(assert (=> b!1437178 (= e!810820 e!810822)))

(declare-fun c!133012 () Bool)

(assert (=> b!1437178 (= c!133012 (validKeyInArray!0 (select (arr!47149 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67598 () Bool)

(assert (=> bm!67598 (= call!67601 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133012 (Cons!33724 (select (arr!47149 a!2862) #b00000000000000000000000000000000) Nil!33725) Nil!33725)))))

(declare-fun b!1437179 () Bool)

(assert (=> b!1437179 (= e!810822 call!67601)))

(declare-fun b!1437180 () Bool)

(assert (=> b!1437180 (= e!810819 e!810820)))

(declare-fun res!970168 () Bool)

(assert (=> b!1437180 (=> (not res!970168) (not e!810820))))

(assert (=> b!1437180 (= res!970168 (not e!810821))))

(declare-fun res!970166 () Bool)

(assert (=> b!1437180 (=> (not res!970166) (not e!810821))))

(assert (=> b!1437180 (= res!970166 (validKeyInArray!0 (select (arr!47149 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154459 (not res!970167)) b!1437180))

(assert (= (and b!1437180 res!970166) b!1437177))

(assert (= (and b!1437180 res!970168) b!1437178))

(assert (= (and b!1437178 c!133012) b!1437176))

(assert (= (and b!1437178 (not c!133012)) b!1437179))

(assert (= (or b!1437176 b!1437179) bm!67598))

(assert (=> b!1437177 m!1326009))

(assert (=> b!1437177 m!1326009))

(declare-fun m!1326021 () Bool)

(assert (=> b!1437177 m!1326021))

(assert (=> b!1437178 m!1326009))

(assert (=> b!1437178 m!1326009))

(assert (=> b!1437178 m!1326017))

(assert (=> bm!67598 m!1326009))

(declare-fun m!1326023 () Bool)

(assert (=> bm!67598 m!1326023))

(assert (=> b!1437180 m!1326009))

(assert (=> b!1437180 m!1326009))

(assert (=> b!1437180 m!1326017))

(assert (=> b!1437099 d!154459))

(declare-fun d!154461 () Bool)

(assert (=> d!154461 (= (validKeyInArray!0 (select (arr!47149 a!2862) i!1006)) (and (not (= (select (arr!47149 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47149 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437095 d!154461))

(declare-fun b!1437222 () Bool)

(declare-fun e!810851 () Bool)

(declare-fun e!810852 () Bool)

(assert (=> b!1437222 (= e!810851 e!810852)))

(declare-fun res!970185 () Bool)

(declare-fun lt!632049 () SeekEntryResult!11426)

(get-info :version)

(assert (=> b!1437222 (= res!970185 (and ((_ is Intermediate!11426) lt!632049) (not (undefined!12238 lt!632049)) (bvslt (x!129822 lt!632049) #b01111111111111111111111111111110) (bvsge (x!129822 lt!632049) #b00000000000000000000000000000000) (bvsge (x!129822 lt!632049) x!665)))))

(assert (=> b!1437222 (=> (not res!970185) (not e!810852))))

(declare-fun b!1437223 () Bool)

(assert (=> b!1437223 (and (bvsge (index!48098 lt!632049) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632049) (size!47701 a!2862)))))

(declare-fun res!970186 () Bool)

(assert (=> b!1437223 (= res!970186 (= (select (arr!47149 a!2862) (index!48098 lt!632049)) (select (arr!47149 a!2862) j!93)))))

(declare-fun e!810849 () Bool)

(assert (=> b!1437223 (=> res!970186 e!810849)))

(assert (=> b!1437223 (= e!810852 e!810849)))

(declare-fun b!1437224 () Bool)

(assert (=> b!1437224 (and (bvsge (index!48098 lt!632049) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632049) (size!47701 a!2862)))))

(declare-fun res!970184 () Bool)

(assert (=> b!1437224 (= res!970184 (= (select (arr!47149 a!2862) (index!48098 lt!632049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437224 (=> res!970184 e!810849)))

(declare-fun b!1437225 () Bool)

(declare-fun e!810850 () SeekEntryResult!11426)

(declare-fun e!810853 () SeekEntryResult!11426)

(assert (=> b!1437225 (= e!810850 e!810853)))

(declare-fun c!133026 () Bool)

(declare-fun lt!632050 () (_ BitVec 64))

(assert (=> b!1437225 (= c!133026 (or (= lt!632050 (select (arr!47149 a!2862) j!93)) (= (bvadd lt!632050 lt!632050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!154463 () Bool)

(assert (=> d!154463 e!810851))

(declare-fun c!133028 () Bool)

(assert (=> d!154463 (= c!133028 (and ((_ is Intermediate!11426) lt!632049) (undefined!12238 lt!632049)))))

(assert (=> d!154463 (= lt!632049 e!810850)))

(declare-fun c!133027 () Bool)

(assert (=> d!154463 (= c!133027 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154463 (= lt!632050 (select (arr!47149 a!2862) index!646))))

(assert (=> d!154463 (validMask!0 mask!2687)))

(assert (=> d!154463 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47149 a!2862) j!93) a!2862 mask!2687) lt!632049)))

(declare-fun b!1437226 () Bool)

(assert (=> b!1437226 (and (bvsge (index!48098 lt!632049) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632049) (size!47701 a!2862)))))

(assert (=> b!1437226 (= e!810849 (= (select (arr!47149 a!2862) (index!48098 lt!632049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437227 () Bool)

(assert (=> b!1437227 (= e!810851 (bvsge (x!129822 lt!632049) #b01111111111111111111111111111110))))

(declare-fun b!1437228 () Bool)

(assert (=> b!1437228 (= e!810853 (Intermediate!11426 false index!646 x!665))))

(declare-fun b!1437229 () Bool)

(assert (=> b!1437229 (= e!810850 (Intermediate!11426 true index!646 x!665))))

(declare-fun b!1437230 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437230 (= e!810853 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47149 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154463 c!133027) b!1437229))

(assert (= (and d!154463 (not c!133027)) b!1437225))

(assert (= (and b!1437225 c!133026) b!1437228))

(assert (= (and b!1437225 (not c!133026)) b!1437230))

(assert (= (and d!154463 c!133028) b!1437227))

(assert (= (and d!154463 (not c!133028)) b!1437222))

(assert (= (and b!1437222 res!970185) b!1437223))

(assert (= (and b!1437223 (not res!970186)) b!1437224))

(assert (= (and b!1437224 (not res!970184)) b!1437226))

(declare-fun m!1326033 () Bool)

(assert (=> b!1437230 m!1326033))

(assert (=> b!1437230 m!1326033))

(assert (=> b!1437230 m!1325931))

(declare-fun m!1326035 () Bool)

(assert (=> b!1437230 m!1326035))

(declare-fun m!1326037 () Bool)

(assert (=> b!1437224 m!1326037))

(assert (=> b!1437223 m!1326037))

(assert (=> b!1437226 m!1326037))

(declare-fun m!1326039 () Bool)

(assert (=> d!154463 m!1326039))

(assert (=> d!154463 m!1325937))

(assert (=> b!1437096 d!154463))

(declare-fun d!154477 () Bool)

(assert (=> d!154477 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124126 d!154477))

(declare-fun d!154481 () Bool)

(assert (=> d!154481 (= (array_inv!36382 a!2862) (bvsge (size!47701 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124126 d!154481))

(declare-fun b!1437268 () Bool)

(declare-fun e!810877 () Bool)

(declare-fun e!810878 () Bool)

(assert (=> b!1437268 (= e!810877 e!810878)))

(declare-fun res!970203 () Bool)

(declare-fun lt!632057 () SeekEntryResult!11426)

(assert (=> b!1437268 (= res!970203 (and ((_ is Intermediate!11426) lt!632057) (not (undefined!12238 lt!632057)) (bvslt (x!129822 lt!632057) #b01111111111111111111111111111110) (bvsge (x!129822 lt!632057) #b00000000000000000000000000000000) (bvsge (x!129822 lt!632057) #b00000000000000000000000000000000)))))

(assert (=> b!1437268 (=> (not res!970203) (not e!810878))))

(declare-fun b!1437269 () Bool)

(assert (=> b!1437269 (and (bvsge (index!48098 lt!632057) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632057) (size!47701 a!2862)))))

(declare-fun res!970204 () Bool)

(assert (=> b!1437269 (= res!970204 (= (select (arr!47149 a!2862) (index!48098 lt!632057)) (select (arr!47149 a!2862) j!93)))))

(declare-fun e!810875 () Bool)

(assert (=> b!1437269 (=> res!970204 e!810875)))

(assert (=> b!1437269 (= e!810878 e!810875)))

(declare-fun b!1437270 () Bool)

(assert (=> b!1437270 (and (bvsge (index!48098 lt!632057) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632057) (size!47701 a!2862)))))

(declare-fun res!970202 () Bool)

(assert (=> b!1437270 (= res!970202 (= (select (arr!47149 a!2862) (index!48098 lt!632057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437270 (=> res!970202 e!810875)))

(declare-fun b!1437271 () Bool)

(declare-fun e!810876 () SeekEntryResult!11426)

(declare-fun e!810879 () SeekEntryResult!11426)

(assert (=> b!1437271 (= e!810876 e!810879)))

(declare-fun lt!632058 () (_ BitVec 64))

(declare-fun c!133040 () Bool)

(assert (=> b!1437271 (= c!133040 (or (= lt!632058 (select (arr!47149 a!2862) j!93)) (= (bvadd lt!632058 lt!632058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!154483 () Bool)

(assert (=> d!154483 e!810877))

(declare-fun c!133042 () Bool)

(assert (=> d!154483 (= c!133042 (and ((_ is Intermediate!11426) lt!632057) (undefined!12238 lt!632057)))))

(assert (=> d!154483 (= lt!632057 e!810876)))

(declare-fun c!133041 () Bool)

(assert (=> d!154483 (= c!133041 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154483 (= lt!632058 (select (arr!47149 a!2862) (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687)))))

(assert (=> d!154483 (validMask!0 mask!2687)))

(assert (=> d!154483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) (select (arr!47149 a!2862) j!93) a!2862 mask!2687) lt!632057)))

(declare-fun b!1437272 () Bool)

(assert (=> b!1437272 (and (bvsge (index!48098 lt!632057) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632057) (size!47701 a!2862)))))

(assert (=> b!1437272 (= e!810875 (= (select (arr!47149 a!2862) (index!48098 lt!632057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437273 () Bool)

(assert (=> b!1437273 (= e!810877 (bvsge (x!129822 lt!632057) #b01111111111111111111111111111110))))

(declare-fun b!1437274 () Bool)

(assert (=> b!1437274 (= e!810879 (Intermediate!11426 false (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437275 () Bool)

(assert (=> b!1437275 (= e!810876 (Intermediate!11426 true (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437276 () Bool)

(assert (=> b!1437276 (= e!810879 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47149 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154483 c!133041) b!1437275))

(assert (= (and d!154483 (not c!133041)) b!1437271))

(assert (= (and b!1437271 c!133040) b!1437274))

(assert (= (and b!1437271 (not c!133040)) b!1437276))

(assert (= (and d!154483 c!133042) b!1437273))

(assert (= (and d!154483 (not c!133042)) b!1437268))

(assert (= (and b!1437268 res!970203) b!1437269))

(assert (= (and b!1437269 (not res!970204)) b!1437270))

(assert (= (and b!1437270 (not res!970202)) b!1437272))

(assert (=> b!1437276 m!1325949))

(declare-fun m!1326049 () Bool)

(assert (=> b!1437276 m!1326049))

(assert (=> b!1437276 m!1326049))

(assert (=> b!1437276 m!1325931))

(declare-fun m!1326051 () Bool)

(assert (=> b!1437276 m!1326051))

(declare-fun m!1326053 () Bool)

(assert (=> b!1437270 m!1326053))

(assert (=> b!1437269 m!1326053))

(assert (=> b!1437272 m!1326053))

(assert (=> d!154483 m!1325949))

(declare-fun m!1326055 () Bool)

(assert (=> d!154483 m!1326055))

(assert (=> d!154483 m!1325937))

(assert (=> b!1437097 d!154483))

(declare-fun d!154485 () Bool)

(declare-fun lt!632068 () (_ BitVec 32))

(declare-fun lt!632067 () (_ BitVec 32))

(assert (=> d!154485 (= lt!632068 (bvmul (bvxor lt!632067 (bvlshr lt!632067 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154485 (= lt!632067 ((_ extract 31 0) (bvand (bvxor (select (arr!47149 a!2862) j!93) (bvlshr (select (arr!47149 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154485 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970205 (let ((h!35065 ((_ extract 31 0) (bvand (bvxor (select (arr!47149 a!2862) j!93) (bvlshr (select (arr!47149 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129828 (bvmul (bvxor h!35065 (bvlshr h!35065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129828 (bvlshr x!129828 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970205 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970205 #b00000000000000000000000000000000))))))

(assert (=> d!154485 (= (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687) (bvand (bvxor lt!632068 (bvlshr lt!632068 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437097 d!154485))

(check-sat (not b!1437230) (not b!1437163) (not d!154463) (not bm!67598) (not d!154483) (not b!1437177) (not b!1437162) (not bm!67595) (not b!1437276) (not b!1437178) (not b!1437180))
(check-sat)
