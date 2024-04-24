; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125424 () Bool)

(assert start!125424)

(declare-fun b!1461723 () Bool)

(declare-fun res!990680 () Bool)

(declare-fun e!821995 () Bool)

(assert (=> b!1461723 (=> (not res!990680) (not e!821995))))

(declare-datatypes ((array!98767 0))(
  ( (array!98768 (arr!47668 (Array (_ BitVec 32) (_ BitVec 64))) (size!48219 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98767)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461723 (= res!990680 (validKeyInArray!0 (select (arr!47668 a!2862) i!1006)))))

(declare-fun lt!640287 () (_ BitVec 64))

(declare-fun e!821998 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1461724 () Bool)

(declare-fun lt!640288 () array!98767)

(declare-datatypes ((SeekEntryResult!11817 0))(
  ( (MissingZero!11817 (index!49660 (_ BitVec 32))) (Found!11817 (index!49661 (_ BitVec 32))) (Intermediate!11817 (undefined!12629 Bool) (index!49662 (_ BitVec 32)) (x!131442 (_ BitVec 32))) (Undefined!11817) (MissingVacant!11817 (index!49663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98767 (_ BitVec 32)) SeekEntryResult!11817)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98767 (_ BitVec 32)) SeekEntryResult!11817)

(assert (=> b!1461724 (= e!821998 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640287 lt!640288 mask!2687) (seekEntryOrOpen!0 lt!640287 lt!640288 mask!2687)))))

(declare-fun b!1461725 () Bool)

(declare-fun res!990677 () Bool)

(declare-fun e!822000 () Bool)

(assert (=> b!1461725 (=> (not res!990677) (not e!822000))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461725 (= res!990677 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1461726 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461726 (= e!822000 (not (or (and (= (select (arr!47668 a!2862) index!646) (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47668 a!2862) index!646) (select (arr!47668 a!2862) j!93))) (= (select (arr!47668 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!821997 () Bool)

(assert (=> b!1461726 e!821997))

(declare-fun res!990687 () Bool)

(assert (=> b!1461726 (=> (not res!990687) (not e!821997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98767 (_ BitVec 32)) Bool)

(assert (=> b!1461726 (= res!990687 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49163 0))(
  ( (Unit!49164) )
))
(declare-fun lt!640291 () Unit!49163)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49163)

(assert (=> b!1461726 (= lt!640291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!640290 () SeekEntryResult!11817)

(declare-fun b!1461727 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98767 (_ BitVec 32)) SeekEntryResult!11817)

(assert (=> b!1461727 (= e!821998 (= lt!640290 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640287 lt!640288 mask!2687)))))

(declare-fun res!990678 () Bool)

(assert (=> start!125424 (=> (not res!990678) (not e!821995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125424 (= res!990678 (validMask!0 mask!2687))))

(assert (=> start!125424 e!821995))

(assert (=> start!125424 true))

(declare-fun array_inv!36949 (array!98767) Bool)

(assert (=> start!125424 (array_inv!36949 a!2862)))

(declare-fun b!1461728 () Bool)

(declare-fun res!990689 () Bool)

(assert (=> b!1461728 (=> (not res!990689) (not e!821995))))

(assert (=> b!1461728 (= res!990689 (and (= (size!48219 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48219 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48219 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461729 () Bool)

(declare-fun res!990679 () Bool)

(assert (=> b!1461729 (=> (not res!990679) (not e!821995))))

(assert (=> b!1461729 (= res!990679 (validKeyInArray!0 (select (arr!47668 a!2862) j!93)))))

(declare-fun b!1461730 () Bool)

(declare-fun e!821999 () Bool)

(declare-fun e!821996 () Bool)

(assert (=> b!1461730 (= e!821999 e!821996)))

(declare-fun res!990688 () Bool)

(assert (=> b!1461730 (=> (not res!990688) (not e!821996))))

(declare-fun lt!640289 () SeekEntryResult!11817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461730 (= res!990688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47668 a!2862) j!93) mask!2687) (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!640289))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461730 (= lt!640289 (Intermediate!11817 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461731 () Bool)

(declare-fun res!990686 () Bool)

(assert (=> b!1461731 (=> (not res!990686) (not e!821995))))

(assert (=> b!1461731 (= res!990686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461732 () Bool)

(assert (=> b!1461732 (= e!821996 e!822000)))

(declare-fun res!990685 () Bool)

(assert (=> b!1461732 (=> (not res!990685) (not e!822000))))

(assert (=> b!1461732 (= res!990685 (= lt!640290 (Intermediate!11817 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461732 (= lt!640290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640287 mask!2687) lt!640287 lt!640288 mask!2687))))

(assert (=> b!1461732 (= lt!640287 (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461733 () Bool)

(declare-fun res!990684 () Bool)

(assert (=> b!1461733 (=> (not res!990684) (not e!822000))))

(assert (=> b!1461733 (= res!990684 e!821998)))

(declare-fun c!135043 () Bool)

(assert (=> b!1461733 (= c!135043 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461734 () Bool)

(assert (=> b!1461734 (= e!821997 (or (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) (select (arr!47668 a!2862) j!93))))))

(declare-fun b!1461735 () Bool)

(declare-fun res!990675 () Bool)

(assert (=> b!1461735 (=> (not res!990675) (not e!821996))))

(assert (=> b!1461735 (= res!990675 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!640289))))

(declare-fun b!1461736 () Bool)

(declare-fun res!990676 () Bool)

(assert (=> b!1461736 (=> (not res!990676) (not e!821995))))

(declare-datatypes ((List!34156 0))(
  ( (Nil!34153) (Cons!34152 (h!35513 (_ BitVec 64)) (t!48842 List!34156)) )
))
(declare-fun arrayNoDuplicates!0 (array!98767 (_ BitVec 32) List!34156) Bool)

(assert (=> b!1461736 (= res!990676 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34153))))

(declare-fun b!1461737 () Bool)

(assert (=> b!1461737 (= e!821995 e!821999)))

(declare-fun res!990683 () Bool)

(assert (=> b!1461737 (=> (not res!990683) (not e!821999))))

(assert (=> b!1461737 (= res!990683 (= (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461737 (= lt!640288 (array!98768 (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48219 a!2862)))))

(declare-fun b!1461738 () Bool)

(declare-fun res!990681 () Bool)

(assert (=> b!1461738 (=> (not res!990681) (not e!821995))))

(assert (=> b!1461738 (= res!990681 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48219 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48219 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48219 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461739 () Bool)

(declare-fun res!990682 () Bool)

(assert (=> b!1461739 (=> (not res!990682) (not e!821997))))

(assert (=> b!1461739 (= res!990682 (= (seekEntryOrOpen!0 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) (Found!11817 j!93)))))

(assert (= (and start!125424 res!990678) b!1461728))

(assert (= (and b!1461728 res!990689) b!1461723))

(assert (= (and b!1461723 res!990680) b!1461729))

(assert (= (and b!1461729 res!990679) b!1461731))

(assert (= (and b!1461731 res!990686) b!1461736))

(assert (= (and b!1461736 res!990676) b!1461738))

(assert (= (and b!1461738 res!990681) b!1461737))

(assert (= (and b!1461737 res!990683) b!1461730))

(assert (= (and b!1461730 res!990688) b!1461735))

(assert (= (and b!1461735 res!990675) b!1461732))

(assert (= (and b!1461732 res!990685) b!1461733))

(assert (= (and b!1461733 c!135043) b!1461727))

(assert (= (and b!1461733 (not c!135043)) b!1461724))

(assert (= (and b!1461733 res!990684) b!1461725))

(assert (= (and b!1461725 res!990677) b!1461726))

(assert (= (and b!1461726 res!990687) b!1461739))

(assert (= (and b!1461739 res!990682) b!1461734))

(declare-fun m!1349515 () Bool)

(assert (=> b!1461736 m!1349515))

(declare-fun m!1349517 () Bool)

(assert (=> b!1461723 m!1349517))

(assert (=> b!1461723 m!1349517))

(declare-fun m!1349519 () Bool)

(assert (=> b!1461723 m!1349519))

(declare-fun m!1349521 () Bool)

(assert (=> b!1461727 m!1349521))

(declare-fun m!1349523 () Bool)

(assert (=> b!1461735 m!1349523))

(assert (=> b!1461735 m!1349523))

(declare-fun m!1349525 () Bool)

(assert (=> b!1461735 m!1349525))

(declare-fun m!1349527 () Bool)

(assert (=> b!1461724 m!1349527))

(declare-fun m!1349529 () Bool)

(assert (=> b!1461724 m!1349529))

(declare-fun m!1349531 () Bool)

(assert (=> b!1461726 m!1349531))

(declare-fun m!1349533 () Bool)

(assert (=> b!1461726 m!1349533))

(declare-fun m!1349535 () Bool)

(assert (=> b!1461726 m!1349535))

(declare-fun m!1349537 () Bool)

(assert (=> b!1461726 m!1349537))

(declare-fun m!1349539 () Bool)

(assert (=> b!1461726 m!1349539))

(assert (=> b!1461726 m!1349523))

(declare-fun m!1349541 () Bool)

(assert (=> b!1461732 m!1349541))

(assert (=> b!1461732 m!1349541))

(declare-fun m!1349543 () Bool)

(assert (=> b!1461732 m!1349543))

(assert (=> b!1461732 m!1349533))

(declare-fun m!1349545 () Bool)

(assert (=> b!1461732 m!1349545))

(assert (=> b!1461730 m!1349523))

(assert (=> b!1461730 m!1349523))

(declare-fun m!1349547 () Bool)

(assert (=> b!1461730 m!1349547))

(assert (=> b!1461730 m!1349547))

(assert (=> b!1461730 m!1349523))

(declare-fun m!1349549 () Bool)

(assert (=> b!1461730 m!1349549))

(declare-fun m!1349551 () Bool)

(assert (=> start!125424 m!1349551))

(declare-fun m!1349553 () Bool)

(assert (=> start!125424 m!1349553))

(declare-fun m!1349555 () Bool)

(assert (=> b!1461734 m!1349555))

(assert (=> b!1461734 m!1349523))

(assert (=> b!1461737 m!1349533))

(declare-fun m!1349557 () Bool)

(assert (=> b!1461737 m!1349557))

(declare-fun m!1349559 () Bool)

(assert (=> b!1461731 m!1349559))

(assert (=> b!1461729 m!1349523))

(assert (=> b!1461729 m!1349523))

(declare-fun m!1349561 () Bool)

(assert (=> b!1461729 m!1349561))

(assert (=> b!1461739 m!1349523))

(assert (=> b!1461739 m!1349523))

(declare-fun m!1349563 () Bool)

(assert (=> b!1461739 m!1349563))

(check-sat (not b!1461735) (not b!1461726) (not b!1461723) (not b!1461736) (not start!125424) (not b!1461732) (not b!1461727) (not b!1461730) (not b!1461724) (not b!1461739) (not b!1461729) (not b!1461731))
(check-sat)
