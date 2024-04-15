; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123716 () Bool)

(assert start!123716)

(declare-fun b!1434157 () Bool)

(declare-fun res!967729 () Bool)

(declare-fun e!809432 () Bool)

(assert (=> b!1434157 (=> (not res!967729) (not e!809432))))

(declare-datatypes ((SeekEntryResult!11380 0))(
  ( (MissingZero!11380 (index!47912 (_ BitVec 32))) (Found!11380 (index!47913 (_ BitVec 32))) (Intermediate!11380 (undefined!12192 Bool) (index!47914 (_ BitVec 32)) (x!129555 (_ BitVec 32))) (Undefined!11380) (MissingVacant!11380 (index!47915 (_ BitVec 32))) )
))
(declare-fun lt!631192 () SeekEntryResult!11380)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((array!97539 0))(
  ( (array!97540 (arr!47074 (Array (_ BitVec 32) (_ BitVec 64))) (size!47626 (_ BitVec 32))) )
))
(declare-fun lt!631196 () array!97539)

(declare-fun lt!631197 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97539 (_ BitVec 32)) SeekEntryResult!11380)

(assert (=> b!1434157 (= res!967729 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631197 lt!631196 mask!2608) lt!631192))))

(declare-fun b!1434158 () Bool)

(declare-fun res!967728 () Bool)

(assert (=> b!1434158 (=> (not res!967728) (not e!809432))))

(declare-fun lt!631193 () SeekEntryResult!11380)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97539)

(assert (=> b!1434158 (= res!967728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631193))))

(declare-fun b!1434159 () Bool)

(declare-fun e!809428 () Bool)

(declare-fun e!809427 () Bool)

(assert (=> b!1434159 (= e!809428 e!809427)))

(declare-fun res!967725 () Bool)

(assert (=> b!1434159 (=> res!967725 e!809427)))

(declare-fun lt!631195 () (_ BitVec 32))

