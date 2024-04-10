; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51758 () Bool)

(assert start!51758)

(declare-fun b!566363 () Bool)

(declare-fun res!357337 () Bool)

(declare-fun e!325933 () Bool)

(assert (=> b!566363 (=> (not res!357337) (not e!325933))))

(declare-datatypes ((array!35566 0))(
  ( (array!35567 (arr!17082 (Array (_ BitVec 32) (_ BitVec 64))) (size!17446 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35566)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35566 (_ BitVec 32)) Bool)

(assert (=> b!566363 (= res!357337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566364 () Bool)

(declare-fun res!357332 () Bool)

(declare-fun e!325931 () Bool)

(assert (=> b!566364 (=> (not res!357332) (not e!325931))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566364 (= res!357332 (and (= (size!17446 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17446 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17446 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566365 () Bool)

(declare-fun res!357338 () Bool)

(assert (=> b!566365 (=> (not res!357338) (not e!325931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566365 (= res!357338 (validKeyInArray!0 (select (arr!17082 a!3118) j!142)))))

(declare-fun b!566366 () Bool)

(declare-fun res!357334 () Bool)

(assert (=> b!566366 (=> (not res!357334) (not e!325931))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566366 (= res!357334 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566367 () Bool)

(assert (=> b!566367 (= e!325931 e!325933)))

(declare-fun res!357341 () Bool)

(assert (=> b!566367 (=> (not res!357341) (not e!325933))))

(declare-datatypes ((SeekEntryResult!5531 0))(
  ( (MissingZero!5531 (index!24351 (_ BitVec 32))) (Found!5531 (index!24352 (_ BitVec 32))) (Intermediate!5531 (undefined!6343 Bool) (index!24353 (_ BitVec 32)) (x!53216 (_ BitVec 32))) (Undefined!5531) (MissingVacant!5531 (index!24354 (_ BitVec 32))) )
))
(declare-fun lt!258084 () SeekEntryResult!5531)

(assert (=> b!566367 (= res!357341 (or (= lt!258084 (MissingZero!5531 i!1132)) (= lt!258084 (MissingVacant!5531 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35566 (_ BitVec 32)) SeekEntryResult!5531)

(assert (=> b!566367 (= lt!258084 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!357333 () Bool)

(assert (=> start!51758 (=> (not res!357333) (not e!325931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51758 (= res!357333 (validMask!0 mask!3119))))

(assert (=> start!51758 e!325931))

(assert (=> start!51758 true))

(declare-fun array_inv!12878 (array!35566) Bool)

(assert (=> start!51758 (array_inv!12878 a!3118)))

(declare-fun b!566368 () Bool)

(declare-fun e!325932 () Bool)

(assert (=> b!566368 (= e!325933 e!325932)))

(declare-fun res!357340 () Bool)

(assert (=> b!566368 (=> (not res!357340) (not e!325932))))

(declare-fun lt!258088 () array!35566)

(declare-fun lt!258087 () (_ BitVec 32))

(declare-fun lt!258090 () (_ BitVec 64))

(declare-fun lt!258091 () SeekEntryResult!5531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35566 (_ BitVec 32)) SeekEntryResult!5531)

(assert (=> b!566368 (= res!357340 (= lt!258091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258087 lt!258090 lt!258088 mask!3119)))))

(declare-fun lt!258086 () (_ BitVec 32))

(assert (=> b!566368 (= lt!258091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258086 (select (arr!17082 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566368 (= lt!258087 (toIndex!0 lt!258090 mask!3119))))

(assert (=> b!566368 (= lt!258090 (select (store (arr!17082 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!566368 (= lt!258086 (toIndex!0 (select (arr!17082 a!3118) j!142) mask!3119))))

(assert (=> b!566368 (= lt!258088 (array!35567 (store (arr!17082 a!3118) i!1132 k!1914) (size!17446 a!3118)))))

(declare-fun b!566369 () Bool)

(declare-fun res!357336 () Bool)

(assert (=> b!566369 (=> (not res!357336) (not e!325933))))

(declare-datatypes ((List!11162 0))(
  ( (Nil!11159) (Cons!11158 (h!12164 (_ BitVec 64)) (t!17390 List!11162)) )
))
(declare-fun arrayNoDuplicates!0 (array!35566 (_ BitVec 32) List!11162) Bool)

(assert (=> b!566369 (= res!357336 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11159))))

(declare-fun b!566370 () Bool)

(declare-fun lt!258089 () SeekEntryResult!5531)

(declare-fun e!325934 () Bool)

(assert (=> b!566370 (= e!325934 (= lt!258089 (seekEntryOrOpen!0 lt!258090 lt!258088 mask!3119)))))

(declare-fun b!566371 () Bool)

(declare-fun res!357339 () Bool)

(assert (=> b!566371 (=> (not res!357339) (not e!325931))))

(assert (=> b!566371 (= res!357339 (validKeyInArray!0 k!1914))))

(declare-fun b!566372 () Bool)

(assert (=> b!566372 (= e!325932 (not e!325934))))

(declare-fun res!357335 () Bool)

(assert (=> b!566372 (=> res!357335 e!325934)))

(assert (=> b!566372 (= res!357335 (or (not (is-Intermediate!5531 lt!258091)) (not (undefined!6343 lt!258091))))))

(assert (=> b!566372 (= lt!258089 (Found!5531 j!142))))

(assert (=> b!566372 (= lt!258089 (seekEntryOrOpen!0 (select (arr!17082 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!566372 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17764 0))(
  ( (Unit!17765) )
))
(declare-fun lt!258085 () Unit!17764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17764)

(assert (=> b!566372 (= lt!258085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51758 res!357333) b!566364))

(assert (= (and b!566364 res!357332) b!566365))

(assert (= (and b!566365 res!357338) b!566371))

(assert (= (and b!566371 res!357339) b!566366))

(assert (= (and b!566366 res!357334) b!566367))

(assert (= (and b!566367 res!357341) b!566363))

(assert (= (and b!566363 res!357337) b!566369))

(assert (= (and b!566369 res!357336) b!566368))

(assert (= (and b!566368 res!357340) b!566372))

(assert (= (and b!566372 (not res!357335)) b!566370))

(declare-fun m!545007 () Bool)

(assert (=> b!566367 m!545007))

(declare-fun m!545009 () Bool)

(assert (=> start!51758 m!545009))

(declare-fun m!545011 () Bool)

(assert (=> start!51758 m!545011))

(declare-fun m!545013 () Bool)

(assert (=> b!566368 m!545013))

(declare-fun m!545015 () Bool)

(assert (=> b!566368 m!545015))

(assert (=> b!566368 m!545013))

(declare-fun m!545017 () Bool)

(assert (=> b!566368 m!545017))

(declare-fun m!545019 () Bool)

(assert (=> b!566368 m!545019))

(declare-fun m!545021 () Bool)

(assert (=> b!566368 m!545021))

(declare-fun m!545023 () Bool)

(assert (=> b!566368 m!545023))

(assert (=> b!566368 m!545013))

(declare-fun m!545025 () Bool)

(assert (=> b!566368 m!545025))

(assert (=> b!566365 m!545013))

(assert (=> b!566365 m!545013))

(declare-fun m!545027 () Bool)

(assert (=> b!566365 m!545027))

(assert (=> b!566372 m!545013))

(assert (=> b!566372 m!545013))

(declare-fun m!545029 () Bool)

(assert (=> b!566372 m!545029))

(declare-fun m!545031 () Bool)

(assert (=> b!566372 m!545031))

(declare-fun m!545033 () Bool)

(assert (=> b!566372 m!545033))

(declare-fun m!545035 () Bool)

(assert (=> b!566366 m!545035))

(declare-fun m!545037 () Bool)

(assert (=> b!566363 m!545037))

(declare-fun m!545039 () Bool)

(assert (=> b!566371 m!545039))

(declare-fun m!545041 () Bool)

(assert (=> b!566369 m!545041))

(declare-fun m!545043 () Bool)

(assert (=> b!566370 m!545043))

(push 1)

(assert (not b!566371))

(assert (not b!566369))

(assert (not start!51758))

(assert (not b!566370))

(assert (not b!566368))

(assert (not b!566363))

(assert (not b!566367))

(assert (not b!566365))

(assert (not b!566372))

(assert (not b!566366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!566487 () Bool)

(declare-fun e!325999 () Bool)

(declare-fun e!326000 () Bool)

(assert (=> b!566487 (= e!325999 e!326000)))

(declare-fun c!64884 () Bool)

(assert (=> b!566487 (= c!64884 (validKeyInArray!0 (select (arr!17082 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566489 () Bool)

(declare-fun call!32484 () Bool)

(assert (=> b!566489 (= e!326000 call!32484)))

(declare-fun b!566490 () Bool)

(declare-fun e!326001 () Bool)

(assert (=> b!566490 (= e!326000 e!326001)))

(declare-fun lt!258174 () (_ BitVec 64))

(assert (=> b!566490 (= lt!258174 (select (arr!17082 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258173 () Unit!17764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35566 (_ BitVec 64) (_ BitVec 32)) Unit!17764)

(assert (=> b!566490 (= lt!258173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258174 #b00000000000000000000000000000000))))

(assert (=> b!566490 (arrayContainsKey!0 a!3118 lt!258174 #b00000000000000000000000000000000)))

(declare-fun lt!258175 () Unit!17764)

(assert (=> b!566490 (= lt!258175 lt!258173)))

(declare-fun res!357414 () Bool)

(assert (=> b!566490 (= res!357414 (= (seekEntryOrOpen!0 (select (arr!17082 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5531 #b00000000000000000000000000000000)))))

(assert (=> b!566490 (=> (not res!357414) (not e!326001))))

(declare-fun bm!32481 () Bool)

(assert (=> bm!32481 (= call!32484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566488 () Bool)

(assert (=> b!566488 (= e!326001 call!32484)))

(declare-fun d!84097 () Bool)

(declare-fun res!357415 () Bool)

(assert (=> d!84097 (=> res!357415 e!325999)))

(assert (=> d!84097 (= res!357415 (bvsge #b00000000000000000000000000000000 (size!17446 a!3118)))))

(assert (=> d!84097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325999)))

(assert (= (and d!84097 (not res!357415)) b!566487))

(assert (= (and b!566487 c!64884) b!566490))

(assert (= (and b!566487 (not c!64884)) b!566489))

(assert (= (and b!566490 res!357414) b!566488))

(assert (= (or b!566488 b!566489) bm!32481))

(declare-fun m!545151 () Bool)

(assert (=> b!566487 m!545151))

(assert (=> b!566487 m!545151))

(declare-fun m!545153 () Bool)

(assert (=> b!566487 m!545153))

(assert (=> b!566490 m!545151))

(declare-fun m!545155 () Bool)

(assert (=> b!566490 m!545155))

(declare-fun m!545157 () Bool)

(assert (=> b!566490 m!545157))

(assert (=> b!566490 m!545151))

(declare-fun m!545159 () Bool)

(assert (=> b!566490 m!545159))

(declare-fun m!545161 () Bool)

(assert (=> bm!32481 m!545161))

(assert (=> b!566363 d!84097))

(declare-fun b!566551 () Bool)

(declare-fun e!326041 () Bool)

(declare-fun e!326043 () Bool)

(assert (=> b!566551 (= e!326041 e!326043)))

(declare-fun res!357435 () Bool)

(declare-fun lt!258207 () SeekEntryResult!5531)

(assert (=> b!566551 (= res!357435 (and (is-Intermediate!5531 lt!258207) (not (undefined!6343 lt!258207)) (bvslt (x!53216 lt!258207) #b01111111111111111111111111111110) (bvsge (x!53216 lt!258207) #b00000000000000000000000000000000) (bvsge (x!53216 lt!258207) #b00000000000000000000000000000000)))))

(assert (=> b!566551 (=> (not res!357435) (not e!326043))))

(declare-fun b!566552 () Bool)

(declare-fun e!326042 () SeekEntryResult!5531)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566552 (= e!326042 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258087 #b00000000000000000000000000000000 mask!3119) lt!258090 lt!258088 mask!3119))))

(declare-fun b!566553 () Bool)

(assert (=> b!566553 (= e!326042 (Intermediate!5531 false lt!258087 #b00000000000000000000000000000000))))

(declare-fun d!84103 () Bool)

(assert (=> d!84103 e!326041))

(declare-fun c!64906 () Bool)

(assert (=> d!84103 (= c!64906 (and (is-Intermediate!5531 lt!258207) (undefined!6343 lt!258207)))))

(declare-fun e!326039 () SeekEntryResult!5531)

(assert (=> d!84103 (= lt!258207 e!326039)))

(declare-fun c!64908 () Bool)

(assert (=> d!84103 (= c!64908 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258206 () (_ BitVec 64))

(assert (=> d!84103 (= lt!258206 (select (arr!17082 lt!258088) lt!258087))))

(assert (=> d!84103 (validMask!0 mask!3119)))

(assert (=> d!84103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258087 lt!258090 lt!258088 mask!3119) lt!258207)))

(declare-fun b!566554 () Bool)

(assert (=> b!566554 (and (bvsge (index!24353 lt!258207) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258207) (size!17446 lt!258088)))))

(declare-fun res!357434 () Bool)

(assert (=> b!566554 (= res!357434 (= (select (arr!17082 lt!258088) (index!24353 lt!258207)) lt!258090))))

(declare-fun e!326040 () Bool)

(assert (=> b!566554 (=> res!357434 e!326040)))

(assert (=> b!566554 (= e!326043 e!326040)))

(declare-fun b!566555 () Bool)

(assert (=> b!566555 (and (bvsge (index!24353 lt!258207) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258207) (size!17446 lt!258088)))))

(assert (=> b!566555 (= e!326040 (= (select (arr!17082 lt!258088) (index!24353 lt!258207)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566556 () Bool)

(assert (=> b!566556 (= e!326039 (Intermediate!5531 true lt!258087 #b00000000000000000000000000000000))))

(declare-fun b!566557 () Bool)

(assert (=> b!566557 (and (bvsge (index!24353 lt!258207) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258207) (size!17446 lt!258088)))))

(declare-fun res!357436 () Bool)

(assert (=> b!566557 (= res!357436 (= (select (arr!17082 lt!258088) (index!24353 lt!258207)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566557 (=> res!357436 e!326040)))

(declare-fun b!566558 () Bool)

(assert (=> b!566558 (= e!326039 e!326042)))

(declare-fun c!64907 () Bool)

(assert (=> b!566558 (= c!64907 (or (= lt!258206 lt!258090) (= (bvadd lt!258206 lt!258206) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!566559 () Bool)

(assert (=> b!566559 (= e!326041 (bvsge (x!53216 lt!258207) #b01111111111111111111111111111110))))

(assert (= (and d!84103 c!64908) b!566556))

(assert (= (and d!84103 (not c!64908)) b!566558))

(assert (= (and b!566558 c!64907) b!566553))

(assert (= (and b!566558 (not c!64907)) b!566552))

(assert (= (and d!84103 c!64906) b!566559))

(assert (= (and d!84103 (not c!64906)) b!566551))

(assert (= (and b!566551 res!357435) b!566554))

(assert (= (and b!566554 (not res!357434)) b!566557))

(assert (= (and b!566557 (not res!357436)) b!566555))

(declare-fun m!545227 () Bool)

(assert (=> d!84103 m!545227))

(assert (=> d!84103 m!545009))

(declare-fun m!545229 () Bool)

(assert (=> b!566555 m!545229))

(assert (=> b!566557 m!545229))

(declare-fun m!545231 () Bool)

(assert (=> b!566552 m!545231))

(assert (=> b!566552 m!545231))

(declare-fun m!545233 () Bool)

(assert (=> b!566552 m!545233))

(assert (=> b!566554 m!545229))

(assert (=> b!566368 d!84103))

(declare-fun b!566560 () Bool)

(declare-fun e!326046 () Bool)

(declare-fun e!326048 () Bool)

(assert (=> b!566560 (= e!326046 e!326048)))

(declare-fun res!357438 () Bool)

(declare-fun lt!258210 () SeekEntryResult!5531)

(assert (=> b!566560 (= res!357438 (and (is-Intermediate!5531 lt!258210) (not (undefined!6343 lt!258210)) (bvslt (x!53216 lt!258210) #b01111111111111111111111111111110) (bvsge (x!53216 lt!258210) #b00000000000000000000000000000000) (bvsge (x!53216 lt!258210) #b00000000000000000000000000000000)))))

(assert (=> b!566560 (=> (not res!357438) (not e!326048))))

(declare-fun e!326047 () SeekEntryResult!5531)

(declare-fun b!566561 () Bool)

(assert (=> b!566561 (= e!326047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258086 #b00000000000000000000000000000000 mask!3119) (select (arr!17082 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566562 () Bool)

(assert (=> b!566562 (= e!326047 (Intermediate!5531 false lt!258086 #b00000000000000000000000000000000))))

(declare-fun d!84123 () Bool)

(assert (=> d!84123 e!326046))

(declare-fun c!64909 () Bool)

(assert (=> d!84123 (= c!64909 (and (is-Intermediate!5531 lt!258210) (undefined!6343 lt!258210)))))

(declare-fun e!326044 () SeekEntryResult!5531)

(assert (=> d!84123 (= lt!258210 e!326044)))

(declare-fun c!64911 () Bool)

(assert (=> d!84123 (= c!64911 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258209 () (_ BitVec 64))

(assert (=> d!84123 (= lt!258209 (select (arr!17082 a!3118) lt!258086))))

(assert (=> d!84123 (validMask!0 mask!3119)))

(assert (=> d!84123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258086 (select (arr!17082 a!3118) j!142) a!3118 mask!3119) lt!258210)))

(declare-fun b!566563 () Bool)

(assert (=> b!566563 (and (bvsge (index!24353 lt!258210) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258210) (size!17446 a!3118)))))

(declare-fun res!357437 () Bool)

(assert (=> b!566563 (= res!357437 (= (select (arr!17082 a!3118) (index!24353 lt!258210)) (select (arr!17082 a!3118) j!142)))))

(declare-fun e!326045 () Bool)

(assert (=> b!566563 (=> res!357437 e!326045)))

(assert (=> b!566563 (= e!326048 e!326045)))

(declare-fun b!566564 () Bool)

(assert (=> b!566564 (and (bvsge (index!24353 lt!258210) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258210) (size!17446 a!3118)))))

(assert (=> b!566564 (= e!326045 (= (select (arr!17082 a!3118) (index!24353 lt!258210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566565 () Bool)

(assert (=> b!566565 (= e!326044 (Intermediate!5531 true lt!258086 #b00000000000000000000000000000000))))

(declare-fun b!566566 () Bool)

(assert (=> b!566566 (and (bvsge (index!24353 lt!258210) #b00000000000000000000000000000000) (bvslt (index!24353 lt!258210) (size!17446 a!3118)))))

(declare-fun res!357439 () Bool)

(assert (=> b!566566 (= res!357439 (= (select (arr!17082 a!3118) (index!24353 lt!258210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566566 (=> res!357439 e!326045)))

(declare-fun b!566567 () Bool)

(assert (=> b!566567 (= e!326044 e!326047)))

(declare-fun c!64910 () Bool)

(assert (=> b!566567 (= c!64910 (or (= lt!258209 (select (arr!17082 a!3118) j!142)) (= (bvadd lt!258209 lt!258209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!566568 () Bool)

(assert (=> b!566568 (= e!326046 (bvsge (x!53216 lt!258210) #b01111111111111111111111111111110))))

(assert (= (and d!84123 c!64911) b!566565))

(assert (= (and d!84123 (not c!64911)) b!566567))

(assert (= (and b!566567 c!64910) b!566562))

(assert (= (and b!566567 (not c!64910)) b!566561))

(assert (= (and d!84123 c!64909) b!566568))

(assert (= (and d!84123 (not c!64909)) b!566560))

(assert (= (and b!566560 res!357438) b!566563))

(assert (= (and b!566563 (not res!357437)) b!566566))

(assert (= (and b!566566 (not res!357439)) b!566564))

(declare-fun m!545235 () Bool)

(assert (=> d!84123 m!545235))

(assert (=> d!84123 m!545009))

(declare-fun m!545237 () Bool)

(assert (=> b!566564 m!545237))

(assert (=> b!566566 m!545237))

(declare-fun m!545239 () Bool)

(assert (=> b!566561 m!545239))

(assert (=> b!566561 m!545239))

(assert (=> b!566561 m!545013))

(declare-fun m!545241 () Bool)

(assert (=> b!566561 m!545241))

(assert (=> b!566563 m!545237))

(assert (=> b!566368 d!84123))

(declare-fun d!84125 () Bool)

(declare-fun lt!258220 () (_ BitVec 32))

(declare-fun lt!258219 () (_ BitVec 32))

(assert (=> d!84125 (= lt!258220 (bvmul (bvxor lt!258219 (bvlshr lt!258219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84125 (= lt!258219 ((_ extract 31 0) (bvand (bvxor lt!258090 (bvlshr lt!258090 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84125 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357440 (let ((h!12167 ((_ extract 31 0) (bvand (bvxor lt!258090 (bvlshr lt!258090 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53221 (bvmul (bvxor h!12167 (bvlshr h!12167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53221 (bvlshr x!53221 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357440 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357440 #b00000000000000000000000000000000))))))

(assert (=> d!84125 (= (toIndex!0 lt!258090 mask!3119) (bvand (bvxor lt!258220 (bvlshr lt!258220 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566368 d!84125))

(declare-fun d!84127 () Bool)

(declare-fun lt!258222 () (_ BitVec 32))

(declare-fun lt!258221 () (_ BitVec 32))

(assert (=> d!84127 (= lt!258222 (bvmul (bvxor lt!258221 (bvlshr lt!258221 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84127 (= lt!258221 ((_ extract 31 0) (bvand (bvxor (select (arr!17082 a!3118) j!142) (bvlshr (select (arr!17082 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84127 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357440 (let ((h!12167 ((_ extract 31 0) (bvand (bvxor (select (arr!17082 a!3118) j!142) (bvlshr (select (arr!17082 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53221 (bvmul (bvxor h!12167 (bvlshr h!12167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53221 (bvlshr x!53221 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357440 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357440 #b00000000000000000000000000000000))))))

(assert (=> d!84127 (= (toIndex!0 (select (arr!17082 a!3118) j!142) mask!3119) (bvand (bvxor lt!258222 (bvlshr lt!258222 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566368 d!84127))

(declare-fun b!566663 () Bool)

(declare-fun e!326112 () SeekEntryResult!5531)

(declare-fun lt!258249 () SeekEntryResult!5531)

(assert (=> b!566663 (= e!326112 (Found!5531 (index!24353 lt!258249)))))

(declare-fun b!566664 () Bool)

(declare-fun e!326111 () SeekEntryResult!5531)

(assert (=> b!566664 (= e!326111 (MissingZero!5531 (index!24353 lt!258249)))))

(declare-fun b!566665 () Bool)

(declare-fun c!64942 () Bool)

(declare-fun lt!258248 () (_ BitVec 64))

(assert (=> b!566665 (= c!64942 (= lt!258248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566665 (= e!326112 e!326111)))

(declare-fun b!566666 () Bool)

(declare-fun e!326113 () SeekEntryResult!5531)

(assert (=> b!566666 (= e!326113 Undefined!5531)))

(declare-fun d!84129 () Bool)

(declare-fun lt!258247 () SeekEntryResult!5531)

(assert (=> d!84129 (and (or (is-Undefined!5531 lt!258247) (not (is-Found!5531 lt!258247)) (and (bvsge (index!24352 lt!258247) #b00000000000000000000000000000000) (bvslt (index!24352 lt!258247) (size!17446 lt!258088)))) (or (is-Undefined!5531 lt!258247) (is-Found!5531 lt!258247) (not (is-MissingZero!5531 lt!258247)) (and (bvsge (index!24351 lt!258247) #b00000000000000000000000000000000) (bvslt (index!24351 lt!258247) (size!17446 lt!258088)))) (or (is-Undefined!5531 lt!258247) (is-Found!5531 lt!258247) (is-MissingZero!5531 lt!258247) (not (is-MissingVacant!5531 lt!258247)) (and (bvsge (index!24354 lt!258247) #b00000000000000000000000000000000) (bvslt (index!24354 lt!258247) (size!17446 lt!258088)))) (or (is-Undefined!5531 lt!258247) (ite (is-Found!5531 lt!258247) (= (select (arr!17082 lt!258088) (index!24352 lt!258247)) lt!258090) (ite (is-MissingZero!5531 lt!258247) (= (select (arr!17082 lt!258088) (index!24351 lt!258247)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5531 lt!258247) (= (select (arr!17082 lt!258088) (index!24354 lt!258247)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84129 (= lt!258247 e!326113)))

(declare-fun c!64941 () Bool)

(assert (=> d!84129 (= c!64941 (and (is-Intermediate!5531 lt!258249) (undefined!6343 lt!258249)))))

(assert (=> d!84129 (= lt!258249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258090 mask!3119) lt!258090 lt!258088 mask!3119))))

(assert (=> d!84129 (validMask!0 mask!3119)))

(assert (=> d!84129 (= (seekEntryOrOpen!0 lt!258090 lt!258088 mask!3119) lt!258247)))

(declare-fun b!566667 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35566 (_ BitVec 32)) SeekEntryResult!5531)

(assert (=> b!566667 (= e!326111 (seekKeyOrZeroReturnVacant!0 (x!53216 lt!258249) (index!24353 lt!258249) (index!24353 lt!258249) lt!258090 lt!258088 mask!3119))))

(declare-fun b!566668 () Bool)

(assert (=> b!566668 (= e!326113 e!326112)))

(assert (=> b!566668 (= lt!258248 (select (arr!17082 lt!258088) (index!24353 lt!258249)))))

(declare-fun c!64940 () Bool)

(assert (=> b!566668 (= c!64940 (= lt!258248 lt!258090))))

(assert (= (and d!84129 c!64941) b!566666))

(assert (= (and d!84129 (not c!64941)) b!566668))

(assert (= (and b!566668 c!64940) b!566663))

(assert (= (and b!566668 (not c!64940)) b!566665))

(assert (= (and b!566665 c!64942) b!566664))

(assert (= (and b!566665 (not c!64942)) b!566667))

(declare-fun m!545293 () Bool)

(assert (=> d!84129 m!545293))

(assert (=> d!84129 m!545017))

(declare-fun m!545295 () Bool)

(assert (=> d!84129 m!545295))

(assert (=> d!84129 m!545017))

(declare-fun m!545297 () Bool)

(assert (=> d!84129 m!545297))

(assert (=> d!84129 m!545009))

(declare-fun m!545299 () Bool)

(assert (=> d!84129 m!545299))

(declare-fun m!545301 () Bool)

(assert (=> b!566667 m!545301))

(declare-fun m!545303 () Bool)

(assert (=> b!566668 m!545303))

(assert (=> b!566370 d!84129))

(declare-fun b!566679 () Bool)

(declare-fun e!326125 () Bool)

(declare-fun call!32497 () Bool)

(assert (=> b!566679 (= e!326125 call!32497)))

(declare-fun b!566680 () Bool)

(declare-fun e!326122 () Bool)

(assert (=> b!566680 (= e!326122 e!326125)))

(declare-fun c!64945 () Bool)

(assert (=> b!566680 (= c!64945 (validKeyInArray!0 (select (arr!17082 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84159 () Bool)

(declare-fun res!357488 () Bool)

(declare-fun e!326124 () Bool)

(assert (=> d!84159 (=> res!357488 e!326124)))

(assert (=> d!84159 (= res!357488 (bvsge #b00000000000000000000000000000000 (size!17446 a!3118)))))

(assert (=> d!84159 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11159) e!326124)))

(declare-fun b!566681 () Bool)

(assert (=> b!566681 (= e!326125 call!32497)))

(declare-fun bm!32494 () Bool)

(assert (=> bm!32494 (= call!32497 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64945 (Cons!11158 (select (arr!17082 a!3118) #b00000000000000000000000000000000) Nil!11159) Nil!11159)))))

(declare-fun b!566682 () Bool)

(declare-fun e!326123 () Bool)

(declare-fun contains!2865 (List!11162 (_ BitVec 64)) Bool)

(assert (=> b!566682 (= e!326123 (contains!2865 Nil!11159 (select (arr!17082 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566683 () Bool)

(assert (=> b!566683 (= e!326124 e!326122)))

(declare-fun res!357487 () Bool)

(assert (=> b!566683 (=> (not res!357487) (not e!326122))))

(assert (=> b!566683 (= res!357487 (not e!326123))))

(declare-fun res!357486 () Bool)

(assert (=> b!566683 (=> (not res!357486) (not e!326123))))

(assert (=> b!566683 (= res!357486 (validKeyInArray!0 (select (arr!17082 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84159 (not res!357488)) b!566683))

(assert (= (and b!566683 res!357486) b!566682))

(assert (= (and b!566683 res!357487) b!566680))

(assert (= (and b!566680 c!64945) b!566679))

(assert (= (and b!566680 (not c!64945)) b!566681))

(assert (= (or b!566679 b!566681) bm!32494))

(assert (=> b!566680 m!545151))

(assert (=> b!566680 m!545151))

(assert (=> b!566680 m!545153))

(assert (=> bm!32494 m!545151))

(declare-fun m!545305 () Bool)

(assert (=> bm!32494 m!545305))

(assert (=> b!566682 m!545151))

(assert (=> b!566682 m!545151))

(declare-fun m!545307 () Bool)

(assert (=> b!566682 m!545307))

(assert (=> b!566683 m!545151))

(assert (=> b!566683 m!545151))

(assert (=> b!566683 m!545153))

(assert (=> b!566369 d!84159))

(declare-fun d!84163 () Bool)

(assert (=> d!84163 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51758 d!84163))

(declare-fun d!84169 () Bool)

(assert (=> d!84169 (= (array_inv!12878 a!3118) (bvsge (size!17446 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51758 d!84169))

(declare-fun d!84171 () Bool)

(assert (=> d!84171 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566371 d!84171))

(declare-fun d!84173 () Bool)

(declare-fun res!357506 () Bool)

(declare-fun e!326150 () Bool)

(assert (=> d!84173 (=> res!357506 e!326150)))

(assert (=> d!84173 (= res!357506 (= (select (arr!17082 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84173 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326150)))

(declare-fun b!566724 () Bool)

(declare-fun e!326151 () Bool)

(assert (=> b!566724 (= e!326150 e!326151)))

(declare-fun res!357507 () Bool)

(assert (=> b!566724 (=> (not res!357507) (not e!326151))))

(assert (=> b!566724 (= res!357507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17446 a!3118)))))

(declare-fun b!566725 () Bool)

(assert (=> b!566725 (= e!326151 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84173 (not res!357506)) b!566724))

(assert (= (and b!566724 res!357507) b!566725))

(assert (=> d!84173 m!545151))

(declare-fun m!545325 () Bool)

(assert (=> b!566725 m!545325))

(assert (=> b!566366 d!84173))

(declare-fun d!84177 () Bool)

(assert (=> d!84177 (= (validKeyInArray!0 (select (arr!17082 a!3118) j!142)) (and (not (= (select (arr!17082 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17082 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566365 d!84177))

(declare-fun b!566726 () Bool)

(declare-fun e!326153 () SeekEntryResult!5531)

(declare-fun lt!258268 () SeekEntryResult!5531)

(assert (=> b!566726 (= e!326153 (Found!5531 (index!24353 lt!258268)))))

(declare-fun b!566727 () Bool)

(declare-fun e!326152 () SeekEntryResult!5531)

(assert (=> b!566727 (= e!326152 (MissingZero!5531 (index!24353 lt!258268)))))

(declare-fun b!566728 () Bool)

(declare-fun c!64960 () Bool)

(declare-fun lt!258267 () (_ BitVec 64))

(assert (=> b!566728 (= c!64960 (= lt!258267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566728 (= e!326153 e!326152)))

(declare-fun b!566729 () Bool)

(declare-fun e!326154 () SeekEntryResult!5531)

(assert (=> b!566729 (= e!326154 Undefined!5531)))

(declare-fun d!84179 () Bool)

(declare-fun lt!258266 () SeekEntryResult!5531)

(assert (=> d!84179 (and (or (is-Undefined!5531 lt!258266) (not (is-Found!5531 lt!258266)) (and (bvsge (index!24352 lt!258266) #b00000000000000000000000000000000) (bvslt (index!24352 lt!258266) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258266) (is-Found!5531 lt!258266) (not (is-MissingZero!5531 lt!258266)) (and (bvsge (index!24351 lt!258266) #b00000000000000000000000000000000) (bvslt (index!24351 lt!258266) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258266) (is-Found!5531 lt!258266) (is-MissingZero!5531 lt!258266) (not (is-MissingVacant!5531 lt!258266)) (and (bvsge (index!24354 lt!258266) #b00000000000000000000000000000000) (bvslt (index!24354 lt!258266) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258266) (ite (is-Found!5531 lt!258266) (= (select (arr!17082 a!3118) (index!24352 lt!258266)) k!1914) (ite (is-MissingZero!5531 lt!258266) (= (select (arr!17082 a!3118) (index!24351 lt!258266)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5531 lt!258266) (= (select (arr!17082 a!3118) (index!24354 lt!258266)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84179 (= lt!258266 e!326154)))

(declare-fun c!64959 () Bool)

(assert (=> d!84179 (= c!64959 (and (is-Intermediate!5531 lt!258268) (undefined!6343 lt!258268)))))

(assert (=> d!84179 (= lt!258268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84179 (validMask!0 mask!3119)))

(assert (=> d!84179 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258266)))

(declare-fun b!566730 () Bool)

(assert (=> b!566730 (= e!326152 (seekKeyOrZeroReturnVacant!0 (x!53216 lt!258268) (index!24353 lt!258268) (index!24353 lt!258268) k!1914 a!3118 mask!3119))))

(declare-fun b!566731 () Bool)

(assert (=> b!566731 (= e!326154 e!326153)))

(assert (=> b!566731 (= lt!258267 (select (arr!17082 a!3118) (index!24353 lt!258268)))))

(declare-fun c!64958 () Bool)

(assert (=> b!566731 (= c!64958 (= lt!258267 k!1914))))

(assert (= (and d!84179 c!64959) b!566729))

(assert (= (and d!84179 (not c!64959)) b!566731))

(assert (= (and b!566731 c!64958) b!566726))

(assert (= (and b!566731 (not c!64958)) b!566728))

(assert (= (and b!566728 c!64960) b!566727))

(assert (= (and b!566728 (not c!64960)) b!566730))

(declare-fun m!545327 () Bool)

(assert (=> d!84179 m!545327))

(declare-fun m!545329 () Bool)

(assert (=> d!84179 m!545329))

(declare-fun m!545331 () Bool)

(assert (=> d!84179 m!545331))

(assert (=> d!84179 m!545329))

(declare-fun m!545333 () Bool)

(assert (=> d!84179 m!545333))

(assert (=> d!84179 m!545009))

(declare-fun m!545335 () Bool)

(assert (=> d!84179 m!545335))

(declare-fun m!545337 () Bool)

(assert (=> b!566730 m!545337))

(declare-fun m!545339 () Bool)

(assert (=> b!566731 m!545339))

(assert (=> b!566367 d!84179))

(declare-fun b!566732 () Bool)

(declare-fun e!326156 () SeekEntryResult!5531)

(declare-fun lt!258271 () SeekEntryResult!5531)

(assert (=> b!566732 (= e!326156 (Found!5531 (index!24353 lt!258271)))))

(declare-fun b!566733 () Bool)

(declare-fun e!326155 () SeekEntryResult!5531)

(assert (=> b!566733 (= e!326155 (MissingZero!5531 (index!24353 lt!258271)))))

(declare-fun b!566734 () Bool)

(declare-fun c!64963 () Bool)

(declare-fun lt!258270 () (_ BitVec 64))

(assert (=> b!566734 (= c!64963 (= lt!258270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566734 (= e!326156 e!326155)))

(declare-fun b!566735 () Bool)

(declare-fun e!326157 () SeekEntryResult!5531)

(assert (=> b!566735 (= e!326157 Undefined!5531)))

(declare-fun d!84181 () Bool)

(declare-fun lt!258269 () SeekEntryResult!5531)

(assert (=> d!84181 (and (or (is-Undefined!5531 lt!258269) (not (is-Found!5531 lt!258269)) (and (bvsge (index!24352 lt!258269) #b00000000000000000000000000000000) (bvslt (index!24352 lt!258269) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258269) (is-Found!5531 lt!258269) (not (is-MissingZero!5531 lt!258269)) (and (bvsge (index!24351 lt!258269) #b00000000000000000000000000000000) (bvslt (index!24351 lt!258269) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258269) (is-Found!5531 lt!258269) (is-MissingZero!5531 lt!258269) (not (is-MissingVacant!5531 lt!258269)) (and (bvsge (index!24354 lt!258269) #b00000000000000000000000000000000) (bvslt (index!24354 lt!258269) (size!17446 a!3118)))) (or (is-Undefined!5531 lt!258269) (ite (is-Found!5531 lt!258269) (= (select (arr!17082 a!3118) (index!24352 lt!258269)) (select (arr!17082 a!3118) j!142)) (ite (is-MissingZero!5531 lt!258269) (= (select (arr!17082 a!3118) (index!24351 lt!258269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5531 lt!258269) (= (select (arr!17082 a!3118) (index!24354 lt!258269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84181 (= lt!258269 e!326157)))

(declare-fun c!64962 () Bool)

(assert (=> d!84181 (= c!64962 (and (is-Intermediate!5531 lt!258271) (undefined!6343 lt!258271)))))

(assert (=> d!84181 (= lt!258271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17082 a!3118) j!142) mask!3119) (select (arr!17082 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84181 (validMask!0 mask!3119)))

(assert (=> d!84181 (= (seekEntryOrOpen!0 (select (arr!17082 a!3118) j!142) a!3118 mask!3119) lt!258269)))

(declare-fun b!566736 () Bool)

(assert (=> b!566736 (= e!326155 (seekKeyOrZeroReturnVacant!0 (x!53216 lt!258271) (index!24353 lt!258271) (index!24353 lt!258271) (select (arr!17082 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566737 () Bool)

(assert (=> b!566737 (= e!326157 e!326156)))

(assert (=> b!566737 (= lt!258270 (select (arr!17082 a!3118) (index!24353 lt!258271)))))

(declare-fun c!64961 () Bool)

(assert (=> b!566737 (= c!64961 (= lt!258270 (select (arr!17082 a!3118) j!142)))))

(assert (= (and d!84181 c!64962) b!566735))

(assert (= (and d!84181 (not c!64962)) b!566737))

(assert (= (and b!566737 c!64961) b!566732))

(assert (= (and b!566737 (not c!64961)) b!566734))

(assert (= (and b!566734 c!64963) b!566733))

(assert (= (and b!566734 (not c!64963)) b!566736))

(declare-fun m!545341 () Bool)

(assert (=> d!84181 m!545341))

(assert (=> d!84181 m!545013))

(assert (=> d!84181 m!545015))

(declare-fun m!545343 () Bool)

(assert (=> d!84181 m!545343))

(assert (=> d!84181 m!545015))

(assert (=> d!84181 m!545013))

(declare-fun m!545345 () Bool)

(assert (=> d!84181 m!545345))

(assert (=> d!84181 m!545009))

(declare-fun m!545347 () Bool)

(assert (=> d!84181 m!545347))

(assert (=> b!566736 m!545013))

(declare-fun m!545349 () Bool)

(assert (=> b!566736 m!545349))

(declare-fun m!545351 () Bool)

(assert (=> b!566737 m!545351))

(assert (=> b!566372 d!84181))

(declare-fun b!566738 () Bool)

(declare-fun e!326158 () Bool)

(declare-fun e!326159 () Bool)

(assert (=> b!566738 (= e!326158 e!326159)))

(declare-fun c!64964 () Bool)

(assert (=> b!566738 (= c!64964 (validKeyInArray!0 (select (arr!17082 a!3118) j!142)))))

(declare-fun b!566740 () Bool)

(declare-fun call!32498 () Bool)

(assert (=> b!566740 (= e!326159 call!32498)))

(declare-fun b!566741 () Bool)

(declare-fun e!326160 () Bool)

(assert (=> b!566741 (= e!326159 e!326160)))

(declare-fun lt!258273 () (_ BitVec 64))

(assert (=> b!566741 (= lt!258273 (select (arr!17082 a!3118) j!142))))

(declare-fun lt!258272 () Unit!17764)

(assert (=> b!566741 (= lt!258272 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258273 j!142))))

(assert (=> b!566741 (arrayContainsKey!0 a!3118 lt!258273 #b00000000000000000000000000000000)))

(declare-fun lt!258274 () Unit!17764)

(assert (=> b!566741 (= lt!258274 lt!258272)))

(declare-fun res!357508 () Bool)

(assert (=> b!566741 (= res!357508 (= (seekEntryOrOpen!0 (select (arr!17082 a!3118) j!142) a!3118 mask!3119) (Found!5531 j!142)))))

(assert (=> b!566741 (=> (not res!357508) (not e!326160))))

(declare-fun bm!32495 () Bool)

(assert (=> bm!32495 (= call!32498 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566739 () Bool)

(assert (=> b!566739 (= e!326160 call!32498)))

(declare-fun d!84183 () Bool)

(declare-fun res!357509 () Bool)

(assert (=> d!84183 (=> res!357509 e!326158)))

(assert (=> d!84183 (= res!357509 (bvsge j!142 (size!17446 a!3118)))))

(assert (=> d!84183 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326158)))

(assert (= (and d!84183 (not res!357509)) b!566738))

(assert (= (and b!566738 c!64964) b!566741))

(assert (= (and b!566738 (not c!64964)) b!566740))

(assert (= (and b!566741 res!357508) b!566739))

(assert (= (or b!566739 b!566740) bm!32495))

(assert (=> b!566738 m!545013))

(assert (=> b!566738 m!545013))

(assert (=> b!566738 m!545027))

(assert (=> b!566741 m!545013))

(declare-fun m!545353 () Bool)

(assert (=> b!566741 m!545353))

(declare-fun m!545355 () Bool)

(assert (=> b!566741 m!545355))

(assert (=> b!566741 m!545013))

(assert (=> b!566741 m!545029))

(declare-fun m!545357 () Bool)

(assert (=> bm!32495 m!545357))

(assert (=> b!566372 d!84183))

(declare-fun d!84185 () Bool)

(assert (=> d!84185 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258277 () Unit!17764)

(declare-fun choose!38 (array!35566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17764)

(assert (=> d!84185 (= lt!258277 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84185 (validMask!0 mask!3119)))

(assert (=> d!84185 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258277)))

(declare-fun bs!17598 () Bool)

(assert (= bs!17598 d!84185))

(assert (=> bs!17598 m!545031))

(declare-fun m!545359 () Bool)

(assert (=> bs!17598 m!545359))

(assert (=> bs!17598 m!545009))

(assert (=> b!566372 d!84185))

(push 1)

(assert (not bm!32495))

(assert (not b!566487))

(assert (not d!84185))

(assert (not b!566736))

(assert (not b!566682))

(assert (not b!566725))

(assert (not b!566683))

(assert (not b!566730))

(assert (not b!566490))

(assert (not d!84181))

(assert (not b!566552))

(assert (not b!566741))

(assert (not b!566561))

(assert (not d!84179))

(assert (not bm!32481))

(assert (not d!84129))

(assert (not d!84123))

(assert (not d!84103))

(assert (not b!566667))

(assert (not bm!32494))

(assert (not b!566680))

(assert (not b!566738))

(check-sat)

(pop 1)

