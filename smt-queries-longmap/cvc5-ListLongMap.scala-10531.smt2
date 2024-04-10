; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124156 () Bool)

(assert start!124156)

(declare-fun b!1437286 () Bool)

(declare-fun e!810899 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1437286 (= e!810899 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1437287 () Bool)

(declare-fun e!810897 () Bool)

(assert (=> b!1437287 (= e!810897 e!810899)))

(declare-fun res!970174 () Bool)

(assert (=> b!1437287 (=> (not res!970174) (not e!810899))))

(declare-datatypes ((SeekEntryResult!11426 0))(
  ( (MissingZero!11426 (index!48096 (_ BitVec 32))) (Found!11426 (index!48097 (_ BitVec 32))) (Intermediate!11426 (undefined!12238 Bool) (index!48098 (_ BitVec 32)) (x!129827 (_ BitVec 32))) (Undefined!11426) (MissingVacant!11426 (index!48099 (_ BitVec 32))) )
))
(declare-fun lt!632259 () SeekEntryResult!11426)

(declare-datatypes ((array!97760 0))(
  ( (array!97761 (arr!47174 (Array (_ BitVec 32) (_ BitVec 64))) (size!47724 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97760)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97760 (_ BitVec 32)) SeekEntryResult!11426)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437287 (= res!970174 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) (select (arr!47174 a!2862) j!93) a!2862 mask!2687) lt!632259))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437287 (= lt!632259 (Intermediate!11426 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437288 () Bool)

(declare-fun res!970172 () Bool)

(assert (=> b!1437288 (=> (not res!970172) (not e!810897))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437288 (= res!970172 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47724 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47724 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47724 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47174 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970171 () Bool)

(assert (=> start!124156 (=> (not res!970171) (not e!810897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124156 (= res!970171 (validMask!0 mask!2687))))

(assert (=> start!124156 e!810897))

(assert (=> start!124156 true))

(declare-fun array_inv!36202 (array!97760) Bool)

(assert (=> start!124156 (array_inv!36202 a!2862)))

(declare-fun b!1437289 () Bool)

(declare-fun res!970169 () Bool)

(assert (=> b!1437289 (=> (not res!970169) (not e!810897))))

(declare-datatypes ((List!33675 0))(
  ( (Nil!33672) (Cons!33671 (h!35009 (_ BitVec 64)) (t!48369 List!33675)) )
))
(declare-fun arrayNoDuplicates!0 (array!97760 (_ BitVec 32) List!33675) Bool)

(assert (=> b!1437289 (= res!970169 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33672))))

(declare-fun b!1437290 () Bool)

(declare-fun res!970170 () Bool)

(assert (=> b!1437290 (=> (not res!970170) (not e!810899))))

(assert (=> b!1437290 (= res!970170 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47174 a!2862) j!93) a!2862 mask!2687) lt!632259))))

(declare-fun b!1437291 () Bool)

(declare-fun res!970173 () Bool)

