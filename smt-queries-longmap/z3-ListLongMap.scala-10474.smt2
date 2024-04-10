; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123170 () Bool)

(assert start!123170)

(declare-fun e!806639 () Bool)

(declare-fun b!1428321 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97382 0))(
  ( (array!97383 (arr!47004 (Array (_ BitVec 32) (_ BitVec 64))) (size!47554 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97382)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11283 0))(
  ( (MissingZero!11283 (index!47524 (_ BitVec 32))) (Found!11283 (index!47525 (_ BitVec 32))) (Intermediate!11283 (undefined!12095 Bool) (index!47526 (_ BitVec 32)) (x!129159 (_ BitVec 32))) (Undefined!11283) (MissingVacant!11283 (index!47527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97382 (_ BitVec 32)) SeekEntryResult!11283)

(assert (=> b!1428321 (= e!806639 (= (seekEntryOrOpen!0 (select (arr!47004 a!2831) j!81) a!2831 mask!2608) (Found!11283 j!81)))))

(declare-fun b!1428322 () Bool)

(declare-fun res!963152 () Bool)

(declare-fun e!806638 () Bool)

(assert (=> b!1428322 (=> (not res!963152) (not e!806638))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428322 (= res!963152 (validKeyInArray!0 (select (arr!47004 a!2831) i!982)))))

(declare-fun b!1428323 () Bool)

(declare-fun res!963161 () Bool)

(declare-fun e!806641 () Bool)

(assert (=> b!1428323 (=> (not res!963161) (not e!806641))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628924 () SeekEntryResult!11283)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97382 (_ BitVec 32)) SeekEntryResult!11283)

(assert (=> b!1428323 (= res!963161 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47004 a!2831) j!81) a!2831 mask!2608) lt!628924))))

(declare-fun b!1428324 () Bool)

(declare-fun res!963159 () Bool)

(assert (=> b!1428324 (=> (not res!963159) (not e!806638))))

