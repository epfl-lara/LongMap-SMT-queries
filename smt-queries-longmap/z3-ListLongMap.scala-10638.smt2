; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124968 () Bool)

(assert start!124968)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11748 0))(
  ( (MissingZero!11748 (index!49384 (_ BitVec 32))) (Found!11748 (index!49385 (_ BitVec 32))) (Intermediate!11748 (undefined!12560 Bool) (index!49386 (_ BitVec 32)) (x!131029 (_ BitVec 32))) (Undefined!11748) (MissingVacant!11748 (index!49387 (_ BitVec 32))) )
))
(declare-fun lt!637025 () SeekEntryResult!11748)

(declare-fun lt!637026 () (_ BitVec 64))

(declare-fun e!817753 () Bool)

(declare-fun b!1452716 () Bool)

(declare-datatypes ((array!98416 0))(
  ( (array!98417 (arr!47496 (Array (_ BitVec 32) (_ BitVec 64))) (size!48046 (_ BitVec 32))) )
))
(declare-fun lt!637027 () array!98416)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11748)

(assert (=> b!1452716 (= e!817753 (= lt!637025 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637026 lt!637027 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1452717 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!817754 () Bool)

(declare-fun a!2862 () array!98416)

(assert (=> b!1452717 (= e!817754 (and (or (= (select (arr!47496 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47496 a!2862) intermediateBeforeIndex!19) (select (arr!47496 a!2862) j!93))) (or (and (= (select (arr!47496 a!2862) index!646) (select (store (arr!47496 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47496 a!2862) index!646) (select (arr!47496 a!2862) j!93))) (= (select (arr!47496 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47496 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!983809 () Bool)

(declare-fun e!817749 () Bool)

(assert (=> start!124968 (=> (not res!983809) (not e!817749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124968 (= res!983809 (validMask!0 mask!2687))))

(assert (=> start!124968 e!817749))

(assert (=> start!124968 true))

(declare-fun array_inv!36524 (array!98416) Bool)

(assert (=> start!124968 (array_inv!36524 a!2862)))

(declare-fun b!1452718 () Bool)

(declare-fun e!817752 () Bool)

(assert (=> b!1452718 (= e!817752 (not true))))

(assert (=> b!1452718 e!817754))

(declare-fun res!983801 () Bool)

(assert (=> b!1452718 (=> (not res!983801) (not e!817754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98416 (_ BitVec 32)) Bool)

(assert (=> b!1452718 (= res!983801 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48992 0))(
  ( (Unit!48993) )
))
(declare-fun lt!637028 () Unit!48992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48992)

(assert (=> b!1452718 (= lt!637028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452719 () Bool)

(declare-fun res!983811 () Bool)

(assert (=> b!1452719 (=> (not res!983811) (not e!817752))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452719 (= res!983811 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452720 () Bool)

(declare-fun res!983803 () Bool)

(assert (=> b!1452720 (=> (not res!983803) (not e!817749))))

(assert (=> b!1452720 (= res!983803 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48046 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48046 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48046 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452721 () Bool)

(declare-fun res!983805 () Bool)

(assert (=> b!1452721 (=> (not res!983805) (not e!817752))))

(assert (=> b!1452721 (= res!983805 e!817753)))

(declare-fun c!133968 () Bool)

(assert (=> b!1452721 (= c!133968 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452722 () Bool)

(declare-fun e!817751 () Bool)

(declare-fun e!817750 () Bool)

(assert (=> b!1452722 (= e!817751 e!817750)))

(declare-fun res!983802 () Bool)

(assert (=> b!1452722 (=> (not res!983802) (not e!817750))))

(declare-fun lt!637029 () SeekEntryResult!11748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452722 (= res!983802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47496 a!2862) j!93) mask!2687) (select (arr!47496 a!2862) j!93) a!2862 mask!2687) lt!637029))))

(assert (=> b!1452722 (= lt!637029 (Intermediate!11748 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452723 () Bool)

(declare-fun res!983810 () Bool)

(assert (=> b!1452723 (=> (not res!983810) (not e!817749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452723 (= res!983810 (validKeyInArray!0 (select (arr!47496 a!2862) j!93)))))

(declare-fun b!1452724 () Bool)

(declare-fun res!983808 () Bool)

(assert (=> b!1452724 (=> (not res!983808) (not e!817749))))

(assert (=> b!1452724 (= res!983808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452725 () Bool)

(declare-fun res!983807 () Bool)

(assert (=> b!1452725 (=> (not res!983807) (not e!817749))))

(assert (=> b!1452725 (= res!983807 (validKeyInArray!0 (select (arr!47496 a!2862) i!1006)))))

(declare-fun b!1452726 () Bool)

(assert (=> b!1452726 (= e!817750 e!817752)))

(declare-fun res!983804 () Bool)

(assert (=> b!1452726 (=> (not res!983804) (not e!817752))))

(assert (=> b!1452726 (= res!983804 (= lt!637025 (Intermediate!11748 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452726 (= lt!637025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637026 mask!2687) lt!637026 lt!637027 mask!2687))))

(assert (=> b!1452726 (= lt!637026 (select (store (arr!47496 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452727 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11748)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11748)

(assert (=> b!1452727 (= e!817753 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637026 lt!637027 mask!2687) (seekEntryOrOpen!0 lt!637026 lt!637027 mask!2687)))))

(declare-fun b!1452728 () Bool)

(declare-fun res!983812 () Bool)

(assert (=> b!1452728 (=> (not res!983812) (not e!817754))))

(assert (=> b!1452728 (= res!983812 (= (seekEntryOrOpen!0 (select (arr!47496 a!2862) j!93) a!2862 mask!2687) (Found!11748 j!93)))))

(declare-fun b!1452729 () Bool)

(declare-fun res!983815 () Bool)

(assert (=> b!1452729 (=> (not res!983815) (not e!817749))))

(declare-datatypes ((List!33997 0))(
  ( (Nil!33994) (Cons!33993 (h!35343 (_ BitVec 64)) (t!48691 List!33997)) )
))
(declare-fun arrayNoDuplicates!0 (array!98416 (_ BitVec 32) List!33997) Bool)

(assert (=> b!1452729 (= res!983815 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33994))))

(declare-fun b!1452730 () Bool)

(declare-fun res!983813 () Bool)

(assert (=> b!1452730 (=> (not res!983813) (not e!817750))))

(assert (=> b!1452730 (= res!983813 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47496 a!2862) j!93) a!2862 mask!2687) lt!637029))))

(declare-fun b!1452731 () Bool)

(declare-fun res!983806 () Bool)

(assert (=> b!1452731 (=> (not res!983806) (not e!817749))))

(assert (=> b!1452731 (= res!983806 (and (= (size!48046 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48046 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48046 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452732 () Bool)

(assert (=> b!1452732 (= e!817749 e!817751)))

(declare-fun res!983814 () Bool)

(assert (=> b!1452732 (=> (not res!983814) (not e!817751))))

(assert (=> b!1452732 (= res!983814 (= (select (store (arr!47496 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452732 (= lt!637027 (array!98417 (store (arr!47496 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48046 a!2862)))))

(assert (= (and start!124968 res!983809) b!1452731))

(assert (= (and b!1452731 res!983806) b!1452725))

(assert (= (and b!1452725 res!983807) b!1452723))

(assert (= (and b!1452723 res!983810) b!1452724))

(assert (= (and b!1452724 res!983808) b!1452729))

(assert (= (and b!1452729 res!983815) b!1452720))

(assert (= (and b!1452720 res!983803) b!1452732))

(assert (= (and b!1452732 res!983814) b!1452722))

(assert (= (and b!1452722 res!983802) b!1452730))

(assert (= (and b!1452730 res!983813) b!1452726))

(assert (= (and b!1452726 res!983804) b!1452721))

(assert (= (and b!1452721 c!133968) b!1452716))

(assert (= (and b!1452721 (not c!133968)) b!1452727))

(assert (= (and b!1452721 res!983805) b!1452719))

(assert (= (and b!1452719 res!983811) b!1452718))

(assert (= (and b!1452718 res!983801) b!1452728))

(assert (= (and b!1452728 res!983812) b!1452717))

(declare-fun m!1341285 () Bool)

(assert (=> b!1452730 m!1341285))

(assert (=> b!1452730 m!1341285))

(declare-fun m!1341287 () Bool)

(assert (=> b!1452730 m!1341287))

(declare-fun m!1341289 () Bool)

(assert (=> b!1452727 m!1341289))

(declare-fun m!1341291 () Bool)

(assert (=> b!1452727 m!1341291))

(declare-fun m!1341293 () Bool)

(assert (=> b!1452718 m!1341293))

(declare-fun m!1341295 () Bool)

(assert (=> b!1452718 m!1341295))

(declare-fun m!1341297 () Bool)

(assert (=> start!124968 m!1341297))

(declare-fun m!1341299 () Bool)

(assert (=> start!124968 m!1341299))

(declare-fun m!1341301 () Bool)

(assert (=> b!1452732 m!1341301))

(declare-fun m!1341303 () Bool)

(assert (=> b!1452732 m!1341303))

(assert (=> b!1452723 m!1341285))

(assert (=> b!1452723 m!1341285))

(declare-fun m!1341305 () Bool)

(assert (=> b!1452723 m!1341305))

(declare-fun m!1341307 () Bool)

(assert (=> b!1452716 m!1341307))

(declare-fun m!1341309 () Bool)

(assert (=> b!1452729 m!1341309))

(assert (=> b!1452717 m!1341301))

(declare-fun m!1341311 () Bool)

(assert (=> b!1452717 m!1341311))

(declare-fun m!1341313 () Bool)

(assert (=> b!1452717 m!1341313))

(declare-fun m!1341315 () Bool)

(assert (=> b!1452717 m!1341315))

(assert (=> b!1452717 m!1341285))

(assert (=> b!1452728 m!1341285))

(assert (=> b!1452728 m!1341285))

(declare-fun m!1341317 () Bool)

(assert (=> b!1452728 m!1341317))

(declare-fun m!1341319 () Bool)

(assert (=> b!1452725 m!1341319))

(assert (=> b!1452725 m!1341319))

(declare-fun m!1341321 () Bool)

(assert (=> b!1452725 m!1341321))

(declare-fun m!1341323 () Bool)

(assert (=> b!1452724 m!1341323))

(declare-fun m!1341325 () Bool)

(assert (=> b!1452726 m!1341325))

(assert (=> b!1452726 m!1341325))

(declare-fun m!1341327 () Bool)

(assert (=> b!1452726 m!1341327))

(assert (=> b!1452726 m!1341301))

(declare-fun m!1341329 () Bool)

(assert (=> b!1452726 m!1341329))

(assert (=> b!1452722 m!1341285))

(assert (=> b!1452722 m!1341285))

(declare-fun m!1341331 () Bool)

(assert (=> b!1452722 m!1341331))

(assert (=> b!1452722 m!1341331))

(assert (=> b!1452722 m!1341285))

(declare-fun m!1341333 () Bool)

(assert (=> b!1452722 m!1341333))

(check-sat (not b!1452716) (not start!124968) (not b!1452726) (not b!1452728) (not b!1452718) (not b!1452722) (not b!1452725) (not b!1452730) (not b!1452723) (not b!1452724) (not b!1452727) (not b!1452729))
(check-sat)
