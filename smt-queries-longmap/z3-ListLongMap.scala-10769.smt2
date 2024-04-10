; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125994 () Bool)

(assert start!125994)

(declare-fun b!1475264 () Bool)

(declare-fun res!1002125 () Bool)

(declare-fun e!827696 () Bool)

(assert (=> b!1475264 (=> (not res!1002125) (not e!827696))))

(declare-datatypes ((array!99214 0))(
  ( (array!99215 (arr!47889 (Array (_ BitVec 32) (_ BitVec 64))) (size!48439 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99214)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475264 (= res!1002125 (validKeyInArray!0 (select (arr!47889 a!2862) j!93)))))

(declare-fun b!1475265 () Bool)

(declare-fun e!827689 () Bool)

(declare-fun e!827691 () Bool)

(assert (=> b!1475265 (= e!827689 e!827691)))

(declare-fun res!1002127 () Bool)

(assert (=> b!1475265 (=> (not res!1002127) (not e!827691))))

(declare-datatypes ((SeekEntryResult!12129 0))(
  ( (MissingZero!12129 (index!50908 (_ BitVec 32))) (Found!12129 (index!50909 (_ BitVec 32))) (Intermediate!12129 (undefined!12941 Bool) (index!50910 (_ BitVec 32)) (x!132494 (_ BitVec 32))) (Undefined!12129) (MissingVacant!12129 (index!50911 (_ BitVec 32))) )
))
(declare-fun lt!644557 () SeekEntryResult!12129)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475265 (= res!1002127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644557))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475265 (= lt!644557 (Intermediate!12129 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1002130 () Bool)

(assert (=> start!125994 (=> (not res!1002130) (not e!827696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125994 (= res!1002130 (validMask!0 mask!2687))))

(assert (=> start!125994 e!827696))

(assert (=> start!125994 true))

(declare-fun array_inv!36917 (array!99214) Bool)

(assert (=> start!125994 (array_inv!36917 a!2862)))

(declare-fun b!1475266 () Bool)

(assert (=> b!1475266 (= e!827696 e!827689)))

(declare-fun res!1002138 () Bool)

(assert (=> b!1475266 (=> (not res!1002138) (not e!827689))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1475266 (= res!1002138 (= (select (store (arr!47889 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644558 () array!99214)

(assert (=> b!1475266 (= lt!644558 (array!99215 (store (arr!47889 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48439 a!2862)))))

(declare-fun e!827692 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644559 () SeekEntryResult!12129)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1475267 () Bool)

(declare-fun lt!644561 () (_ BitVec 64))

(assert (=> b!1475267 (= e!827692 (= lt!644559 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644561 lt!644558 mask!2687)))))

(declare-fun b!1475268 () Bool)

(declare-fun res!1002131 () Bool)

(declare-fun e!827695 () Bool)

(assert (=> b!1475268 (=> (not res!1002131) (not e!827695))))

(assert (=> b!1475268 (= res!1002131 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475269 () Bool)

(declare-fun res!1002135 () Bool)

(assert (=> b!1475269 (=> (not res!1002135) (not e!827696))))

(assert (=> b!1475269 (= res!1002135 (and (= (size!48439 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48439 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48439 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475270 () Bool)

(assert (=> b!1475270 (= e!827695 (not (or (and (= (select (arr!47889 a!2862) index!646) (select (store (arr!47889 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47889 a!2862) index!646) (select (arr!47889 a!2862) j!93))) (not (= (select (arr!47889 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!646 intermediateBeforeIndex!19))))))

(declare-fun e!827694 () Bool)

(assert (=> b!1475270 e!827694))

(declare-fun res!1002128 () Bool)

(assert (=> b!1475270 (=> (not res!1002128) (not e!827694))))

(declare-fun lt!644560 () SeekEntryResult!12129)

(assert (=> b!1475270 (= res!1002128 (and (= lt!644560 (Found!12129 j!93)) (or (= (select (arr!47889 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47889 a!2862) intermediateBeforeIndex!19) (select (arr!47889 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12129)

(assert (=> b!1475270 (= lt!644560 (seekEntryOrOpen!0 (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99214 (_ BitVec 32)) Bool)

(assert (=> b!1475270 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49598 0))(
  ( (Unit!49599) )
))
(declare-fun lt!644562 () Unit!49598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49598)

(assert (=> b!1475270 (= lt!644562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475271 () Bool)

(declare-fun e!827690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12129)

(assert (=> b!1475271 (= e!827690 (= lt!644560 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47889 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475272 () Bool)

(declare-fun res!1002134 () Bool)

(assert (=> b!1475272 (=> (not res!1002134) (not e!827695))))

(assert (=> b!1475272 (= res!1002134 e!827692)))

(declare-fun c!136086 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475272 (= c!136086 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475273 () Bool)

(declare-fun res!1002129 () Bool)

(assert (=> b!1475273 (=> (not res!1002129) (not e!827696))))

(assert (=> b!1475273 (= res!1002129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475274 () Bool)

(declare-fun res!1002136 () Bool)

(assert (=> b!1475274 (=> (not res!1002136) (not e!827696))))

(declare-datatypes ((List!34390 0))(
  ( (Nil!34387) (Cons!34386 (h!35748 (_ BitVec 64)) (t!49084 List!34390)) )
))
(declare-fun arrayNoDuplicates!0 (array!99214 (_ BitVec 32) List!34390) Bool)

(assert (=> b!1475274 (= res!1002136 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34387))))

(declare-fun b!1475275 () Bool)

(assert (=> b!1475275 (= e!827694 e!827690)))

(declare-fun res!1002137 () Bool)

(assert (=> b!1475275 (=> res!1002137 e!827690)))

(assert (=> b!1475275 (= res!1002137 (or (and (= (select (arr!47889 a!2862) index!646) (select (store (arr!47889 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47889 a!2862) index!646) (select (arr!47889 a!2862) j!93))) (not (= (select (arr!47889 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1475276 () Bool)

(assert (=> b!1475276 (= e!827692 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644561 lt!644558 mask!2687) (seekEntryOrOpen!0 lt!644561 lt!644558 mask!2687)))))

(declare-fun b!1475277 () Bool)

(declare-fun res!1002133 () Bool)

(assert (=> b!1475277 (=> (not res!1002133) (not e!827696))))

(assert (=> b!1475277 (= res!1002133 (validKeyInArray!0 (select (arr!47889 a!2862) i!1006)))))

(declare-fun b!1475278 () Bool)

(declare-fun res!1002132 () Bool)

(assert (=> b!1475278 (=> (not res!1002132) (not e!827696))))

(assert (=> b!1475278 (= res!1002132 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48439 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48439 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48439 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475279 () Bool)

(assert (=> b!1475279 (= e!827691 e!827695)))

(declare-fun res!1002126 () Bool)

(assert (=> b!1475279 (=> (not res!1002126) (not e!827695))))

(assert (=> b!1475279 (= res!1002126 (= lt!644559 (Intermediate!12129 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475279 (= lt!644559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644561 mask!2687) lt!644561 lt!644558 mask!2687))))

(assert (=> b!1475279 (= lt!644561 (select (store (arr!47889 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475280 () Bool)

(declare-fun res!1002139 () Bool)

(assert (=> b!1475280 (=> (not res!1002139) (not e!827691))))

(assert (=> b!1475280 (= res!1002139 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644557))))

(assert (= (and start!125994 res!1002130) b!1475269))

(assert (= (and b!1475269 res!1002135) b!1475277))

(assert (= (and b!1475277 res!1002133) b!1475264))

(assert (= (and b!1475264 res!1002125) b!1475273))

(assert (= (and b!1475273 res!1002129) b!1475274))

(assert (= (and b!1475274 res!1002136) b!1475278))

(assert (= (and b!1475278 res!1002132) b!1475266))

(assert (= (and b!1475266 res!1002138) b!1475265))

(assert (= (and b!1475265 res!1002127) b!1475280))

(assert (= (and b!1475280 res!1002139) b!1475279))

(assert (= (and b!1475279 res!1002126) b!1475272))

(assert (= (and b!1475272 c!136086) b!1475267))

(assert (= (and b!1475272 (not c!136086)) b!1475276))

(assert (= (and b!1475272 res!1002134) b!1475268))

(assert (= (and b!1475268 res!1002131) b!1475270))

(assert (= (and b!1475270 res!1002128) b!1475275))

(assert (= (and b!1475275 (not res!1002137)) b!1475271))

(declare-fun m!1361555 () Bool)

(assert (=> b!1475266 m!1361555))

(declare-fun m!1361557 () Bool)

(assert (=> b!1475266 m!1361557))

(declare-fun m!1361559 () Bool)

(assert (=> b!1475270 m!1361559))

(assert (=> b!1475270 m!1361555))

(declare-fun m!1361561 () Bool)

(assert (=> b!1475270 m!1361561))

(declare-fun m!1361563 () Bool)

(assert (=> b!1475270 m!1361563))

(declare-fun m!1361565 () Bool)

(assert (=> b!1475270 m!1361565))

(declare-fun m!1361567 () Bool)

(assert (=> b!1475270 m!1361567))

(declare-fun m!1361569 () Bool)

(assert (=> b!1475270 m!1361569))

(declare-fun m!1361571 () Bool)

(assert (=> b!1475270 m!1361571))

(assert (=> b!1475270 m!1361567))

(assert (=> b!1475271 m!1361567))

(assert (=> b!1475271 m!1361567))

(declare-fun m!1361573 () Bool)

(assert (=> b!1475271 m!1361573))

(declare-fun m!1361575 () Bool)

(assert (=> b!1475279 m!1361575))

(assert (=> b!1475279 m!1361575))

(declare-fun m!1361577 () Bool)

(assert (=> b!1475279 m!1361577))

(assert (=> b!1475279 m!1361555))

(declare-fun m!1361579 () Bool)

(assert (=> b!1475279 m!1361579))

(declare-fun m!1361581 () Bool)

(assert (=> b!1475267 m!1361581))

(declare-fun m!1361583 () Bool)

(assert (=> b!1475276 m!1361583))

(declare-fun m!1361585 () Bool)

(assert (=> b!1475276 m!1361585))

(assert (=> b!1475265 m!1361567))

(assert (=> b!1475265 m!1361567))

(declare-fun m!1361587 () Bool)

(assert (=> b!1475265 m!1361587))

(assert (=> b!1475265 m!1361587))

(assert (=> b!1475265 m!1361567))

(declare-fun m!1361589 () Bool)

(assert (=> b!1475265 m!1361589))

(assert (=> b!1475275 m!1361565))

(assert (=> b!1475275 m!1361555))

(assert (=> b!1475275 m!1361563))

(assert (=> b!1475275 m!1361567))

(assert (=> b!1475264 m!1361567))

(assert (=> b!1475264 m!1361567))

(declare-fun m!1361591 () Bool)

(assert (=> b!1475264 m!1361591))

(assert (=> b!1475280 m!1361567))

(assert (=> b!1475280 m!1361567))

(declare-fun m!1361593 () Bool)

(assert (=> b!1475280 m!1361593))

(declare-fun m!1361595 () Bool)

(assert (=> b!1475274 m!1361595))

(declare-fun m!1361597 () Bool)

(assert (=> b!1475277 m!1361597))

(assert (=> b!1475277 m!1361597))

(declare-fun m!1361599 () Bool)

(assert (=> b!1475277 m!1361599))

(declare-fun m!1361601 () Bool)

(assert (=> b!1475273 m!1361601))

(declare-fun m!1361603 () Bool)

(assert (=> start!125994 m!1361603))

(declare-fun m!1361605 () Bool)

(assert (=> start!125994 m!1361605))

(check-sat (not start!125994) (not b!1475276) (not b!1475264) (not b!1475267) (not b!1475265) (not b!1475270) (not b!1475274) (not b!1475277) (not b!1475280) (not b!1475279) (not b!1475273) (not b!1475271))
(check-sat)
(get-model)

(declare-fun b!1475340 () Bool)

(declare-fun e!827727 () Bool)

(declare-fun e!827728 () Bool)

(assert (=> b!1475340 (= e!827727 e!827728)))

(declare-fun lt!644589 () (_ BitVec 64))

(assert (=> b!1475340 (= lt!644589 (select (arr!47889 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644587 () Unit!49598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99214 (_ BitVec 64) (_ BitVec 32)) Unit!49598)

(assert (=> b!1475340 (= lt!644587 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644589 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475340 (arrayContainsKey!0 a!2862 lt!644589 #b00000000000000000000000000000000)))

(declare-fun lt!644588 () Unit!49598)

(assert (=> b!1475340 (= lt!644588 lt!644587)))

(declare-fun res!1002190 () Bool)

(assert (=> b!1475340 (= res!1002190 (= (seekEntryOrOpen!0 (select (arr!47889 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12129 #b00000000000000000000000000000000)))))

(assert (=> b!1475340 (=> (not res!1002190) (not e!827728))))

(declare-fun b!1475341 () Bool)

(declare-fun call!67783 () Bool)

(assert (=> b!1475341 (= e!827728 call!67783)))

(declare-fun bm!67780 () Bool)

(assert (=> bm!67780 (= call!67783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475342 () Bool)

(declare-fun e!827729 () Bool)

(assert (=> b!1475342 (= e!827729 e!827727)))

(declare-fun c!136092 () Bool)

(assert (=> b!1475342 (= c!136092 (validKeyInArray!0 (select (arr!47889 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475343 () Bool)

(assert (=> b!1475343 (= e!827727 call!67783)))

(declare-fun d!155773 () Bool)

(declare-fun res!1002189 () Bool)

(assert (=> d!155773 (=> res!1002189 e!827729)))

(assert (=> d!155773 (= res!1002189 (bvsge #b00000000000000000000000000000000 (size!48439 a!2862)))))

(assert (=> d!155773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827729)))

(assert (= (and d!155773 (not res!1002189)) b!1475342))

(assert (= (and b!1475342 c!136092) b!1475340))

(assert (= (and b!1475342 (not c!136092)) b!1475343))

(assert (= (and b!1475340 res!1002190) b!1475341))

(assert (= (or b!1475341 b!1475343) bm!67780))

(declare-fun m!1361659 () Bool)

(assert (=> b!1475340 m!1361659))

(declare-fun m!1361661 () Bool)

(assert (=> b!1475340 m!1361661))

(declare-fun m!1361663 () Bool)

(assert (=> b!1475340 m!1361663))

(assert (=> b!1475340 m!1361659))

(declare-fun m!1361665 () Bool)

(assert (=> b!1475340 m!1361665))

(declare-fun m!1361667 () Bool)

(assert (=> bm!67780 m!1361667))

(assert (=> b!1475342 m!1361659))

(assert (=> b!1475342 m!1361659))

(declare-fun m!1361669 () Bool)

(assert (=> b!1475342 m!1361669))

(assert (=> b!1475273 d!155773))

(declare-fun b!1475356 () Bool)

(declare-fun e!827737 () SeekEntryResult!12129)

(declare-fun e!827738 () SeekEntryResult!12129)

(assert (=> b!1475356 (= e!827737 e!827738)))

(declare-fun c!136101 () Bool)

(declare-fun lt!644595 () (_ BitVec 64))

(assert (=> b!1475356 (= c!136101 (= lt!644595 (select (arr!47889 a!2862) j!93)))))

(declare-fun e!827736 () SeekEntryResult!12129)

(declare-fun b!1475357 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475357 (= e!827736 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475358 () Bool)

(assert (=> b!1475358 (= e!827736 (MissingVacant!12129 index!646))))

(declare-fun b!1475360 () Bool)

(assert (=> b!1475360 (= e!827738 (Found!12129 index!646))))

(declare-fun b!1475361 () Bool)

(declare-fun c!136100 () Bool)

(assert (=> b!1475361 (= c!136100 (= lt!644595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475361 (= e!827738 e!827736)))

(declare-fun b!1475359 () Bool)

(assert (=> b!1475359 (= e!827737 Undefined!12129)))

(declare-fun d!155775 () Bool)

(declare-fun lt!644594 () SeekEntryResult!12129)

(get-info :version)

(assert (=> d!155775 (and (or ((_ is Undefined!12129) lt!644594) (not ((_ is Found!12129) lt!644594)) (and (bvsge (index!50909 lt!644594) #b00000000000000000000000000000000) (bvslt (index!50909 lt!644594) (size!48439 a!2862)))) (or ((_ is Undefined!12129) lt!644594) ((_ is Found!12129) lt!644594) (not ((_ is MissingVacant!12129) lt!644594)) (not (= (index!50911 lt!644594) index!646)) (and (bvsge (index!50911 lt!644594) #b00000000000000000000000000000000) (bvslt (index!50911 lt!644594) (size!48439 a!2862)))) (or ((_ is Undefined!12129) lt!644594) (ite ((_ is Found!12129) lt!644594) (= (select (arr!47889 a!2862) (index!50909 lt!644594)) (select (arr!47889 a!2862) j!93)) (and ((_ is MissingVacant!12129) lt!644594) (= (index!50911 lt!644594) index!646) (= (select (arr!47889 a!2862) (index!50911 lt!644594)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155775 (= lt!644594 e!827737)))

(declare-fun c!136099 () Bool)

(assert (=> d!155775 (= c!136099 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155775 (= lt!644595 (select (arr!47889 a!2862) index!646))))

(assert (=> d!155775 (validMask!0 mask!2687)))

(assert (=> d!155775 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644594)))

(assert (= (and d!155775 c!136099) b!1475359))

(assert (= (and d!155775 (not c!136099)) b!1475356))

(assert (= (and b!1475356 c!136101) b!1475360))

(assert (= (and b!1475356 (not c!136101)) b!1475361))

(assert (= (and b!1475361 c!136100) b!1475358))

(assert (= (and b!1475361 (not c!136100)) b!1475357))

(declare-fun m!1361671 () Bool)

(assert (=> b!1475357 m!1361671))

(assert (=> b!1475357 m!1361671))

(assert (=> b!1475357 m!1361567))

(declare-fun m!1361673 () Bool)

(assert (=> b!1475357 m!1361673))

(declare-fun m!1361675 () Bool)

(assert (=> d!155775 m!1361675))

(declare-fun m!1361677 () Bool)

(assert (=> d!155775 m!1361677))

(assert (=> d!155775 m!1361565))

(assert (=> d!155775 m!1361603))

(assert (=> b!1475271 d!155775))

(declare-fun b!1475374 () Bool)

(declare-fun e!827745 () SeekEntryResult!12129)

(declare-fun e!827746 () SeekEntryResult!12129)

(assert (=> b!1475374 (= e!827745 e!827746)))

(declare-fun lt!644604 () (_ BitVec 64))

(declare-fun lt!644602 () SeekEntryResult!12129)

(assert (=> b!1475374 (= lt!644604 (select (arr!47889 a!2862) (index!50910 lt!644602)))))

(declare-fun c!136108 () Bool)

(assert (=> b!1475374 (= c!136108 (= lt!644604 (select (arr!47889 a!2862) j!93)))))

(declare-fun b!1475376 () Bool)

(declare-fun e!827747 () SeekEntryResult!12129)

(assert (=> b!1475376 (= e!827747 (MissingZero!12129 (index!50910 lt!644602)))))

(declare-fun b!1475377 () Bool)

(assert (=> b!1475377 (= e!827745 Undefined!12129)))

(declare-fun b!1475378 () Bool)

(assert (=> b!1475378 (= e!827747 (seekKeyOrZeroReturnVacant!0 (x!132494 lt!644602) (index!50910 lt!644602) (index!50910 lt!644602) (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475379 () Bool)

(declare-fun c!136109 () Bool)

(assert (=> b!1475379 (= c!136109 (= lt!644604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475379 (= e!827746 e!827747)))

(declare-fun b!1475375 () Bool)

(assert (=> b!1475375 (= e!827746 (Found!12129 (index!50910 lt!644602)))))

(declare-fun d!155777 () Bool)

(declare-fun lt!644603 () SeekEntryResult!12129)

(assert (=> d!155777 (and (or ((_ is Undefined!12129) lt!644603) (not ((_ is Found!12129) lt!644603)) (and (bvsge (index!50909 lt!644603) #b00000000000000000000000000000000) (bvslt (index!50909 lt!644603) (size!48439 a!2862)))) (or ((_ is Undefined!12129) lt!644603) ((_ is Found!12129) lt!644603) (not ((_ is MissingZero!12129) lt!644603)) (and (bvsge (index!50908 lt!644603) #b00000000000000000000000000000000) (bvslt (index!50908 lt!644603) (size!48439 a!2862)))) (or ((_ is Undefined!12129) lt!644603) ((_ is Found!12129) lt!644603) ((_ is MissingZero!12129) lt!644603) (not ((_ is MissingVacant!12129) lt!644603)) (and (bvsge (index!50911 lt!644603) #b00000000000000000000000000000000) (bvslt (index!50911 lt!644603) (size!48439 a!2862)))) (or ((_ is Undefined!12129) lt!644603) (ite ((_ is Found!12129) lt!644603) (= (select (arr!47889 a!2862) (index!50909 lt!644603)) (select (arr!47889 a!2862) j!93)) (ite ((_ is MissingZero!12129) lt!644603) (= (select (arr!47889 a!2862) (index!50908 lt!644603)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12129) lt!644603) (= (select (arr!47889 a!2862) (index!50911 lt!644603)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155777 (= lt!644603 e!827745)))

(declare-fun c!136110 () Bool)

(assert (=> d!155777 (= c!136110 (and ((_ is Intermediate!12129) lt!644602) (undefined!12941 lt!644602)))))

(assert (=> d!155777 (= lt!644602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155777 (validMask!0 mask!2687)))

(assert (=> d!155777 (= (seekEntryOrOpen!0 (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644603)))

(assert (= (and d!155777 c!136110) b!1475377))

(assert (= (and d!155777 (not c!136110)) b!1475374))

(assert (= (and b!1475374 c!136108) b!1475375))

(assert (= (and b!1475374 (not c!136108)) b!1475379))

(assert (= (and b!1475379 c!136109) b!1475376))

(assert (= (and b!1475379 (not c!136109)) b!1475378))

(declare-fun m!1361679 () Bool)

(assert (=> b!1475374 m!1361679))

(assert (=> b!1475378 m!1361567))

(declare-fun m!1361681 () Bool)

(assert (=> b!1475378 m!1361681))

(declare-fun m!1361683 () Bool)

(assert (=> d!155777 m!1361683))

(declare-fun m!1361685 () Bool)

(assert (=> d!155777 m!1361685))

(declare-fun m!1361687 () Bool)

(assert (=> d!155777 m!1361687))

(assert (=> d!155777 m!1361567))

(assert (=> d!155777 m!1361587))

(assert (=> d!155777 m!1361587))

(assert (=> d!155777 m!1361567))

(assert (=> d!155777 m!1361589))

(assert (=> d!155777 m!1361603))

(assert (=> b!1475270 d!155777))

(declare-fun b!1475380 () Bool)

(declare-fun e!827748 () Bool)

(declare-fun e!827749 () Bool)

(assert (=> b!1475380 (= e!827748 e!827749)))

(declare-fun lt!644607 () (_ BitVec 64))

(assert (=> b!1475380 (= lt!644607 (select (arr!47889 a!2862) j!93))))

(declare-fun lt!644605 () Unit!49598)

(assert (=> b!1475380 (= lt!644605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644607 j!93))))

(assert (=> b!1475380 (arrayContainsKey!0 a!2862 lt!644607 #b00000000000000000000000000000000)))

(declare-fun lt!644606 () Unit!49598)

(assert (=> b!1475380 (= lt!644606 lt!644605)))

(declare-fun res!1002192 () Bool)

(assert (=> b!1475380 (= res!1002192 (= (seekEntryOrOpen!0 (select (arr!47889 a!2862) j!93) a!2862 mask!2687) (Found!12129 j!93)))))

(assert (=> b!1475380 (=> (not res!1002192) (not e!827749))))

(declare-fun b!1475381 () Bool)

(declare-fun call!67784 () Bool)

(assert (=> b!1475381 (= e!827749 call!67784)))

(declare-fun bm!67781 () Bool)

(assert (=> bm!67781 (= call!67784 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475382 () Bool)

(declare-fun e!827750 () Bool)

(assert (=> b!1475382 (= e!827750 e!827748)))

(declare-fun c!136111 () Bool)

(assert (=> b!1475382 (= c!136111 (validKeyInArray!0 (select (arr!47889 a!2862) j!93)))))

(declare-fun b!1475383 () Bool)

(assert (=> b!1475383 (= e!827748 call!67784)))

(declare-fun d!155779 () Bool)

(declare-fun res!1002191 () Bool)

(assert (=> d!155779 (=> res!1002191 e!827750)))

(assert (=> d!155779 (= res!1002191 (bvsge j!93 (size!48439 a!2862)))))

(assert (=> d!155779 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827750)))

(assert (= (and d!155779 (not res!1002191)) b!1475382))

(assert (= (and b!1475382 c!136111) b!1475380))

(assert (= (and b!1475382 (not c!136111)) b!1475383))

(assert (= (and b!1475380 res!1002192) b!1475381))

(assert (= (or b!1475381 b!1475383) bm!67781))

(assert (=> b!1475380 m!1361567))

(declare-fun m!1361689 () Bool)

(assert (=> b!1475380 m!1361689))

(declare-fun m!1361691 () Bool)

(assert (=> b!1475380 m!1361691))

(assert (=> b!1475380 m!1361567))

(assert (=> b!1475380 m!1361569))

(declare-fun m!1361693 () Bool)

(assert (=> bm!67781 m!1361693))

(assert (=> b!1475382 m!1361567))

(assert (=> b!1475382 m!1361567))

(assert (=> b!1475382 m!1361591))

(assert (=> b!1475270 d!155779))

(declare-fun d!155781 () Bool)

(assert (=> d!155781 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644610 () Unit!49598)

(declare-fun choose!38 (array!99214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49598)

(assert (=> d!155781 (= lt!644610 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155781 (validMask!0 mask!2687)))

(assert (=> d!155781 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644610)))

(declare-fun bs!42575 () Bool)

(assert (= bs!42575 d!155781))

(assert (=> bs!42575 m!1361571))

(declare-fun m!1361695 () Bool)

(assert (=> bs!42575 m!1361695))

(assert (=> bs!42575 m!1361603))

(assert (=> b!1475270 d!155781))

(declare-fun b!1475402 () Bool)

(declare-fun e!827761 () SeekEntryResult!12129)

(declare-fun e!827764 () SeekEntryResult!12129)

(assert (=> b!1475402 (= e!827761 e!827764)))

(declare-fun c!136119 () Bool)

(declare-fun lt!644616 () (_ BitVec 64))

(assert (=> b!1475402 (= c!136119 (or (= lt!644616 (select (arr!47889 a!2862) j!93)) (= (bvadd lt!644616 lt!644616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155783 () Bool)

(declare-fun e!827762 () Bool)

(assert (=> d!155783 e!827762))

(declare-fun c!136120 () Bool)

(declare-fun lt!644615 () SeekEntryResult!12129)

(assert (=> d!155783 (= c!136120 (and ((_ is Intermediate!12129) lt!644615) (undefined!12941 lt!644615)))))

(assert (=> d!155783 (= lt!644615 e!827761)))

(declare-fun c!136118 () Bool)

(assert (=> d!155783 (= c!136118 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155783 (= lt!644616 (select (arr!47889 a!2862) index!646))))

(assert (=> d!155783 (validMask!0 mask!2687)))

(assert (=> d!155783 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644615)))

(declare-fun b!1475403 () Bool)

(assert (=> b!1475403 (= e!827764 (Intermediate!12129 false index!646 x!665))))

(declare-fun b!1475404 () Bool)

(declare-fun e!827763 () Bool)

(assert (=> b!1475404 (= e!827762 e!827763)))

(declare-fun res!1002201 () Bool)

(assert (=> b!1475404 (= res!1002201 (and ((_ is Intermediate!12129) lt!644615) (not (undefined!12941 lt!644615)) (bvslt (x!132494 lt!644615) #b01111111111111111111111111111110) (bvsge (x!132494 lt!644615) #b00000000000000000000000000000000) (bvsge (x!132494 lt!644615) x!665)))))

(assert (=> b!1475404 (=> (not res!1002201) (not e!827763))))

(declare-fun b!1475405 () Bool)

(assert (=> b!1475405 (and (bvsge (index!50910 lt!644615) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644615) (size!48439 a!2862)))))

(declare-fun res!1002199 () Bool)

(assert (=> b!1475405 (= res!1002199 (= (select (arr!47889 a!2862) (index!50910 lt!644615)) (select (arr!47889 a!2862) j!93)))))

(declare-fun e!827765 () Bool)

(assert (=> b!1475405 (=> res!1002199 e!827765)))

(assert (=> b!1475405 (= e!827763 e!827765)))

(declare-fun b!1475406 () Bool)

(assert (=> b!1475406 (= e!827762 (bvsge (x!132494 lt!644615) #b01111111111111111111111111111110))))

(declare-fun b!1475407 () Bool)

(assert (=> b!1475407 (= e!827761 (Intermediate!12129 true index!646 x!665))))

(declare-fun b!1475408 () Bool)

(assert (=> b!1475408 (and (bvsge (index!50910 lt!644615) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644615) (size!48439 a!2862)))))

(declare-fun res!1002200 () Bool)

(assert (=> b!1475408 (= res!1002200 (= (select (arr!47889 a!2862) (index!50910 lt!644615)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475408 (=> res!1002200 e!827765)))

(declare-fun b!1475409 () Bool)

(assert (=> b!1475409 (= e!827764 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475410 () Bool)

(assert (=> b!1475410 (and (bvsge (index!50910 lt!644615) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644615) (size!48439 a!2862)))))

(assert (=> b!1475410 (= e!827765 (= (select (arr!47889 a!2862) (index!50910 lt!644615)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155783 c!136118) b!1475407))

(assert (= (and d!155783 (not c!136118)) b!1475402))

(assert (= (and b!1475402 c!136119) b!1475403))

(assert (= (and b!1475402 (not c!136119)) b!1475409))

(assert (= (and d!155783 c!136120) b!1475406))

(assert (= (and d!155783 (not c!136120)) b!1475404))

(assert (= (and b!1475404 res!1002201) b!1475405))

(assert (= (and b!1475405 (not res!1002199)) b!1475408))

(assert (= (and b!1475408 (not res!1002200)) b!1475410))

(declare-fun m!1361697 () Bool)

(assert (=> b!1475410 m!1361697))

(assert (=> b!1475408 m!1361697))

(assert (=> d!155783 m!1361565))

(assert (=> d!155783 m!1361603))

(assert (=> b!1475405 m!1361697))

(assert (=> b!1475409 m!1361671))

(assert (=> b!1475409 m!1361671))

(assert (=> b!1475409 m!1361567))

(declare-fun m!1361699 () Bool)

(assert (=> b!1475409 m!1361699))

(assert (=> b!1475280 d!155783))

(declare-fun b!1475411 () Bool)

(declare-fun e!827766 () SeekEntryResult!12129)

(declare-fun e!827769 () SeekEntryResult!12129)

(assert (=> b!1475411 (= e!827766 e!827769)))

(declare-fun c!136122 () Bool)

(declare-fun lt!644618 () (_ BitVec 64))

(assert (=> b!1475411 (= c!136122 (or (= lt!644618 lt!644561) (= (bvadd lt!644618 lt!644618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155789 () Bool)

(declare-fun e!827767 () Bool)

(assert (=> d!155789 e!827767))

(declare-fun c!136123 () Bool)

(declare-fun lt!644617 () SeekEntryResult!12129)

(assert (=> d!155789 (= c!136123 (and ((_ is Intermediate!12129) lt!644617) (undefined!12941 lt!644617)))))

(assert (=> d!155789 (= lt!644617 e!827766)))

(declare-fun c!136121 () Bool)

(assert (=> d!155789 (= c!136121 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155789 (= lt!644618 (select (arr!47889 lt!644558) (toIndex!0 lt!644561 mask!2687)))))

(assert (=> d!155789 (validMask!0 mask!2687)))

(assert (=> d!155789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644561 mask!2687) lt!644561 lt!644558 mask!2687) lt!644617)))

(declare-fun b!1475412 () Bool)

(assert (=> b!1475412 (= e!827769 (Intermediate!12129 false (toIndex!0 lt!644561 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475413 () Bool)

(declare-fun e!827768 () Bool)

(assert (=> b!1475413 (= e!827767 e!827768)))

(declare-fun res!1002204 () Bool)

(assert (=> b!1475413 (= res!1002204 (and ((_ is Intermediate!12129) lt!644617) (not (undefined!12941 lt!644617)) (bvslt (x!132494 lt!644617) #b01111111111111111111111111111110) (bvsge (x!132494 lt!644617) #b00000000000000000000000000000000) (bvsge (x!132494 lt!644617) #b00000000000000000000000000000000)))))

(assert (=> b!1475413 (=> (not res!1002204) (not e!827768))))

(declare-fun b!1475414 () Bool)

(assert (=> b!1475414 (and (bvsge (index!50910 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644617) (size!48439 lt!644558)))))

(declare-fun res!1002202 () Bool)

(assert (=> b!1475414 (= res!1002202 (= (select (arr!47889 lt!644558) (index!50910 lt!644617)) lt!644561))))

(declare-fun e!827770 () Bool)

(assert (=> b!1475414 (=> res!1002202 e!827770)))

(assert (=> b!1475414 (= e!827768 e!827770)))

(declare-fun b!1475415 () Bool)

(assert (=> b!1475415 (= e!827767 (bvsge (x!132494 lt!644617) #b01111111111111111111111111111110))))

(declare-fun b!1475416 () Bool)

(assert (=> b!1475416 (= e!827766 (Intermediate!12129 true (toIndex!0 lt!644561 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475417 () Bool)

(assert (=> b!1475417 (and (bvsge (index!50910 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644617) (size!48439 lt!644558)))))

(declare-fun res!1002203 () Bool)

(assert (=> b!1475417 (= res!1002203 (= (select (arr!47889 lt!644558) (index!50910 lt!644617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475417 (=> res!1002203 e!827770)))

(declare-fun b!1475418 () Bool)

(assert (=> b!1475418 (= e!827769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644561 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644561 lt!644558 mask!2687))))

(declare-fun b!1475419 () Bool)

(assert (=> b!1475419 (and (bvsge (index!50910 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644617) (size!48439 lt!644558)))))

(assert (=> b!1475419 (= e!827770 (= (select (arr!47889 lt!644558) (index!50910 lt!644617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155789 c!136121) b!1475416))

(assert (= (and d!155789 (not c!136121)) b!1475411))

(assert (= (and b!1475411 c!136122) b!1475412))

(assert (= (and b!1475411 (not c!136122)) b!1475418))

(assert (= (and d!155789 c!136123) b!1475415))

(assert (= (and d!155789 (not c!136123)) b!1475413))

(assert (= (and b!1475413 res!1002204) b!1475414))

(assert (= (and b!1475414 (not res!1002202)) b!1475417))

(assert (= (and b!1475417 (not res!1002203)) b!1475419))

(declare-fun m!1361701 () Bool)

(assert (=> b!1475419 m!1361701))

(assert (=> b!1475417 m!1361701))

(assert (=> d!155789 m!1361575))

(declare-fun m!1361703 () Bool)

(assert (=> d!155789 m!1361703))

(assert (=> d!155789 m!1361603))

(assert (=> b!1475414 m!1361701))

(assert (=> b!1475418 m!1361575))

(declare-fun m!1361705 () Bool)

(assert (=> b!1475418 m!1361705))

(assert (=> b!1475418 m!1361705))

(declare-fun m!1361707 () Bool)

(assert (=> b!1475418 m!1361707))

(assert (=> b!1475279 d!155789))

(declare-fun d!155791 () Bool)

(declare-fun lt!644624 () (_ BitVec 32))

(declare-fun lt!644623 () (_ BitVec 32))

(assert (=> d!155791 (= lt!644624 (bvmul (bvxor lt!644623 (bvlshr lt!644623 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155791 (= lt!644623 ((_ extract 31 0) (bvand (bvxor lt!644561 (bvlshr lt!644561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155791 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002205 (let ((h!35750 ((_ extract 31 0) (bvand (bvxor lt!644561 (bvlshr lt!644561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132498 (bvmul (bvxor h!35750 (bvlshr h!35750 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132498 (bvlshr x!132498 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002205 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002205 #b00000000000000000000000000000000))))))

(assert (=> d!155791 (= (toIndex!0 lt!644561 mask!2687) (bvand (bvxor lt!644624 (bvlshr lt!644624 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475279 d!155791))

(declare-fun d!155793 () Bool)

(assert (=> d!155793 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125994 d!155793))

(declare-fun d!155803 () Bool)

(assert (=> d!155803 (= (array_inv!36917 a!2862) (bvsge (size!48439 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125994 d!155803))

(declare-fun b!1475420 () Bool)

(declare-fun e!827771 () SeekEntryResult!12129)

(declare-fun e!827774 () SeekEntryResult!12129)

(assert (=> b!1475420 (= e!827771 e!827774)))

(declare-fun c!136125 () Bool)

(declare-fun lt!644626 () (_ BitVec 64))

(assert (=> b!1475420 (= c!136125 (or (= lt!644626 lt!644561) (= (bvadd lt!644626 lt!644626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155805 () Bool)

(declare-fun e!827772 () Bool)

(assert (=> d!155805 e!827772))

(declare-fun c!136126 () Bool)

(declare-fun lt!644625 () SeekEntryResult!12129)

(assert (=> d!155805 (= c!136126 (and ((_ is Intermediate!12129) lt!644625) (undefined!12941 lt!644625)))))

(assert (=> d!155805 (= lt!644625 e!827771)))

(declare-fun c!136124 () Bool)

(assert (=> d!155805 (= c!136124 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155805 (= lt!644626 (select (arr!47889 lt!644558) index!646))))

(assert (=> d!155805 (validMask!0 mask!2687)))

(assert (=> d!155805 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644561 lt!644558 mask!2687) lt!644625)))

(declare-fun b!1475421 () Bool)

(assert (=> b!1475421 (= e!827774 (Intermediate!12129 false index!646 x!665))))

(declare-fun b!1475422 () Bool)

(declare-fun e!827773 () Bool)

(assert (=> b!1475422 (= e!827772 e!827773)))

(declare-fun res!1002208 () Bool)

(assert (=> b!1475422 (= res!1002208 (and ((_ is Intermediate!12129) lt!644625) (not (undefined!12941 lt!644625)) (bvslt (x!132494 lt!644625) #b01111111111111111111111111111110) (bvsge (x!132494 lt!644625) #b00000000000000000000000000000000) (bvsge (x!132494 lt!644625) x!665)))))

(assert (=> b!1475422 (=> (not res!1002208) (not e!827773))))

(declare-fun b!1475423 () Bool)

(assert (=> b!1475423 (and (bvsge (index!50910 lt!644625) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644625) (size!48439 lt!644558)))))

(declare-fun res!1002206 () Bool)

(assert (=> b!1475423 (= res!1002206 (= (select (arr!47889 lt!644558) (index!50910 lt!644625)) lt!644561))))

(declare-fun e!827775 () Bool)

(assert (=> b!1475423 (=> res!1002206 e!827775)))

(assert (=> b!1475423 (= e!827773 e!827775)))

(declare-fun b!1475424 () Bool)

(assert (=> b!1475424 (= e!827772 (bvsge (x!132494 lt!644625) #b01111111111111111111111111111110))))

(declare-fun b!1475425 () Bool)

(assert (=> b!1475425 (= e!827771 (Intermediate!12129 true index!646 x!665))))

(declare-fun b!1475426 () Bool)

(assert (=> b!1475426 (and (bvsge (index!50910 lt!644625) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644625) (size!48439 lt!644558)))))

(declare-fun res!1002207 () Bool)

(assert (=> b!1475426 (= res!1002207 (= (select (arr!47889 lt!644558) (index!50910 lt!644625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475426 (=> res!1002207 e!827775)))

(declare-fun b!1475427 () Bool)

(assert (=> b!1475427 (= e!827774 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644561 lt!644558 mask!2687))))

(declare-fun b!1475428 () Bool)

(assert (=> b!1475428 (and (bvsge (index!50910 lt!644625) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644625) (size!48439 lt!644558)))))

(assert (=> b!1475428 (= e!827775 (= (select (arr!47889 lt!644558) (index!50910 lt!644625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155805 c!136124) b!1475425))

(assert (= (and d!155805 (not c!136124)) b!1475420))

(assert (= (and b!1475420 c!136125) b!1475421))

(assert (= (and b!1475420 (not c!136125)) b!1475427))

(assert (= (and d!155805 c!136126) b!1475424))

(assert (= (and d!155805 (not c!136126)) b!1475422))

(assert (= (and b!1475422 res!1002208) b!1475423))

(assert (= (and b!1475423 (not res!1002206)) b!1475426))

(assert (= (and b!1475426 (not res!1002207)) b!1475428))

(declare-fun m!1361709 () Bool)

(assert (=> b!1475428 m!1361709))

(assert (=> b!1475426 m!1361709))

(declare-fun m!1361711 () Bool)

(assert (=> d!155805 m!1361711))

(assert (=> d!155805 m!1361603))

(assert (=> b!1475423 m!1361709))

(assert (=> b!1475427 m!1361671))

(assert (=> b!1475427 m!1361671))

(declare-fun m!1361713 () Bool)

(assert (=> b!1475427 m!1361713))

(assert (=> b!1475267 d!155805))

(declare-fun d!155807 () Bool)

(assert (=> d!155807 (= (validKeyInArray!0 (select (arr!47889 a!2862) i!1006)) (and (not (= (select (arr!47889 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47889 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475277 d!155807))

(declare-fun b!1475429 () Bool)

(declare-fun e!827777 () SeekEntryResult!12129)

(declare-fun e!827778 () SeekEntryResult!12129)

(assert (=> b!1475429 (= e!827777 e!827778)))

(declare-fun c!136129 () Bool)

(declare-fun lt!644628 () (_ BitVec 64))

(assert (=> b!1475429 (= c!136129 (= lt!644628 lt!644561))))

(declare-fun b!1475430 () Bool)

(declare-fun e!827776 () SeekEntryResult!12129)

(assert (=> b!1475430 (= e!827776 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644561 lt!644558 mask!2687))))

(declare-fun b!1475431 () Bool)

(assert (=> b!1475431 (= e!827776 (MissingVacant!12129 intermediateAfterIndex!19))))

(declare-fun b!1475433 () Bool)

(assert (=> b!1475433 (= e!827778 (Found!12129 index!646))))

(declare-fun b!1475434 () Bool)

(declare-fun c!136128 () Bool)

(assert (=> b!1475434 (= c!136128 (= lt!644628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475434 (= e!827778 e!827776)))

(declare-fun b!1475432 () Bool)

(assert (=> b!1475432 (= e!827777 Undefined!12129)))

(declare-fun d!155809 () Bool)

(declare-fun lt!644627 () SeekEntryResult!12129)

(assert (=> d!155809 (and (or ((_ is Undefined!12129) lt!644627) (not ((_ is Found!12129) lt!644627)) (and (bvsge (index!50909 lt!644627) #b00000000000000000000000000000000) (bvslt (index!50909 lt!644627) (size!48439 lt!644558)))) (or ((_ is Undefined!12129) lt!644627) ((_ is Found!12129) lt!644627) (not ((_ is MissingVacant!12129) lt!644627)) (not (= (index!50911 lt!644627) intermediateAfterIndex!19)) (and (bvsge (index!50911 lt!644627) #b00000000000000000000000000000000) (bvslt (index!50911 lt!644627) (size!48439 lt!644558)))) (or ((_ is Undefined!12129) lt!644627) (ite ((_ is Found!12129) lt!644627) (= (select (arr!47889 lt!644558) (index!50909 lt!644627)) lt!644561) (and ((_ is MissingVacant!12129) lt!644627) (= (index!50911 lt!644627) intermediateAfterIndex!19) (= (select (arr!47889 lt!644558) (index!50911 lt!644627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155809 (= lt!644627 e!827777)))

(declare-fun c!136127 () Bool)

(assert (=> d!155809 (= c!136127 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155809 (= lt!644628 (select (arr!47889 lt!644558) index!646))))

(assert (=> d!155809 (validMask!0 mask!2687)))

(assert (=> d!155809 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644561 lt!644558 mask!2687) lt!644627)))

(assert (= (and d!155809 c!136127) b!1475432))

(assert (= (and d!155809 (not c!136127)) b!1475429))

(assert (= (and b!1475429 c!136129) b!1475433))

(assert (= (and b!1475429 (not c!136129)) b!1475434))

(assert (= (and b!1475434 c!136128) b!1475431))

(assert (= (and b!1475434 (not c!136128)) b!1475430))

(assert (=> b!1475430 m!1361671))

(assert (=> b!1475430 m!1361671))

(declare-fun m!1361715 () Bool)

(assert (=> b!1475430 m!1361715))

(declare-fun m!1361717 () Bool)

(assert (=> d!155809 m!1361717))

(declare-fun m!1361719 () Bool)

(assert (=> d!155809 m!1361719))

(assert (=> d!155809 m!1361711))

(assert (=> d!155809 m!1361603))

(assert (=> b!1475276 d!155809))

(declare-fun b!1475435 () Bool)

(declare-fun e!827779 () SeekEntryResult!12129)

(declare-fun e!827780 () SeekEntryResult!12129)

(assert (=> b!1475435 (= e!827779 e!827780)))

(declare-fun lt!644631 () (_ BitVec 64))

(declare-fun lt!644629 () SeekEntryResult!12129)

(assert (=> b!1475435 (= lt!644631 (select (arr!47889 lt!644558) (index!50910 lt!644629)))))

(declare-fun c!136130 () Bool)

(assert (=> b!1475435 (= c!136130 (= lt!644631 lt!644561))))

(declare-fun b!1475437 () Bool)

(declare-fun e!827781 () SeekEntryResult!12129)

(assert (=> b!1475437 (= e!827781 (MissingZero!12129 (index!50910 lt!644629)))))

(declare-fun b!1475438 () Bool)

(assert (=> b!1475438 (= e!827779 Undefined!12129)))

(declare-fun b!1475439 () Bool)

(assert (=> b!1475439 (= e!827781 (seekKeyOrZeroReturnVacant!0 (x!132494 lt!644629) (index!50910 lt!644629) (index!50910 lt!644629) lt!644561 lt!644558 mask!2687))))

(declare-fun b!1475440 () Bool)

(declare-fun c!136131 () Bool)

(assert (=> b!1475440 (= c!136131 (= lt!644631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475440 (= e!827780 e!827781)))

(declare-fun b!1475436 () Bool)

(assert (=> b!1475436 (= e!827780 (Found!12129 (index!50910 lt!644629)))))

(declare-fun d!155811 () Bool)

(declare-fun lt!644630 () SeekEntryResult!12129)

(assert (=> d!155811 (and (or ((_ is Undefined!12129) lt!644630) (not ((_ is Found!12129) lt!644630)) (and (bvsge (index!50909 lt!644630) #b00000000000000000000000000000000) (bvslt (index!50909 lt!644630) (size!48439 lt!644558)))) (or ((_ is Undefined!12129) lt!644630) ((_ is Found!12129) lt!644630) (not ((_ is MissingZero!12129) lt!644630)) (and (bvsge (index!50908 lt!644630) #b00000000000000000000000000000000) (bvslt (index!50908 lt!644630) (size!48439 lt!644558)))) (or ((_ is Undefined!12129) lt!644630) ((_ is Found!12129) lt!644630) ((_ is MissingZero!12129) lt!644630) (not ((_ is MissingVacant!12129) lt!644630)) (and (bvsge (index!50911 lt!644630) #b00000000000000000000000000000000) (bvslt (index!50911 lt!644630) (size!48439 lt!644558)))) (or ((_ is Undefined!12129) lt!644630) (ite ((_ is Found!12129) lt!644630) (= (select (arr!47889 lt!644558) (index!50909 lt!644630)) lt!644561) (ite ((_ is MissingZero!12129) lt!644630) (= (select (arr!47889 lt!644558) (index!50908 lt!644630)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12129) lt!644630) (= (select (arr!47889 lt!644558) (index!50911 lt!644630)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155811 (= lt!644630 e!827779)))

(declare-fun c!136132 () Bool)

(assert (=> d!155811 (= c!136132 (and ((_ is Intermediate!12129) lt!644629) (undefined!12941 lt!644629)))))

(assert (=> d!155811 (= lt!644629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644561 mask!2687) lt!644561 lt!644558 mask!2687))))

(assert (=> d!155811 (validMask!0 mask!2687)))

(assert (=> d!155811 (= (seekEntryOrOpen!0 lt!644561 lt!644558 mask!2687) lt!644630)))

(assert (= (and d!155811 c!136132) b!1475438))

(assert (= (and d!155811 (not c!136132)) b!1475435))

(assert (= (and b!1475435 c!136130) b!1475436))

(assert (= (and b!1475435 (not c!136130)) b!1475440))

(assert (= (and b!1475440 c!136131) b!1475437))

(assert (= (and b!1475440 (not c!136131)) b!1475439))

(declare-fun m!1361721 () Bool)

(assert (=> b!1475435 m!1361721))

(declare-fun m!1361723 () Bool)

(assert (=> b!1475439 m!1361723))

(declare-fun m!1361725 () Bool)

(assert (=> d!155811 m!1361725))

(declare-fun m!1361727 () Bool)

(assert (=> d!155811 m!1361727))

(declare-fun m!1361729 () Bool)

(assert (=> d!155811 m!1361729))

(assert (=> d!155811 m!1361575))

(assert (=> d!155811 m!1361575))

(assert (=> d!155811 m!1361577))

(assert (=> d!155811 m!1361603))

(assert (=> b!1475276 d!155811))

(declare-fun b!1475441 () Bool)

(declare-fun e!827782 () SeekEntryResult!12129)

(declare-fun e!827785 () SeekEntryResult!12129)

(assert (=> b!1475441 (= e!827782 e!827785)))

(declare-fun c!136134 () Bool)

(declare-fun lt!644633 () (_ BitVec 64))

(assert (=> b!1475441 (= c!136134 (or (= lt!644633 (select (arr!47889 a!2862) j!93)) (= (bvadd lt!644633 lt!644633) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155813 () Bool)

(declare-fun e!827783 () Bool)

(assert (=> d!155813 e!827783))

(declare-fun c!136135 () Bool)

(declare-fun lt!644632 () SeekEntryResult!12129)

(assert (=> d!155813 (= c!136135 (and ((_ is Intermediate!12129) lt!644632) (undefined!12941 lt!644632)))))

(assert (=> d!155813 (= lt!644632 e!827782)))

(declare-fun c!136133 () Bool)

(assert (=> d!155813 (= c!136133 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155813 (= lt!644633 (select (arr!47889 a!2862) (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687)))))

(assert (=> d!155813 (validMask!0 mask!2687)))

(assert (=> d!155813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) (select (arr!47889 a!2862) j!93) a!2862 mask!2687) lt!644632)))

(declare-fun b!1475442 () Bool)

(assert (=> b!1475442 (= e!827785 (Intermediate!12129 false (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475443 () Bool)

(declare-fun e!827784 () Bool)

(assert (=> b!1475443 (= e!827783 e!827784)))

(declare-fun res!1002211 () Bool)

(assert (=> b!1475443 (= res!1002211 (and ((_ is Intermediate!12129) lt!644632) (not (undefined!12941 lt!644632)) (bvslt (x!132494 lt!644632) #b01111111111111111111111111111110) (bvsge (x!132494 lt!644632) #b00000000000000000000000000000000) (bvsge (x!132494 lt!644632) #b00000000000000000000000000000000)))))

(assert (=> b!1475443 (=> (not res!1002211) (not e!827784))))

(declare-fun b!1475444 () Bool)

(assert (=> b!1475444 (and (bvsge (index!50910 lt!644632) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644632) (size!48439 a!2862)))))

(declare-fun res!1002209 () Bool)

(assert (=> b!1475444 (= res!1002209 (= (select (arr!47889 a!2862) (index!50910 lt!644632)) (select (arr!47889 a!2862) j!93)))))

(declare-fun e!827786 () Bool)

(assert (=> b!1475444 (=> res!1002209 e!827786)))

(assert (=> b!1475444 (= e!827784 e!827786)))

(declare-fun b!1475445 () Bool)

(assert (=> b!1475445 (= e!827783 (bvsge (x!132494 lt!644632) #b01111111111111111111111111111110))))

(declare-fun b!1475446 () Bool)

(assert (=> b!1475446 (= e!827782 (Intermediate!12129 true (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475447 () Bool)

(assert (=> b!1475447 (and (bvsge (index!50910 lt!644632) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644632) (size!48439 a!2862)))))

(declare-fun res!1002210 () Bool)

(assert (=> b!1475447 (= res!1002210 (= (select (arr!47889 a!2862) (index!50910 lt!644632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475447 (=> res!1002210 e!827786)))

(declare-fun b!1475448 () Bool)

(assert (=> b!1475448 (= e!827785 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47889 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475449 () Bool)

(assert (=> b!1475449 (and (bvsge (index!50910 lt!644632) #b00000000000000000000000000000000) (bvslt (index!50910 lt!644632) (size!48439 a!2862)))))

(assert (=> b!1475449 (= e!827786 (= (select (arr!47889 a!2862) (index!50910 lt!644632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155813 c!136133) b!1475446))

(assert (= (and d!155813 (not c!136133)) b!1475441))

(assert (= (and b!1475441 c!136134) b!1475442))

(assert (= (and b!1475441 (not c!136134)) b!1475448))

(assert (= (and d!155813 c!136135) b!1475445))

(assert (= (and d!155813 (not c!136135)) b!1475443))

(assert (= (and b!1475443 res!1002211) b!1475444))

(assert (= (and b!1475444 (not res!1002209)) b!1475447))

(assert (= (and b!1475447 (not res!1002210)) b!1475449))

(declare-fun m!1361731 () Bool)

(assert (=> b!1475449 m!1361731))

(assert (=> b!1475447 m!1361731))

(assert (=> d!155813 m!1361587))

(declare-fun m!1361733 () Bool)

(assert (=> d!155813 m!1361733))

(assert (=> d!155813 m!1361603))

(assert (=> b!1475444 m!1361731))

(assert (=> b!1475448 m!1361587))

(declare-fun m!1361735 () Bool)

(assert (=> b!1475448 m!1361735))

(assert (=> b!1475448 m!1361735))

(assert (=> b!1475448 m!1361567))

(declare-fun m!1361737 () Bool)

(assert (=> b!1475448 m!1361737))

(assert (=> b!1475265 d!155813))

(declare-fun d!155815 () Bool)

(declare-fun lt!644639 () (_ BitVec 32))

(declare-fun lt!644638 () (_ BitVec 32))

(assert (=> d!155815 (= lt!644639 (bvmul (bvxor lt!644638 (bvlshr lt!644638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155815 (= lt!644638 ((_ extract 31 0) (bvand (bvxor (select (arr!47889 a!2862) j!93) (bvlshr (select (arr!47889 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155815 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002205 (let ((h!35750 ((_ extract 31 0) (bvand (bvxor (select (arr!47889 a!2862) j!93) (bvlshr (select (arr!47889 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132498 (bvmul (bvxor h!35750 (bvlshr h!35750 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132498 (bvlshr x!132498 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002205 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002205 #b00000000000000000000000000000000))))))

(assert (=> d!155815 (= (toIndex!0 (select (arr!47889 a!2862) j!93) mask!2687) (bvand (bvxor lt!644639 (bvlshr lt!644639 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475265 d!155815))

(declare-fun d!155817 () Bool)

(assert (=> d!155817 (= (validKeyInArray!0 (select (arr!47889 a!2862) j!93)) (and (not (= (select (arr!47889 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47889 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475264 d!155817))

(declare-fun d!155819 () Bool)

(declare-fun res!1002226 () Bool)

(declare-fun e!827815 () Bool)

(assert (=> d!155819 (=> res!1002226 e!827815)))

(assert (=> d!155819 (= res!1002226 (bvsge #b00000000000000000000000000000000 (size!48439 a!2862)))))

(assert (=> d!155819 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34387) e!827815)))

(declare-fun bm!67784 () Bool)

(declare-fun call!67787 () Bool)

(declare-fun c!136153 () Bool)

(assert (=> bm!67784 (= call!67787 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136153 (Cons!34386 (select (arr!47889 a!2862) #b00000000000000000000000000000000) Nil!34387) Nil!34387)))))

(declare-fun b!1475496 () Bool)

(declare-fun e!827816 () Bool)

(assert (=> b!1475496 (= e!827815 e!827816)))

(declare-fun res!1002224 () Bool)

(assert (=> b!1475496 (=> (not res!1002224) (not e!827816))))

(declare-fun e!827817 () Bool)

(assert (=> b!1475496 (= res!1002224 (not e!827817))))

(declare-fun res!1002225 () Bool)

(assert (=> b!1475496 (=> (not res!1002225) (not e!827817))))

(assert (=> b!1475496 (= res!1002225 (validKeyInArray!0 (select (arr!47889 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475497 () Bool)

(declare-fun e!827814 () Bool)

(assert (=> b!1475497 (= e!827816 e!827814)))

(assert (=> b!1475497 (= c!136153 (validKeyInArray!0 (select (arr!47889 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475498 () Bool)

(assert (=> b!1475498 (= e!827814 call!67787)))

(declare-fun b!1475499 () Bool)

(assert (=> b!1475499 (= e!827814 call!67787)))

(declare-fun b!1475500 () Bool)

(declare-fun contains!9907 (List!34390 (_ BitVec 64)) Bool)

(assert (=> b!1475500 (= e!827817 (contains!9907 Nil!34387 (select (arr!47889 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155819 (not res!1002226)) b!1475496))

(assert (= (and b!1475496 res!1002225) b!1475500))

(assert (= (and b!1475496 res!1002224) b!1475497))

(assert (= (and b!1475497 c!136153) b!1475498))

(assert (= (and b!1475497 (not c!136153)) b!1475499))

(assert (= (or b!1475498 b!1475499) bm!67784))

(assert (=> bm!67784 m!1361659))

(declare-fun m!1361747 () Bool)

(assert (=> bm!67784 m!1361747))

(assert (=> b!1475496 m!1361659))

(assert (=> b!1475496 m!1361659))

(assert (=> b!1475496 m!1361669))

(assert (=> b!1475497 m!1361659))

(assert (=> b!1475497 m!1361659))

(assert (=> b!1475497 m!1361669))

(assert (=> b!1475500 m!1361659))

(assert (=> b!1475500 m!1361659))

(declare-fun m!1361749 () Bool)

(assert (=> b!1475500 m!1361749))

(assert (=> b!1475274 d!155819))

(check-sat (not bm!67780) (not b!1475418) (not b!1475378) (not d!155811) (not b!1475430) (not d!155781) (not bm!67781) (not d!155809) (not b!1475427) (not b!1475497) (not b!1475380) (not d!155775) (not d!155805) (not d!155777) (not b!1475382) (not d!155789) (not b!1475500) (not bm!67784) (not b!1475357) (not b!1475342) (not b!1475340) (not b!1475439) (not b!1475448) (not d!155783) (not b!1475409) (not b!1475496) (not d!155813))
(check-sat)
