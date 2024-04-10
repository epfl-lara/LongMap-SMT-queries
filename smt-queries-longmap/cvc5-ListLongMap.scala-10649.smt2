; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125032 () Bool)

(assert start!125032)

(declare-fun b!1454700 () Bool)

(declare-fun res!985503 () Bool)

(declare-fun e!818642 () Bool)

(assert (=> b!1454700 (=> (not res!985503) (not e!818642))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98480 0))(
  ( (array!98481 (arr!47528 (Array (_ BitVec 32) (_ BitVec 64))) (size!48078 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98480)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454700 (= res!985503 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48078 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48078 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48078 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454701 () Bool)

(declare-fun e!818645 () Bool)

(declare-fun e!818648 () Bool)

(assert (=> b!1454701 (= e!818645 e!818648)))

(declare-fun res!985509 () Bool)

(assert (=> b!1454701 (=> (not res!985509) (not e!818648))))

(declare-datatypes ((SeekEntryResult!11780 0))(
  ( (MissingZero!11780 (index!49512 (_ BitVec 32))) (Found!11780 (index!49513 (_ BitVec 32))) (Intermediate!11780 (undefined!12592 Bool) (index!49514 (_ BitVec 32)) (x!131149 (_ BitVec 32))) (Undefined!11780) (MissingVacant!11780 (index!49515 (_ BitVec 32))) )
))
(declare-fun lt!637689 () SeekEntryResult!11780)

(assert (=> b!1454701 (= res!985509 (= lt!637689 (Intermediate!11780 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637686 () array!98480)

(declare-fun lt!637688 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98480 (_ BitVec 32)) SeekEntryResult!11780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454701 (= lt!637689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637688 mask!2687) lt!637688 lt!637686 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454701 (= lt!637688 (select (store (arr!47528 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454702 () Bool)

(declare-fun res!985513 () Bool)

(assert (=> b!1454702 (=> (not res!985513) (not e!818642))))

(declare-datatypes ((List!34029 0))(
  ( (Nil!34026) (Cons!34025 (h!35375 (_ BitVec 64)) (t!48723 List!34029)) )
))
(declare-fun arrayNoDuplicates!0 (array!98480 (_ BitVec 32) List!34029) Bool)

(assert (=> b!1454702 (= res!985513 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34026))))

(declare-fun b!1454703 () Bool)

(declare-fun e!818647 () Bool)

(assert (=> b!1454703 (= e!818647 e!818645)))

(declare-fun res!985499 () Bool)

(assert (=> b!1454703 (=> (not res!985499) (not e!818645))))

(declare-fun lt!637684 () SeekEntryResult!11780)

(assert (=> b!1454703 (= res!985499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47528 a!2862) j!93) mask!2687) (select (arr!47528 a!2862) j!93) a!2862 mask!2687) lt!637684))))

(assert (=> b!1454703 (= lt!637684 (Intermediate!11780 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454704 () Bool)

(declare-fun res!985511 () Bool)

(assert (=> b!1454704 (=> (not res!985511) (not e!818642))))

(assert (=> b!1454704 (= res!985511 (and (= (size!48078 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48078 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48078 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454705 () Bool)

(declare-fun res!985500 () Bool)

(assert (=> b!1454705 (=> (not res!985500) (not e!818645))))

(assert (=> b!1454705 (= res!985500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47528 a!2862) j!93) a!2862 mask!2687) lt!637684))))

(declare-fun e!818650 () Bool)

(declare-fun lt!637685 () (_ BitVec 32))

(declare-fun lt!637687 () SeekEntryResult!11780)

(declare-fun b!1454706 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98480 (_ BitVec 32)) SeekEntryResult!11780)

(assert (=> b!1454706 (= e!818650 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637685 intermediateAfterIndex!19 lt!637688 lt!637686 mask!2687) lt!637687)))))

(declare-fun b!1454707 () Bool)

(declare-fun res!985501 () Bool)

(assert (=> b!1454707 (=> (not res!985501) (not e!818642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454707 (= res!985501 (validKeyInArray!0 (select (arr!47528 a!2862) j!93)))))

(declare-fun b!1454708 () Bool)

(declare-fun res!985508 () Bool)

(assert (=> b!1454708 (=> (not res!985508) (not e!818642))))

(assert (=> b!1454708 (= res!985508 (validKeyInArray!0 (select (arr!47528 a!2862) i!1006)))))

(declare-fun e!818644 () Bool)

(declare-fun b!1454709 () Bool)

(assert (=> b!1454709 (= e!818644 (= lt!637689 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637688 lt!637686 mask!2687)))))

(declare-fun b!1454710 () Bool)

(declare-fun res!985510 () Bool)

(assert (=> b!1454710 (=> (not res!985510) (not e!818648))))

(assert (=> b!1454710 (= res!985510 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454711 () Bool)

(declare-fun e!818646 () Bool)

(assert (=> b!1454711 (= e!818646 (and (or (= (select (arr!47528 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47528 a!2862) intermediateBeforeIndex!19) (select (arr!47528 a!2862) j!93))) (let ((bdg!53089 (select (store (arr!47528 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47528 a!2862) index!646) bdg!53089) (= (select (arr!47528 a!2862) index!646) (select (arr!47528 a!2862) j!93))) (= (select (arr!47528 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53089 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454712 () Bool)

(declare-fun e!818649 () Bool)

(assert (=> b!1454712 (= e!818648 (not e!818649))))

(declare-fun res!985514 () Bool)

(assert (=> b!1454712 (=> res!985514 e!818649)))

(assert (=> b!1454712 (= res!985514 (or (and (= (select (arr!47528 a!2862) index!646) (select (store (arr!47528 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47528 a!2862) index!646) (select (arr!47528 a!2862) j!93))) (= (select (arr!47528 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454712 e!818646))

(declare-fun res!985505 () Bool)

(assert (=> b!1454712 (=> (not res!985505) (not e!818646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98480 (_ BitVec 32)) Bool)

(assert (=> b!1454712 (= res!985505 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49056 0))(
  ( (Unit!49057) )
))
(declare-fun lt!637683 () Unit!49056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49056)

(assert (=> b!1454712 (= lt!637683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!985504 () Bool)

(assert (=> start!125032 (=> (not res!985504) (not e!818642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125032 (= res!985504 (validMask!0 mask!2687))))

(assert (=> start!125032 e!818642))

(assert (=> start!125032 true))

(declare-fun array_inv!36556 (array!98480) Bool)

(assert (=> start!125032 (array_inv!36556 a!2862)))

(declare-fun b!1454713 () Bool)

(declare-fun res!985507 () Bool)

(declare-fun e!818643 () Bool)

(assert (=> b!1454713 (=> res!985507 e!818643)))

(assert (=> b!1454713 (= res!985507 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637685 (select (arr!47528 a!2862) j!93) a!2862 mask!2687) lt!637684)))))

(declare-fun b!1454714 () Bool)

(assert (=> b!1454714 (= e!818650 (not (= lt!637689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637685 lt!637688 lt!637686 mask!2687))))))

(declare-fun b!1454715 () Bool)

(assert (=> b!1454715 (= e!818643 true)))

(declare-fun lt!637682 () Bool)

(assert (=> b!1454715 (= lt!637682 e!818650)))

(declare-fun c!134112 () Bool)

(assert (=> b!1454715 (= c!134112 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454716 () Bool)

(assert (=> b!1454716 (= e!818642 e!818647)))

(declare-fun res!985516 () Bool)

(assert (=> b!1454716 (=> (not res!985516) (not e!818647))))

(assert (=> b!1454716 (= res!985516 (= (select (store (arr!47528 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454716 (= lt!637686 (array!98481 (store (arr!47528 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48078 a!2862)))))

(declare-fun b!1454717 () Bool)

(declare-fun res!985502 () Bool)

(assert (=> b!1454717 (=> (not res!985502) (not e!818642))))

(assert (=> b!1454717 (= res!985502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454718 () Bool)

(declare-fun res!985512 () Bool)

(assert (=> b!1454718 (=> (not res!985512) (not e!818646))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98480 (_ BitVec 32)) SeekEntryResult!11780)

(assert (=> b!1454718 (= res!985512 (= (seekEntryOrOpen!0 (select (arr!47528 a!2862) j!93) a!2862 mask!2687) (Found!11780 j!93)))))

(declare-fun b!1454719 () Bool)

(assert (=> b!1454719 (= e!818649 e!818643)))

(declare-fun res!985515 () Bool)

(assert (=> b!1454719 (=> res!985515 e!818643)))

(assert (=> b!1454719 (= res!985515 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637685 #b00000000000000000000000000000000) (bvsge lt!637685 (size!48078 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454719 (= lt!637685 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454719 (= lt!637687 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637688 lt!637686 mask!2687))))

(assert (=> b!1454719 (= lt!637687 (seekEntryOrOpen!0 lt!637688 lt!637686 mask!2687))))

(declare-fun b!1454720 () Bool)

(assert (=> b!1454720 (= e!818644 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637688 lt!637686 mask!2687) (seekEntryOrOpen!0 lt!637688 lt!637686 mask!2687)))))

(declare-fun b!1454721 () Bool)

(declare-fun res!985506 () Bool)

(assert (=> b!1454721 (=> (not res!985506) (not e!818648))))

(assert (=> b!1454721 (= res!985506 e!818644)))

(declare-fun c!134111 () Bool)

(assert (=> b!1454721 (= c!134111 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125032 res!985504) b!1454704))

(assert (= (and b!1454704 res!985511) b!1454708))

(assert (= (and b!1454708 res!985508) b!1454707))

(assert (= (and b!1454707 res!985501) b!1454717))

(assert (= (and b!1454717 res!985502) b!1454702))

(assert (= (and b!1454702 res!985513) b!1454700))

(assert (= (and b!1454700 res!985503) b!1454716))

(assert (= (and b!1454716 res!985516) b!1454703))

(assert (= (and b!1454703 res!985499) b!1454705))

(assert (= (and b!1454705 res!985500) b!1454701))

(assert (= (and b!1454701 res!985509) b!1454721))

(assert (= (and b!1454721 c!134111) b!1454709))

(assert (= (and b!1454721 (not c!134111)) b!1454720))

(assert (= (and b!1454721 res!985506) b!1454710))

(assert (= (and b!1454710 res!985510) b!1454712))

(assert (= (and b!1454712 res!985505) b!1454718))

(assert (= (and b!1454718 res!985512) b!1454711))

(assert (= (and b!1454712 (not res!985514)) b!1454719))

(assert (= (and b!1454719 (not res!985515)) b!1454713))

(assert (= (and b!1454713 (not res!985507)) b!1454715))

(assert (= (and b!1454715 c!134112) b!1454714))

(assert (= (and b!1454715 (not c!134112)) b!1454706))

(declare-fun m!1343011 () Bool)

(assert (=> b!1454706 m!1343011))

(declare-fun m!1343013 () Bool)

(assert (=> b!1454711 m!1343013))

(declare-fun m!1343015 () Bool)

(assert (=> b!1454711 m!1343015))

(declare-fun m!1343017 () Bool)

(assert (=> b!1454711 m!1343017))

(declare-fun m!1343019 () Bool)

(assert (=> b!1454711 m!1343019))

(declare-fun m!1343021 () Bool)

(assert (=> b!1454711 m!1343021))

(declare-fun m!1343023 () Bool)

(assert (=> b!1454714 m!1343023))

(declare-fun m!1343025 () Bool)

(assert (=> b!1454702 m!1343025))

(declare-fun m!1343027 () Bool)

(assert (=> b!1454712 m!1343027))

(assert (=> b!1454712 m!1343013))

(assert (=> b!1454712 m!1343017))

(assert (=> b!1454712 m!1343019))

(declare-fun m!1343029 () Bool)

(assert (=> b!1454712 m!1343029))

(assert (=> b!1454712 m!1343021))

(declare-fun m!1343031 () Bool)

(assert (=> b!1454708 m!1343031))

(assert (=> b!1454708 m!1343031))

(declare-fun m!1343033 () Bool)

(assert (=> b!1454708 m!1343033))

(declare-fun m!1343035 () Bool)

(assert (=> b!1454719 m!1343035))

(declare-fun m!1343037 () Bool)

(assert (=> b!1454719 m!1343037))

(declare-fun m!1343039 () Bool)

(assert (=> b!1454719 m!1343039))

(declare-fun m!1343041 () Bool)

(assert (=> b!1454701 m!1343041))

(assert (=> b!1454701 m!1343041))

(declare-fun m!1343043 () Bool)

(assert (=> b!1454701 m!1343043))

(assert (=> b!1454701 m!1343013))

(declare-fun m!1343045 () Bool)

(assert (=> b!1454701 m!1343045))

(assert (=> b!1454713 m!1343021))

(assert (=> b!1454713 m!1343021))

(declare-fun m!1343047 () Bool)

(assert (=> b!1454713 m!1343047))

(assert (=> b!1454720 m!1343037))

(assert (=> b!1454720 m!1343039))

(declare-fun m!1343049 () Bool)

(assert (=> b!1454717 m!1343049))

(declare-fun m!1343051 () Bool)

(assert (=> start!125032 m!1343051))

(declare-fun m!1343053 () Bool)

(assert (=> start!125032 m!1343053))

(assert (=> b!1454707 m!1343021))

(assert (=> b!1454707 m!1343021))

(declare-fun m!1343055 () Bool)

(assert (=> b!1454707 m!1343055))

(declare-fun m!1343057 () Bool)

(assert (=> b!1454709 m!1343057))

(assert (=> b!1454718 m!1343021))

(assert (=> b!1454718 m!1343021))

(declare-fun m!1343059 () Bool)

(assert (=> b!1454718 m!1343059))

(assert (=> b!1454703 m!1343021))

(assert (=> b!1454703 m!1343021))

(declare-fun m!1343061 () Bool)

(assert (=> b!1454703 m!1343061))

(assert (=> b!1454703 m!1343061))

(assert (=> b!1454703 m!1343021))

(declare-fun m!1343063 () Bool)

(assert (=> b!1454703 m!1343063))

(assert (=> b!1454716 m!1343013))

(declare-fun m!1343065 () Bool)

(assert (=> b!1454716 m!1343065))

(assert (=> b!1454705 m!1343021))

(assert (=> b!1454705 m!1343021))

(declare-fun m!1343067 () Bool)

(assert (=> b!1454705 m!1343067))

(push 1)

