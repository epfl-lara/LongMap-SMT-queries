; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124290 () Bool)

(assert start!124290)

(declare-fun b!1438362 () Bool)

(declare-fun res!971042 () Bool)

(declare-fun e!811378 () Bool)

(assert (=> b!1438362 (=> (not res!971042) (not e!811378))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97816 0))(
  ( (array!97817 (arr!47199 (Array (_ BitVec 32) (_ BitVec 64))) (size!47749 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97816)

(declare-datatypes ((SeekEntryResult!11451 0))(
  ( (MissingZero!11451 (index!48196 (_ BitVec 32))) (Found!11451 (index!48197 (_ BitVec 32))) (Intermediate!11451 (undefined!12263 Bool) (index!48198 (_ BitVec 32)) (x!129928 (_ BitVec 32))) (Undefined!11451) (MissingVacant!11451 (index!48199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97816 (_ BitVec 32)) SeekEntryResult!11451)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438362 (= res!971042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)) mask!2687) (Intermediate!11451 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438363 () Bool)

(declare-fun e!811377 () Bool)

(assert (=> b!1438363 (= e!811377 e!811378)))

(declare-fun res!971035 () Bool)

(assert (=> b!1438363 (=> (not res!971035) (not e!811378))))

(declare-fun lt!632532 () SeekEntryResult!11451)

(assert (=> b!1438363 (= res!971035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) (select (arr!47199 a!2862) j!93) a!2862 mask!2687) lt!632532))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438363 (= lt!632532 (Intermediate!11451 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438364 () Bool)

(declare-fun res!971037 () Bool)

(assert (=> b!1438364 (=> (not res!971037) (not e!811377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438364 (= res!971037 (validKeyInArray!0 (select (arr!47199 a!2862) i!1006)))))

(declare-fun b!1438365 () Bool)

(declare-fun res!971043 () Bool)

(assert (=> b!1438365 (=> (not res!971043) (not e!811377))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438365 (= res!971043 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47749 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47749 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47749 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438366 () Bool)

(assert (=> b!1438366 (= e!811378 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1438367 () Bool)

(declare-fun res!971040 () Bool)

(assert (=> b!1438367 (=> (not res!971040) (not e!811377))))

(assert (=> b!1438367 (= res!971040 (and (= (size!47749 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47749 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47749 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438368 () Bool)

(declare-fun res!971036 () Bool)

(assert (=> b!1438368 (=> (not res!971036) (not e!811378))))

(assert (=> b!1438368 (= res!971036 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47199 a!2862) j!93) a!2862 mask!2687) lt!632532))))

(declare-fun b!1438369 () Bool)

(declare-fun res!971039 () Bool)

(assert (=> b!1438369 (=> (not res!971039) (not e!811377))))

(assert (=> b!1438369 (= res!971039 (validKeyInArray!0 (select (arr!47199 a!2862) j!93)))))

(declare-fun res!971044 () Bool)

(assert (=> start!124290 (=> (not res!971044) (not e!811377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124290 (= res!971044 (validMask!0 mask!2687))))

(assert (=> start!124290 e!811377))

(assert (=> start!124290 true))

(declare-fun array_inv!36227 (array!97816) Bool)

(assert (=> start!124290 (array_inv!36227 a!2862)))

(declare-fun b!1438370 () Bool)

(declare-fun res!971038 () Bool)

(assert (=> b!1438370 (=> (not res!971038) (not e!811377))))

(declare-datatypes ((List!33700 0))(
  ( (Nil!33697) (Cons!33696 (h!35040 (_ BitVec 64)) (t!48394 List!33700)) )
))
(declare-fun arrayNoDuplicates!0 (array!97816 (_ BitVec 32) List!33700) Bool)

(assert (=> b!1438370 (= res!971038 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33697))))

(declare-fun b!1438371 () Bool)

(declare-fun res!971041 () Bool)

(assert (=> b!1438371 (=> (not res!971041) (not e!811377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97816 (_ BitVec 32)) Bool)

(assert (=> b!1438371 (= res!971041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124290 res!971044) b!1438367))

(assert (= (and b!1438367 res!971040) b!1438364))

(assert (= (and b!1438364 res!971037) b!1438369))

(assert (= (and b!1438369 res!971039) b!1438371))

(assert (= (and b!1438371 res!971041) b!1438370))

(assert (= (and b!1438370 res!971038) b!1438365))

(assert (= (and b!1438365 res!971043) b!1438363))

(assert (= (and b!1438363 res!971035) b!1438368))

(assert (= (and b!1438368 res!971036) b!1438362))

(assert (= (and b!1438362 res!971042) b!1438366))

(declare-fun m!1327551 () Bool)

(assert (=> b!1438369 m!1327551))

(assert (=> b!1438369 m!1327551))

(declare-fun m!1327553 () Bool)

(assert (=> b!1438369 m!1327553))

(assert (=> b!1438363 m!1327551))

(assert (=> b!1438363 m!1327551))

(declare-fun m!1327555 () Bool)

(assert (=> b!1438363 m!1327555))

(assert (=> b!1438363 m!1327555))

(assert (=> b!1438363 m!1327551))

(declare-fun m!1327557 () Bool)

(assert (=> b!1438363 m!1327557))

(declare-fun m!1327559 () Bool)

(assert (=> b!1438365 m!1327559))

(declare-fun m!1327561 () Bool)

(assert (=> b!1438365 m!1327561))

(declare-fun m!1327563 () Bool)

(assert (=> b!1438370 m!1327563))

(assert (=> b!1438368 m!1327551))

(assert (=> b!1438368 m!1327551))

(declare-fun m!1327565 () Bool)

(assert (=> b!1438368 m!1327565))

(declare-fun m!1327567 () Bool)

(assert (=> b!1438364 m!1327567))

(assert (=> b!1438364 m!1327567))

(declare-fun m!1327569 () Bool)

(assert (=> b!1438364 m!1327569))

(declare-fun m!1327571 () Bool)

(assert (=> b!1438371 m!1327571))

(declare-fun m!1327573 () Bool)

(assert (=> start!124290 m!1327573))

(declare-fun m!1327575 () Bool)

(assert (=> start!124290 m!1327575))

(assert (=> b!1438362 m!1327559))

(declare-fun m!1327577 () Bool)

(assert (=> b!1438362 m!1327577))

(assert (=> b!1438362 m!1327577))

(declare-fun m!1327579 () Bool)

(assert (=> b!1438362 m!1327579))

(assert (=> b!1438362 m!1327579))

(assert (=> b!1438362 m!1327577))

(declare-fun m!1327581 () Bool)

(assert (=> b!1438362 m!1327581))

(check-sat (not b!1438364) (not b!1438362) (not b!1438368) (not b!1438369) (not start!124290) (not b!1438371) (not b!1438370) (not b!1438363))
(check-sat)
(get-model)

(declare-fun bm!67660 () Bool)

(declare-fun call!67663 () Bool)

(declare-fun c!133173 () Bool)

(assert (=> bm!67660 (= call!67663 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133173 (Cons!33696 (select (arr!47199 a!2862) #b00000000000000000000000000000000) Nil!33697) Nil!33697)))))

(declare-fun b!1438412 () Bool)

(declare-fun e!811397 () Bool)

(declare-fun e!811398 () Bool)

(assert (=> b!1438412 (= e!811397 e!811398)))

(declare-fun res!971083 () Bool)

(assert (=> b!1438412 (=> (not res!971083) (not e!811398))))

(declare-fun e!811400 () Bool)

(assert (=> b!1438412 (= res!971083 (not e!811400))))

(declare-fun res!971081 () Bool)

(assert (=> b!1438412 (=> (not res!971081) (not e!811400))))

(assert (=> b!1438412 (= res!971081 (validKeyInArray!0 (select (arr!47199 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438413 () Bool)

(declare-fun e!811399 () Bool)

(assert (=> b!1438413 (= e!811399 call!67663)))

(declare-fun b!1438414 () Bool)

(declare-fun contains!9891 (List!33700 (_ BitVec 64)) Bool)

(assert (=> b!1438414 (= e!811400 (contains!9891 Nil!33697 (select (arr!47199 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154767 () Bool)

(declare-fun res!971082 () Bool)

(assert (=> d!154767 (=> res!971082 e!811397)))

(assert (=> d!154767 (= res!971082 (bvsge #b00000000000000000000000000000000 (size!47749 a!2862)))))

(assert (=> d!154767 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33697) e!811397)))

(declare-fun b!1438415 () Bool)

(assert (=> b!1438415 (= e!811399 call!67663)))

(declare-fun b!1438416 () Bool)

(assert (=> b!1438416 (= e!811398 e!811399)))

(assert (=> b!1438416 (= c!133173 (validKeyInArray!0 (select (arr!47199 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154767 (not res!971082)) b!1438412))

(assert (= (and b!1438412 res!971081) b!1438414))

(assert (= (and b!1438412 res!971083) b!1438416))

(assert (= (and b!1438416 c!133173) b!1438413))

(assert (= (and b!1438416 (not c!133173)) b!1438415))

(assert (= (or b!1438413 b!1438415) bm!67660))

(declare-fun m!1327615 () Bool)

(assert (=> bm!67660 m!1327615))

(declare-fun m!1327617 () Bool)

(assert (=> bm!67660 m!1327617))

(assert (=> b!1438412 m!1327615))

(assert (=> b!1438412 m!1327615))

(declare-fun m!1327619 () Bool)

(assert (=> b!1438412 m!1327619))

(assert (=> b!1438414 m!1327615))

(assert (=> b!1438414 m!1327615))

(declare-fun m!1327621 () Bool)

(assert (=> b!1438414 m!1327621))

(assert (=> b!1438416 m!1327615))

(assert (=> b!1438416 m!1327615))

(assert (=> b!1438416 m!1327619))

(assert (=> b!1438370 d!154767))

(declare-fun bm!67663 () Bool)

(declare-fun call!67666 () Bool)

(assert (=> bm!67663 (= call!67666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1438425 () Bool)

(declare-fun e!811408 () Bool)

(assert (=> b!1438425 (= e!811408 call!67666)))

(declare-fun d!154769 () Bool)

(declare-fun res!971088 () Bool)

(declare-fun e!811407 () Bool)

(assert (=> d!154769 (=> res!971088 e!811407)))

(assert (=> d!154769 (= res!971088 (bvsge #b00000000000000000000000000000000 (size!47749 a!2862)))))

(assert (=> d!154769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811407)))

(declare-fun b!1438426 () Bool)

(declare-fun e!811409 () Bool)

(assert (=> b!1438426 (= e!811409 call!67666)))

(declare-fun b!1438427 () Bool)

(assert (=> b!1438427 (= e!811407 e!811408)))

(declare-fun c!133176 () Bool)

(assert (=> b!1438427 (= c!133176 (validKeyInArray!0 (select (arr!47199 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438428 () Bool)

(assert (=> b!1438428 (= e!811408 e!811409)))

(declare-fun lt!632543 () (_ BitVec 64))

(assert (=> b!1438428 (= lt!632543 (select (arr!47199 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48566 0))(
  ( (Unit!48567) )
))
(declare-fun lt!632542 () Unit!48566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97816 (_ BitVec 64) (_ BitVec 32)) Unit!48566)

(assert (=> b!1438428 (= lt!632542 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632543 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438428 (arrayContainsKey!0 a!2862 lt!632543 #b00000000000000000000000000000000)))

(declare-fun lt!632544 () Unit!48566)

(assert (=> b!1438428 (= lt!632544 lt!632542)))

(declare-fun res!971089 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97816 (_ BitVec 32)) SeekEntryResult!11451)

(assert (=> b!1438428 (= res!971089 (= (seekEntryOrOpen!0 (select (arr!47199 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11451 #b00000000000000000000000000000000)))))

(assert (=> b!1438428 (=> (not res!971089) (not e!811409))))

(assert (= (and d!154769 (not res!971088)) b!1438427))

(assert (= (and b!1438427 c!133176) b!1438428))

(assert (= (and b!1438427 (not c!133176)) b!1438425))

(assert (= (and b!1438428 res!971089) b!1438426))

(assert (= (or b!1438426 b!1438425) bm!67663))

(declare-fun m!1327623 () Bool)

(assert (=> bm!67663 m!1327623))

(assert (=> b!1438427 m!1327615))

(assert (=> b!1438427 m!1327615))

(assert (=> b!1438427 m!1327619))

(assert (=> b!1438428 m!1327615))

(declare-fun m!1327625 () Bool)

(assert (=> b!1438428 m!1327625))

(declare-fun m!1327627 () Bool)

(assert (=> b!1438428 m!1327627))

(assert (=> b!1438428 m!1327615))

(declare-fun m!1327629 () Bool)

(assert (=> b!1438428 m!1327629))

(assert (=> b!1438371 d!154769))

(declare-fun b!1438447 () Bool)

(declare-fun e!811423 () SeekEntryResult!11451)

(assert (=> b!1438447 (= e!811423 (Intermediate!11451 false index!646 x!665))))

(declare-fun d!154771 () Bool)

(declare-fun e!811420 () Bool)

(assert (=> d!154771 e!811420))

(declare-fun c!133185 () Bool)

(declare-fun lt!632549 () SeekEntryResult!11451)

(get-info :version)

(assert (=> d!154771 (= c!133185 (and ((_ is Intermediate!11451) lt!632549) (undefined!12263 lt!632549)))))

(declare-fun e!811422 () SeekEntryResult!11451)

(assert (=> d!154771 (= lt!632549 e!811422)))

(declare-fun c!133183 () Bool)

(assert (=> d!154771 (= c!133183 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632550 () (_ BitVec 64))

(assert (=> d!154771 (= lt!632550 (select (arr!47199 a!2862) index!646))))

(assert (=> d!154771 (validMask!0 mask!2687)))

(assert (=> d!154771 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47199 a!2862) j!93) a!2862 mask!2687) lt!632549)))

(declare-fun b!1438448 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438448 (= e!811423 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47199 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438449 () Bool)

(declare-fun e!811421 () Bool)

(assert (=> b!1438449 (= e!811420 e!811421)))

(declare-fun res!971098 () Bool)

(assert (=> b!1438449 (= res!971098 (and ((_ is Intermediate!11451) lt!632549) (not (undefined!12263 lt!632549)) (bvslt (x!129928 lt!632549) #b01111111111111111111111111111110) (bvsge (x!129928 lt!632549) #b00000000000000000000000000000000) (bvsge (x!129928 lt!632549) x!665)))))

(assert (=> b!1438449 (=> (not res!971098) (not e!811421))))

(declare-fun b!1438450 () Bool)

(assert (=> b!1438450 (= e!811420 (bvsge (x!129928 lt!632549) #b01111111111111111111111111111110))))

(declare-fun b!1438451 () Bool)

(assert (=> b!1438451 (= e!811422 (Intermediate!11451 true index!646 x!665))))

(declare-fun b!1438452 () Bool)

(assert (=> b!1438452 (and (bvsge (index!48198 lt!632549) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632549) (size!47749 a!2862)))))

(declare-fun res!971097 () Bool)

(assert (=> b!1438452 (= res!971097 (= (select (arr!47199 a!2862) (index!48198 lt!632549)) (select (arr!47199 a!2862) j!93)))))

(declare-fun e!811424 () Bool)

(assert (=> b!1438452 (=> res!971097 e!811424)))

(assert (=> b!1438452 (= e!811421 e!811424)))

(declare-fun b!1438453 () Bool)

(assert (=> b!1438453 (and (bvsge (index!48198 lt!632549) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632549) (size!47749 a!2862)))))

(declare-fun res!971096 () Bool)

(assert (=> b!1438453 (= res!971096 (= (select (arr!47199 a!2862) (index!48198 lt!632549)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438453 (=> res!971096 e!811424)))

(declare-fun b!1438454 () Bool)

(assert (=> b!1438454 (and (bvsge (index!48198 lt!632549) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632549) (size!47749 a!2862)))))

(assert (=> b!1438454 (= e!811424 (= (select (arr!47199 a!2862) (index!48198 lt!632549)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438455 () Bool)

(assert (=> b!1438455 (= e!811422 e!811423)))

(declare-fun c!133184 () Bool)

(assert (=> b!1438455 (= c!133184 (or (= lt!632550 (select (arr!47199 a!2862) j!93)) (= (bvadd lt!632550 lt!632550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154771 c!133183) b!1438451))

(assert (= (and d!154771 (not c!133183)) b!1438455))

(assert (= (and b!1438455 c!133184) b!1438447))

(assert (= (and b!1438455 (not c!133184)) b!1438448))

(assert (= (and d!154771 c!133185) b!1438450))

(assert (= (and d!154771 (not c!133185)) b!1438449))

(assert (= (and b!1438449 res!971098) b!1438452))

(assert (= (and b!1438452 (not res!971097)) b!1438453))

(assert (= (and b!1438453 (not res!971096)) b!1438454))

(declare-fun m!1327631 () Bool)

(assert (=> b!1438453 m!1327631))

(declare-fun m!1327633 () Bool)

(assert (=> d!154771 m!1327633))

(assert (=> d!154771 m!1327573))

(declare-fun m!1327635 () Bool)

(assert (=> b!1438448 m!1327635))

(assert (=> b!1438448 m!1327635))

(assert (=> b!1438448 m!1327551))

(declare-fun m!1327637 () Bool)

(assert (=> b!1438448 m!1327637))

(assert (=> b!1438452 m!1327631))

(assert (=> b!1438454 m!1327631))

(assert (=> b!1438368 d!154771))

(declare-fun b!1438456 () Bool)

(declare-fun e!811428 () SeekEntryResult!11451)

(assert (=> b!1438456 (= e!811428 (Intermediate!11451 false (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154775 () Bool)

(declare-fun e!811425 () Bool)

(assert (=> d!154775 e!811425))

(declare-fun c!133188 () Bool)

(declare-fun lt!632551 () SeekEntryResult!11451)

(assert (=> d!154775 (= c!133188 (and ((_ is Intermediate!11451) lt!632551) (undefined!12263 lt!632551)))))

(declare-fun e!811427 () SeekEntryResult!11451)

(assert (=> d!154775 (= lt!632551 e!811427)))

(declare-fun c!133186 () Bool)

(assert (=> d!154775 (= c!133186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632552 () (_ BitVec 64))

(assert (=> d!154775 (= lt!632552 (select (arr!47199 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862))) (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687)))))

(assert (=> d!154775 (validMask!0 mask!2687)))

(assert (=> d!154775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)) mask!2687) lt!632551)))

(declare-fun b!1438457 () Bool)

(assert (=> b!1438457 (= e!811428 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)) mask!2687))))

(declare-fun b!1438458 () Bool)

(declare-fun e!811426 () Bool)

(assert (=> b!1438458 (= e!811425 e!811426)))

(declare-fun res!971101 () Bool)

(assert (=> b!1438458 (= res!971101 (and ((_ is Intermediate!11451) lt!632551) (not (undefined!12263 lt!632551)) (bvslt (x!129928 lt!632551) #b01111111111111111111111111111110) (bvsge (x!129928 lt!632551) #b00000000000000000000000000000000) (bvsge (x!129928 lt!632551) #b00000000000000000000000000000000)))))

(assert (=> b!1438458 (=> (not res!971101) (not e!811426))))

(declare-fun b!1438459 () Bool)

(assert (=> b!1438459 (= e!811425 (bvsge (x!129928 lt!632551) #b01111111111111111111111111111110))))

(declare-fun b!1438460 () Bool)

(assert (=> b!1438460 (= e!811427 (Intermediate!11451 true (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438461 () Bool)

(assert (=> b!1438461 (and (bvsge (index!48198 lt!632551) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632551) (size!47749 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)))))))

(declare-fun res!971100 () Bool)

(assert (=> b!1438461 (= res!971100 (= (select (arr!47199 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862))) (index!48198 lt!632551)) (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(declare-fun e!811429 () Bool)

(assert (=> b!1438461 (=> res!971100 e!811429)))

(assert (=> b!1438461 (= e!811426 e!811429)))

(declare-fun b!1438462 () Bool)

(assert (=> b!1438462 (and (bvsge (index!48198 lt!632551) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632551) (size!47749 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)))))))

(declare-fun res!971099 () Bool)

(assert (=> b!1438462 (= res!971099 (= (select (arr!47199 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862))) (index!48198 lt!632551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438462 (=> res!971099 e!811429)))

(declare-fun b!1438463 () Bool)

(assert (=> b!1438463 (and (bvsge (index!48198 lt!632551) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632551) (size!47749 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862)))))))

(assert (=> b!1438463 (= e!811429 (= (select (arr!47199 (array!97817 (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47749 a!2862))) (index!48198 lt!632551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438464 () Bool)

(assert (=> b!1438464 (= e!811427 e!811428)))

(declare-fun c!133187 () Bool)

(assert (=> b!1438464 (= c!133187 (or (= lt!632552 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632552 lt!632552) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154775 c!133186) b!1438460))

(assert (= (and d!154775 (not c!133186)) b!1438464))

(assert (= (and b!1438464 c!133187) b!1438456))

(assert (= (and b!1438464 (not c!133187)) b!1438457))

(assert (= (and d!154775 c!133188) b!1438459))

(assert (= (and d!154775 (not c!133188)) b!1438458))

(assert (= (and b!1438458 res!971101) b!1438461))

(assert (= (and b!1438461 (not res!971100)) b!1438462))

(assert (= (and b!1438462 (not res!971099)) b!1438463))

(declare-fun m!1327639 () Bool)

(assert (=> b!1438462 m!1327639))

(assert (=> d!154775 m!1327579))

(declare-fun m!1327641 () Bool)

(assert (=> d!154775 m!1327641))

(assert (=> d!154775 m!1327573))

(assert (=> b!1438457 m!1327579))

(declare-fun m!1327643 () Bool)

(assert (=> b!1438457 m!1327643))

(assert (=> b!1438457 m!1327643))

(assert (=> b!1438457 m!1327577))

(declare-fun m!1327645 () Bool)

(assert (=> b!1438457 m!1327645))

(assert (=> b!1438461 m!1327639))

(assert (=> b!1438463 m!1327639))

(assert (=> b!1438362 d!154775))

(declare-fun d!154779 () Bool)

(declare-fun lt!632558 () (_ BitVec 32))

(declare-fun lt!632557 () (_ BitVec 32))

(assert (=> d!154779 (= lt!632558 (bvmul (bvxor lt!632557 (bvlshr lt!632557 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154779 (= lt!632557 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154779 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971102 (let ((h!35042 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129931 (bvmul (bvxor h!35042 (bvlshr h!35042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129931 (bvlshr x!129931 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971102 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971102 #b00000000000000000000000000000000))))))

(assert (=> d!154779 (= (toIndex!0 (select (store (arr!47199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632558 (bvlshr lt!632558 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438362 d!154779))

(declare-fun d!154781 () Bool)

(assert (=> d!154781 (= (validKeyInArray!0 (select (arr!47199 a!2862) i!1006)) (and (not (= (select (arr!47199 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47199 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438364 d!154781))

(declare-fun d!154783 () Bool)

(assert (=> d!154783 (= (validKeyInArray!0 (select (arr!47199 a!2862) j!93)) (and (not (= (select (arr!47199 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47199 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438369 d!154783))

(declare-fun e!811433 () SeekEntryResult!11451)

(declare-fun b!1438465 () Bool)

(assert (=> b!1438465 (= e!811433 (Intermediate!11451 false (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154785 () Bool)

(declare-fun e!811430 () Bool)

(assert (=> d!154785 e!811430))

(declare-fun c!133191 () Bool)

(declare-fun lt!632559 () SeekEntryResult!11451)

(assert (=> d!154785 (= c!133191 (and ((_ is Intermediate!11451) lt!632559) (undefined!12263 lt!632559)))))

(declare-fun e!811432 () SeekEntryResult!11451)

(assert (=> d!154785 (= lt!632559 e!811432)))

(declare-fun c!133189 () Bool)

(assert (=> d!154785 (= c!133189 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632560 () (_ BitVec 64))

(assert (=> d!154785 (= lt!632560 (select (arr!47199 a!2862) (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687)))))

(assert (=> d!154785 (validMask!0 mask!2687)))

(assert (=> d!154785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) (select (arr!47199 a!2862) j!93) a!2862 mask!2687) lt!632559)))

(declare-fun b!1438466 () Bool)

(assert (=> b!1438466 (= e!811433 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47199 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438467 () Bool)

(declare-fun e!811431 () Bool)

(assert (=> b!1438467 (= e!811430 e!811431)))

(declare-fun res!971105 () Bool)

(assert (=> b!1438467 (= res!971105 (and ((_ is Intermediate!11451) lt!632559) (not (undefined!12263 lt!632559)) (bvslt (x!129928 lt!632559) #b01111111111111111111111111111110) (bvsge (x!129928 lt!632559) #b00000000000000000000000000000000) (bvsge (x!129928 lt!632559) #b00000000000000000000000000000000)))))

(assert (=> b!1438467 (=> (not res!971105) (not e!811431))))

(declare-fun b!1438468 () Bool)

(assert (=> b!1438468 (= e!811430 (bvsge (x!129928 lt!632559) #b01111111111111111111111111111110))))

(declare-fun b!1438469 () Bool)

(assert (=> b!1438469 (= e!811432 (Intermediate!11451 true (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438470 () Bool)

(assert (=> b!1438470 (and (bvsge (index!48198 lt!632559) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632559) (size!47749 a!2862)))))

(declare-fun res!971104 () Bool)

(assert (=> b!1438470 (= res!971104 (= (select (arr!47199 a!2862) (index!48198 lt!632559)) (select (arr!47199 a!2862) j!93)))))

(declare-fun e!811434 () Bool)

(assert (=> b!1438470 (=> res!971104 e!811434)))

(assert (=> b!1438470 (= e!811431 e!811434)))

(declare-fun b!1438471 () Bool)

(assert (=> b!1438471 (and (bvsge (index!48198 lt!632559) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632559) (size!47749 a!2862)))))

(declare-fun res!971103 () Bool)

(assert (=> b!1438471 (= res!971103 (= (select (arr!47199 a!2862) (index!48198 lt!632559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438471 (=> res!971103 e!811434)))

(declare-fun b!1438472 () Bool)

(assert (=> b!1438472 (and (bvsge (index!48198 lt!632559) #b00000000000000000000000000000000) (bvslt (index!48198 lt!632559) (size!47749 a!2862)))))

(assert (=> b!1438472 (= e!811434 (= (select (arr!47199 a!2862) (index!48198 lt!632559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438473 () Bool)

(assert (=> b!1438473 (= e!811432 e!811433)))

(declare-fun c!133190 () Bool)

(assert (=> b!1438473 (= c!133190 (or (= lt!632560 (select (arr!47199 a!2862) j!93)) (= (bvadd lt!632560 lt!632560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154785 c!133189) b!1438469))

(assert (= (and d!154785 (not c!133189)) b!1438473))

(assert (= (and b!1438473 c!133190) b!1438465))

(assert (= (and b!1438473 (not c!133190)) b!1438466))

(assert (= (and d!154785 c!133191) b!1438468))

(assert (= (and d!154785 (not c!133191)) b!1438467))

(assert (= (and b!1438467 res!971105) b!1438470))

(assert (= (and b!1438470 (not res!971104)) b!1438471))

(assert (= (and b!1438471 (not res!971103)) b!1438472))

(declare-fun m!1327647 () Bool)

(assert (=> b!1438471 m!1327647))

(assert (=> d!154785 m!1327555))

(declare-fun m!1327649 () Bool)

(assert (=> d!154785 m!1327649))

(assert (=> d!154785 m!1327573))

(assert (=> b!1438466 m!1327555))

(declare-fun m!1327651 () Bool)

(assert (=> b!1438466 m!1327651))

(assert (=> b!1438466 m!1327651))

(assert (=> b!1438466 m!1327551))

(declare-fun m!1327653 () Bool)

(assert (=> b!1438466 m!1327653))

(assert (=> b!1438470 m!1327647))

(assert (=> b!1438472 m!1327647))

(assert (=> b!1438363 d!154785))

(declare-fun d!154787 () Bool)

(declare-fun lt!632566 () (_ BitVec 32))

(declare-fun lt!632565 () (_ BitVec 32))

(assert (=> d!154787 (= lt!632566 (bvmul (bvxor lt!632565 (bvlshr lt!632565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154787 (= lt!632565 ((_ extract 31 0) (bvand (bvxor (select (arr!47199 a!2862) j!93) (bvlshr (select (arr!47199 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154787 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971102 (let ((h!35042 ((_ extract 31 0) (bvand (bvxor (select (arr!47199 a!2862) j!93) (bvlshr (select (arr!47199 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129931 (bvmul (bvxor h!35042 (bvlshr h!35042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129931 (bvlshr x!129931 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971102 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971102 #b00000000000000000000000000000000))))))

(assert (=> d!154787 (= (toIndex!0 (select (arr!47199 a!2862) j!93) mask!2687) (bvand (bvxor lt!632566 (bvlshr lt!632566 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438363 d!154787))

(declare-fun d!154789 () Bool)

(assert (=> d!154789 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124290 d!154789))

(declare-fun d!154805 () Bool)

(assert (=> d!154805 (= (array_inv!36227 a!2862) (bvsge (size!47749 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124290 d!154805))

(check-sat (not b!1438448) (not d!154771) (not b!1438412) (not b!1438466) (not d!154775) (not b!1438416) (not b!1438414) (not bm!67660) (not b!1438428) (not b!1438427) (not d!154785) (not bm!67663) (not b!1438457))
