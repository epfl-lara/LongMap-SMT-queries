; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125772 () Bool)

(assert start!125772)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!826112 () Bool)

(declare-fun b!1471856 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99106 0))(
  ( (array!99107 (arr!47838 (Array (_ BitVec 32) (_ BitVec 64))) (size!48388 (_ BitVec 32))) )
))
(declare-fun lt!643400 () array!99106)

(declare-datatypes ((SeekEntryResult!12078 0))(
  ( (MissingZero!12078 (index!50704 (_ BitVec 32))) (Found!12078 (index!50705 (_ BitVec 32))) (Intermediate!12078 (undefined!12890 Bool) (index!50706 (_ BitVec 32)) (x!132289 (_ BitVec 32))) (Undefined!12078) (MissingVacant!12078 (index!50707 (_ BitVec 32))) )
))
(declare-fun lt!643401 () SeekEntryResult!12078)

(declare-fun lt!643403 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99106 (_ BitVec 32)) SeekEntryResult!12078)

(assert (=> b!1471856 (= e!826112 (= lt!643401 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643403 lt!643400 mask!2687)))))

(declare-fun b!1471857 () Bool)

(declare-fun res!999594 () Bool)

(declare-fun e!826109 () Bool)

(assert (=> b!1471857 (=> (not res!999594) (not e!826109))))

(declare-fun a!2862 () array!99106)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471857 (= res!999594 (validKeyInArray!0 (select (arr!47838 a!2862) j!93)))))

(declare-fun b!1471858 () Bool)

(declare-fun res!999592 () Bool)

(declare-fun e!826115 () Bool)

(assert (=> b!1471858 (=> (not res!999592) (not e!826115))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471858 (= res!999592 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471859 () Bool)

(declare-fun res!999593 () Bool)

(assert (=> b!1471859 (=> (not res!999593) (not e!826109))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471859 (= res!999593 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48388 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48388 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48388 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471860 () Bool)

(declare-fun e!826114 () Bool)

(declare-fun e!826110 () Bool)

(assert (=> b!1471860 (= e!826114 e!826110)))

(declare-fun res!999600 () Bool)

(assert (=> b!1471860 (=> (not res!999600) (not e!826110))))

(declare-fun lt!643402 () SeekEntryResult!12078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471860 (= res!999600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47838 a!2862) j!93) mask!2687) (select (arr!47838 a!2862) j!93) a!2862 mask!2687) lt!643402))))

(assert (=> b!1471860 (= lt!643402 (Intermediate!12078 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471861 () Bool)

(declare-fun res!999596 () Bool)

(assert (=> b!1471861 (=> (not res!999596) (not e!826110))))

(assert (=> b!1471861 (= res!999596 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47838 a!2862) j!93) a!2862 mask!2687) lt!643402))))

(declare-fun b!1471862 () Bool)

(assert (=> b!1471862 (= e!826115 (not true))))

(declare-fun e!826111 () Bool)

(assert (=> b!1471862 e!826111))

(declare-fun res!999599 () Bool)

