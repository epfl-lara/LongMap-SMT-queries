; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125382 () Bool)

(assert start!125382)

(declare-fun b!1460384 () Bool)

(declare-fun e!821440 () Bool)

(assert (=> b!1460384 (= e!821440 true)))

(declare-datatypes ((SeekEntryResult!11796 0))(
  ( (MissingZero!11796 (index!49576 (_ BitVec 32))) (Found!11796 (index!49577 (_ BitVec 32))) (Intermediate!11796 (undefined!12608 Bool) (index!49578 (_ BitVec 32)) (x!131365 (_ BitVec 32))) (Undefined!11796) (MissingVacant!11796 (index!49579 (_ BitVec 32))) )
))
(declare-fun lt!639767 () SeekEntryResult!11796)

(declare-fun lt!639766 () SeekEntryResult!11796)

(assert (=> b!1460384 (= lt!639767 lt!639766)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((Unit!49121 0))(
  ( (Unit!49122) )
))
(declare-fun lt!639765 () Unit!49121)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639770 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98725 0))(
  ( (array!98726 (arr!47647 (Array (_ BitVec 32) (_ BitVec 64))) (size!48198 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98725)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49121)

(assert (=> b!1460384 (= lt!639765 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639770 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460385 () Bool)

(declare-fun res!989565 () Bool)

(assert (=> b!1460385 (=> res!989565 e!821440)))

(declare-fun lt!639769 () SeekEntryResult!11796)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98725 (_ BitVec 32)) SeekEntryResult!11796)

(assert (=> b!1460385 (= res!989565 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639770 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!639769)))))

(declare-fun b!1460386 () Bool)

(declare-fun res!989575 () Bool)

(declare-fun e!821443 () Bool)

(assert (=> b!1460386 (=> (not res!989575) (not e!821443))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460386 (= res!989575 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!639769))))

(declare-fun b!1460387 () Bool)

(declare-fun res!989577 () Bool)

(declare-fun e!821445 () Bool)

(assert (=> b!1460387 (=> (not res!989577) (not e!821445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98725 (_ BitVec 32)) Bool)

(assert (=> b!1460387 (= res!989577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460388 () Bool)

(declare-fun lt!639771 () array!98725)

(declare-fun lt!639768 () SeekEntryResult!11796)

(declare-fun lt!639764 () (_ BitVec 64))

(declare-fun e!821442 () Bool)

(assert (=> b!1460388 (= e!821442 (= lt!639768 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639764 lt!639771 mask!2687)))))

(declare-fun b!1460389 () Bool)

(declare-fun e!821444 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98725 (_ BitVec 32)) SeekEntryResult!11796)

(assert (=> b!1460389 (= e!821444 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639770 intermediateAfterIndex!19 lt!639764 lt!639771 mask!2687) lt!639766)))))

(declare-fun b!1460390 () Bool)

(declare-fun res!989574 () Bool)