(assert (=> b!1437291 (=> (not res!970173) (not e!810897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437291 (= res!970173 (validKeyInArray!0 (select (arr!47174 a!2862) i!1006)))))

(declare-fun b!1437292 () Bool)

(declare-fun res!970175 () Bool)

(assert (=> b!1437292 (=> (not res!970175) (not e!810897))))

(assert (=> b!1437292 (= res!970175 (and (= (size!47724 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47724 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47724 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437293 () Bool)

(declare-fun res!970177 () Bool)

(assert (=> b!1437293 (=> (not res!970177) (not e!810897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97760 (_ BitVec 32)) Bool)

(assert (=> b!1437293 (= res!970177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437294 () Bool)

(declare-fun res!970176 () Bool)

(assert (=> b!1437294 (=> (not res!970176) (not e!810897))))

(assert (=> b!1437294 (= res!970176 (validKeyInArray!0 (select (arr!47174 a!2862) j!93)))))

(assert (= (and start!124156 res!970171) b!1437292))

(assert (= (and b!1437292 res!970175) b!1437291))

(assert (= (and b!1437291 res!970173) b!1437294))

(assert (= (and b!1437294 res!970176) b!1437293))

(assert (= (and b!1437293 res!970177) b!1437289))

(assert (= (and b!1437289 res!970169) b!1437288))

(assert (= (and b!1437288 res!970172) b!1437287))

(assert (= (and b!1437287 res!970174) b!1437290))

(assert (= (and b!1437290 res!970170) b!1437286))

(declare-fun m!1326607 () Bool)

(assert (=> b!1437291 m!1326607))

(assert (=> b!1437291 m!1326607))

(declare-fun m!1326609 () Bool)

(assert (=> b!1437291 m!1326609))

(declare-fun m!1326611 () Bool)

(assert (=> b!1437293 m!1326611))

(declare-fun m!1326613 () Bool)

(assert (=> start!124156 m!1326613))

(declare-fun m!1326615 () Bool)

(assert (=> start!124156 m!1326615))

(declare-fun m!1326617 () Bool)

(assert (=> b!1437289 m!1326617))

(declare-fun m!1326619 () Bool)

(assert (=> b!1437294 m!1326619))

(assert (=> b!1437294 m!1326619))

(declare-fun m!1326621 () Bool)

(assert (=> b!1437294 m!1326621))

(assert (=> b!1437287 m!1326619))

(assert (=> b!1437287 m!1326619))

(declare-fun m!1326623 () Bool)

(assert (=> b!1437287 m!1326623))

(assert (=> b!1437287 m!1326623))

(assert (=> b!1437287 m!1326619))

(declare-fun m!1326625 () Bool)

(assert (=> b!1437287 m!1326625))

(declare-fun m!1326627 () Bool)

(assert (=> b!1437288 m!1326627))

(declare-fun m!1326629 () Bool)

(assert (=> b!1437288 m!1326629))

(assert (=> b!1437290 m!1326619))

(assert (=> b!1437290 m!1326619))

(declare-fun m!1326631 () Bool)

(assert (=> b!1437290 m!1326631))

(push 1)

(assert (not b!1437290))

(assert (not b!1437289))

(assert (not start!124156))

(assert (not b!1437293))

(assert (not b!1437291))

(assert (not b!1437294))

(assert (not b!1437287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154639 () Bool)

(assert (=> d!154639 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124156 d!154639))

(declare-fun d!154653 () Bool)

(assert (=> d!154653 (= (array_inv!36202 a!2862) (bvsge (size!47724 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124156 d!154653))

(declare-fun e!810981 () SeekEntryResult!11426)

(declare-fun b!1437451 () Bool)

(assert (=> b!1437451 (= e!810981 (Intermediate!11426 true (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437452 () Bool)

(declare-fun lt!632302 () SeekEntryResult!11426)

(assert (=> b!1437452 (and (bvsge (index!48098 lt!632302) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632302) (size!47724 a!2862)))))

(declare-fun res!970270 () Bool)

(assert (=> b!1437452 (= res!970270 (= (select (arr!47174 a!2862) (index!48098 lt!632302)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810979 () Bool)

(assert (=> b!1437452 (=> res!970270 e!810979)))

(declare-fun b!1437453 () Bool)

(declare-fun e!810980 () Bool)

(assert (=> b!1437453 (= e!810980 (bvsge (x!129827 lt!632302) #b01111111111111111111111111111110))))

(declare-fun e!810977 () SeekEntryResult!11426)

(declare-fun b!1437454 () Bool)

(assert (=> b!1437454 (= e!810977 (Intermediate!11426 false (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437455 () Bool)

(declare-fun e!810978 () Bool)

(assert (=> b!1437455 (= e!810980 e!810978)))

(declare-fun res!970272 () Bool)

(assert (=> b!1437455 (= res!970272 (and (is-Intermediate!11426 lt!632302) (not (undefined!12238 lt!632302)) (bvslt (x!129827 lt!632302) #b01111111111111111111111111111110) (bvsge (x!129827 lt!632302) #b00000000000000000000000000000000) (bvsge (x!129827 lt!632302) #b00000000000000000000000000000000)))))

(assert (=> b!1437455 (=> (not res!970272) (not e!810978))))

(declare-fun b!1437456 () Bool)

(assert (=> b!1437456 (and (bvsge (index!48098 lt!632302) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632302) (size!47724 a!2862)))))

(assert (=> b!1437456 (= e!810979 (= (select (arr!47174 a!2862) (index!48098 lt!632302)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437457 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437457 (= e!810977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47174 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154655 () Bool)

(assert (=> d!154655 e!810980))

(declare-fun c!133097 () Bool)

(assert (=> d!154655 (= c!133097 (and (is-Intermediate!11426 lt!632302) (undefined!12238 lt!632302)))))

(assert (=> d!154655 (= lt!632302 e!810981)))

(declare-fun c!133096 () Bool)

(assert (=> d!154655 (= c!133096 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632301 () (_ BitVec 64))

(assert (=> d!154655 (= lt!632301 (select (arr!47174 a!2862) (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687)))))

(assert (=> d!154655 (validMask!0 mask!2687)))

(assert (=> d!154655 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) (select (arr!47174 a!2862) j!93) a!2862 mask!2687) lt!632302)))

(declare-fun b!1437458 () Bool)

(assert (=> b!1437458 (and (bvsge (index!48098 lt!632302) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632302) (size!47724 a!2862)))))

(declare-fun res!970271 () Bool)

(assert (=> b!1437458 (= res!970271 (= (select (arr!47174 a!2862) (index!48098 lt!632302)) (select (arr!47174 a!2862) j!93)))))

(assert (=> b!1437458 (=> res!970271 e!810979)))

(assert (=> b!1437458 (= e!810978 e!810979)))

(declare-fun b!1437459 () Bool)

(assert (=> b!1437459 (= e!810981 e!810977)))

(declare-fun c!133098 () Bool)

(assert (=> b!1437459 (= c!133098 (or (= lt!632301 (select (arr!47174 a!2862) j!93)) (= (bvadd lt!632301 lt!632301) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154655 c!133096) b!1437451))

(assert (= (and d!154655 (not c!133096)) b!1437459))

(assert (= (and b!1437459 c!133098) b!1437454))

(assert (= (and b!1437459 (not c!133098)) b!1437457))

(assert (= (and d!154655 c!133097) b!1437453))

(assert (= (and d!154655 (not c!133097)) b!1437455))

(assert (= (and b!1437455 res!970272) b!1437458))

(assert (= (and b!1437458 (not res!970271)) b!1437452))

(assert (= (and b!1437452 (not res!970270)) b!1437456))

(declare-fun m!1326729 () Bool)

(assert (=> b!1437458 m!1326729))

(assert (=> d!154655 m!1326623))

(declare-fun m!1326731 () Bool)

(assert (=> d!154655 m!1326731))

(assert (=> d!154655 m!1326613))

(assert (=> b!1437456 m!1326729))

(assert (=> b!1437457 m!1326623))

(declare-fun m!1326733 () Bool)

(assert (=> b!1437457 m!1326733))

(assert (=> b!1437457 m!1326733))

(assert (=> b!1437457 m!1326619))

(declare-fun m!1326735 () Bool)

(assert (=> b!1437457 m!1326735))

(assert (=> b!1437452 m!1326729))

(assert (=> b!1437287 d!154655))

(declare-fun d!154667 () Bool)

(declare-fun lt!632314 () (_ BitVec 32))

(declare-fun lt!632313 () (_ BitVec 32))

(assert (=> d!154667 (= lt!632314 (bvmul (bvxor lt!632313 (bvlshr lt!632313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154667 (= lt!632313 ((_ extract 31 0) (bvand (bvxor (select (arr!47174 a!2862) j!93) (bvlshr (select (arr!47174 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154667 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970279 (let ((h!35014 ((_ extract 31 0) (bvand (bvxor (select (arr!47174 a!2862) j!93) (bvlshr (select (arr!47174 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129835 (bvmul (bvxor h!35014 (bvlshr h!35014 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129835 (bvlshr x!129835 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970279 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970279 #b00000000000000000000000000000000))))))

(assert (=> d!154667 (= (toIndex!0 (select (arr!47174 a!2862) j!93) mask!2687) (bvand (bvxor lt!632314 (bvlshr lt!632314 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437287 d!154667))

(declare-fun b!1437483 () Bool)

(declare-fun e!811002 () Bool)

(declare-fun e!811000 () Bool)

(assert (=> b!1437483 (= e!811002 e!811000)))

(declare-fun c!133104 () Bool)

(assert (=> b!1437483 (= c!133104 (validKeyInArray!0 (select (arr!47174 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437484 () Bool)

(declare-fun e!811001 () Bool)

(declare-fun call!67633 () Bool)

(assert (=> b!1437484 (= e!811001 call!67633)))

(declare-fun b!1437485 () Bool)

(assert (=> b!1437485 (= e!811000 call!67633)))

(declare-fun bm!67630 () Bool)

(assert (=> bm!67630 (= call!67633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154671 () Bool)

(declare-fun res!970288 () Bool)

(assert (=> d!154671 (=> res!970288 e!811002)))

(assert (=> d!154671 (= res!970288 (bvsge #b00000000000000000000000000000000 (size!47724 a!2862)))))

(assert (=> d!154671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811002)))

(declare-fun b!1437486 () Bool)

(assert (=> b!1437486 (= e!811000 e!811001)))

(declare-fun lt!632323 () (_ BitVec 64))

(assert (=> b!1437486 (= lt!632323 (select (arr!47174 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48558 0))(
  ( (Unit!48559) )
))
(declare-fun lt!632321 () Unit!48558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97760 (_ BitVec 64) (_ BitVec 32)) Unit!48558)

(assert (=> b!1437486 (= lt!632321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632323 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437486 (arrayContainsKey!0 a!2862 lt!632323 #b00000000000000000000000000000000)))

(declare-fun lt!632322 () Unit!48558)

(assert (=> b!1437486 (= lt!632322 lt!632321)))

(declare-fun res!970287 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97760 (_ BitVec 32)) SeekEntryResult!11426)

(assert (=> b!1437486 (= res!970287 (= (seekEntryOrOpen!0 (select (arr!47174 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11426 #b00000000000000000000000000000000)))))

(assert (=> b!1437486 (=> (not res!970287) (not e!811001))))

(assert (= (and d!154671 (not res!970288)) b!1437483))

(assert (= (and b!1437483 c!133104) b!1437486))

(assert (= (and b!1437483 (not c!133104)) b!1437485))

(assert (= (and b!1437486 res!970287) b!1437484))

(assert (= (or b!1437484 b!1437485) bm!67630))

(declare-fun m!1326741 () Bool)

(assert (=> b!1437483 m!1326741))

(assert (=> b!1437483 m!1326741))

(declare-fun m!1326743 () Bool)

(assert (=> b!1437483 m!1326743))

(declare-fun m!1326745 () Bool)

(assert (=> bm!67630 m!1326745))

(assert (=> b!1437486 m!1326741))

(declare-fun m!1326747 () Bool)

(assert (=> b!1437486 m!1326747))

(declare-fun m!1326749 () Bool)

(assert (=> b!1437486 m!1326749))

(assert (=> b!1437486 m!1326741))

(declare-fun m!1326751 () Bool)

(assert (=> b!1437486 m!1326751))

(assert (=> b!1437293 d!154671))

(declare-fun d!154677 () Bool)

(assert (=> d!154677 (= (validKeyInArray!0 (select (arr!47174 a!2862) j!93)) (and (not (= (select (arr!47174 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47174 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437294 d!154677))

(declare-fun d!154679 () Bool)

(declare-fun res!970302 () Bool)

(declare-fun e!811021 () Bool)

(assert (=> d!154679 (=> res!970302 e!811021)))

(assert (=> d!154679 (= res!970302 (bvsge #b00000000000000000000000000000000 (size!47724 a!2862)))))

(assert (=> d!154679 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33672) e!811021)))

(declare-fun bm!67636 () Bool)

(declare-fun call!67639 () Bool)

(declare-fun c!133110 () Bool)

(assert (=> bm!67636 (= call!67639 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133110 (Cons!33671 (select (arr!47174 a!2862) #b00000000000000000000000000000000) Nil!33672) Nil!33672)))))

(declare-fun b!1437509 () Bool)

(declare-fun e!811020 () Bool)

(declare-fun contains!9887 (List!33675 (_ BitVec 64)) Bool)

(assert (=> b!1437509 (= e!811020 (contains!9887 Nil!33672 (select (arr!47174 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437510 () Bool)

(declare-fun e!811022 () Bool)

(assert (=> b!1437510 (= e!811022 call!67639)))

(declare-fun b!1437511 () Bool)

(declare-fun e!811023 () Bool)

(assert (=> b!1437511 (= e!811023 e!811022)))

(assert (=> b!1437511 (= c!133110 (validKeyInArray!0 (select (arr!47174 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437512 () Bool)

(assert (=> b!1437512 (= e!811021 e!811023)))

(declare-fun res!970303 () Bool)

(assert (=> b!1437512 (=> (not res!970303) (not e!811023))))

(assert (=> b!1437512 (= res!970303 (not e!811020))))

(declare-fun res!970301 () Bool)

(assert (=> b!1437512 (=> (not res!970301) (not e!811020))))

(assert (=> b!1437512 (= res!970301 (validKeyInArray!0 (select (arr!47174 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437513 () Bool)

(assert (=> b!1437513 (= e!811022 call!67639)))

(assert (= (and d!154679 (not res!970302)) b!1437512))

(assert (= (and b!1437512 res!970301) b!1437509))

(assert (= (and b!1437512 res!970303) b!1437511))

(assert (= (and b!1437511 c!133110) b!1437513))

(assert (= (and b!1437511 (not c!133110)) b!1437510))

(assert (= (or b!1437513 b!1437510) bm!67636))

(assert (=> bm!67636 m!1326741))

(declare-fun m!1326765 () Bool)

(assert (=> bm!67636 m!1326765))

(assert (=> b!1437509 m!1326741))

(assert (=> b!1437509 m!1326741))

(declare-fun m!1326767 () Bool)

(assert (=> b!1437509 m!1326767))

(assert (=> b!1437511 m!1326741))

(assert (=> b!1437511 m!1326741))

(assert (=> b!1437511 m!1326743))

(assert (=> b!1437512 m!1326741))

(assert (=> b!1437512 m!1326741))

(assert (=> b!1437512 m!1326743))

(assert (=> b!1437289 d!154679))

(declare-fun b!1437514 () Bool)

(declare-fun e!811028 () SeekEntryResult!11426)

(assert (=> b!1437514 (= e!811028 (Intermediate!11426 true index!646 x!665))))

(declare-fun b!1437515 () Bool)

(declare-fun lt!632334 () SeekEntryResult!11426)

(assert (=> b!1437515 (and (bvsge (index!48098 lt!632334) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632334) (size!47724 a!2862)))))

(declare-fun res!970304 () Bool)

(assert (=> b!1437515 (= res!970304 (= (select (arr!47174 a!2862) (index!48098 lt!632334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811026 () Bool)

(assert (=> b!1437515 (=> res!970304 e!811026)))

(declare-fun b!1437516 () Bool)

(declare-fun e!811027 () Bool)

(assert (=> b!1437516 (= e!811027 (bvsge (x!129827 lt!632334) #b01111111111111111111111111111110))))

(declare-fun b!1437517 () Bool)

(declare-fun e!811024 () SeekEntryResult!11426)

(assert (=> b!1437517 (= e!811024 (Intermediate!11426 false index!646 x!665))))

(declare-fun b!1437518 () Bool)

(declare-fun e!811025 () Bool)

(assert (=> b!1437518 (= e!811027 e!811025)))

(declare-fun res!970306 () Bool)

(assert (=> b!1437518 (= res!970306 (and (is-Intermediate!11426 lt!632334) (not (undefined!12238 lt!632334)) (bvslt (x!129827 lt!632334) #b01111111111111111111111111111110) (bvsge (x!129827 lt!632334) #b00000000000000000000000000000000) (bvsge (x!129827 lt!632334) x!665)))))

(assert (=> b!1437518 (=> (not res!970306) (not e!811025))))

(declare-fun b!1437519 () Bool)

(assert (=> b!1437519 (and (bvsge (index!48098 lt!632334) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632334) (size!47724 a!2862)))))

(assert (=> b!1437519 (= e!811026 (= (select (arr!47174 a!2862) (index!48098 lt!632334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437520 () Bool)

(assert (=> b!1437520 (= e!811024 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47174 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154683 () Bool)

(assert (=> d!154683 e!811027))

(declare-fun c!133112 () Bool)

(assert (=> d!154683 (= c!133112 (and (is-Intermediate!11426 lt!632334) (undefined!12238 lt!632334)))))

(assert (=> d!154683 (= lt!632334 e!811028)))

(declare-fun c!133111 () Bool)

(assert (=> d!154683 (= c!133111 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632333 () (_ BitVec 64))

(assert (=> d!154683 (= lt!632333 (select (arr!47174 a!2862) index!646))))

(assert (=> d!154683 (validMask!0 mask!2687)))

(assert (=> d!154683 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47174 a!2862) j!93) a!2862 mask!2687) lt!632334)))

(declare-fun b!1437521 () Bool)

(assert (=> b!1437521 (and (bvsge (index!48098 lt!632334) #b00000000000000000000000000000000) (bvslt (index!48098 lt!632334) (size!47724 a!2862)))))

(declare-fun res!970305 () Bool)

(assert (=> b!1437521 (= res!970305 (= (select (arr!47174 a!2862) (index!48098 lt!632334)) (select (arr!47174 a!2862) j!93)))))

(assert (=> b!1437521 (=> res!970305 e!811026)))

(assert (=> b!1437521 (= e!811025 e!811026)))

