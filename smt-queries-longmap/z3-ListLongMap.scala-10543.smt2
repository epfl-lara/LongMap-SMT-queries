; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124324 () Bool)

(assert start!124324)

(declare-fun b!1438695 () Bool)

(declare-fun res!971370 () Bool)

(declare-fun e!811503 () Bool)

(assert (=> b!1438695 (=> (not res!971370) (not e!811503))))

(declare-datatypes ((array!97789 0))(
  ( (array!97790 (arr!47185 (Array (_ BitVec 32) (_ BitVec 64))) (size!47737 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97789)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438695 (= res!971370 (validKeyInArray!0 (select (arr!47185 a!2862) i!1006)))))

(declare-fun res!971362 () Bool)

(assert (=> start!124324 (=> (not res!971362) (not e!811503))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124324 (= res!971362 (validMask!0 mask!2687))))

(assert (=> start!124324 e!811503))

(assert (=> start!124324 true))

(declare-fun array_inv!36418 (array!97789) Bool)

(assert (=> start!124324 (array_inv!36418 a!2862)))

(declare-fun b!1438696 () Bool)

(declare-fun res!971365 () Bool)

(declare-fun e!811502 () Bool)

(assert (=> b!1438696 (=> (not res!971365) (not e!811502))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11462 0))(
  ( (MissingZero!11462 (index!48240 (_ BitVec 32))) (Found!11462 (index!48241 (_ BitVec 32))) (Intermediate!11462 (undefined!12274 Bool) (index!48242 (_ BitVec 32)) (x!129972 (_ BitVec 32))) (Undefined!11462) (MissingVacant!11462 (index!48243 (_ BitVec 32))) )
))
(declare-fun lt!632433 () SeekEntryResult!11462)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97789 (_ BitVec 32)) SeekEntryResult!11462)

(assert (=> b!1438696 (= res!971365 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632433))))

(declare-fun b!1438697 () Bool)

(declare-fun res!971363 () Bool)

(assert (=> b!1438697 (=> (not res!971363) (not e!811503))))

(declare-datatypes ((List!33764 0))(
  ( (Nil!33761) (Cons!33760 (h!35107 (_ BitVec 64)) (t!48450 List!33764)) )
))
(declare-fun arrayNoDuplicates!0 (array!97789 (_ BitVec 32) List!33764) Bool)

(assert (=> b!1438697 (= res!971363 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33761))))

(declare-fun b!1438698 () Bool)

(declare-fun res!971364 () Bool)