(assert (=> b!1460390 (=> (not res!989574) (not e!821445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460390 (= res!989574 (validKeyInArray!0 (select (arr!47647 a!2862) i!1006)))))

(declare-fun b!1460391 () Bool)

(declare-fun res!989580 () Bool)

(assert (=> b!1460391 (=> (not res!989580) (not e!821445))))

(assert (=> b!1460391 (= res!989580 (and (= (size!48198 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48198 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48198 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460392 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98725 (_ BitVec 32)) SeekEntryResult!11796)

(assert (=> b!1460392 (= e!821442 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639764 lt!639771 mask!2687) (seekEntryOrOpen!0 lt!639764 lt!639771 mask!2687)))))

(declare-fun b!1460393 () Bool)

(declare-fun res!989568 () Bool)

(assert (=> b!1460393 (=> res!989568 e!821440)))

(assert (=> b!1460393 (= res!989568 e!821444)))

(declare-fun c!134928 () Bool)

(assert (=> b!1460393 (= c!134928 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460394 () Bool)

(declare-fun e!821441 () Bool)

(declare-fun e!821447 () Bool)

(assert (=> b!1460394 (= e!821441 (not e!821447))))

(declare-fun res!989572 () Bool)

(assert (=> b!1460394 (=> res!989572 e!821447)))

(assert (=> b!1460394 (= res!989572 (or (and (= (select (arr!47647 a!2862) index!646) (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47647 a!2862) index!646) (select (arr!47647 a!2862) j!93))) (= (select (arr!47647 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460394 (and (= lt!639767 (Found!11796 j!93)) (or (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) (select (arr!47647 a!2862) j!93))) (let ((bdg!53482 (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47647 a!2862) index!646) bdg!53482) (= (select (arr!47647 a!2862) index!646) (select (arr!47647 a!2862) j!93))) (= (select (arr!47647 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53482 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460394 (= lt!639767 (seekEntryOrOpen!0 (select (arr!47647 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1460394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639772 () Unit!49121)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49121)

(assert (=> b!1460394 (= lt!639772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460395 () Bool)

(declare-fun e!821446 () Bool)

(assert (=> b!1460395 (= e!821445 e!821446)))

(declare-fun res!989571 () Bool)

(assert (=> b!1460395 (=> (not res!989571) (not e!821446))))

(assert (=> b!1460395 (= res!989571 (= (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460395 (= lt!639771 (array!98726 (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48198 a!2862)))))

(declare-fun b!1460396 () Bool)

(assert (=> b!1460396 (= e!821444 (not (= lt!639768 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639770 lt!639764 lt!639771 mask!2687))))))

(declare-fun b!1460383 () Bool)

(declare-fun res!989573 () Bool)

(assert (=> b!1460383 (=> (not res!989573) (not e!821445))))

(assert (=> b!1460383 (= res!989573 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48198 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48198 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48198 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!989576 () Bool)

(assert (=> start!125382 (=> (not res!989576) (not e!821445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125382 (= res!989576 (validMask!0 mask!2687))))

(assert (=> start!125382 e!821445))

(assert (=> start!125382 true))

(declare-fun array_inv!36928 (array!98725) Bool)

(assert (=> start!125382 (array_inv!36928 a!2862)))

(declare-fun b!1460397 () Bool)

(declare-fun res!989582 () Bool)

(assert (=> b!1460397 (=> (not res!989582) (not e!821441))))

(assert (=> b!1460397 (= res!989582 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460398 () Bool)

(declare-fun res!989570 () Bool)

(assert (=> b!1460398 (=> (not res!989570) (not e!821441))))

(assert (=> b!1460398 (= res!989570 e!821442)))

(declare-fun c!134929 () Bool)

(assert (=> b!1460398 (= c!134929 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460399 () Bool)

(declare-fun res!989569 () Bool)

(assert (=> b!1460399 (=> (not res!989569) (not e!821445))))

(declare-datatypes ((List!34135 0))(
  ( (Nil!34132) (Cons!34131 (h!35492 (_ BitVec 64)) (t!48821 List!34135)) )
))
(declare-fun arrayNoDuplicates!0 (array!98725 (_ BitVec 32) List!34135) Bool)

(assert (=> b!1460399 (= res!989569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34132))))

(declare-fun b!1460400 () Bool)

(assert (=> b!1460400 (= e!821443 e!821441)))

(declare-fun res!989567 () Bool)

(assert (=> b!1460400 (=> (not res!989567) (not e!821441))))

(assert (=> b!1460400 (= res!989567 (= lt!639768 (Intermediate!11796 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460400 (= lt!639768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639764 mask!2687) lt!639764 lt!639771 mask!2687))))

(assert (=> b!1460400 (= lt!639764 (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460401 () Bool)

(assert (=> b!1460401 (= e!821447 e!821440)))

(declare-fun res!989581 () Bool)

(assert (=> b!1460401 (=> res!989581 e!821440)))

(assert (=> b!1460401 (= res!989581 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639770 #b00000000000000000000000000000000) (bvsge lt!639770 (size!48198 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460401 (= lt!639770 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1460401 (= lt!639766 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639764 lt!639771 mask!2687))))

(assert (=> b!1460401 (= lt!639766 (seekEntryOrOpen!0 lt!639764 lt!639771 mask!2687))))

(declare-fun b!1460402 () Bool)

(declare-fun res!989578 () Bool)

(assert (=> b!1460402 (=> res!989578 e!821440)))

(assert (=> b!1460402 (= res!989578 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460403 () Bool)

(assert (=> b!1460403 (= e!821446 e!821443)))

(declare-fun res!989566 () Bool)

(assert (=> b!1460403 (=> (not res!989566) (not e!821443))))

(assert (=> b!1460403 (= res!989566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47647 a!2862) j!93) mask!2687) (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!639769))))

(assert (=> b!1460403 (= lt!639769 (Intermediate!11796 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460404 () Bool)

(declare-fun res!989579 () Bool)

(assert (=> b!1460404 (=> (not res!989579) (not e!821445))))

(assert (=> b!1460404 (= res!989579 (validKeyInArray!0 (select (arr!47647 a!2862) j!93)))))

(assert (= (and start!125382 res!989576) b!1460391))

(assert (= (and b!1460391 res!989580) b!1460390))

(assert (= (and b!1460390 res!989574) b!1460404))

(assert (= (and b!1460404 res!989579) b!1460387))

(assert (= (and b!1460387 res!989577) b!1460399))

(assert (= (and b!1460399 res!989569) b!1460383))

(assert (= (and b!1460383 res!989573) b!1460395))

(assert (= (and b!1460395 res!989571) b!1460403))

(assert (= (and b!1460403 res!989566) b!1460386))

(assert (= (and b!1460386 res!989575) b!1460400))

(assert (= (and b!1460400 res!989567) b!1460398))

(assert (= (and b!1460398 c!134929) b!1460388))

(assert (= (and b!1460398 (not c!134929)) b!1460392))

(assert (= (and b!1460398 res!989570) b!1460397))

(assert (= (and b!1460397 res!989582) b!1460394))

(assert (= (and b!1460394 (not res!989572)) b!1460401))

(assert (= (and b!1460401 (not res!989581)) b!1460385))

(assert (= (and b!1460385 (not res!989565)) b!1460393))

(assert (= (and b!1460393 c!134928) b!1460396))

(assert (= (and b!1460393 (not c!134928)) b!1460389))

(assert (= (and b!1460393 (not res!989568)) b!1460402))

(assert (= (and b!1460402 (not res!989578)) b!1460384))

(declare-fun m!1348291 () Bool)

(assert (=> b!1460399 m!1348291))

(declare-fun m!1348293 () Bool)

(assert (=> b!1460392 m!1348293))

(declare-fun m!1348295 () Bool)

(assert (=> b!1460392 m!1348295))

(declare-fun m!1348297 () Bool)

(assert (=> b!1460401 m!1348297))

(assert (=> b!1460401 m!1348293))

(assert (=> b!1460401 m!1348295))

(declare-fun m!1348299 () Bool)

(assert (=> b!1460396 m!1348299))

(declare-fun m!1348301 () Bool)

(assert (=> b!1460400 m!1348301))

(assert (=> b!1460400 m!1348301))

(declare-fun m!1348303 () Bool)

(assert (=> b!1460400 m!1348303))

(declare-fun m!1348305 () Bool)

(assert (=> b!1460400 m!1348305))

(declare-fun m!1348307 () Bool)

(assert (=> b!1460400 m!1348307))

(declare-fun m!1348309 () Bool)

(assert (=> b!1460403 m!1348309))

(assert (=> b!1460403 m!1348309))

(declare-fun m!1348311 () Bool)

(assert (=> b!1460403 m!1348311))

(assert (=> b!1460403 m!1348311))

(assert (=> b!1460403 m!1348309))

(declare-fun m!1348313 () Bool)

(assert (=> b!1460403 m!1348313))

(assert (=> b!1460395 m!1348305))

(declare-fun m!1348315 () Bool)

(assert (=> b!1460395 m!1348315))

(assert (=> b!1460386 m!1348309))

(assert (=> b!1460386 m!1348309))

(declare-fun m!1348317 () Bool)

(assert (=> b!1460386 m!1348317))

(assert (=> b!1460404 m!1348309))

(assert (=> b!1460404 m!1348309))

(declare-fun m!1348319 () Bool)

(assert (=> b!1460404 m!1348319))

(declare-fun m!1348321 () Bool)

(assert (=> b!1460394 m!1348321))

(assert (=> b!1460394 m!1348305))

(declare-fun m!1348323 () Bool)

(assert (=> b!1460394 m!1348323))

(declare-fun m!1348325 () Bool)

(assert (=> b!1460394 m!1348325))

(declare-fun m!1348327 () Bool)

(assert (=> b!1460394 m!1348327))

(assert (=> b!1460394 m!1348309))

(declare-fun m!1348329 () Bool)

(assert (=> b!1460394 m!1348329))

(declare-fun m!1348331 () Bool)

(assert (=> b!1460394 m!1348331))

(assert (=> b!1460394 m!1348309))

(declare-fun m!1348333 () Bool)

(assert (=> start!125382 m!1348333))

(declare-fun m!1348335 () Bool)

(assert (=> start!125382 m!1348335))

(declare-fun m!1348337 () Bool)

(assert (=> b!1460384 m!1348337))

(declare-fun m!1348339 () Bool)

(assert (=> b!1460390 m!1348339))

(assert (=> b!1460390 m!1348339))

(declare-fun m!1348341 () Bool)

(assert (=> b!1460390 m!1348341))

(declare-fun m!1348343 () Bool)

(assert (=> b!1460388 m!1348343))

(declare-fun m!1348345 () Bool)

(assert (=> b!1460387 m!1348345))

(assert (=> b!1460385 m!1348309))

(assert (=> b!1460385 m!1348309))

(declare-fun m!1348347 () Bool)

(assert (=> b!1460385 m!1348347))

(declare-fun m!1348349 () Bool)

(assert (=> b!1460389 m!1348349))

(check-sat (not start!125382) (not b!1460389) (not b!1460385) (not b!1460399) (not b!1460392) (not b!1460387) (not b!1460394) (not b!1460403) (not b!1460404) (not b!1460401) (not b!1460388) (not b!1460386) (not b!1460400) (not b!1460396) (not b!1460384) (not b!1460390))
(check-sat)