(assert (=> b!1471862 (=> (not res!999599) (not e!826111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99106 (_ BitVec 32)) Bool)

(assert (=> b!1471862 (= res!999599 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49496 0))(
  ( (Unit!49497) )
))
(declare-fun lt!643404 () Unit!49496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49496)

(assert (=> b!1471862 (= lt!643404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471863 () Bool)

(declare-fun res!999598 () Bool)

(assert (=> b!1471863 (=> (not res!999598) (not e!826109))))

(assert (=> b!1471863 (= res!999598 (validKeyInArray!0 (select (arr!47838 a!2862) i!1006)))))

(declare-fun b!1471864 () Bool)

(declare-fun res!999597 () Bool)

(assert (=> b!1471864 (=> (not res!999597) (not e!826115))))

(assert (=> b!1471864 (= res!999597 e!826112)))

(declare-fun c!135648 () Bool)

(assert (=> b!1471864 (= c!135648 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471865 () Bool)

(assert (=> b!1471865 (= e!826111 (or (= (select (arr!47838 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47838 a!2862) intermediateBeforeIndex!19) (select (arr!47838 a!2862) j!93))))))

(declare-fun b!1471866 () Bool)

(assert (=> b!1471866 (= e!826110 e!826115)))

(declare-fun res!999590 () Bool)

(assert (=> b!1471866 (=> (not res!999590) (not e!826115))))

(assert (=> b!1471866 (= res!999590 (= lt!643401 (Intermediate!12078 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471866 (= lt!643401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643403 mask!2687) lt!643403 lt!643400 mask!2687))))

(assert (=> b!1471866 (= lt!643403 (select (store (arr!47838 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!999588 () Bool)

(assert (=> start!125772 (=> (not res!999588) (not e!826109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125772 (= res!999588 (validMask!0 mask!2687))))

(assert (=> start!125772 e!826109))

(assert (=> start!125772 true))

(declare-fun array_inv!36866 (array!99106) Bool)

(assert (=> start!125772 (array_inv!36866 a!2862)))

(declare-fun b!1471867 () Bool)

(declare-fun res!999589 () Bool)

(assert (=> b!1471867 (=> (not res!999589) (not e!826111))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99106 (_ BitVec 32)) SeekEntryResult!12078)

(assert (=> b!1471867 (= res!999589 (= (seekEntryOrOpen!0 (select (arr!47838 a!2862) j!93) a!2862 mask!2687) (Found!12078 j!93)))))

(declare-fun b!1471868 () Bool)

(declare-fun res!999601 () Bool)

(assert (=> b!1471868 (=> (not res!999601) (not e!826109))))

(declare-datatypes ((List!34339 0))(
  ( (Nil!34336) (Cons!34335 (h!35691 (_ BitVec 64)) (t!49033 List!34339)) )
))
(declare-fun arrayNoDuplicates!0 (array!99106 (_ BitVec 32) List!34339) Bool)

(assert (=> b!1471868 (= res!999601 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34336))))

(declare-fun b!1471869 () Bool)

(assert (=> b!1471869 (= e!826109 e!826114)))

(declare-fun res!999587 () Bool)

(assert (=> b!1471869 (=> (not res!999587) (not e!826114))))

(assert (=> b!1471869 (= res!999587 (= (select (store (arr!47838 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471869 (= lt!643400 (array!99107 (store (arr!47838 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48388 a!2862)))))

(declare-fun b!1471870 () Bool)

(declare-fun res!999595 () Bool)

(assert (=> b!1471870 (=> (not res!999595) (not e!826109))))

(assert (=> b!1471870 (= res!999595 (and (= (size!48388 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48388 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48388 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471871 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99106 (_ BitVec 32)) SeekEntryResult!12078)

(assert (=> b!1471871 (= e!826112 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643403 lt!643400 mask!2687) (seekEntryOrOpen!0 lt!643403 lt!643400 mask!2687)))))

(declare-fun b!1471872 () Bool)

(declare-fun res!999591 () Bool)

(assert (=> b!1471872 (=> (not res!999591) (not e!826109))))

(assert (=> b!1471872 (= res!999591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125772 res!999588) b!1471870))

(assert (= (and b!1471870 res!999595) b!1471863))

(assert (= (and b!1471863 res!999598) b!1471857))

(assert (= (and b!1471857 res!999594) b!1471872))

(assert (= (and b!1471872 res!999591) b!1471868))

(assert (= (and b!1471868 res!999601) b!1471859))

(assert (= (and b!1471859 res!999593) b!1471869))

(assert (= (and b!1471869 res!999587) b!1471860))

(assert (= (and b!1471860 res!999600) b!1471861))

(assert (= (and b!1471861 res!999596) b!1471866))

(assert (= (and b!1471866 res!999590) b!1471864))

(assert (= (and b!1471864 c!135648) b!1471856))

(assert (= (and b!1471864 (not c!135648)) b!1471871))

(assert (= (and b!1471864 res!999597) b!1471858))

(assert (= (and b!1471858 res!999592) b!1471862))

(assert (= (and b!1471862 res!999599) b!1471867))

(assert (= (and b!1471867 res!999589) b!1471865))

(declare-fun m!1358627 () Bool)

(assert (=> start!125772 m!1358627))

(declare-fun m!1358629 () Bool)

(assert (=> start!125772 m!1358629))

(declare-fun m!1358631 () Bool)

(assert (=> b!1471865 m!1358631))

(declare-fun m!1358633 () Bool)

(assert (=> b!1471865 m!1358633))

(declare-fun m!1358635 () Bool)

(assert (=> b!1471862 m!1358635))

(declare-fun m!1358637 () Bool)

(assert (=> b!1471862 m!1358637))

(assert (=> b!1471867 m!1358633))

(assert (=> b!1471867 m!1358633))

(declare-fun m!1358639 () Bool)

(assert (=> b!1471867 m!1358639))

(declare-fun m!1358641 () Bool)

(assert (=> b!1471872 m!1358641))

(assert (=> b!1471857 m!1358633))

(assert (=> b!1471857 m!1358633))

(declare-fun m!1358643 () Bool)

(assert (=> b!1471857 m!1358643))

(declare-fun m!1358645 () Bool)

(assert (=> b!1471871 m!1358645))

(declare-fun m!1358647 () Bool)

(assert (=> b!1471871 m!1358647))

(assert (=> b!1471860 m!1358633))

(assert (=> b!1471860 m!1358633))

(declare-fun m!1358649 () Bool)

(assert (=> b!1471860 m!1358649))

(assert (=> b!1471860 m!1358649))

(assert (=> b!1471860 m!1358633))

(declare-fun m!1358651 () Bool)

(assert (=> b!1471860 m!1358651))

(declare-fun m!1358653 () Bool)

(assert (=> b!1471863 m!1358653))

(assert (=> b!1471863 m!1358653))

(declare-fun m!1358655 () Bool)

(assert (=> b!1471863 m!1358655))

(declare-fun m!1358657 () Bool)

(assert (=> b!1471866 m!1358657))

(assert (=> b!1471866 m!1358657))

(declare-fun m!1358659 () Bool)

(assert (=> b!1471866 m!1358659))

(declare-fun m!1358661 () Bool)

(assert (=> b!1471866 m!1358661))

(declare-fun m!1358663 () Bool)

(assert (=> b!1471866 m!1358663))

(declare-fun m!1358665 () Bool)

(assert (=> b!1471868 m!1358665))

(assert (=> b!1471861 m!1358633))

(assert (=> b!1471861 m!1358633))

(declare-fun m!1358667 () Bool)

(assert (=> b!1471861 m!1358667))

(declare-fun m!1358669 () Bool)

(assert (=> b!1471856 m!1358669))

(assert (=> b!1471869 m!1358661))

(declare-fun m!1358671 () Bool)

(assert (=> b!1471869 m!1358671))

(check-sat (not start!125772) (not b!1471856) (not b!1471861) (not b!1471867) (not b!1471860) (not b!1471872) (not b!1471871) (not b!1471857) (not b!1471863) (not b!1471862) (not b!1471866) (not b!1471868))
(check-sat)