(assert (=> b!1438698 (=> (not res!971364) (not e!811503))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438698 (= res!971364 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47737 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47737 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47737 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438699 () Bool)

(assert (=> b!1438699 (= e!811503 e!811502)))

(declare-fun res!971366 () Bool)

(assert (=> b!1438699 (=> (not res!971366) (not e!811502))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438699 (= res!971366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632433))))

(assert (=> b!1438699 (= lt!632433 (Intermediate!11462 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438700 () Bool)

(declare-fun e!811500 () Bool)

(assert (=> b!1438700 (= e!811502 e!811500)))

(declare-fun res!971368 () Bool)

(assert (=> b!1438700 (=> (not res!971368) (not e!811500))))

(declare-fun lt!632432 () (_ BitVec 32))

(assert (=> b!1438700 (= res!971368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632432 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)) mask!2687) (Intermediate!11462 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1438700 (= lt!632432 (toIndex!0 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438701 () Bool)

(assert (=> b!1438701 (= e!811500 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632432 #b00000000000000000000000000000000) (bvsge lt!632432 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun b!1438702 () Bool)

(declare-fun res!971371 () Bool)

(assert (=> b!1438702 (=> (not res!971371) (not e!811503))))

(assert (=> b!1438702 (= res!971371 (and (= (size!47737 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47737 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47737 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438703 () Bool)

(declare-fun res!971369 () Bool)

(assert (=> b!1438703 (=> (not res!971369) (not e!811503))))

(assert (=> b!1438703 (= res!971369 (validKeyInArray!0 (select (arr!47185 a!2862) j!93)))))

(declare-fun b!1438704 () Bool)

(declare-fun res!971367 () Bool)

(assert (=> b!1438704 (=> (not res!971367) (not e!811503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97789 (_ BitVec 32)) Bool)

(assert (=> b!1438704 (= res!971367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124324 res!971362) b!1438702))

(assert (= (and b!1438702 res!971371) b!1438695))

(assert (= (and b!1438695 res!971370) b!1438703))

(assert (= (and b!1438703 res!971369) b!1438704))

(assert (= (and b!1438704 res!971367) b!1438697))

(assert (= (and b!1438697 res!971363) b!1438698))

(assert (= (and b!1438698 res!971364) b!1438699))

(assert (= (and b!1438699 res!971366) b!1438696))

(assert (= (and b!1438696 res!971365) b!1438700))

(assert (= (and b!1438700 res!971368) b!1438701))

(declare-fun m!1327347 () Bool)

(assert (=> b!1438704 m!1327347))

(declare-fun m!1327349 () Bool)

(assert (=> start!124324 m!1327349))

(declare-fun m!1327351 () Bool)

(assert (=> start!124324 m!1327351))

(declare-fun m!1327353 () Bool)

(assert (=> b!1438698 m!1327353))

(declare-fun m!1327355 () Bool)

(assert (=> b!1438698 m!1327355))

(declare-fun m!1327357 () Bool)

(assert (=> b!1438699 m!1327357))

(assert (=> b!1438699 m!1327357))

(declare-fun m!1327359 () Bool)

(assert (=> b!1438699 m!1327359))

(assert (=> b!1438699 m!1327359))

(assert (=> b!1438699 m!1327357))

(declare-fun m!1327361 () Bool)

(assert (=> b!1438699 m!1327361))

(assert (=> b!1438700 m!1327353))

(declare-fun m!1327363 () Bool)

(assert (=> b!1438700 m!1327363))

(assert (=> b!1438700 m!1327363))

(declare-fun m!1327365 () Bool)

(assert (=> b!1438700 m!1327365))

(assert (=> b!1438700 m!1327363))

(declare-fun m!1327367 () Bool)

(assert (=> b!1438700 m!1327367))

(declare-fun m!1327369 () Bool)

(assert (=> b!1438695 m!1327369))

(assert (=> b!1438695 m!1327369))

(declare-fun m!1327371 () Bool)

(assert (=> b!1438695 m!1327371))

(declare-fun m!1327373 () Bool)

(assert (=> b!1438697 m!1327373))

(assert (=> b!1438696 m!1327357))

(assert (=> b!1438696 m!1327357))

(declare-fun m!1327375 () Bool)

(assert (=> b!1438696 m!1327375))

(assert (=> b!1438703 m!1327357))

(assert (=> b!1438703 m!1327357))

(declare-fun m!1327377 () Bool)

(assert (=> b!1438703 m!1327377))

(check-sat (not b!1438703) (not b!1438697) (not start!124324) (not b!1438695) (not b!1438696) (not b!1438699) (not b!1438700) (not b!1438704))
(check-sat)
(get-model)

(declare-fun d!154659 () Bool)

(assert (=> d!154659 (= (validKeyInArray!0 (select (arr!47185 a!2862) j!93)) (and (not (= (select (arr!47185 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47185 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438703 d!154659))

(declare-fun d!154661 () Bool)

(declare-fun e!811538 () Bool)

(assert (=> d!154661 e!811538))

(declare-fun c!133184 () Bool)

(declare-fun lt!632450 () SeekEntryResult!11462)

(get-info :version)

(assert (=> d!154661 (= c!133184 (and ((_ is Intermediate!11462) lt!632450) (undefined!12274 lt!632450)))))

(declare-fun e!811540 () SeekEntryResult!11462)

(assert (=> d!154661 (= lt!632450 e!811540)))

(declare-fun c!133186 () Bool)

(assert (=> d!154661 (= c!133186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632451 () (_ BitVec 64))

(assert (=> d!154661 (= lt!632451 (select (arr!47185 a!2862) (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687)))))

(assert (=> d!154661 (validMask!0 mask!2687)))

(assert (=> d!154661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632450)))

(declare-fun b!1438783 () Bool)

(declare-fun e!811542 () SeekEntryResult!11462)

(assert (=> b!1438783 (= e!811540 e!811542)))

(declare-fun c!133185 () Bool)

(assert (=> b!1438783 (= c!133185 (or (= lt!632451 (select (arr!47185 a!2862) j!93)) (= (bvadd lt!632451 lt!632451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438784 () Bool)

(assert (=> b!1438784 (= e!811542 (Intermediate!11462 false (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438785 () Bool)

(declare-fun e!811539 () Bool)

(assert (=> b!1438785 (= e!811538 e!811539)))

(declare-fun res!971438 () Bool)

(assert (=> b!1438785 (= res!971438 (and ((_ is Intermediate!11462) lt!632450) (not (undefined!12274 lt!632450)) (bvslt (x!129972 lt!632450) #b01111111111111111111111111111110) (bvsge (x!129972 lt!632450) #b00000000000000000000000000000000) (bvsge (x!129972 lt!632450) #b00000000000000000000000000000000)))))

(assert (=> b!1438785 (=> (not res!971438) (not e!811539))))

(declare-fun b!1438786 () Bool)

(assert (=> b!1438786 (and (bvsge (index!48242 lt!632450) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632450) (size!47737 a!2862)))))

(declare-fun e!811541 () Bool)

(assert (=> b!1438786 (= e!811541 (= (select (arr!47185 a!2862) (index!48242 lt!632450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438787 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438787 (= e!811542 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47185 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438788 () Bool)

(assert (=> b!1438788 (and (bvsge (index!48242 lt!632450) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632450) (size!47737 a!2862)))))

(declare-fun res!971440 () Bool)

(assert (=> b!1438788 (= res!971440 (= (select (arr!47185 a!2862) (index!48242 lt!632450)) (select (arr!47185 a!2862) j!93)))))

(assert (=> b!1438788 (=> res!971440 e!811541)))

(assert (=> b!1438788 (= e!811539 e!811541)))

(declare-fun b!1438789 () Bool)

(assert (=> b!1438789 (= e!811540 (Intermediate!11462 true (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438790 () Bool)

(assert (=> b!1438790 (= e!811538 (bvsge (x!129972 lt!632450) #b01111111111111111111111111111110))))

(declare-fun b!1438791 () Bool)

(assert (=> b!1438791 (and (bvsge (index!48242 lt!632450) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632450) (size!47737 a!2862)))))

(declare-fun res!971439 () Bool)

(assert (=> b!1438791 (= res!971439 (= (select (arr!47185 a!2862) (index!48242 lt!632450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438791 (=> res!971439 e!811541)))

(assert (= (and d!154661 c!133186) b!1438789))

(assert (= (and d!154661 (not c!133186)) b!1438783))

(assert (= (and b!1438783 c!133185) b!1438784))

(assert (= (and b!1438783 (not c!133185)) b!1438787))

(assert (= (and d!154661 c!133184) b!1438790))

(assert (= (and d!154661 (not c!133184)) b!1438785))

(assert (= (and b!1438785 res!971438) b!1438788))

(assert (= (and b!1438788 (not res!971440)) b!1438791))

(assert (= (and b!1438791 (not res!971439)) b!1438786))

(declare-fun m!1327443 () Bool)

(assert (=> b!1438788 m!1327443))

(assert (=> b!1438791 m!1327443))

(assert (=> b!1438787 m!1327359))

(declare-fun m!1327445 () Bool)

(assert (=> b!1438787 m!1327445))

(assert (=> b!1438787 m!1327445))

(assert (=> b!1438787 m!1327357))

(declare-fun m!1327447 () Bool)

(assert (=> b!1438787 m!1327447))

(assert (=> b!1438786 m!1327443))

(assert (=> d!154661 m!1327359))

(declare-fun m!1327449 () Bool)

(assert (=> d!154661 m!1327449))

(assert (=> d!154661 m!1327349))

(assert (=> b!1438699 d!154661))

(declare-fun d!154663 () Bool)

(declare-fun lt!632457 () (_ BitVec 32))

(declare-fun lt!632456 () (_ BitVec 32))

(assert (=> d!154663 (= lt!632457 (bvmul (bvxor lt!632456 (bvlshr lt!632456 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154663 (= lt!632456 ((_ extract 31 0) (bvand (bvxor (select (arr!47185 a!2862) j!93) (bvlshr (select (arr!47185 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154663 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971441 (let ((h!35110 ((_ extract 31 0) (bvand (bvxor (select (arr!47185 a!2862) j!93) (bvlshr (select (arr!47185 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129976 (bvmul (bvxor h!35110 (bvlshr h!35110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129976 (bvlshr x!129976 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971441 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971441 #b00000000000000000000000000000000))))))

(assert (=> d!154663 (= (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) (bvand (bvxor lt!632457 (bvlshr lt!632457 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438699 d!154663))

(declare-fun d!154665 () Bool)

(declare-fun res!971446 () Bool)

(declare-fun e!811549 () Bool)

(assert (=> d!154665 (=> res!971446 e!811549)))

(assert (=> d!154665 (= res!971446 (bvsge #b00000000000000000000000000000000 (size!47737 a!2862)))))

(assert (=> d!154665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811549)))

(declare-fun b!1438800 () Bool)

(declare-fun e!811550 () Bool)

(declare-fun e!811551 () Bool)

(assert (=> b!1438800 (= e!811550 e!811551)))

(declare-fun lt!632465 () (_ BitVec 64))

(assert (=> b!1438800 (= lt!632465 (select (arr!47185 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48411 0))(
  ( (Unit!48412) )
))
(declare-fun lt!632466 () Unit!48411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97789 (_ BitVec 64) (_ BitVec 32)) Unit!48411)

(assert (=> b!1438800 (= lt!632466 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632465 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438800 (arrayContainsKey!0 a!2862 lt!632465 #b00000000000000000000000000000000)))

(declare-fun lt!632464 () Unit!48411)

(assert (=> b!1438800 (= lt!632464 lt!632466)))

(declare-fun res!971447 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97789 (_ BitVec 32)) SeekEntryResult!11462)

(assert (=> b!1438800 (= res!971447 (= (seekEntryOrOpen!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11462 #b00000000000000000000000000000000)))))

(assert (=> b!1438800 (=> (not res!971447) (not e!811551))))

(declare-fun bm!67649 () Bool)

(declare-fun call!67652 () Bool)

(assert (=> bm!67649 (= call!67652 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1438801 () Bool)

(assert (=> b!1438801 (= e!811551 call!67652)))

(declare-fun b!1438802 () Bool)

(assert (=> b!1438802 (= e!811549 e!811550)))

(declare-fun c!133189 () Bool)

(assert (=> b!1438802 (= c!133189 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438803 () Bool)

(assert (=> b!1438803 (= e!811550 call!67652)))

(assert (= (and d!154665 (not res!971446)) b!1438802))

(assert (= (and b!1438802 c!133189) b!1438800))

(assert (= (and b!1438802 (not c!133189)) b!1438803))

(assert (= (and b!1438800 res!971447) b!1438801))

(assert (= (or b!1438801 b!1438803) bm!67649))

(declare-fun m!1327451 () Bool)

(assert (=> b!1438800 m!1327451))

(declare-fun m!1327453 () Bool)

(assert (=> b!1438800 m!1327453))

(declare-fun m!1327455 () Bool)

(assert (=> b!1438800 m!1327455))

(assert (=> b!1438800 m!1327451))

(declare-fun m!1327457 () Bool)

(assert (=> b!1438800 m!1327457))

(declare-fun m!1327459 () Bool)

(assert (=> bm!67649 m!1327459))

(assert (=> b!1438802 m!1327451))

(assert (=> b!1438802 m!1327451))

(declare-fun m!1327461 () Bool)

(assert (=> b!1438802 m!1327461))

(assert (=> b!1438704 d!154665))

(declare-fun d!154669 () Bool)

(assert (=> d!154669 (= (validKeyInArray!0 (select (arr!47185 a!2862) i!1006)) (and (not (= (select (arr!47185 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47185 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438695 d!154669))

(declare-fun d!154671 () Bool)

(declare-fun e!811552 () Bool)

(assert (=> d!154671 e!811552))

(declare-fun c!133190 () Bool)

(declare-fun lt!632467 () SeekEntryResult!11462)

(assert (=> d!154671 (= c!133190 (and ((_ is Intermediate!11462) lt!632467) (undefined!12274 lt!632467)))))

(declare-fun e!811554 () SeekEntryResult!11462)

(assert (=> d!154671 (= lt!632467 e!811554)))

(declare-fun c!133192 () Bool)

(assert (=> d!154671 (= c!133192 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632468 () (_ BitVec 64))

(assert (=> d!154671 (= lt!632468 (select (arr!47185 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862))) lt!632432))))

(assert (=> d!154671 (validMask!0 mask!2687)))

(assert (=> d!154671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632432 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)) mask!2687) lt!632467)))

(declare-fun b!1438804 () Bool)

(declare-fun e!811556 () SeekEntryResult!11462)

(assert (=> b!1438804 (= e!811554 e!811556)))

(declare-fun c!133191 () Bool)

(assert (=> b!1438804 (= c!133191 (or (= lt!632468 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632468 lt!632468) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438805 () Bool)

(assert (=> b!1438805 (= e!811556 (Intermediate!11462 false lt!632432 #b00000000000000000000000000000000))))

(declare-fun b!1438806 () Bool)

(declare-fun e!811553 () Bool)

(assert (=> b!1438806 (= e!811552 e!811553)))

(declare-fun res!971448 () Bool)

(assert (=> b!1438806 (= res!971448 (and ((_ is Intermediate!11462) lt!632467) (not (undefined!12274 lt!632467)) (bvslt (x!129972 lt!632467) #b01111111111111111111111111111110) (bvsge (x!129972 lt!632467) #b00000000000000000000000000000000) (bvsge (x!129972 lt!632467) #b00000000000000000000000000000000)))))

(assert (=> b!1438806 (=> (not res!971448) (not e!811553))))

(declare-fun b!1438807 () Bool)

(assert (=> b!1438807 (and (bvsge (index!48242 lt!632467) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632467) (size!47737 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)))))))

(declare-fun e!811555 () Bool)

(assert (=> b!1438807 (= e!811555 (= (select (arr!47185 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862))) (index!48242 lt!632467)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438808 () Bool)

(assert (=> b!1438808 (= e!811556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!632432 #b00000000000000000000000000000000 mask!2687) (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)) mask!2687))))

(declare-fun b!1438809 () Bool)

(assert (=> b!1438809 (and (bvsge (index!48242 lt!632467) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632467) (size!47737 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)))))))

(declare-fun res!971450 () Bool)

(assert (=> b!1438809 (= res!971450 (= (select (arr!47185 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862))) (index!48242 lt!632467)) (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(assert (=> b!1438809 (=> res!971450 e!811555)))

(assert (=> b!1438809 (= e!811553 e!811555)))

(declare-fun b!1438810 () Bool)

(assert (=> b!1438810 (= e!811554 (Intermediate!11462 true lt!632432 #b00000000000000000000000000000000))))

(declare-fun b!1438811 () Bool)

(assert (=> b!1438811 (= e!811552 (bvsge (x!129972 lt!632467) #b01111111111111111111111111111110))))

(declare-fun b!1438812 () Bool)

(assert (=> b!1438812 (and (bvsge (index!48242 lt!632467) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632467) (size!47737 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862)))))))

(declare-fun res!971449 () Bool)

(assert (=> b!1438812 (= res!971449 (= (select (arr!47185 (array!97790 (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47737 a!2862))) (index!48242 lt!632467)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438812 (=> res!971449 e!811555)))

(assert (= (and d!154671 c!133192) b!1438810))

(assert (= (and d!154671 (not c!133192)) b!1438804))

(assert (= (and b!1438804 c!133191) b!1438805))

(assert (= (and b!1438804 (not c!133191)) b!1438808))

(assert (= (and d!154671 c!133190) b!1438811))

(assert (= (and d!154671 (not c!133190)) b!1438806))

(assert (= (and b!1438806 res!971448) b!1438809))

(assert (= (and b!1438809 (not res!971450)) b!1438812))

(assert (= (and b!1438812 (not res!971449)) b!1438807))

(declare-fun m!1327463 () Bool)

(assert (=> b!1438809 m!1327463))

(assert (=> b!1438812 m!1327463))

(declare-fun m!1327465 () Bool)

(assert (=> b!1438808 m!1327465))

(assert (=> b!1438808 m!1327465))

(assert (=> b!1438808 m!1327363))

(declare-fun m!1327467 () Bool)

(assert (=> b!1438808 m!1327467))

(assert (=> b!1438807 m!1327463))

(declare-fun m!1327469 () Bool)

(assert (=> d!154671 m!1327469))

(assert (=> d!154671 m!1327349))

(assert (=> b!1438700 d!154671))

(declare-fun d!154673 () Bool)

(declare-fun lt!632470 () (_ BitVec 32))

(declare-fun lt!632469 () (_ BitVec 32))

(assert (=> d!154673 (= lt!632470 (bvmul (bvxor lt!632469 (bvlshr lt!632469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154673 (= lt!632469 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154673 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971441 (let ((h!35110 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129976 (bvmul (bvxor h!35110 (bvlshr h!35110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129976 (bvlshr x!129976 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971441 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971441 #b00000000000000000000000000000000))))))

(assert (=> d!154673 (= (toIndex!0 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632470 (bvlshr lt!632470 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438700 d!154673))

(declare-fun d!154675 () Bool)

(assert (=> d!154675 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124324 d!154675))

(declare-fun d!154683 () Bool)

(assert (=> d!154683 (= (array_inv!36418 a!2862) (bvsge (size!47737 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124324 d!154683))

(declare-fun d!154685 () Bool)

(declare-fun e!811574 () Bool)

(assert (=> d!154685 e!811574))

(declare-fun c!133198 () Bool)

(declare-fun lt!632480 () SeekEntryResult!11462)

(assert (=> d!154685 (= c!133198 (and ((_ is Intermediate!11462) lt!632480) (undefined!12274 lt!632480)))))

(declare-fun e!811576 () SeekEntryResult!11462)

(assert (=> d!154685 (= lt!632480 e!811576)))

(declare-fun c!133200 () Bool)

(assert (=> d!154685 (= c!133200 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632481 () (_ BitVec 64))

(assert (=> d!154685 (= lt!632481 (select (arr!47185 a!2862) index!646))))

(assert (=> d!154685 (validMask!0 mask!2687)))

(assert (=> d!154685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632480)))

(declare-fun b!1438835 () Bool)

(declare-fun e!811578 () SeekEntryResult!11462)

(assert (=> b!1438835 (= e!811576 e!811578)))

(declare-fun c!133199 () Bool)

(assert (=> b!1438835 (= c!133199 (or (= lt!632481 (select (arr!47185 a!2862) j!93)) (= (bvadd lt!632481 lt!632481) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438836 () Bool)

(assert (=> b!1438836 (= e!811578 (Intermediate!11462 false index!646 x!665))))

(declare-fun b!1438837 () Bool)

(declare-fun e!811575 () Bool)

(assert (=> b!1438837 (= e!811574 e!811575)))

(declare-fun res!971463 () Bool)

(assert (=> b!1438837 (= res!971463 (and ((_ is Intermediate!11462) lt!632480) (not (undefined!12274 lt!632480)) (bvslt (x!129972 lt!632480) #b01111111111111111111111111111110) (bvsge (x!129972 lt!632480) #b00000000000000000000000000000000) (bvsge (x!129972 lt!632480) x!665)))))

(assert (=> b!1438837 (=> (not res!971463) (not e!811575))))

(declare-fun b!1438838 () Bool)

(assert (=> b!1438838 (and (bvsge (index!48242 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632480) (size!47737 a!2862)))))

(declare-fun e!811577 () Bool)

(assert (=> b!1438838 (= e!811577 (= (select (arr!47185 a!2862) (index!48242 lt!632480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438839 () Bool)

(assert (=> b!1438839 (= e!811578 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47185 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438840 () Bool)

(assert (=> b!1438840 (and (bvsge (index!48242 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632480) (size!47737 a!2862)))))

(declare-fun res!971465 () Bool)

(assert (=> b!1438840 (= res!971465 (= (select (arr!47185 a!2862) (index!48242 lt!632480)) (select (arr!47185 a!2862) j!93)))))

(assert (=> b!1438840 (=> res!971465 e!811577)))

(assert (=> b!1438840 (= e!811575 e!811577)))

(declare-fun b!1438841 () Bool)

(assert (=> b!1438841 (= e!811576 (Intermediate!11462 true index!646 x!665))))

(declare-fun b!1438842 () Bool)

(assert (=> b!1438842 (= e!811574 (bvsge (x!129972 lt!632480) #b01111111111111111111111111111110))))

(declare-fun b!1438843 () Bool)

(assert (=> b!1438843 (and (bvsge (index!48242 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632480) (size!47737 a!2862)))))

(declare-fun res!971464 () Bool)

(assert (=> b!1438843 (= res!971464 (= (select (arr!47185 a!2862) (index!48242 lt!632480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438843 (=> res!971464 e!811577)))

(assert (= (and d!154685 c!133200) b!1438841))

(assert (= (and d!154685 (not c!133200)) b!1438835))

(assert (= (and b!1438835 c!133199) b!1438836))

(assert (= (and b!1438835 (not c!133199)) b!1438839))

(assert (= (and d!154685 c!133198) b!1438842))

(assert (= (and d!154685 (not c!133198)) b!1438837))

(assert (= (and b!1438837 res!971463) b!1438840))

(assert (= (and b!1438840 (not res!971465)) b!1438843))

(assert (= (and b!1438843 (not res!971464)) b!1438838))

(declare-fun m!1327483 () Bool)

(assert (=> b!1438840 m!1327483))

(assert (=> b!1438843 m!1327483))

(declare-fun m!1327485 () Bool)

(assert (=> b!1438839 m!1327485))

(assert (=> b!1438839 m!1327485))

(assert (=> b!1438839 m!1327357))

(declare-fun m!1327487 () Bool)

(assert (=> b!1438839 m!1327487))

(assert (=> b!1438838 m!1327483))

(declare-fun m!1327489 () Bool)

(assert (=> d!154685 m!1327489))

(assert (=> d!154685 m!1327349))

(assert (=> b!1438696 d!154685))

(declare-fun d!154687 () Bool)

(declare-fun res!971475 () Bool)

(declare-fun e!811594 () Bool)

(assert (=> d!154687 (=> res!971475 e!811594)))

(assert (=> d!154687 (= res!971475 (bvsge #b00000000000000000000000000000000 (size!47737 a!2862)))))

(assert (=> d!154687 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33761) e!811594)))

(declare-fun b!1438859 () Bool)

(declare-fun e!811591 () Bool)

(declare-fun e!811592 () Bool)

(assert (=> b!1438859 (= e!811591 e!811592)))

(declare-fun c!133204 () Bool)

(assert (=> b!1438859 (= c!133204 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438860 () Bool)

(assert (=> b!1438860 (= e!811594 e!811591)))

(declare-fun res!971477 () Bool)

(assert (=> b!1438860 (=> (not res!971477) (not e!811591))))

(declare-fun e!811593 () Bool)

(assert (=> b!1438860 (= res!971477 (not e!811593))))

(declare-fun res!971476 () Bool)

(assert (=> b!1438860 (=> (not res!971476) (not e!811593))))

(assert (=> b!1438860 (= res!971476 (validKeyInArray!0 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438861 () Bool)

(declare-fun contains!9858 (List!33764 (_ BitVec 64)) Bool)

(assert (=> b!1438861 (= e!811593 (contains!9858 Nil!33761 (select (arr!47185 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438862 () Bool)

(declare-fun call!67661 () Bool)

(assert (=> b!1438862 (= e!811592 call!67661)))

(declare-fun bm!67658 () Bool)

(assert (=> bm!67658 (= call!67661 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133204 (Cons!33760 (select (arr!47185 a!2862) #b00000000000000000000000000000000) Nil!33761) Nil!33761)))))

(declare-fun b!1438863 () Bool)

(assert (=> b!1438863 (= e!811592 call!67661)))

(assert (= (and d!154687 (not res!971475)) b!1438860))

(assert (= (and b!1438860 res!971476) b!1438861))

(assert (= (and b!1438860 res!971477) b!1438859))

(assert (= (and b!1438859 c!133204) b!1438862))

(assert (= (and b!1438859 (not c!133204)) b!1438863))

(assert (= (or b!1438862 b!1438863) bm!67658))

(assert (=> b!1438859 m!1327451))

(assert (=> b!1438859 m!1327451))

(assert (=> b!1438859 m!1327461))

(assert (=> b!1438860 m!1327451))

(assert (=> b!1438860 m!1327451))

(assert (=> b!1438860 m!1327461))

(assert (=> b!1438861 m!1327451))

(assert (=> b!1438861 m!1327451))

(declare-fun m!1327499 () Bool)

(assert (=> b!1438861 m!1327499))

(assert (=> bm!67658 m!1327451))

(declare-fun m!1327501 () Bool)

(assert (=> bm!67658 m!1327501))

(assert (=> b!1438697 d!154687))

(check-sat (not bm!67658) (not b!1438802) (not bm!67649) (not d!154661) (not b!1438800) (not b!1438861) (not d!154671) (not b!1438839) (not b!1438860) (not b!1438859) (not b!1438787) (not b!1438808) (not d!154685))
(check-sat)