(assert (=> b!1428324 (= res!963159 (and (= (size!47554 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47554 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47554 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428325 () Bool)

(declare-fun e!806640 () Bool)

(assert (=> b!1428325 (= e!806640 e!806641)))

(declare-fun res!963162 () Bool)

(assert (=> b!1428325 (=> (not res!963162) (not e!806641))))

(declare-fun lt!628926 () SeekEntryResult!11283)

(declare-fun lt!628922 () array!97382)

(declare-fun lt!628925 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428325 (= res!963162 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628925 mask!2608) lt!628925 lt!628922 mask!2608) lt!628926))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428325 (= lt!628926 (Intermediate!11283 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428325 (= lt!628925 (select (store (arr!47004 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428325 (= lt!628922 (array!97383 (store (arr!47004 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47554 a!2831)))))

(declare-fun res!963163 () Bool)

(assert (=> start!123170 (=> (not res!963163) (not e!806638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123170 (= res!963163 (validMask!0 mask!2608))))

(assert (=> start!123170 e!806638))

(assert (=> start!123170 true))

(declare-fun array_inv!36032 (array!97382) Bool)

(assert (=> start!123170 (array_inv!36032 a!2831)))

(declare-fun b!1428326 () Bool)

(assert (=> b!1428326 (= e!806638 e!806640)))

(declare-fun res!963155 () Bool)

(assert (=> b!1428326 (=> (not res!963155) (not e!806640))))

(assert (=> b!1428326 (= res!963155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) (select (arr!47004 a!2831) j!81) a!2831 mask!2608) lt!628924))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428326 (= lt!628924 (Intermediate!11283 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428327 () Bool)

(declare-fun res!963154 () Bool)

(assert (=> b!1428327 (=> (not res!963154) (not e!806638))))

(assert (=> b!1428327 (= res!963154 (validKeyInArray!0 (select (arr!47004 a!2831) j!81)))))

(declare-fun b!1428328 () Bool)

(declare-fun res!963156 () Bool)

(assert (=> b!1428328 (=> (not res!963156) (not e!806638))))

(assert (=> b!1428328 (= res!963156 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47554 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47554 a!2831))))))

(declare-fun b!1428329 () Bool)

(assert (=> b!1428329 (= e!806641 (not (or (= (select (arr!47004 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47004 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!47004 a!2831) index!585) (select (arr!47004 a!2831) j!81))))))))

(assert (=> b!1428329 e!806639))

(declare-fun res!963157 () Bool)

(assert (=> b!1428329 (=> (not res!963157) (not e!806639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97382 (_ BitVec 32)) Bool)

(assert (=> b!1428329 (= res!963157 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48312 0))(
  ( (Unit!48313) )
))
(declare-fun lt!628923 () Unit!48312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48312)

(assert (=> b!1428329 (= lt!628923 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428330 () Bool)

(declare-fun res!963158 () Bool)

(assert (=> b!1428330 (=> (not res!963158) (not e!806638))))

(declare-datatypes ((List!33514 0))(
  ( (Nil!33511) (Cons!33510 (h!34821 (_ BitVec 64)) (t!48208 List!33514)) )
))
(declare-fun arrayNoDuplicates!0 (array!97382 (_ BitVec 32) List!33514) Bool)

(assert (=> b!1428330 (= res!963158 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33511))))

(declare-fun b!1428331 () Bool)

(declare-fun res!963153 () Bool)

(assert (=> b!1428331 (=> (not res!963153) (not e!806641))))

(assert (=> b!1428331 (= res!963153 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428332 () Bool)

(declare-fun res!963151 () Bool)

(assert (=> b!1428332 (=> (not res!963151) (not e!806641))))

(assert (=> b!1428332 (= res!963151 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628925 lt!628922 mask!2608) lt!628926))))

(declare-fun b!1428333 () Bool)

(declare-fun res!963160 () Bool)

(assert (=> b!1428333 (=> (not res!963160) (not e!806638))))

(assert (=> b!1428333 (= res!963160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123170 res!963163) b!1428324))

(assert (= (and b!1428324 res!963159) b!1428322))

(assert (= (and b!1428322 res!963152) b!1428327))

(assert (= (and b!1428327 res!963154) b!1428333))

(assert (= (and b!1428333 res!963160) b!1428330))

(assert (= (and b!1428330 res!963158) b!1428328))

(assert (= (and b!1428328 res!963156) b!1428326))

(assert (= (and b!1428326 res!963155) b!1428325))

(assert (= (and b!1428325 res!963162) b!1428323))

(assert (= (and b!1428323 res!963161) b!1428332))

(assert (= (and b!1428332 res!963151) b!1428331))

(assert (= (and b!1428331 res!963153) b!1428329))

(assert (= (and b!1428329 res!963157) b!1428321))

(declare-fun m!1318561 () Bool)

(assert (=> start!123170 m!1318561))

(declare-fun m!1318563 () Bool)

(assert (=> start!123170 m!1318563))

(declare-fun m!1318565 () Bool)

(assert (=> b!1428333 m!1318565))

(declare-fun m!1318567 () Bool)

(assert (=> b!1428325 m!1318567))

(assert (=> b!1428325 m!1318567))

(declare-fun m!1318569 () Bool)

(assert (=> b!1428325 m!1318569))

(declare-fun m!1318571 () Bool)

(assert (=> b!1428325 m!1318571))

(declare-fun m!1318573 () Bool)

(assert (=> b!1428325 m!1318573))

(declare-fun m!1318575 () Bool)

(assert (=> b!1428322 m!1318575))

(assert (=> b!1428322 m!1318575))

(declare-fun m!1318577 () Bool)

(assert (=> b!1428322 m!1318577))

(declare-fun m!1318579 () Bool)

(assert (=> b!1428329 m!1318579))

(declare-fun m!1318581 () Bool)

(assert (=> b!1428329 m!1318581))

(declare-fun m!1318583 () Bool)

(assert (=> b!1428329 m!1318583))

(declare-fun m!1318585 () Bool)

(assert (=> b!1428329 m!1318585))

(assert (=> b!1428323 m!1318581))

(assert (=> b!1428323 m!1318581))

(declare-fun m!1318587 () Bool)

(assert (=> b!1428323 m!1318587))

(assert (=> b!1428321 m!1318581))

(assert (=> b!1428321 m!1318581))

(declare-fun m!1318589 () Bool)

(assert (=> b!1428321 m!1318589))

(declare-fun m!1318591 () Bool)

(assert (=> b!1428332 m!1318591))

(assert (=> b!1428327 m!1318581))

(assert (=> b!1428327 m!1318581))

(declare-fun m!1318593 () Bool)

(assert (=> b!1428327 m!1318593))

(assert (=> b!1428326 m!1318581))

(assert (=> b!1428326 m!1318581))

(declare-fun m!1318595 () Bool)

(assert (=> b!1428326 m!1318595))

(assert (=> b!1428326 m!1318595))

(assert (=> b!1428326 m!1318581))

(declare-fun m!1318597 () Bool)

(assert (=> b!1428326 m!1318597))

(declare-fun m!1318599 () Bool)

(assert (=> b!1428330 m!1318599))

(check-sat (not b!1428329) (not start!123170) (not b!1428325) (not b!1428321) (not b!1428332) (not b!1428323) (not b!1428333) (not b!1428322) (not b!1428326) (not b!1428330) (not b!1428327))
(check-sat)
(get-model)

(declare-fun e!806670 () SeekEntryResult!11283)

(declare-fun b!1428391 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428391 (= e!806670 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47004 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428393 () Bool)

(declare-fun e!806671 () Bool)

(declare-fun lt!628947 () SeekEntryResult!11283)

(assert (=> b!1428393 (= e!806671 (bvsge (x!129159 lt!628947) #b01111111111111111111111111111110))))

(declare-fun b!1428394 () Bool)

(declare-fun e!806668 () SeekEntryResult!11283)

(assert (=> b!1428394 (= e!806668 e!806670)))

(declare-fun c!132084 () Bool)

(declare-fun lt!628946 () (_ BitVec 64))

(assert (=> b!1428394 (= c!132084 (or (= lt!628946 (select (arr!47004 a!2831) j!81)) (= (bvadd lt!628946 lt!628946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428395 () Bool)

(assert (=> b!1428395 (and (bvsge (index!47526 lt!628947) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628947) (size!47554 a!2831)))))

(declare-fun res!963211 () Bool)

(assert (=> b!1428395 (= res!963211 (= (select (arr!47004 a!2831) (index!47526 lt!628947)) (select (arr!47004 a!2831) j!81)))))

(declare-fun e!806672 () Bool)

(assert (=> b!1428395 (=> res!963211 e!806672)))

(declare-fun e!806669 () Bool)

(assert (=> b!1428395 (= e!806669 e!806672)))

(declare-fun b!1428396 () Bool)

(assert (=> b!1428396 (= e!806670 (Intermediate!11283 false index!585 x!605))))

(declare-fun b!1428397 () Bool)

(assert (=> b!1428397 (and (bvsge (index!47526 lt!628947) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628947) (size!47554 a!2831)))))

(assert (=> b!1428397 (= e!806672 (= (select (arr!47004 a!2831) (index!47526 lt!628947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428392 () Bool)

(assert (=> b!1428392 (= e!806671 e!806669)))

(declare-fun res!963210 () Bool)

(get-info :version)

(assert (=> b!1428392 (= res!963210 (and ((_ is Intermediate!11283) lt!628947) (not (undefined!12095 lt!628947)) (bvslt (x!129159 lt!628947) #b01111111111111111111111111111110) (bvsge (x!129159 lt!628947) #b00000000000000000000000000000000) (bvsge (x!129159 lt!628947) x!605)))))

(assert (=> b!1428392 (=> (not res!963210) (not e!806669))))

(declare-fun d!153459 () Bool)

(assert (=> d!153459 e!806671))

(declare-fun c!132082 () Bool)

(assert (=> d!153459 (= c!132082 (and ((_ is Intermediate!11283) lt!628947) (undefined!12095 lt!628947)))))

(assert (=> d!153459 (= lt!628947 e!806668)))

(declare-fun c!132083 () Bool)

(assert (=> d!153459 (= c!132083 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153459 (= lt!628946 (select (arr!47004 a!2831) index!585))))

(assert (=> d!153459 (validMask!0 mask!2608)))

(assert (=> d!153459 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47004 a!2831) j!81) a!2831 mask!2608) lt!628947)))

(declare-fun b!1428398 () Bool)

(assert (=> b!1428398 (and (bvsge (index!47526 lt!628947) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628947) (size!47554 a!2831)))))

(declare-fun res!963209 () Bool)

(assert (=> b!1428398 (= res!963209 (= (select (arr!47004 a!2831) (index!47526 lt!628947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428398 (=> res!963209 e!806672)))

(declare-fun b!1428399 () Bool)

(assert (=> b!1428399 (= e!806668 (Intermediate!11283 true index!585 x!605))))

(assert (= (and d!153459 c!132083) b!1428399))

(assert (= (and d!153459 (not c!132083)) b!1428394))

(assert (= (and b!1428394 c!132084) b!1428396))

(assert (= (and b!1428394 (not c!132084)) b!1428391))

(assert (= (and d!153459 c!132082) b!1428393))

(assert (= (and d!153459 (not c!132082)) b!1428392))

(assert (= (and b!1428392 res!963210) b!1428395))

(assert (= (and b!1428395 (not res!963211)) b!1428398))

(assert (= (and b!1428398 (not res!963209)) b!1428397))

(assert (=> d!153459 m!1318579))

(assert (=> d!153459 m!1318561))

(declare-fun m!1318641 () Bool)

(assert (=> b!1428391 m!1318641))

(assert (=> b!1428391 m!1318641))

(assert (=> b!1428391 m!1318581))

(declare-fun m!1318643 () Bool)

(assert (=> b!1428391 m!1318643))

(declare-fun m!1318645 () Bool)

(assert (=> b!1428397 m!1318645))

(assert (=> b!1428398 m!1318645))

(assert (=> b!1428395 m!1318645))

(assert (=> b!1428323 d!153459))

(declare-fun e!806675 () SeekEntryResult!11283)

(declare-fun b!1428400 () Bool)

(assert (=> b!1428400 (= e!806675 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628925 lt!628922 mask!2608))))

(declare-fun b!1428402 () Bool)

(declare-fun e!806676 () Bool)

(declare-fun lt!628949 () SeekEntryResult!11283)

(assert (=> b!1428402 (= e!806676 (bvsge (x!129159 lt!628949) #b01111111111111111111111111111110))))

(declare-fun b!1428403 () Bool)

(declare-fun e!806673 () SeekEntryResult!11283)

(assert (=> b!1428403 (= e!806673 e!806675)))

(declare-fun c!132087 () Bool)

(declare-fun lt!628948 () (_ BitVec 64))

(assert (=> b!1428403 (= c!132087 (or (= lt!628948 lt!628925) (= (bvadd lt!628948 lt!628948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428404 () Bool)

(assert (=> b!1428404 (and (bvsge (index!47526 lt!628949) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628949) (size!47554 lt!628922)))))

(declare-fun res!963214 () Bool)

(assert (=> b!1428404 (= res!963214 (= (select (arr!47004 lt!628922) (index!47526 lt!628949)) lt!628925))))

(declare-fun e!806677 () Bool)

(assert (=> b!1428404 (=> res!963214 e!806677)))

(declare-fun e!806674 () Bool)

(assert (=> b!1428404 (= e!806674 e!806677)))

(declare-fun b!1428405 () Bool)

(assert (=> b!1428405 (= e!806675 (Intermediate!11283 false index!585 x!605))))

(declare-fun b!1428406 () Bool)

(assert (=> b!1428406 (and (bvsge (index!47526 lt!628949) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628949) (size!47554 lt!628922)))))

(assert (=> b!1428406 (= e!806677 (= (select (arr!47004 lt!628922) (index!47526 lt!628949)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428401 () Bool)

(assert (=> b!1428401 (= e!806676 e!806674)))

(declare-fun res!963213 () Bool)

(assert (=> b!1428401 (= res!963213 (and ((_ is Intermediate!11283) lt!628949) (not (undefined!12095 lt!628949)) (bvslt (x!129159 lt!628949) #b01111111111111111111111111111110) (bvsge (x!129159 lt!628949) #b00000000000000000000000000000000) (bvsge (x!129159 lt!628949) x!605)))))

(assert (=> b!1428401 (=> (not res!963213) (not e!806674))))

(declare-fun d!153461 () Bool)

(assert (=> d!153461 e!806676))

(declare-fun c!132085 () Bool)

(assert (=> d!153461 (= c!132085 (and ((_ is Intermediate!11283) lt!628949) (undefined!12095 lt!628949)))))

(assert (=> d!153461 (= lt!628949 e!806673)))

(declare-fun c!132086 () Bool)

(assert (=> d!153461 (= c!132086 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153461 (= lt!628948 (select (arr!47004 lt!628922) index!585))))

(assert (=> d!153461 (validMask!0 mask!2608)))

(assert (=> d!153461 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628925 lt!628922 mask!2608) lt!628949)))

(declare-fun b!1428407 () Bool)

(assert (=> b!1428407 (and (bvsge (index!47526 lt!628949) #b00000000000000000000000000000000) (bvslt (index!47526 lt!628949) (size!47554 lt!628922)))))

(declare-fun res!963212 () Bool)

(assert (=> b!1428407 (= res!963212 (= (select (arr!47004 lt!628922) (index!47526 lt!628949)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428407 (=> res!963212 e!806677)))

(declare-fun b!1428408 () Bool)

(assert (=> b!1428408 (= e!806673 (Intermediate!11283 true index!585 x!605))))

(assert (= (and d!153461 c!132086) b!1428408))

(assert (= (and d!153461 (not c!132086)) b!1428403))

(assert (= (and b!1428403 c!132087) b!1428405))

(assert (= (and b!1428403 (not c!132087)) b!1428400))

(assert (= (and d!153461 c!132085) b!1428402))

(assert (= (and d!153461 (not c!132085)) b!1428401))

(assert (= (and b!1428401 res!963213) b!1428404))

(assert (= (and b!1428404 (not res!963214)) b!1428407))

(assert (= (and b!1428407 (not res!963212)) b!1428406))

(declare-fun m!1318647 () Bool)

(assert (=> d!153461 m!1318647))

(assert (=> d!153461 m!1318561))

(assert (=> b!1428400 m!1318641))

(assert (=> b!1428400 m!1318641))

(declare-fun m!1318649 () Bool)

(assert (=> b!1428400 m!1318649))

(declare-fun m!1318651 () Bool)

(assert (=> b!1428406 m!1318651))

(assert (=> b!1428407 m!1318651))

(assert (=> b!1428404 m!1318651))

(assert (=> b!1428332 d!153461))

(declare-fun bm!67384 () Bool)

(declare-fun call!67387 () Bool)

(assert (=> bm!67384 (= call!67387 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153463 () Bool)

(declare-fun res!963220 () Bool)

(declare-fun e!806686 () Bool)

(assert (=> d!153463 (=> res!963220 e!806686)))

(assert (=> d!153463 (= res!963220 (bvsge #b00000000000000000000000000000000 (size!47554 a!2831)))))

(assert (=> d!153463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806686)))

(declare-fun b!1428417 () Bool)

(declare-fun e!806684 () Bool)

(assert (=> b!1428417 (= e!806684 call!67387)))

(declare-fun b!1428418 () Bool)

(declare-fun e!806685 () Bool)

(assert (=> b!1428418 (= e!806685 call!67387)))

(declare-fun b!1428419 () Bool)

(assert (=> b!1428419 (= e!806686 e!806684)))

(declare-fun c!132090 () Bool)

(assert (=> b!1428419 (= c!132090 (validKeyInArray!0 (select (arr!47004 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428420 () Bool)

(assert (=> b!1428420 (= e!806684 e!806685)))

(declare-fun lt!628957 () (_ BitVec 64))

(assert (=> b!1428420 (= lt!628957 (select (arr!47004 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628958 () Unit!48312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97382 (_ BitVec 64) (_ BitVec 32)) Unit!48312)

(assert (=> b!1428420 (= lt!628958 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628957 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1428420 (arrayContainsKey!0 a!2831 lt!628957 #b00000000000000000000000000000000)))

(declare-fun lt!628956 () Unit!48312)

(assert (=> b!1428420 (= lt!628956 lt!628958)))

(declare-fun res!963219 () Bool)

(assert (=> b!1428420 (= res!963219 (= (seekEntryOrOpen!0 (select (arr!47004 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11283 #b00000000000000000000000000000000)))))

(assert (=> b!1428420 (=> (not res!963219) (not e!806685))))

(assert (= (and d!153463 (not res!963220)) b!1428419))

(assert (= (and b!1428419 c!132090) b!1428420))

(assert (= (and b!1428419 (not c!132090)) b!1428417))

(assert (= (and b!1428420 res!963219) b!1428418))

(assert (= (or b!1428418 b!1428417) bm!67384))

(declare-fun m!1318653 () Bool)

(assert (=> bm!67384 m!1318653))

(declare-fun m!1318655 () Bool)

(assert (=> b!1428419 m!1318655))

(assert (=> b!1428419 m!1318655))

(declare-fun m!1318657 () Bool)

(assert (=> b!1428419 m!1318657))

(assert (=> b!1428420 m!1318655))

(declare-fun m!1318659 () Bool)

(assert (=> b!1428420 m!1318659))

(declare-fun m!1318661 () Bool)

(assert (=> b!1428420 m!1318661))

(assert (=> b!1428420 m!1318655))

(declare-fun m!1318663 () Bool)

(assert (=> b!1428420 m!1318663))

(assert (=> b!1428333 d!153463))

(declare-fun d!153469 () Bool)

(assert (=> d!153469 (= (validKeyInArray!0 (select (arr!47004 a!2831) i!982)) (and (not (= (select (arr!47004 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47004 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428322 d!153469))

(declare-fun d!153471 () Bool)

(assert (=> d!153471 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123170 d!153471))

(declare-fun d!153479 () Bool)

(assert (=> d!153479 (= (array_inv!36032 a!2831) (bvsge (size!47554 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123170 d!153479))

(declare-fun d!153481 () Bool)

(declare-fun lt!628988 () SeekEntryResult!11283)

(assert (=> d!153481 (and (or ((_ is Undefined!11283) lt!628988) (not ((_ is Found!11283) lt!628988)) (and (bvsge (index!47525 lt!628988) #b00000000000000000000000000000000) (bvslt (index!47525 lt!628988) (size!47554 a!2831)))) (or ((_ is Undefined!11283) lt!628988) ((_ is Found!11283) lt!628988) (not ((_ is MissingZero!11283) lt!628988)) (and (bvsge (index!47524 lt!628988) #b00000000000000000000000000000000) (bvslt (index!47524 lt!628988) (size!47554 a!2831)))) (or ((_ is Undefined!11283) lt!628988) ((_ is Found!11283) lt!628988) ((_ is MissingZero!11283) lt!628988) (not ((_ is MissingVacant!11283) lt!628988)) (and (bvsge (index!47527 lt!628988) #b00000000000000000000000000000000) (bvslt (index!47527 lt!628988) (size!47554 a!2831)))) (or ((_ is Undefined!11283) lt!628988) (ite ((_ is Found!11283) lt!628988) (= (select (arr!47004 a!2831) (index!47525 lt!628988)) (select (arr!47004 a!2831) j!81)) (ite ((_ is MissingZero!11283) lt!628988) (= (select (arr!47004 a!2831) (index!47524 lt!628988)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11283) lt!628988) (= (select (arr!47004 a!2831) (index!47527 lt!628988)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806749 () SeekEntryResult!11283)

(assert (=> d!153481 (= lt!628988 e!806749)))

(declare-fun c!132121 () Bool)

(declare-fun lt!628989 () SeekEntryResult!11283)

(assert (=> d!153481 (= c!132121 (and ((_ is Intermediate!11283) lt!628989) (undefined!12095 lt!628989)))))

(assert (=> d!153481 (= lt!628989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) (select (arr!47004 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153481 (validMask!0 mask!2608)))

(assert (=> d!153481 (= (seekEntryOrOpen!0 (select (arr!47004 a!2831) j!81) a!2831 mask!2608) lt!628988)))

(declare-fun b!1428515 () Bool)

(declare-fun e!806751 () SeekEntryResult!11283)

(assert (=> b!1428515 (= e!806751 (Found!11283 (index!47526 lt!628989)))))

(declare-fun b!1428516 () Bool)

(declare-fun e!806750 () SeekEntryResult!11283)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97382 (_ BitVec 32)) SeekEntryResult!11283)

(assert (=> b!1428516 (= e!806750 (seekKeyOrZeroReturnVacant!0 (x!129159 lt!628989) (index!47526 lt!628989) (index!47526 lt!628989) (select (arr!47004 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428517 () Bool)

(assert (=> b!1428517 (= e!806750 (MissingZero!11283 (index!47526 lt!628989)))))

(declare-fun b!1428518 () Bool)

(declare-fun c!132119 () Bool)

(declare-fun lt!628990 () (_ BitVec 64))

(assert (=> b!1428518 (= c!132119 (= lt!628990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428518 (= e!806751 e!806750)))

(declare-fun b!1428519 () Bool)

(assert (=> b!1428519 (= e!806749 e!806751)))

(assert (=> b!1428519 (= lt!628990 (select (arr!47004 a!2831) (index!47526 lt!628989)))))

(declare-fun c!132120 () Bool)

(assert (=> b!1428519 (= c!132120 (= lt!628990 (select (arr!47004 a!2831) j!81)))))

(declare-fun b!1428520 () Bool)

(assert (=> b!1428520 (= e!806749 Undefined!11283)))

(assert (= (and d!153481 c!132121) b!1428520))

(assert (= (and d!153481 (not c!132121)) b!1428519))

(assert (= (and b!1428519 c!132120) b!1428515))

(assert (= (and b!1428519 (not c!132120)) b!1428518))

(assert (= (and b!1428518 c!132119) b!1428517))

(assert (= (and b!1428518 (not c!132119)) b!1428516))

(assert (=> d!153481 m!1318581))

(assert (=> d!153481 m!1318595))

(declare-fun m!1318709 () Bool)

(assert (=> d!153481 m!1318709))

(assert (=> d!153481 m!1318595))

(assert (=> d!153481 m!1318581))

(assert (=> d!153481 m!1318597))

(declare-fun m!1318711 () Bool)

(assert (=> d!153481 m!1318711))

(assert (=> d!153481 m!1318561))

(declare-fun m!1318713 () Bool)

(assert (=> d!153481 m!1318713))

(assert (=> b!1428516 m!1318581))

(declare-fun m!1318715 () Bool)

(assert (=> b!1428516 m!1318715))

(declare-fun m!1318717 () Bool)

(assert (=> b!1428519 m!1318717))

(assert (=> b!1428321 d!153481))

(declare-fun b!1428543 () Bool)

(declare-fun e!806769 () Bool)

(declare-fun e!806771 () Bool)

(assert (=> b!1428543 (= e!806769 e!806771)))

(declare-fun c!132127 () Bool)

(assert (=> b!1428543 (= c!132127 (validKeyInArray!0 (select (arr!47004 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428544 () Bool)

(declare-fun call!67403 () Bool)

(assert (=> b!1428544 (= e!806771 call!67403)))

(declare-fun bm!67400 () Bool)

(assert (=> bm!67400 (= call!67403 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132127 (Cons!33510 (select (arr!47004 a!2831) #b00000000000000000000000000000000) Nil!33511) Nil!33511)))))

(declare-fun d!153497 () Bool)

(declare-fun res!963273 () Bool)

(declare-fun e!806772 () Bool)

(assert (=> d!153497 (=> res!963273 e!806772)))

(assert (=> d!153497 (= res!963273 (bvsge #b00000000000000000000000000000000 (size!47554 a!2831)))))

(assert (=> d!153497 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33511) e!806772)))

(declare-fun b!1428545 () Bool)

(assert (=> b!1428545 (= e!806772 e!806769)))

(declare-fun res!963272 () Bool)

(assert (=> b!1428545 (=> (not res!963272) (not e!806769))))

(declare-fun e!806770 () Bool)

(assert (=> b!1428545 (= res!963272 (not e!806770))))

(declare-fun res!963271 () Bool)

(assert (=> b!1428545 (=> (not res!963271) (not e!806770))))

(assert (=> b!1428545 (= res!963271 (validKeyInArray!0 (select (arr!47004 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428546 () Bool)

(assert (=> b!1428546 (= e!806771 call!67403)))

(declare-fun b!1428547 () Bool)

(declare-fun contains!9855 (List!33514 (_ BitVec 64)) Bool)

(assert (=> b!1428547 (= e!806770 (contains!9855 Nil!33511 (select (arr!47004 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153497 (not res!963273)) b!1428545))

(assert (= (and b!1428545 res!963271) b!1428547))

(assert (= (and b!1428545 res!963272) b!1428543))

(assert (= (and b!1428543 c!132127) b!1428544))

(assert (= (and b!1428543 (not c!132127)) b!1428546))

(assert (= (or b!1428544 b!1428546) bm!67400))

(assert (=> b!1428543 m!1318655))

(assert (=> b!1428543 m!1318655))

(assert (=> b!1428543 m!1318657))

(assert (=> bm!67400 m!1318655))

(declare-fun m!1318727 () Bool)

(assert (=> bm!67400 m!1318727))

(assert (=> b!1428545 m!1318655))

(assert (=> b!1428545 m!1318655))

(assert (=> b!1428545 m!1318657))

(assert (=> b!1428547 m!1318655))

(assert (=> b!1428547 m!1318655))

(declare-fun m!1318733 () Bool)

(assert (=> b!1428547 m!1318733))

(assert (=> b!1428330 d!153497))

(declare-fun call!67405 () Bool)

(declare-fun bm!67402 () Bool)

(assert (=> bm!67402 (= call!67405 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153501 () Bool)

(declare-fun res!963277 () Bool)

(declare-fun e!806778 () Bool)

(assert (=> d!153501 (=> res!963277 e!806778)))

(assert (=> d!153501 (= res!963277 (bvsge j!81 (size!47554 a!2831)))))

(assert (=> d!153501 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806778)))

(declare-fun b!1428552 () Bool)

(declare-fun e!806776 () Bool)

(assert (=> b!1428552 (= e!806776 call!67405)))

(declare-fun b!1428553 () Bool)

(declare-fun e!806777 () Bool)

(assert (=> b!1428553 (= e!806777 call!67405)))

(declare-fun b!1428554 () Bool)

(assert (=> b!1428554 (= e!806778 e!806776)))

(declare-fun c!132129 () Bool)

(assert (=> b!1428554 (= c!132129 (validKeyInArray!0 (select (arr!47004 a!2831) j!81)))))

(declare-fun b!1428555 () Bool)

(assert (=> b!1428555 (= e!806776 e!806777)))

(declare-fun lt!629004 () (_ BitVec 64))

(assert (=> b!1428555 (= lt!629004 (select (arr!47004 a!2831) j!81))))

(declare-fun lt!629005 () Unit!48312)

(assert (=> b!1428555 (= lt!629005 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629004 j!81))))

(assert (=> b!1428555 (arrayContainsKey!0 a!2831 lt!629004 #b00000000000000000000000000000000)))

(declare-fun lt!629003 () Unit!48312)

(assert (=> b!1428555 (= lt!629003 lt!629005)))

(declare-fun res!963276 () Bool)

(assert (=> b!1428555 (= res!963276 (= (seekEntryOrOpen!0 (select (arr!47004 a!2831) j!81) a!2831 mask!2608) (Found!11283 j!81)))))

(assert (=> b!1428555 (=> (not res!963276) (not e!806777))))

(assert (= (and d!153501 (not res!963277)) b!1428554))

(assert (= (and b!1428554 c!132129) b!1428555))

(assert (= (and b!1428554 (not c!132129)) b!1428552))

(assert (= (and b!1428555 res!963276) b!1428553))

(assert (= (or b!1428553 b!1428552) bm!67402))

(declare-fun m!1318737 () Bool)

(assert (=> bm!67402 m!1318737))

(assert (=> b!1428554 m!1318581))

(assert (=> b!1428554 m!1318581))

(assert (=> b!1428554 m!1318593))

(assert (=> b!1428555 m!1318581))

(declare-fun m!1318739 () Bool)

(assert (=> b!1428555 m!1318739))

(declare-fun m!1318741 () Bool)

(assert (=> b!1428555 m!1318741))

(assert (=> b!1428555 m!1318581))

(assert (=> b!1428555 m!1318589))

(assert (=> b!1428329 d!153501))

(declare-fun d!153505 () Bool)

(assert (=> d!153505 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629013 () Unit!48312)

(declare-fun choose!38 (array!97382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48312)

(assert (=> d!153505 (= lt!629013 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153505 (validMask!0 mask!2608)))

(assert (=> d!153505 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629013)))

(declare-fun bs!41626 () Bool)

(assert (= bs!41626 d!153505))

(assert (=> bs!41626 m!1318583))

(declare-fun m!1318745 () Bool)

(assert (=> bs!41626 m!1318745))

(assert (=> bs!41626 m!1318561))

(assert (=> b!1428329 d!153505))

(declare-fun d!153509 () Bool)

(assert (=> d!153509 (= (validKeyInArray!0 (select (arr!47004 a!2831) j!81)) (and (not (= (select (arr!47004 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47004 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428327 d!153509))

(declare-fun b!1428565 () Bool)

(declare-fun e!806786 () SeekEntryResult!11283)

(assert (=> b!1428565 (= e!806786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47004 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428567 () Bool)

(declare-fun e!806787 () Bool)

(declare-fun lt!629015 () SeekEntryResult!11283)

(assert (=> b!1428567 (= e!806787 (bvsge (x!129159 lt!629015) #b01111111111111111111111111111110))))

(declare-fun b!1428568 () Bool)

(declare-fun e!806784 () SeekEntryResult!11283)

(assert (=> b!1428568 (= e!806784 e!806786)))

(declare-fun c!132135 () Bool)

(declare-fun lt!629014 () (_ BitVec 64))

(assert (=> b!1428568 (= c!132135 (or (= lt!629014 (select (arr!47004 a!2831) j!81)) (= (bvadd lt!629014 lt!629014) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428569 () Bool)

(assert (=> b!1428569 (and (bvsge (index!47526 lt!629015) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629015) (size!47554 a!2831)))))

(declare-fun res!963283 () Bool)

(assert (=> b!1428569 (= res!963283 (= (select (arr!47004 a!2831) (index!47526 lt!629015)) (select (arr!47004 a!2831) j!81)))))

(declare-fun e!806788 () Bool)

(assert (=> b!1428569 (=> res!963283 e!806788)))

(declare-fun e!806785 () Bool)

(assert (=> b!1428569 (= e!806785 e!806788)))

(declare-fun b!1428570 () Bool)

(assert (=> b!1428570 (= e!806786 (Intermediate!11283 false (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428571 () Bool)

(assert (=> b!1428571 (and (bvsge (index!47526 lt!629015) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629015) (size!47554 a!2831)))))

(assert (=> b!1428571 (= e!806788 (= (select (arr!47004 a!2831) (index!47526 lt!629015)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428566 () Bool)

(assert (=> b!1428566 (= e!806787 e!806785)))

(declare-fun res!963282 () Bool)

(assert (=> b!1428566 (= res!963282 (and ((_ is Intermediate!11283) lt!629015) (not (undefined!12095 lt!629015)) (bvslt (x!129159 lt!629015) #b01111111111111111111111111111110) (bvsge (x!129159 lt!629015) #b00000000000000000000000000000000) (bvsge (x!129159 lt!629015) #b00000000000000000000000000000000)))))

(assert (=> b!1428566 (=> (not res!963282) (not e!806785))))

(declare-fun d!153511 () Bool)

(assert (=> d!153511 e!806787))

(declare-fun c!132133 () Bool)

(assert (=> d!153511 (= c!132133 (and ((_ is Intermediate!11283) lt!629015) (undefined!12095 lt!629015)))))

(assert (=> d!153511 (= lt!629015 e!806784)))

(declare-fun c!132134 () Bool)

(assert (=> d!153511 (= c!132134 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153511 (= lt!629014 (select (arr!47004 a!2831) (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608)))))

(assert (=> d!153511 (validMask!0 mask!2608)))

(assert (=> d!153511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) (select (arr!47004 a!2831) j!81) a!2831 mask!2608) lt!629015)))

(declare-fun b!1428572 () Bool)

(assert (=> b!1428572 (and (bvsge (index!47526 lt!629015) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629015) (size!47554 a!2831)))))

(declare-fun res!963281 () Bool)

(assert (=> b!1428572 (= res!963281 (= (select (arr!47004 a!2831) (index!47526 lt!629015)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428572 (=> res!963281 e!806788)))

(declare-fun b!1428573 () Bool)

(assert (=> b!1428573 (= e!806784 (Intermediate!11283 true (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153511 c!132134) b!1428573))

(assert (= (and d!153511 (not c!132134)) b!1428568))

(assert (= (and b!1428568 c!132135) b!1428570))

(assert (= (and b!1428568 (not c!132135)) b!1428565))

(assert (= (and d!153511 c!132133) b!1428567))

(assert (= (and d!153511 (not c!132133)) b!1428566))

(assert (= (and b!1428566 res!963282) b!1428569))

(assert (= (and b!1428569 (not res!963283)) b!1428572))

(assert (= (and b!1428572 (not res!963281)) b!1428571))

(assert (=> d!153511 m!1318595))

(declare-fun m!1318755 () Bool)

(assert (=> d!153511 m!1318755))

(assert (=> d!153511 m!1318561))

(assert (=> b!1428565 m!1318595))

(declare-fun m!1318757 () Bool)

(assert (=> b!1428565 m!1318757))

(assert (=> b!1428565 m!1318757))

(assert (=> b!1428565 m!1318581))

(declare-fun m!1318759 () Bool)

(assert (=> b!1428565 m!1318759))

(declare-fun m!1318761 () Bool)

(assert (=> b!1428571 m!1318761))

(assert (=> b!1428572 m!1318761))

(assert (=> b!1428569 m!1318761))

(assert (=> b!1428326 d!153511))

(declare-fun d!153515 () Bool)

(declare-fun lt!629031 () (_ BitVec 32))

(declare-fun lt!629030 () (_ BitVec 32))

(assert (=> d!153515 (= lt!629031 (bvmul (bvxor lt!629030 (bvlshr lt!629030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153515 (= lt!629030 ((_ extract 31 0) (bvand (bvxor (select (arr!47004 a!2831) j!81) (bvlshr (select (arr!47004 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153515 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963285 (let ((h!34824 ((_ extract 31 0) (bvand (bvxor (select (arr!47004 a!2831) j!81) (bvlshr (select (arr!47004 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129165 (bvmul (bvxor h!34824 (bvlshr h!34824 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129165 (bvlshr x!129165 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963285 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963285 #b00000000000000000000000000000000))))))

(assert (=> d!153515 (= (toIndex!0 (select (arr!47004 a!2831) j!81) mask!2608) (bvand (bvxor lt!629031 (bvlshr lt!629031 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428326 d!153515))

(declare-fun b!1428592 () Bool)

(declare-fun e!806801 () SeekEntryResult!11283)

(assert (=> b!1428592 (= e!806801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628925 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628925 lt!628922 mask!2608))))

(declare-fun b!1428594 () Bool)

(declare-fun e!806802 () Bool)

(declare-fun lt!629033 () SeekEntryResult!11283)

(assert (=> b!1428594 (= e!806802 (bvsge (x!129159 lt!629033) #b01111111111111111111111111111110))))

(declare-fun b!1428595 () Bool)

(declare-fun e!806799 () SeekEntryResult!11283)

(assert (=> b!1428595 (= e!806799 e!806801)))

(declare-fun c!132144 () Bool)

(declare-fun lt!629032 () (_ BitVec 64))

(assert (=> b!1428595 (= c!132144 (or (= lt!629032 lt!628925) (= (bvadd lt!629032 lt!629032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428596 () Bool)

(assert (=> b!1428596 (and (bvsge (index!47526 lt!629033) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629033) (size!47554 lt!628922)))))

(declare-fun res!963294 () Bool)

(assert (=> b!1428596 (= res!963294 (= (select (arr!47004 lt!628922) (index!47526 lt!629033)) lt!628925))))

(declare-fun e!806803 () Bool)

(assert (=> b!1428596 (=> res!963294 e!806803)))

(declare-fun e!806800 () Bool)

(assert (=> b!1428596 (= e!806800 e!806803)))

(declare-fun b!1428597 () Bool)

(assert (=> b!1428597 (= e!806801 (Intermediate!11283 false (toIndex!0 lt!628925 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428598 () Bool)

(assert (=> b!1428598 (and (bvsge (index!47526 lt!629033) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629033) (size!47554 lt!628922)))))

(assert (=> b!1428598 (= e!806803 (= (select (arr!47004 lt!628922) (index!47526 lt!629033)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428593 () Bool)

(assert (=> b!1428593 (= e!806802 e!806800)))

(declare-fun res!963293 () Bool)

(assert (=> b!1428593 (= res!963293 (and ((_ is Intermediate!11283) lt!629033) (not (undefined!12095 lt!629033)) (bvslt (x!129159 lt!629033) #b01111111111111111111111111111110) (bvsge (x!129159 lt!629033) #b00000000000000000000000000000000) (bvsge (x!129159 lt!629033) #b00000000000000000000000000000000)))))

(assert (=> b!1428593 (=> (not res!963293) (not e!806800))))

(declare-fun d!153519 () Bool)

(assert (=> d!153519 e!806802))

(declare-fun c!132142 () Bool)

(assert (=> d!153519 (= c!132142 (and ((_ is Intermediate!11283) lt!629033) (undefined!12095 lt!629033)))))

(assert (=> d!153519 (= lt!629033 e!806799)))

(declare-fun c!132143 () Bool)

(assert (=> d!153519 (= c!132143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153519 (= lt!629032 (select (arr!47004 lt!628922) (toIndex!0 lt!628925 mask!2608)))))

(assert (=> d!153519 (validMask!0 mask!2608)))

(assert (=> d!153519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628925 mask!2608) lt!628925 lt!628922 mask!2608) lt!629033)))

(declare-fun b!1428599 () Bool)

(assert (=> b!1428599 (and (bvsge (index!47526 lt!629033) #b00000000000000000000000000000000) (bvslt (index!47526 lt!629033) (size!47554 lt!628922)))))

(declare-fun res!963292 () Bool)

(assert (=> b!1428599 (= res!963292 (= (select (arr!47004 lt!628922) (index!47526 lt!629033)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428599 (=> res!963292 e!806803)))

(declare-fun b!1428600 () Bool)

(assert (=> b!1428600 (= e!806799 (Intermediate!11283 true (toIndex!0 lt!628925 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153519 c!132143) b!1428600))

(assert (= (and d!153519 (not c!132143)) b!1428595))

(assert (= (and b!1428595 c!132144) b!1428597))

(assert (= (and b!1428595 (not c!132144)) b!1428592))

(assert (= (and d!153519 c!132142) b!1428594))

(assert (= (and d!153519 (not c!132142)) b!1428593))

(assert (= (and b!1428593 res!963293) b!1428596))

(assert (= (and b!1428596 (not res!963294)) b!1428599))

(assert (= (and b!1428599 (not res!963292)) b!1428598))

(assert (=> d!153519 m!1318567))

(declare-fun m!1318763 () Bool)

(assert (=> d!153519 m!1318763))

(assert (=> d!153519 m!1318561))

(assert (=> b!1428592 m!1318567))

(declare-fun m!1318765 () Bool)

(assert (=> b!1428592 m!1318765))

(assert (=> b!1428592 m!1318765))

(declare-fun m!1318767 () Bool)

(assert (=> b!1428592 m!1318767))

(declare-fun m!1318769 () Bool)

(assert (=> b!1428598 m!1318769))

(assert (=> b!1428599 m!1318769))

(assert (=> b!1428596 m!1318769))

(assert (=> b!1428325 d!153519))

(declare-fun d!153521 () Bool)

(declare-fun lt!629037 () (_ BitVec 32))

(declare-fun lt!629036 () (_ BitVec 32))

(assert (=> d!153521 (= lt!629037 (bvmul (bvxor lt!629036 (bvlshr lt!629036 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153521 (= lt!629036 ((_ extract 31 0) (bvand (bvxor lt!628925 (bvlshr lt!628925 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153521 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963285 (let ((h!34824 ((_ extract 31 0) (bvand (bvxor lt!628925 (bvlshr lt!628925 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129165 (bvmul (bvxor h!34824 (bvlshr h!34824 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129165 (bvlshr x!129165 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963285 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963285 #b00000000000000000000000000000000))))))

(assert (=> d!153521 (= (toIndex!0 lt!628925 mask!2608) (bvand (bvxor lt!629037 (bvlshr lt!629037 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428325 d!153521))

(check-sat (not d!153505) (not b!1428543) (not d!153519) (not b!1428547) (not d!153461) (not b!1428592) (not b!1428391) (not bm!67384) (not b!1428420) (not bm!67402) (not b!1428555) (not b!1428565) (not bm!67400) (not d!153511) (not d!153481) (not b!1428554) (not b!1428400) (not b!1428545) (not b!1428419) (not b!1428516) (not d!153459))
(check-sat)