(assert (=> b!1434159 (= res!967725 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631195 #b00000000000000000000000000000000) (bvsge lt!631195 (size!47626 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434159 (= lt!631195 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434160 () Bool)

(declare-fun res!967733 () Bool)

(declare-fun e!809431 () Bool)

(assert (=> b!1434160 (=> (not res!967733) (not e!809431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97539 (_ BitVec 32)) Bool)

(assert (=> b!1434160 (= res!967733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434161 () Bool)

(declare-fun res!967735 () Bool)

(assert (=> b!1434161 (=> (not res!967735) (not e!809431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434161 (= res!967735 (validKeyInArray!0 (select (arr!47074 a!2831) j!81)))))

(declare-fun b!1434162 () Bool)

(declare-fun e!809429 () Bool)

(assert (=> b!1434162 (= e!809431 e!809429)))

(declare-fun res!967731 () Bool)

(assert (=> b!1434162 (=> (not res!967731) (not e!809429))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434162 (= res!967731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631193))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434162 (= lt!631193 (Intermediate!11380 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434163 () Bool)

(assert (=> b!1434163 (= e!809429 e!809432)))

(declare-fun res!967730 () Bool)

(assert (=> b!1434163 (=> (not res!967730) (not e!809432))))

(assert (=> b!1434163 (= res!967730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631197 mask!2608) lt!631197 lt!631196 mask!2608) lt!631192))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434163 (= lt!631192 (Intermediate!11380 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434163 (= lt!631197 (select (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434163 (= lt!631196 (array!97540 (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47626 a!2831)))))

(declare-fun b!1434164 () Bool)

(assert (=> b!1434164 (= e!809432 (not e!809428))))

(declare-fun res!967726 () Bool)

(assert (=> b!1434164 (=> res!967726 e!809428)))

(assert (=> b!1434164 (= res!967726 (or (= (select (arr!47074 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47074 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47074 a!2831) index!585) (select (arr!47074 a!2831) j!81)) (= (select (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809430 () Bool)

(assert (=> b!1434164 e!809430))

(declare-fun res!967736 () Bool)

(assert (=> b!1434164 (=> (not res!967736) (not e!809430))))

(assert (=> b!1434164 (= res!967736 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48345 0))(
  ( (Unit!48346) )
))
(declare-fun lt!631194 () Unit!48345)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48345)

(assert (=> b!1434164 (= lt!631194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434166 () Bool)

(declare-fun res!967732 () Bool)

(assert (=> b!1434166 (=> (not res!967732) (not e!809431))))

(assert (=> b!1434166 (= res!967732 (and (= (size!47626 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47626 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47626 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434167 () Bool)

(declare-fun res!967738 () Bool)

(assert (=> b!1434167 (=> (not res!967738) (not e!809431))))

(assert (=> b!1434167 (= res!967738 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47626 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47626 a!2831))))))

(declare-fun b!1434168 () Bool)

(declare-fun res!967727 () Bool)

(assert (=> b!1434168 (=> (not res!967727) (not e!809432))))

(assert (=> b!1434168 (= res!967727 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434169 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97539 (_ BitVec 32)) SeekEntryResult!11380)

(assert (=> b!1434169 (= e!809430 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) (Found!11380 j!81)))))

(declare-fun b!1434170 () Bool)

(declare-fun res!967724 () Bool)

(assert (=> b!1434170 (=> (not res!967724) (not e!809431))))

(assert (=> b!1434170 (= res!967724 (validKeyInArray!0 (select (arr!47074 a!2831) i!982)))))

(declare-fun b!1434171 () Bool)

(declare-fun res!967737 () Bool)

(assert (=> b!1434171 (=> (not res!967737) (not e!809431))))

(declare-datatypes ((List!33662 0))(
  ( (Nil!33659) (Cons!33658 (h!34987 (_ BitVec 64)) (t!48348 List!33662)) )
))
(declare-fun arrayNoDuplicates!0 (array!97539 (_ BitVec 32) List!33662) Bool)

(assert (=> b!1434171 (= res!967737 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33659))))

(declare-fun res!967734 () Bool)

(assert (=> start!123716 (=> (not res!967734) (not e!809431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123716 (= res!967734 (validMask!0 mask!2608))))

(assert (=> start!123716 e!809431))

(assert (=> start!123716 true))

(declare-fun array_inv!36307 (array!97539) Bool)

(assert (=> start!123716 (array_inv!36307 a!2831)))

(declare-fun b!1434165 () Bool)

(assert (=> b!1434165 (= e!809427 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631195 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631193))))

(assert (= (and start!123716 res!967734) b!1434166))

(assert (= (and b!1434166 res!967732) b!1434170))

(assert (= (and b!1434170 res!967724) b!1434161))

(assert (= (and b!1434161 res!967735) b!1434160))

(assert (= (and b!1434160 res!967733) b!1434171))

(assert (= (and b!1434171 res!967737) b!1434167))

(assert (= (and b!1434167 res!967738) b!1434162))

(assert (= (and b!1434162 res!967731) b!1434163))

(assert (= (and b!1434163 res!967730) b!1434158))

(assert (= (and b!1434158 res!967728) b!1434157))

(assert (= (and b!1434157 res!967729) b!1434168))

(assert (= (and b!1434168 res!967727) b!1434164))

(assert (= (and b!1434164 res!967736) b!1434169))

(assert (= (and b!1434164 (not res!967726)) b!1434159))

(assert (= (and b!1434159 (not res!967725)) b!1434165))

(declare-fun m!1323293 () Bool)

(assert (=> b!1434158 m!1323293))

(assert (=> b!1434158 m!1323293))

(declare-fun m!1323295 () Bool)

(assert (=> b!1434158 m!1323295))

(declare-fun m!1323297 () Bool)

(assert (=> b!1434157 m!1323297))

(declare-fun m!1323299 () Bool)

(assert (=> b!1434163 m!1323299))

(assert (=> b!1434163 m!1323299))

(declare-fun m!1323301 () Bool)

(assert (=> b!1434163 m!1323301))

(declare-fun m!1323303 () Bool)

(assert (=> b!1434163 m!1323303))

(declare-fun m!1323305 () Bool)

(assert (=> b!1434163 m!1323305))

(assert (=> b!1434162 m!1323293))

(assert (=> b!1434162 m!1323293))

(declare-fun m!1323307 () Bool)

(assert (=> b!1434162 m!1323307))

(assert (=> b!1434162 m!1323307))

(assert (=> b!1434162 m!1323293))

(declare-fun m!1323309 () Bool)

(assert (=> b!1434162 m!1323309))

(declare-fun m!1323311 () Bool)

(assert (=> b!1434171 m!1323311))

(assert (=> b!1434164 m!1323303))

(declare-fun m!1323313 () Bool)

(assert (=> b!1434164 m!1323313))

(declare-fun m!1323315 () Bool)

(assert (=> b!1434164 m!1323315))

(declare-fun m!1323317 () Bool)

(assert (=> b!1434164 m!1323317))

(assert (=> b!1434164 m!1323293))

(declare-fun m!1323319 () Bool)

(assert (=> b!1434164 m!1323319))

(assert (=> b!1434165 m!1323293))

(assert (=> b!1434165 m!1323293))

(declare-fun m!1323321 () Bool)

(assert (=> b!1434165 m!1323321))

(declare-fun m!1323323 () Bool)

(assert (=> b!1434160 m!1323323))

(declare-fun m!1323325 () Bool)

(assert (=> b!1434159 m!1323325))

(assert (=> b!1434169 m!1323293))

(assert (=> b!1434169 m!1323293))

(declare-fun m!1323327 () Bool)

(assert (=> b!1434169 m!1323327))

(declare-fun m!1323329 () Bool)

(assert (=> start!123716 m!1323329))

(declare-fun m!1323331 () Bool)

(assert (=> start!123716 m!1323331))

(assert (=> b!1434161 m!1323293))

(assert (=> b!1434161 m!1323293))

(declare-fun m!1323333 () Bool)

(assert (=> b!1434161 m!1323333))

(declare-fun m!1323335 () Bool)

(assert (=> b!1434170 m!1323335))

(assert (=> b!1434170 m!1323335))

(declare-fun m!1323337 () Bool)

(assert (=> b!1434170 m!1323337))

(check-sat (not b!1434161) (not b!1434169) (not b!1434170) (not b!1434165) (not b!1434157) (not b!1434164) (not b!1434158) (not b!1434160) (not b!1434171) (not start!123716) (not b!1434159) (not b!1434162) (not b!1434163))
(check-sat)
(get-model)

(declare-fun bm!67496 () Bool)

(declare-fun call!67499 () Bool)

(assert (=> bm!67496 (= call!67499 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154023 () Bool)

(declare-fun res!967834 () Bool)

(declare-fun e!809482 () Bool)

(assert (=> d!154023 (=> res!967834 e!809482)))

(assert (=> d!154023 (= res!967834 (bvsge j!81 (size!47626 a!2831)))))

(assert (=> d!154023 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809482)))

(declare-fun b!1434270 () Bool)

(declare-fun e!809483 () Bool)

(assert (=> b!1434270 (= e!809483 call!67499)))

(declare-fun b!1434271 () Bool)

(assert (=> b!1434271 (= e!809482 e!809483)))

(declare-fun c!132721 () Bool)

(assert (=> b!1434271 (= c!132721 (validKeyInArray!0 (select (arr!47074 a!2831) j!81)))))

(declare-fun b!1434272 () Bool)

(declare-fun e!809484 () Bool)

(assert (=> b!1434272 (= e!809483 e!809484)))

(declare-fun lt!631240 () (_ BitVec 64))

(assert (=> b!1434272 (= lt!631240 (select (arr!47074 a!2831) j!81))))

(declare-fun lt!631242 () Unit!48345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97539 (_ BitVec 64) (_ BitVec 32)) Unit!48345)

(assert (=> b!1434272 (= lt!631242 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631240 j!81))))

(declare-fun arrayContainsKey!0 (array!97539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434272 (arrayContainsKey!0 a!2831 lt!631240 #b00000000000000000000000000000000)))

(declare-fun lt!631241 () Unit!48345)

(assert (=> b!1434272 (= lt!631241 lt!631242)))

(declare-fun res!967833 () Bool)

(assert (=> b!1434272 (= res!967833 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) (Found!11380 j!81)))))

(assert (=> b!1434272 (=> (not res!967833) (not e!809484))))

(declare-fun b!1434273 () Bool)

(assert (=> b!1434273 (= e!809484 call!67499)))

(assert (= (and d!154023 (not res!967834)) b!1434271))

(assert (= (and b!1434271 c!132721) b!1434272))

(assert (= (and b!1434271 (not c!132721)) b!1434270))

(assert (= (and b!1434272 res!967833) b!1434273))

(assert (= (or b!1434273 b!1434270) bm!67496))

(declare-fun m!1323431 () Bool)

(assert (=> bm!67496 m!1323431))

(assert (=> b!1434271 m!1323293))

(assert (=> b!1434271 m!1323293))

(assert (=> b!1434271 m!1323333))

(assert (=> b!1434272 m!1323293))

(declare-fun m!1323433 () Bool)

(assert (=> b!1434272 m!1323433))

(declare-fun m!1323435 () Bool)

(assert (=> b!1434272 m!1323435))

(assert (=> b!1434272 m!1323293))

(assert (=> b!1434272 m!1323327))

(assert (=> b!1434164 d!154023))

(declare-fun d!154025 () Bool)

(assert (=> d!154025 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631245 () Unit!48345)

(declare-fun choose!38 (array!97539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48345)

(assert (=> d!154025 (= lt!631245 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154025 (validMask!0 mask!2608)))

(assert (=> d!154025 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631245)))

(declare-fun bs!41728 () Bool)

(assert (= bs!41728 d!154025))

(assert (=> bs!41728 m!1323317))

(declare-fun m!1323437 () Bool)

(assert (=> bs!41728 m!1323437))

(assert (=> bs!41728 m!1323329))

(assert (=> b!1434164 d!154025))

(declare-fun b!1434307 () Bool)

(declare-fun lt!631250 () SeekEntryResult!11380)

(assert (=> b!1434307 (and (bvsge (index!47914 lt!631250) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631250) (size!47626 a!2831)))))

(declare-fun res!967852 () Bool)

(assert (=> b!1434307 (= res!967852 (= (select (arr!47074 a!2831) (index!47914 lt!631250)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809508 () Bool)

(assert (=> b!1434307 (=> res!967852 e!809508)))

(declare-fun e!809510 () SeekEntryResult!11380)

(declare-fun b!1434308 () Bool)

(assert (=> b!1434308 (= e!809510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631195 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434310 () Bool)

(assert (=> b!1434310 (and (bvsge (index!47914 lt!631250) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631250) (size!47626 a!2831)))))

(declare-fun res!967850 () Bool)

(assert (=> b!1434310 (= res!967850 (= (select (arr!47074 a!2831) (index!47914 lt!631250)) (select (arr!47074 a!2831) j!81)))))

(assert (=> b!1434310 (=> res!967850 e!809508)))

(declare-fun e!809511 () Bool)

(assert (=> b!1434310 (= e!809511 e!809508)))

(declare-fun b!1434311 () Bool)

(assert (=> b!1434311 (= e!809510 (Intermediate!11380 false lt!631195 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434312 () Bool)

(declare-fun e!809509 () SeekEntryResult!11380)

(assert (=> b!1434312 (= e!809509 e!809510)))

(declare-fun c!132731 () Bool)

(declare-fun lt!631251 () (_ BitVec 64))

(assert (=> b!1434312 (= c!132731 (or (= lt!631251 (select (arr!47074 a!2831) j!81)) (= (bvadd lt!631251 lt!631251) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434313 () Bool)

(assert (=> b!1434313 (= e!809509 (Intermediate!11380 true lt!631195 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434314 () Bool)

(declare-fun e!809507 () Bool)

(assert (=> b!1434314 (= e!809507 (bvsge (x!129555 lt!631250) #b01111111111111111111111111111110))))

(declare-fun b!1434315 () Bool)

(assert (=> b!1434315 (and (bvsge (index!47914 lt!631250) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631250) (size!47626 a!2831)))))

(assert (=> b!1434315 (= e!809508 (= (select (arr!47074 a!2831) (index!47914 lt!631250)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434309 () Bool)

(assert (=> b!1434309 (= e!809507 e!809511)))

(declare-fun res!967851 () Bool)

(get-info :version)

(assert (=> b!1434309 (= res!967851 (and ((_ is Intermediate!11380) lt!631250) (not (undefined!12192 lt!631250)) (bvslt (x!129555 lt!631250) #b01111111111111111111111111111110) (bvsge (x!129555 lt!631250) #b00000000000000000000000000000000) (bvsge (x!129555 lt!631250) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434309 (=> (not res!967851) (not e!809511))))

(declare-fun d!154027 () Bool)

(assert (=> d!154027 e!809507))

(declare-fun c!132733 () Bool)

(assert (=> d!154027 (= c!132733 (and ((_ is Intermediate!11380) lt!631250) (undefined!12192 lt!631250)))))

(assert (=> d!154027 (= lt!631250 e!809509)))

(declare-fun c!132732 () Bool)

(assert (=> d!154027 (= c!132732 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154027 (= lt!631251 (select (arr!47074 a!2831) lt!631195))))

(assert (=> d!154027 (validMask!0 mask!2608)))

(assert (=> d!154027 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631195 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631250)))

(assert (= (and d!154027 c!132732) b!1434313))

(assert (= (and d!154027 (not c!132732)) b!1434312))

(assert (= (and b!1434312 c!132731) b!1434311))

(assert (= (and b!1434312 (not c!132731)) b!1434308))

(assert (= (and d!154027 c!132733) b!1434314))

(assert (= (and d!154027 (not c!132733)) b!1434309))

(assert (= (and b!1434309 res!967851) b!1434310))

(assert (= (and b!1434310 (not res!967850)) b!1434307))

(assert (= (and b!1434307 (not res!967852)) b!1434315))

(declare-fun m!1323447 () Bool)

(assert (=> d!154027 m!1323447))

(assert (=> d!154027 m!1323329))

(declare-fun m!1323449 () Bool)

(assert (=> b!1434308 m!1323449))

(assert (=> b!1434308 m!1323449))

(assert (=> b!1434308 m!1323293))

(declare-fun m!1323451 () Bool)

(assert (=> b!1434308 m!1323451))

(declare-fun m!1323453 () Bool)

(assert (=> b!1434307 m!1323453))

(assert (=> b!1434310 m!1323453))

(assert (=> b!1434315 m!1323453))

(assert (=> b!1434165 d!154027))

(declare-fun b!1434316 () Bool)

(declare-fun lt!631252 () SeekEntryResult!11380)

(assert (=> b!1434316 (and (bvsge (index!47914 lt!631252) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631252) (size!47626 lt!631196)))))

(declare-fun res!967855 () Bool)

(assert (=> b!1434316 (= res!967855 (= (select (arr!47074 lt!631196) (index!47914 lt!631252)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809513 () Bool)

(assert (=> b!1434316 (=> res!967855 e!809513)))

(declare-fun b!1434317 () Bool)

(declare-fun e!809515 () SeekEntryResult!11380)

(assert (=> b!1434317 (= e!809515 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631197 lt!631196 mask!2608))))

(declare-fun b!1434319 () Bool)

(assert (=> b!1434319 (and (bvsge (index!47914 lt!631252) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631252) (size!47626 lt!631196)))))

(declare-fun res!967853 () Bool)

(assert (=> b!1434319 (= res!967853 (= (select (arr!47074 lt!631196) (index!47914 lt!631252)) lt!631197))))

(assert (=> b!1434319 (=> res!967853 e!809513)))

(declare-fun e!809516 () Bool)

(assert (=> b!1434319 (= e!809516 e!809513)))

(declare-fun b!1434320 () Bool)

(assert (=> b!1434320 (= e!809515 (Intermediate!11380 false index!585 x!605))))

(declare-fun b!1434321 () Bool)

(declare-fun e!809514 () SeekEntryResult!11380)

(assert (=> b!1434321 (= e!809514 e!809515)))

(declare-fun c!132734 () Bool)

(declare-fun lt!631253 () (_ BitVec 64))

(assert (=> b!1434321 (= c!132734 (or (= lt!631253 lt!631197) (= (bvadd lt!631253 lt!631253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434322 () Bool)

(assert (=> b!1434322 (= e!809514 (Intermediate!11380 true index!585 x!605))))

(declare-fun b!1434323 () Bool)

(declare-fun e!809512 () Bool)

(assert (=> b!1434323 (= e!809512 (bvsge (x!129555 lt!631252) #b01111111111111111111111111111110))))

(declare-fun b!1434324 () Bool)

(assert (=> b!1434324 (and (bvsge (index!47914 lt!631252) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631252) (size!47626 lt!631196)))))

(assert (=> b!1434324 (= e!809513 (= (select (arr!47074 lt!631196) (index!47914 lt!631252)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434318 () Bool)

(assert (=> b!1434318 (= e!809512 e!809516)))

(declare-fun res!967854 () Bool)

(assert (=> b!1434318 (= res!967854 (and ((_ is Intermediate!11380) lt!631252) (not (undefined!12192 lt!631252)) (bvslt (x!129555 lt!631252) #b01111111111111111111111111111110) (bvsge (x!129555 lt!631252) #b00000000000000000000000000000000) (bvsge (x!129555 lt!631252) x!605)))))

(assert (=> b!1434318 (=> (not res!967854) (not e!809516))))

(declare-fun d!154033 () Bool)

(assert (=> d!154033 e!809512))

(declare-fun c!132736 () Bool)

(assert (=> d!154033 (= c!132736 (and ((_ is Intermediate!11380) lt!631252) (undefined!12192 lt!631252)))))

(assert (=> d!154033 (= lt!631252 e!809514)))

(declare-fun c!132735 () Bool)

(assert (=> d!154033 (= c!132735 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154033 (= lt!631253 (select (arr!47074 lt!631196) index!585))))

(assert (=> d!154033 (validMask!0 mask!2608)))

(assert (=> d!154033 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631197 lt!631196 mask!2608) lt!631252)))

(assert (= (and d!154033 c!132735) b!1434322))

(assert (= (and d!154033 (not c!132735)) b!1434321))

(assert (= (and b!1434321 c!132734) b!1434320))

(assert (= (and b!1434321 (not c!132734)) b!1434317))

(assert (= (and d!154033 c!132736) b!1434323))

(assert (= (and d!154033 (not c!132736)) b!1434318))

(assert (= (and b!1434318 res!967854) b!1434319))

(assert (= (and b!1434319 (not res!967853)) b!1434316))

(assert (= (and b!1434316 (not res!967855)) b!1434324))

(declare-fun m!1323455 () Bool)

(assert (=> d!154033 m!1323455))

(assert (=> d!154033 m!1323329))

(assert (=> b!1434317 m!1323325))

(assert (=> b!1434317 m!1323325))

(declare-fun m!1323457 () Bool)

(assert (=> b!1434317 m!1323457))

(declare-fun m!1323459 () Bool)

(assert (=> b!1434316 m!1323459))

(assert (=> b!1434319 m!1323459))

(assert (=> b!1434324 m!1323459))

(assert (=> b!1434157 d!154033))

(declare-fun b!1434325 () Bool)

(declare-fun lt!631254 () SeekEntryResult!11380)

(assert (=> b!1434325 (and (bvsge (index!47914 lt!631254) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631254) (size!47626 a!2831)))))

(declare-fun res!967858 () Bool)

(assert (=> b!1434325 (= res!967858 (= (select (arr!47074 a!2831) (index!47914 lt!631254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809518 () Bool)

(assert (=> b!1434325 (=> res!967858 e!809518)))

(declare-fun e!809520 () SeekEntryResult!11380)

(declare-fun b!1434326 () Bool)

(assert (=> b!1434326 (= e!809520 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434328 () Bool)

(assert (=> b!1434328 (and (bvsge (index!47914 lt!631254) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631254) (size!47626 a!2831)))))

(declare-fun res!967856 () Bool)

(assert (=> b!1434328 (= res!967856 (= (select (arr!47074 a!2831) (index!47914 lt!631254)) (select (arr!47074 a!2831) j!81)))))

(assert (=> b!1434328 (=> res!967856 e!809518)))

(declare-fun e!809521 () Bool)

(assert (=> b!1434328 (= e!809521 e!809518)))

(declare-fun b!1434329 () Bool)

(assert (=> b!1434329 (= e!809520 (Intermediate!11380 false index!585 x!605))))

(declare-fun b!1434330 () Bool)

(declare-fun e!809519 () SeekEntryResult!11380)

(assert (=> b!1434330 (= e!809519 e!809520)))

(declare-fun c!132737 () Bool)

(declare-fun lt!631255 () (_ BitVec 64))

(assert (=> b!1434330 (= c!132737 (or (= lt!631255 (select (arr!47074 a!2831) j!81)) (= (bvadd lt!631255 lt!631255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434331 () Bool)

(assert (=> b!1434331 (= e!809519 (Intermediate!11380 true index!585 x!605))))

(declare-fun b!1434332 () Bool)

(declare-fun e!809517 () Bool)

(assert (=> b!1434332 (= e!809517 (bvsge (x!129555 lt!631254) #b01111111111111111111111111111110))))

(declare-fun b!1434333 () Bool)

(assert (=> b!1434333 (and (bvsge (index!47914 lt!631254) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631254) (size!47626 a!2831)))))

(assert (=> b!1434333 (= e!809518 (= (select (arr!47074 a!2831) (index!47914 lt!631254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434327 () Bool)

(assert (=> b!1434327 (= e!809517 e!809521)))

(declare-fun res!967857 () Bool)

(assert (=> b!1434327 (= res!967857 (and ((_ is Intermediate!11380) lt!631254) (not (undefined!12192 lt!631254)) (bvslt (x!129555 lt!631254) #b01111111111111111111111111111110) (bvsge (x!129555 lt!631254) #b00000000000000000000000000000000) (bvsge (x!129555 lt!631254) x!605)))))

(assert (=> b!1434327 (=> (not res!967857) (not e!809521))))

(declare-fun d!154035 () Bool)

(assert (=> d!154035 e!809517))

(declare-fun c!132739 () Bool)

(assert (=> d!154035 (= c!132739 (and ((_ is Intermediate!11380) lt!631254) (undefined!12192 lt!631254)))))

(assert (=> d!154035 (= lt!631254 e!809519)))

(declare-fun c!132738 () Bool)

(assert (=> d!154035 (= c!132738 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154035 (= lt!631255 (select (arr!47074 a!2831) index!585))))

(assert (=> d!154035 (validMask!0 mask!2608)))

(assert (=> d!154035 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631254)))

(assert (= (and d!154035 c!132738) b!1434331))

(assert (= (and d!154035 (not c!132738)) b!1434330))

(assert (= (and b!1434330 c!132737) b!1434329))

(assert (= (and b!1434330 (not c!132737)) b!1434326))

(assert (= (and d!154035 c!132739) b!1434332))

(assert (= (and d!154035 (not c!132739)) b!1434327))

(assert (= (and b!1434327 res!967857) b!1434328))

(assert (= (and b!1434328 (not res!967856)) b!1434325))

(assert (= (and b!1434325 (not res!967858)) b!1434333))

(assert (=> d!154035 m!1323315))

(assert (=> d!154035 m!1323329))

(assert (=> b!1434326 m!1323325))

(assert (=> b!1434326 m!1323325))

(assert (=> b!1434326 m!1323293))

(declare-fun m!1323461 () Bool)

(assert (=> b!1434326 m!1323461))

(declare-fun m!1323463 () Bool)

(assert (=> b!1434325 m!1323463))

(assert (=> b!1434328 m!1323463))

(assert (=> b!1434333 m!1323463))

(assert (=> b!1434158 d!154035))

(declare-fun b!1434389 () Bool)

(declare-fun e!809556 () SeekEntryResult!11380)

(assert (=> b!1434389 (= e!809556 Undefined!11380)))

(declare-fun b!1434390 () Bool)

(declare-fun e!809557 () SeekEntryResult!11380)

(assert (=> b!1434390 (= e!809556 e!809557)))

(declare-fun lt!631284 () (_ BitVec 64))

(declare-fun lt!631283 () SeekEntryResult!11380)

(assert (=> b!1434390 (= lt!631284 (select (arr!47074 a!2831) (index!47914 lt!631283)))))

(declare-fun c!132761 () Bool)

(assert (=> b!1434390 (= c!132761 (= lt!631284 (select (arr!47074 a!2831) j!81)))))

(declare-fun b!1434391 () Bool)

(declare-fun c!132759 () Bool)

(assert (=> b!1434391 (= c!132759 (= lt!631284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809555 () SeekEntryResult!11380)

(assert (=> b!1434391 (= e!809557 e!809555)))

(declare-fun b!1434392 () Bool)

(assert (=> b!1434392 (= e!809557 (Found!11380 (index!47914 lt!631283)))))

(declare-fun b!1434393 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97539 (_ BitVec 32)) SeekEntryResult!11380)

(assert (=> b!1434393 (= e!809555 (seekKeyOrZeroReturnVacant!0 (x!129555 lt!631283) (index!47914 lt!631283) (index!47914 lt!631283) (select (arr!47074 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434394 () Bool)

(assert (=> b!1434394 (= e!809555 (MissingZero!11380 (index!47914 lt!631283)))))

(declare-fun d!154039 () Bool)

(declare-fun lt!631285 () SeekEntryResult!11380)

(assert (=> d!154039 (and (or ((_ is Undefined!11380) lt!631285) (not ((_ is Found!11380) lt!631285)) (and (bvsge (index!47913 lt!631285) #b00000000000000000000000000000000) (bvslt (index!47913 lt!631285) (size!47626 a!2831)))) (or ((_ is Undefined!11380) lt!631285) ((_ is Found!11380) lt!631285) (not ((_ is MissingZero!11380) lt!631285)) (and (bvsge (index!47912 lt!631285) #b00000000000000000000000000000000) (bvslt (index!47912 lt!631285) (size!47626 a!2831)))) (or ((_ is Undefined!11380) lt!631285) ((_ is Found!11380) lt!631285) ((_ is MissingZero!11380) lt!631285) (not ((_ is MissingVacant!11380) lt!631285)) (and (bvsge (index!47915 lt!631285) #b00000000000000000000000000000000) (bvslt (index!47915 lt!631285) (size!47626 a!2831)))) (or ((_ is Undefined!11380) lt!631285) (ite ((_ is Found!11380) lt!631285) (= (select (arr!47074 a!2831) (index!47913 lt!631285)) (select (arr!47074 a!2831) j!81)) (ite ((_ is MissingZero!11380) lt!631285) (= (select (arr!47074 a!2831) (index!47912 lt!631285)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11380) lt!631285) (= (select (arr!47074 a!2831) (index!47915 lt!631285)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154039 (= lt!631285 e!809556)))

(declare-fun c!132760 () Bool)

(assert (=> d!154039 (= c!132760 (and ((_ is Intermediate!11380) lt!631283) (undefined!12192 lt!631283)))))

(assert (=> d!154039 (= lt!631283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154039 (validMask!0 mask!2608)))

(assert (=> d!154039 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631285)))

(assert (= (and d!154039 c!132760) b!1434389))

(assert (= (and d!154039 (not c!132760)) b!1434390))

(assert (= (and b!1434390 c!132761) b!1434392))

(assert (= (and b!1434390 (not c!132761)) b!1434391))

(assert (= (and b!1434391 c!132759) b!1434394))

(assert (= (and b!1434391 (not c!132759)) b!1434393))

(declare-fun m!1323487 () Bool)

(assert (=> b!1434390 m!1323487))

(assert (=> b!1434393 m!1323293))

(declare-fun m!1323491 () Bool)

(assert (=> b!1434393 m!1323491))

(declare-fun m!1323493 () Bool)

(assert (=> d!154039 m!1323493))

(assert (=> d!154039 m!1323293))

(assert (=> d!154039 m!1323307))

(assert (=> d!154039 m!1323307))

(assert (=> d!154039 m!1323293))

(assert (=> d!154039 m!1323309))

(declare-fun m!1323495 () Bool)

(assert (=> d!154039 m!1323495))

(assert (=> d!154039 m!1323329))

(declare-fun m!1323497 () Bool)

(assert (=> d!154039 m!1323497))

(assert (=> b!1434169 d!154039))

(declare-fun d!154049 () Bool)

(assert (=> d!154049 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123716 d!154049))

(declare-fun d!154055 () Bool)

(assert (=> d!154055 (= (array_inv!36307 a!2831) (bvsge (size!47626 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123716 d!154055))

(declare-fun d!154059 () Bool)

(assert (=> d!154059 (= (validKeyInArray!0 (select (arr!47074 a!2831) i!982)) (and (not (= (select (arr!47074 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47074 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434170 d!154059))

(declare-fun d!154061 () Bool)

(declare-fun lt!631303 () (_ BitVec 32))

(assert (=> d!154061 (and (bvsge lt!631303 #b00000000000000000000000000000000) (bvslt lt!631303 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154061 (= lt!631303 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154061 (validMask!0 mask!2608)))

(assert (=> d!154061 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631303)))

(declare-fun bs!41730 () Bool)

(assert (= bs!41730 d!154061))

(declare-fun m!1323509 () Bool)

(assert (=> bs!41730 m!1323509))

(assert (=> bs!41730 m!1323329))

(assert (=> b!1434159 d!154061))

(declare-fun bm!67504 () Bool)

(declare-fun call!67507 () Bool)

(assert (=> bm!67504 (= call!67507 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154063 () Bool)

(declare-fun res!967878 () Bool)

(declare-fun e!809567 () Bool)

(assert (=> d!154063 (=> res!967878 e!809567)))

(assert (=> d!154063 (= res!967878 (bvsge #b00000000000000000000000000000000 (size!47626 a!2831)))))

(assert (=> d!154063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809567)))

(declare-fun b!1434413 () Bool)

(declare-fun e!809568 () Bool)

(assert (=> b!1434413 (= e!809568 call!67507)))

(declare-fun b!1434414 () Bool)

(assert (=> b!1434414 (= e!809567 e!809568)))

(declare-fun c!132771 () Bool)

(assert (=> b!1434414 (= c!132771 (validKeyInArray!0 (select (arr!47074 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434415 () Bool)

(declare-fun e!809569 () Bool)

(assert (=> b!1434415 (= e!809568 e!809569)))

(declare-fun lt!631304 () (_ BitVec 64))

(assert (=> b!1434415 (= lt!631304 (select (arr!47074 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631306 () Unit!48345)

(assert (=> b!1434415 (= lt!631306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631304 #b00000000000000000000000000000000))))

(assert (=> b!1434415 (arrayContainsKey!0 a!2831 lt!631304 #b00000000000000000000000000000000)))

(declare-fun lt!631305 () Unit!48345)

(assert (=> b!1434415 (= lt!631305 lt!631306)))

(declare-fun res!967877 () Bool)

(assert (=> b!1434415 (= res!967877 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11380 #b00000000000000000000000000000000)))))

(assert (=> b!1434415 (=> (not res!967877) (not e!809569))))

(declare-fun b!1434416 () Bool)

(assert (=> b!1434416 (= e!809569 call!67507)))

(assert (= (and d!154063 (not res!967878)) b!1434414))

(assert (= (and b!1434414 c!132771) b!1434415))

(assert (= (and b!1434414 (not c!132771)) b!1434413))

(assert (= (and b!1434415 res!967877) b!1434416))

(assert (= (or b!1434416 b!1434413) bm!67504))

(declare-fun m!1323511 () Bool)

(assert (=> bm!67504 m!1323511))

(declare-fun m!1323513 () Bool)

(assert (=> b!1434414 m!1323513))

(assert (=> b!1434414 m!1323513))

(declare-fun m!1323515 () Bool)

(assert (=> b!1434414 m!1323515))

(assert (=> b!1434415 m!1323513))

(declare-fun m!1323517 () Bool)

(assert (=> b!1434415 m!1323517))

(declare-fun m!1323519 () Bool)

(assert (=> b!1434415 m!1323519))

(assert (=> b!1434415 m!1323513))

(declare-fun m!1323521 () Bool)

(assert (=> b!1434415 m!1323521))

(assert (=> b!1434160 d!154063))

(declare-fun b!1434439 () Bool)

(declare-fun e!809584 () Bool)

(declare-fun e!809587 () Bool)

(assert (=> b!1434439 (= e!809584 e!809587)))

(declare-fun res!967885 () Bool)

(assert (=> b!1434439 (=> (not res!967885) (not e!809587))))

(declare-fun e!809585 () Bool)

(assert (=> b!1434439 (= res!967885 (not e!809585))))

(declare-fun res!967886 () Bool)

(assert (=> b!1434439 (=> (not res!967886) (not e!809585))))

(assert (=> b!1434439 (= res!967886 (validKeyInArray!0 (select (arr!47074 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434440 () Bool)

(declare-fun contains!9834 (List!33662 (_ BitVec 64)) Bool)

(assert (=> b!1434440 (= e!809585 (contains!9834 Nil!33659 (select (arr!47074 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67507 () Bool)

(declare-fun call!67510 () Bool)

(declare-fun c!132780 () Bool)

(assert (=> bm!67507 (= call!67510 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132780 (Cons!33658 (select (arr!47074 a!2831) #b00000000000000000000000000000000) Nil!33659) Nil!33659)))))

(declare-fun b!1434441 () Bool)

(declare-fun e!809586 () Bool)

(assert (=> b!1434441 (= e!809586 call!67510)))

(declare-fun d!154065 () Bool)

(declare-fun res!967887 () Bool)

(assert (=> d!154065 (=> res!967887 e!809584)))

(assert (=> d!154065 (= res!967887 (bvsge #b00000000000000000000000000000000 (size!47626 a!2831)))))

(assert (=> d!154065 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33659) e!809584)))

(declare-fun b!1434442 () Bool)

(assert (=> b!1434442 (= e!809586 call!67510)))

(declare-fun b!1434443 () Bool)

(assert (=> b!1434443 (= e!809587 e!809586)))

(assert (=> b!1434443 (= c!132780 (validKeyInArray!0 (select (arr!47074 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154065 (not res!967887)) b!1434439))

(assert (= (and b!1434439 res!967886) b!1434440))

(assert (= (and b!1434439 res!967885) b!1434443))

(assert (= (and b!1434443 c!132780) b!1434441))

(assert (= (and b!1434443 (not c!132780)) b!1434442))

(assert (= (or b!1434441 b!1434442) bm!67507))

(assert (=> b!1434439 m!1323513))

(assert (=> b!1434439 m!1323513))

(assert (=> b!1434439 m!1323515))

(assert (=> b!1434440 m!1323513))

(assert (=> b!1434440 m!1323513))

(declare-fun m!1323523 () Bool)

(assert (=> b!1434440 m!1323523))

(assert (=> bm!67507 m!1323513))

(declare-fun m!1323525 () Bool)

(assert (=> bm!67507 m!1323525))

(assert (=> b!1434443 m!1323513))

(assert (=> b!1434443 m!1323513))

(assert (=> b!1434443 m!1323515))

(assert (=> b!1434171 d!154065))

(declare-fun d!154071 () Bool)

(assert (=> d!154071 (= (validKeyInArray!0 (select (arr!47074 a!2831) j!81)) (and (not (= (select (arr!47074 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47074 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434161 d!154071))

(declare-fun b!1434444 () Bool)

(declare-fun lt!631313 () SeekEntryResult!11380)

(assert (=> b!1434444 (and (bvsge (index!47914 lt!631313) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631313) (size!47626 a!2831)))))

(declare-fun res!967890 () Bool)

(assert (=> b!1434444 (= res!967890 (= (select (arr!47074 a!2831) (index!47914 lt!631313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809589 () Bool)

(assert (=> b!1434444 (=> res!967890 e!809589)))

(declare-fun e!809591 () SeekEntryResult!11380)

(declare-fun b!1434445 () Bool)

(assert (=> b!1434445 (= e!809591 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434447 () Bool)

(assert (=> b!1434447 (and (bvsge (index!47914 lt!631313) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631313) (size!47626 a!2831)))))

(declare-fun res!967888 () Bool)

(assert (=> b!1434447 (= res!967888 (= (select (arr!47074 a!2831) (index!47914 lt!631313)) (select (arr!47074 a!2831) j!81)))))

(assert (=> b!1434447 (=> res!967888 e!809589)))

(declare-fun e!809592 () Bool)

(assert (=> b!1434447 (= e!809592 e!809589)))

(declare-fun b!1434448 () Bool)

(assert (=> b!1434448 (= e!809591 (Intermediate!11380 false (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434449 () Bool)

(declare-fun e!809590 () SeekEntryResult!11380)

(assert (=> b!1434449 (= e!809590 e!809591)))

(declare-fun c!132781 () Bool)

(declare-fun lt!631314 () (_ BitVec 64))

(assert (=> b!1434449 (= c!132781 (or (= lt!631314 (select (arr!47074 a!2831) j!81)) (= (bvadd lt!631314 lt!631314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434450 () Bool)

(assert (=> b!1434450 (= e!809590 (Intermediate!11380 true (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434451 () Bool)

(declare-fun e!809588 () Bool)

(assert (=> b!1434451 (= e!809588 (bvsge (x!129555 lt!631313) #b01111111111111111111111111111110))))

(declare-fun b!1434452 () Bool)

(assert (=> b!1434452 (and (bvsge (index!47914 lt!631313) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631313) (size!47626 a!2831)))))

(assert (=> b!1434452 (= e!809589 (= (select (arr!47074 a!2831) (index!47914 lt!631313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434446 () Bool)

(assert (=> b!1434446 (= e!809588 e!809592)))

(declare-fun res!967889 () Bool)

(assert (=> b!1434446 (= res!967889 (and ((_ is Intermediate!11380) lt!631313) (not (undefined!12192 lt!631313)) (bvslt (x!129555 lt!631313) #b01111111111111111111111111111110) (bvsge (x!129555 lt!631313) #b00000000000000000000000000000000) (bvsge (x!129555 lt!631313) #b00000000000000000000000000000000)))))

(assert (=> b!1434446 (=> (not res!967889) (not e!809592))))

(declare-fun d!154073 () Bool)

(assert (=> d!154073 e!809588))

(declare-fun c!132783 () Bool)

(assert (=> d!154073 (= c!132783 (and ((_ is Intermediate!11380) lt!631313) (undefined!12192 lt!631313)))))

(assert (=> d!154073 (= lt!631313 e!809590)))

(declare-fun c!132782 () Bool)

(assert (=> d!154073 (= c!132782 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154073 (= lt!631314 (select (arr!47074 a!2831) (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608)))))

(assert (=> d!154073 (validMask!0 mask!2608)))

(assert (=> d!154073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!631313)))

(assert (= (and d!154073 c!132782) b!1434450))

(assert (= (and d!154073 (not c!132782)) b!1434449))

(assert (= (and b!1434449 c!132781) b!1434448))

(assert (= (and b!1434449 (not c!132781)) b!1434445))

(assert (= (and d!154073 c!132783) b!1434451))

(assert (= (and d!154073 (not c!132783)) b!1434446))

(assert (= (and b!1434446 res!967889) b!1434447))

(assert (= (and b!1434447 (not res!967888)) b!1434444))

(assert (= (and b!1434444 (not res!967890)) b!1434452))

(assert (=> d!154073 m!1323307))

(declare-fun m!1323527 () Bool)

(assert (=> d!154073 m!1323527))

(assert (=> d!154073 m!1323329))

(assert (=> b!1434445 m!1323307))

(declare-fun m!1323529 () Bool)

(assert (=> b!1434445 m!1323529))

(assert (=> b!1434445 m!1323529))

(assert (=> b!1434445 m!1323293))

(declare-fun m!1323531 () Bool)

(assert (=> b!1434445 m!1323531))

(declare-fun m!1323533 () Bool)

(assert (=> b!1434444 m!1323533))

(assert (=> b!1434447 m!1323533))

(assert (=> b!1434452 m!1323533))

(assert (=> b!1434162 d!154073))

(declare-fun d!154075 () Bool)

(declare-fun lt!631325 () (_ BitVec 32))

(declare-fun lt!631324 () (_ BitVec 32))

(assert (=> d!154075 (= lt!631325 (bvmul (bvxor lt!631324 (bvlshr lt!631324 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154075 (= lt!631324 ((_ extract 31 0) (bvand (bvxor (select (arr!47074 a!2831) j!81) (bvlshr (select (arr!47074 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154075 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967891 (let ((h!34991 ((_ extract 31 0) (bvand (bvxor (select (arr!47074 a!2831) j!81) (bvlshr (select (arr!47074 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129562 (bvmul (bvxor h!34991 (bvlshr h!34991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129562 (bvlshr x!129562 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967891 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967891 #b00000000000000000000000000000000))))))

(assert (=> d!154075 (= (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (bvand (bvxor lt!631325 (bvlshr lt!631325 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434162 d!154075))

(declare-fun b!1434468 () Bool)

(declare-fun lt!631326 () SeekEntryResult!11380)

(assert (=> b!1434468 (and (bvsge (index!47914 lt!631326) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631326) (size!47626 lt!631196)))))

(declare-fun res!967897 () Bool)

(assert (=> b!1434468 (= res!967897 (= (select (arr!47074 lt!631196) (index!47914 lt!631326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809602 () Bool)

(assert (=> b!1434468 (=> res!967897 e!809602)))

(declare-fun b!1434469 () Bool)

(declare-fun e!809604 () SeekEntryResult!11380)

(assert (=> b!1434469 (= e!809604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631197 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631197 lt!631196 mask!2608))))

(declare-fun b!1434471 () Bool)

(assert (=> b!1434471 (and (bvsge (index!47914 lt!631326) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631326) (size!47626 lt!631196)))))

(declare-fun res!967895 () Bool)

(assert (=> b!1434471 (= res!967895 (= (select (arr!47074 lt!631196) (index!47914 lt!631326)) lt!631197))))

(assert (=> b!1434471 (=> res!967895 e!809602)))

(declare-fun e!809605 () Bool)

(assert (=> b!1434471 (= e!809605 e!809602)))

(declare-fun b!1434472 () Bool)

(assert (=> b!1434472 (= e!809604 (Intermediate!11380 false (toIndex!0 lt!631197 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434473 () Bool)

(declare-fun e!809603 () SeekEntryResult!11380)

(assert (=> b!1434473 (= e!809603 e!809604)))

(declare-fun c!132790 () Bool)

(declare-fun lt!631327 () (_ BitVec 64))

(assert (=> b!1434473 (= c!132790 (or (= lt!631327 lt!631197) (= (bvadd lt!631327 lt!631327) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434474 () Bool)

(assert (=> b!1434474 (= e!809603 (Intermediate!11380 true (toIndex!0 lt!631197 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434475 () Bool)

(declare-fun e!809601 () Bool)

(assert (=> b!1434475 (= e!809601 (bvsge (x!129555 lt!631326) #b01111111111111111111111111111110))))

(declare-fun b!1434476 () Bool)

(assert (=> b!1434476 (and (bvsge (index!47914 lt!631326) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631326) (size!47626 lt!631196)))))

(assert (=> b!1434476 (= e!809602 (= (select (arr!47074 lt!631196) (index!47914 lt!631326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434470 () Bool)

(assert (=> b!1434470 (= e!809601 e!809605)))

(declare-fun res!967896 () Bool)

(assert (=> b!1434470 (= res!967896 (and ((_ is Intermediate!11380) lt!631326) (not (undefined!12192 lt!631326)) (bvslt (x!129555 lt!631326) #b01111111111111111111111111111110) (bvsge (x!129555 lt!631326) #b00000000000000000000000000000000) (bvsge (x!129555 lt!631326) #b00000000000000000000000000000000)))))

(assert (=> b!1434470 (=> (not res!967896) (not e!809605))))

(declare-fun d!154081 () Bool)

(assert (=> d!154081 e!809601))

(declare-fun c!132792 () Bool)

(assert (=> d!154081 (= c!132792 (and ((_ is Intermediate!11380) lt!631326) (undefined!12192 lt!631326)))))

(assert (=> d!154081 (= lt!631326 e!809603)))

(declare-fun c!132791 () Bool)

(assert (=> d!154081 (= c!132791 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154081 (= lt!631327 (select (arr!47074 lt!631196) (toIndex!0 lt!631197 mask!2608)))))

(assert (=> d!154081 (validMask!0 mask!2608)))

(assert (=> d!154081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631197 mask!2608) lt!631197 lt!631196 mask!2608) lt!631326)))

(assert (= (and d!154081 c!132791) b!1434474))

(assert (= (and d!154081 (not c!132791)) b!1434473))

(assert (= (and b!1434473 c!132790) b!1434472))

(assert (= (and b!1434473 (not c!132790)) b!1434469))

(assert (= (and d!154081 c!132792) b!1434475))

(assert (= (and d!154081 (not c!132792)) b!1434470))

(assert (= (and b!1434470 res!967896) b!1434471))

(assert (= (and b!1434471 (not res!967895)) b!1434468))

(assert (= (and b!1434468 (not res!967897)) b!1434476))

(assert (=> d!154081 m!1323299))

(declare-fun m!1323549 () Bool)

(assert (=> d!154081 m!1323549))

(assert (=> d!154081 m!1323329))

(assert (=> b!1434469 m!1323299))

(declare-fun m!1323551 () Bool)

(assert (=> b!1434469 m!1323551))

(assert (=> b!1434469 m!1323551))

(declare-fun m!1323553 () Bool)

(assert (=> b!1434469 m!1323553))

(declare-fun m!1323555 () Bool)

(assert (=> b!1434468 m!1323555))

(assert (=> b!1434471 m!1323555))

(assert (=> b!1434476 m!1323555))

(assert (=> b!1434163 d!154081))

(declare-fun d!154083 () Bool)

(declare-fun lt!631329 () (_ BitVec 32))

(declare-fun lt!631328 () (_ BitVec 32))

(assert (=> d!154083 (= lt!631329 (bvmul (bvxor lt!631328 (bvlshr lt!631328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154083 (= lt!631328 ((_ extract 31 0) (bvand (bvxor lt!631197 (bvlshr lt!631197 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154083 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967891 (let ((h!34991 ((_ extract 31 0) (bvand (bvxor lt!631197 (bvlshr lt!631197 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129562 (bvmul (bvxor h!34991 (bvlshr h!34991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129562 (bvlshr x!129562 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967891 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967891 #b00000000000000000000000000000000))))))

(assert (=> d!154083 (= (toIndex!0 lt!631197 mask!2608) (bvand (bvxor lt!631329 (bvlshr lt!631329 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434163 d!154083))

(check-sat (not b!1434414) (not b!1434439) (not b!1434271) (not d!154081) (not d!154061) (not d!154027) (not b!1434272) (not d!154025) (not d!154035) (not bm!67504) (not b!1434326) (not b!1434469) (not d!154033) (not b!1434393) (not b!1434445) (not b!1434308) (not b!1434415) (not d!154073) (not bm!67496) (not b!1434440) (not d!154039) (not b!1434317) (not b!1434443) (not bm!67507))
(check-sat)
