; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125652 () Bool)

(assert start!125652)

(declare-fun b!1467523 () Bool)

(declare-fun res!995244 () Bool)

(declare-fun e!824670 () Bool)

(assert (=> b!1467523 (=> (not res!995244) (not e!824670))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98938 0))(
  ( (array!98939 (arr!47752 (Array (_ BitVec 32) (_ BitVec 64))) (size!48303 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98938)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11901 0))(
  ( (MissingZero!11901 (index!49996 (_ BitVec 32))) (Found!11901 (index!49997 (_ BitVec 32))) (Intermediate!11901 (undefined!12713 Bool) (index!49998 (_ BitVec 32)) (x!131759 (_ BitVec 32))) (Undefined!11901) (MissingVacant!11901 (index!49999 (_ BitVec 32))) )
))
(declare-fun lt!642168 () SeekEntryResult!11901)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98938 (_ BitVec 32)) SeekEntryResult!11901)

(assert (=> b!1467523 (= res!995244 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642168))))

(declare-fun b!1467524 () Bool)

(declare-fun res!995250 () Bool)

(declare-fun e!824668 () Bool)

(assert (=> b!1467524 (=> (not res!995250) (not e!824668))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467524 (= res!995250 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467525 () Bool)

(declare-fun e!824664 () Bool)

(assert (=> b!1467525 (= e!824664 e!824670)))

(declare-fun res!995245 () Bool)

(assert (=> b!1467525 (=> (not res!995245) (not e!824670))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467525 (= res!995245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47752 a!2862) j!93) mask!2687) (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642168))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1467525 (= lt!642168 (Intermediate!11901 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467526 () Bool)

(declare-fun res!995255 () Bool)

(declare-fun e!824665 () Bool)

(assert (=> b!1467526 (=> (not res!995255) (not e!824665))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467526 (= res!995255 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48303 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48303 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48303 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467527 () Bool)

(declare-fun res!995261 () Bool)

(assert (=> b!1467527 (=> (not res!995261) (not e!824665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467527 (= res!995261 (validKeyInArray!0 (select (arr!47752 a!2862) i!1006)))))

(declare-fun b!1467528 () Bool)

(assert (=> b!1467528 (= e!824665 e!824664)))

(declare-fun res!995257 () Bool)

(assert (=> b!1467528 (=> (not res!995257) (not e!824664))))

(assert (=> b!1467528 (= res!995257 (= (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642167 () array!98938)

(assert (=> b!1467528 (= lt!642167 (array!98939 (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48303 a!2862)))))

(declare-fun lt!642169 () SeekEntryResult!11901)

(declare-fun e!824667 () Bool)

(declare-fun lt!642163 () (_ BitVec 32))

(declare-fun b!1467529 () Bool)

(declare-fun lt!642164 () (_ BitVec 64))

(assert (=> b!1467529 (= e!824667 (not (= lt!642169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642163 lt!642164 lt!642167 mask!2687))))))

(declare-fun b!1467530 () Bool)

(declare-fun res!995248 () Bool)

(assert (=> b!1467530 (=> (not res!995248) (not e!824668))))

(declare-fun e!824666 () Bool)

(assert (=> b!1467530 (= res!995248 e!824666)))

(declare-fun c!135661 () Bool)

(assert (=> b!1467530 (= c!135661 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467531 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98938 (_ BitVec 32)) SeekEntryResult!11901)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98938 (_ BitVec 32)) SeekEntryResult!11901)

(assert (=> b!1467531 (= e!824666 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642164 lt!642167 mask!2687) (seekEntryOrOpen!0 lt!642164 lt!642167 mask!2687)))))

(declare-fun b!1467532 () Bool)

(declare-fun res!995246 () Bool)

(assert (=> b!1467532 (=> (not res!995246) (not e!824665))))

(assert (=> b!1467532 (= res!995246 (and (= (size!48303 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48303 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48303 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467533 () Bool)

(declare-fun e!824669 () Bool)

(declare-fun e!824663 () Bool)

(assert (=> b!1467533 (= e!824669 e!824663)))

(declare-fun res!995253 () Bool)

(assert (=> b!1467533 (=> res!995253 e!824663)))

(assert (=> b!1467533 (= res!995253 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642163 #b00000000000000000000000000000000) (bvsge lt!642163 (size!48303 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467533 (= lt!642163 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1467534 () Bool)

(assert (=> b!1467534 (= e!824666 (= lt!642169 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642164 lt!642167 mask!2687)))))

(declare-fun b!1467535 () Bool)

(declare-fun res!995252 () Bool)

(assert (=> b!1467535 (=> res!995252 e!824663)))

(assert (=> b!1467535 (= res!995252 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467536 () Bool)

(assert (=> b!1467536 (= e!824663 true)))

(declare-fun lt!642162 () SeekEntryResult!11901)

(assert (=> b!1467536 (= lt!642162 (seekEntryOrOpen!0 lt!642164 lt!642167 mask!2687))))

(declare-datatypes ((Unit!49331 0))(
  ( (Unit!49332) )
))
(declare-fun lt!642165 () Unit!49331)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49331)

(assert (=> b!1467536 (= lt!642165 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642163 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467537 () Bool)

(declare-fun res!995258 () Bool)

(assert (=> b!1467537 (=> (not res!995258) (not e!824665))))

(declare-datatypes ((List!34240 0))(
  ( (Nil!34237) (Cons!34236 (h!35600 (_ BitVec 64)) (t!48926 List!34240)) )
))
(declare-fun arrayNoDuplicates!0 (array!98938 (_ BitVec 32) List!34240) Bool)

(assert (=> b!1467537 (= res!995258 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34237))))

(declare-fun b!1467538 () Bool)

(assert (=> b!1467538 (= e!824670 e!824668)))

(declare-fun res!995254 () Bool)

(assert (=> b!1467538 (=> (not res!995254) (not e!824668))))

(assert (=> b!1467538 (= res!995254 (= lt!642169 (Intermediate!11901 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467538 (= lt!642169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642164 mask!2687) lt!642164 lt!642167 mask!2687))))

(assert (=> b!1467538 (= lt!642164 (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467539 () Bool)

(assert (=> b!1467539 (= e!824667 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642163 intermediateAfterIndex!19 lt!642164 lt!642167 mask!2687) (seekEntryOrOpen!0 lt!642164 lt!642167 mask!2687))))))

(declare-fun b!1467540 () Bool)

(declare-fun res!995259 () Bool)

(assert (=> b!1467540 (=> res!995259 e!824663)))

(assert (=> b!1467540 (= res!995259 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642163 (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642168)))))

(declare-fun b!1467541 () Bool)

(declare-fun res!995251 () Bool)

(assert (=> b!1467541 (=> (not res!995251) (not e!824665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98938 (_ BitVec 32)) Bool)

(assert (=> b!1467541 (= res!995251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!995260 () Bool)

(assert (=> start!125652 (=> (not res!995260) (not e!824665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125652 (= res!995260 (validMask!0 mask!2687))))

(assert (=> start!125652 e!824665))

(assert (=> start!125652 true))

(declare-fun array_inv!37033 (array!98938) Bool)

(assert (=> start!125652 (array_inv!37033 a!2862)))

(declare-fun b!1467542 () Bool)

(assert (=> b!1467542 (= e!824668 (not e!824669))))

(declare-fun res!995249 () Bool)

(assert (=> b!1467542 (=> res!995249 e!824669)))

(assert (=> b!1467542 (= res!995249 (or (and (= (select (arr!47752 a!2862) index!646) (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47752 a!2862) index!646) (select (arr!47752 a!2862) j!93))) (= (select (arr!47752 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467542 (and (= lt!642162 (Found!11901 j!93)) (or (= (select (arr!47752 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47752 a!2862) intermediateBeforeIndex!19) (select (arr!47752 a!2862) j!93))))))

(assert (=> b!1467542 (= lt!642162 (seekEntryOrOpen!0 (select (arr!47752 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1467542 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642166 () Unit!49331)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49331)

(assert (=> b!1467542 (= lt!642166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467543 () Bool)

(declare-fun res!995256 () Bool)

(assert (=> b!1467543 (=> res!995256 e!824663)))

(assert (=> b!1467543 (= res!995256 e!824667)))

(declare-fun c!135660 () Bool)

(assert (=> b!1467543 (= c!135660 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467544 () Bool)

(declare-fun res!995247 () Bool)

(assert (=> b!1467544 (=> (not res!995247) (not e!824665))))

(assert (=> b!1467544 (= res!995247 (validKeyInArray!0 (select (arr!47752 a!2862) j!93)))))

(assert (= (and start!125652 res!995260) b!1467532))

(assert (= (and b!1467532 res!995246) b!1467527))

(assert (= (and b!1467527 res!995261) b!1467544))

(assert (= (and b!1467544 res!995247) b!1467541))

(assert (= (and b!1467541 res!995251) b!1467537))

(assert (= (and b!1467537 res!995258) b!1467526))

(assert (= (and b!1467526 res!995255) b!1467528))

(assert (= (and b!1467528 res!995257) b!1467525))

(assert (= (and b!1467525 res!995245) b!1467523))

(assert (= (and b!1467523 res!995244) b!1467538))

(assert (= (and b!1467538 res!995254) b!1467530))

(assert (= (and b!1467530 c!135661) b!1467534))

(assert (= (and b!1467530 (not c!135661)) b!1467531))

(assert (= (and b!1467530 res!995248) b!1467524))

(assert (= (and b!1467524 res!995250) b!1467542))

(assert (= (and b!1467542 (not res!995249)) b!1467533))

(assert (= (and b!1467533 (not res!995253)) b!1467540))

(assert (= (and b!1467540 (not res!995259)) b!1467543))

(assert (= (and b!1467543 c!135660) b!1467529))

(assert (= (and b!1467543 (not c!135660)) b!1467539))

(assert (= (and b!1467543 (not res!995256)) b!1467535))

(assert (= (and b!1467535 (not res!995252)) b!1467536))

(declare-fun m!1354549 () Bool)

(assert (=> b!1467533 m!1354549))

(declare-fun m!1354551 () Bool)

(assert (=> b!1467541 m!1354551))

(declare-fun m!1354553 () Bool)

(assert (=> b!1467539 m!1354553))

(declare-fun m!1354555 () Bool)

(assert (=> b!1467539 m!1354555))

(declare-fun m!1354557 () Bool)

(assert (=> b!1467527 m!1354557))

(assert (=> b!1467527 m!1354557))

(declare-fun m!1354559 () Bool)

(assert (=> b!1467527 m!1354559))

(declare-fun m!1354561 () Bool)

(assert (=> b!1467538 m!1354561))

(assert (=> b!1467538 m!1354561))

(declare-fun m!1354563 () Bool)

(assert (=> b!1467538 m!1354563))

(declare-fun m!1354565 () Bool)

(assert (=> b!1467538 m!1354565))

(declare-fun m!1354567 () Bool)

(assert (=> b!1467538 m!1354567))

(declare-fun m!1354569 () Bool)

(assert (=> b!1467523 m!1354569))

(assert (=> b!1467523 m!1354569))

(declare-fun m!1354571 () Bool)

(assert (=> b!1467523 m!1354571))

(assert (=> b!1467525 m!1354569))

(assert (=> b!1467525 m!1354569))

(declare-fun m!1354573 () Bool)

(assert (=> b!1467525 m!1354573))

(assert (=> b!1467525 m!1354573))

(assert (=> b!1467525 m!1354569))

(declare-fun m!1354575 () Bool)

(assert (=> b!1467525 m!1354575))

(assert (=> b!1467528 m!1354565))

(declare-fun m!1354577 () Bool)

(assert (=> b!1467528 m!1354577))

(declare-fun m!1354579 () Bool)

(assert (=> b!1467529 m!1354579))

(declare-fun m!1354581 () Bool)

(assert (=> b!1467537 m!1354581))

(declare-fun m!1354583 () Bool)

(assert (=> b!1467531 m!1354583))

(assert (=> b!1467531 m!1354555))

(assert (=> b!1467536 m!1354555))

(declare-fun m!1354585 () Bool)

(assert (=> b!1467536 m!1354585))

(declare-fun m!1354587 () Bool)

(assert (=> b!1467534 m!1354587))

(assert (=> b!1467544 m!1354569))

(assert (=> b!1467544 m!1354569))

(declare-fun m!1354589 () Bool)

(assert (=> b!1467544 m!1354589))

(assert (=> b!1467540 m!1354569))

(assert (=> b!1467540 m!1354569))

(declare-fun m!1354591 () Bool)

(assert (=> b!1467540 m!1354591))

(declare-fun m!1354593 () Bool)

(assert (=> b!1467542 m!1354593))

(assert (=> b!1467542 m!1354565))

(declare-fun m!1354595 () Bool)

(assert (=> b!1467542 m!1354595))

(declare-fun m!1354597 () Bool)

(assert (=> b!1467542 m!1354597))

(declare-fun m!1354599 () Bool)

(assert (=> b!1467542 m!1354599))

(assert (=> b!1467542 m!1354569))

(declare-fun m!1354601 () Bool)

(assert (=> b!1467542 m!1354601))

(declare-fun m!1354603 () Bool)

(assert (=> b!1467542 m!1354603))

(assert (=> b!1467542 m!1354569))

(declare-fun m!1354605 () Bool)

(assert (=> start!125652 m!1354605))

(declare-fun m!1354607 () Bool)

(assert (=> start!125652 m!1354607))

(check-sat (not b!1467531) (not b!1467533) (not b!1467540) (not b!1467541) (not b!1467538) (not b!1467525) (not b!1467536) (not b!1467542) (not start!125652) (not b!1467523) (not b!1467537) (not b!1467544) (not b!1467527) (not b!1467539) (not b!1467529) (not b!1467534))
(check-sat)
