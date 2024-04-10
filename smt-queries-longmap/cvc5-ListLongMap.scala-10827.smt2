; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126742 () Bool)

(assert start!126742)

(declare-fun b!1487805 () Bool)

(declare-fun res!1011775 () Bool)

(declare-fun e!833981 () Bool)

(assert (=> b!1487805 (=> (not res!1011775) (not e!833981))))

(declare-datatypes ((array!99578 0))(
  ( (array!99579 (arr!48062 (Array (_ BitVec 32) (_ BitVec 64))) (size!48612 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99578)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487805 (= res!1011775 (validKeyInArray!0 (select (arr!48062 a!2862) i!1006)))))

(declare-fun b!1487806 () Bool)

(declare-fun e!833982 () Bool)

(declare-fun e!833978 () Bool)

(assert (=> b!1487806 (= e!833982 (not e!833978))))

(declare-fun res!1011790 () Bool)

(assert (=> b!1487806 (=> res!1011790 e!833978)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487806 (= res!1011790 (or (and (= (select (arr!48062 a!2862) index!646) (select (store (arr!48062 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48062 a!2862) index!646) (select (arr!48062 a!2862) j!93))) (= (select (arr!48062 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833979 () Bool)

(assert (=> b!1487806 e!833979))

(declare-fun res!1011792 () Bool)

(assert (=> b!1487806 (=> (not res!1011792) (not e!833979))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99578 (_ BitVec 32)) Bool)

(assert (=> b!1487806 (= res!1011792 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49944 0))(
  ( (Unit!49945) )
))
(declare-fun lt!648966 () Unit!49944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49944)

(assert (=> b!1487806 (= lt!648966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487807 () Bool)

(declare-fun res!1011786 () Bool)

(assert (=> b!1487807 (=> (not res!1011786) (not e!833981))))

(assert (=> b!1487807 (= res!1011786 (validKeyInArray!0 (select (arr!48062 a!2862) j!93)))))

(declare-fun b!1487808 () Bool)

(declare-fun res!1011793 () Bool)

(assert (=> b!1487808 (=> (not res!1011793) (not e!833979))))

(declare-datatypes ((SeekEntryResult!12302 0))(
  ( (MissingZero!12302 (index!51600 (_ BitVec 32))) (Found!12302 (index!51601 (_ BitVec 32))) (Intermediate!12302 (undefined!13114 Bool) (index!51602 (_ BitVec 32)) (x!133194 (_ BitVec 32))) (Undefined!12302) (MissingVacant!12302 (index!51603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99578 (_ BitVec 32)) SeekEntryResult!12302)

(assert (=> b!1487808 (= res!1011793 (= (seekEntryOrOpen!0 (select (arr!48062 a!2862) j!93) a!2862 mask!2687) (Found!12302 j!93)))))

(declare-fun b!1487809 () Bool)

(declare-fun e!833980 () Bool)

(assert (=> b!1487809 (= e!833981 e!833980)))

(declare-fun res!1011776 () Bool)

(assert (=> b!1487809 (=> (not res!1011776) (not e!833980))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487809 (= res!1011776 (= (select (store (arr!48062 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648963 () array!99578)

(assert (=> b!1487809 (= lt!648963 (array!99579 (store (arr!48062 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48612 a!2862)))))

(declare-fun b!1487810 () Bool)

(declare-fun res!1011774 () Bool)

(assert (=> b!1487810 (=> (not res!1011774) (not e!833981))))

(assert (=> b!1487810 (= res!1011774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1011783 () Bool)

(assert (=> start!126742 (=> (not res!1011783) (not e!833981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126742 (= res!1011783 (validMask!0 mask!2687))))

(assert (=> start!126742 e!833981))

(assert (=> start!126742 true))

(declare-fun array_inv!37090 (array!99578) Bool)

(assert (=> start!126742 (array_inv!37090 a!2862)))

(declare-fun b!1487811 () Bool)

(declare-fun res!1011782 () Bool)

(assert (=> b!1487811 (=> (not res!1011782) (not e!833982))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487811 (= res!1011782 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487812 () Bool)

(declare-fun e!833975 () Bool)

(declare-fun lt!648964 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99578 (_ BitVec 32)) SeekEntryResult!12302)

(assert (=> b!1487812 (= e!833975 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648964 lt!648963 mask!2687) (seekEntryOrOpen!0 lt!648964 lt!648963 mask!2687)))))

(declare-fun b!1487813 () Bool)

(declare-fun res!1011781 () Bool)

(assert (=> b!1487813 (=> (not res!1011781) (not e!833979))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1487813 (= res!1011781 (or (= (select (arr!48062 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48062 a!2862) intermediateBeforeIndex!19) (select (arr!48062 a!2862) j!93))))))

(declare-fun b!1487814 () Bool)

(declare-fun e!833983 () Bool)

(declare-fun e!833974 () Bool)

(assert (=> b!1487814 (= e!833983 e!833974)))

(declare-fun res!1011789 () Bool)

(assert (=> b!1487814 (=> (not res!1011789) (not e!833974))))

(declare-fun lt!648961 () (_ BitVec 64))

(assert (=> b!1487814 (= res!1011789 (and (= index!646 intermediateAfterIndex!19) (= lt!648961 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487815 () Bool)

(assert (=> b!1487815 (= e!833979 e!833983)))

(declare-fun res!1011784 () Bool)

(assert (=> b!1487815 (=> res!1011784 e!833983)))

(assert (=> b!1487815 (= res!1011784 (or (and (= (select (arr!48062 a!2862) index!646) lt!648961) (= (select (arr!48062 a!2862) index!646) (select (arr!48062 a!2862) j!93))) (= (select (arr!48062 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487815 (= lt!648961 (select (store (arr!48062 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487816 () Bool)

(declare-fun e!833976 () Bool)

(assert (=> b!1487816 (= e!833976 e!833982)))

(declare-fun res!1011785 () Bool)

(assert (=> b!1487816 (=> (not res!1011785) (not e!833982))))

(declare-fun lt!648959 () SeekEntryResult!12302)

(assert (=> b!1487816 (= res!1011785 (= lt!648959 (Intermediate!12302 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99578 (_ BitVec 32)) SeekEntryResult!12302)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487816 (= lt!648959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648964 mask!2687) lt!648964 lt!648963 mask!2687))))

(assert (=> b!1487816 (= lt!648964 (select (store (arr!48062 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487817 () Bool)

(declare-fun res!1011780 () Bool)

(assert (=> b!1487817 (=> (not res!1011780) (not e!833981))))

(assert (=> b!1487817 (= res!1011780 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48612 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48612 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48612 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487818 () Bool)

(assert (=> b!1487818 (= e!833974 (= (seekEntryOrOpen!0 lt!648964 lt!648963 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648964 lt!648963 mask!2687)))))

(declare-fun b!1487819 () Bool)

(declare-fun res!1011779 () Bool)

(assert (=> b!1487819 (=> (not res!1011779) (not e!833981))))

(assert (=> b!1487819 (= res!1011779 (and (= (size!48612 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48612 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48612 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487820 () Bool)

(assert (=> b!1487820 (= e!833975 (= lt!648959 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648964 lt!648963 mask!2687)))))

(declare-fun b!1487821 () Bool)

(declare-fun res!1011777 () Bool)

(assert (=> b!1487821 (=> (not res!1011777) (not e!833976))))

(declare-fun lt!648960 () SeekEntryResult!12302)

(assert (=> b!1487821 (= res!1011777 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48062 a!2862) j!93) a!2862 mask!2687) lt!648960))))

(declare-fun b!1487822 () Bool)

(declare-fun res!1011791 () Bool)

(assert (=> b!1487822 (=> (not res!1011791) (not e!833981))))

(declare-datatypes ((List!34563 0))(
  ( (Nil!34560) (Cons!34559 (h!35939 (_ BitVec 64)) (t!49257 List!34563)) )
))
(declare-fun arrayNoDuplicates!0 (array!99578 (_ BitVec 32) List!34563) Bool)

(assert (=> b!1487822 (= res!1011791 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34560))))

(declare-fun b!1487823 () Bool)

(declare-fun res!1011787 () Bool)

(assert (=> b!1487823 (=> (not res!1011787) (not e!833982))))

(assert (=> b!1487823 (= res!1011787 e!833975)))

(declare-fun c!137541 () Bool)

(assert (=> b!1487823 (= c!137541 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487824 () Bool)

(declare-fun e!833977 () Bool)

(assert (=> b!1487824 (= e!833978 e!833977)))

(declare-fun res!1011788 () Bool)

(assert (=> b!1487824 (=> res!1011788 e!833977)))

(declare-fun lt!648962 () (_ BitVec 32))

(assert (=> b!1487824 (= res!1011788 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648962 #b00000000000000000000000000000000) (bvsge lt!648962 (size!48612 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487824 (= lt!648962 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487825 () Bool)

(assert (=> b!1487825 (= e!833980 e!833976)))

(declare-fun res!1011778 () Bool)

(assert (=> b!1487825 (=> (not res!1011778) (not e!833976))))

(assert (=> b!1487825 (= res!1011778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48062 a!2862) j!93) mask!2687) (select (arr!48062 a!2862) j!93) a!2862 mask!2687) lt!648960))))

(assert (=> b!1487825 (= lt!648960 (Intermediate!12302 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487826 () Bool)

(assert (=> b!1487826 (= e!833977 true)))

(declare-fun lt!648965 () SeekEntryResult!12302)

(assert (=> b!1487826 (= lt!648965 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648962 (select (arr!48062 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!126742 res!1011783) b!1487819))

(assert (= (and b!1487819 res!1011779) b!1487805))

(assert (= (and b!1487805 res!1011775) b!1487807))

(assert (= (and b!1487807 res!1011786) b!1487810))

(assert (= (and b!1487810 res!1011774) b!1487822))

(assert (= (and b!1487822 res!1011791) b!1487817))

(assert (= (and b!1487817 res!1011780) b!1487809))

(assert (= (and b!1487809 res!1011776) b!1487825))

(assert (= (and b!1487825 res!1011778) b!1487821))

(assert (= (and b!1487821 res!1011777) b!1487816))

(assert (= (and b!1487816 res!1011785) b!1487823))

(assert (= (and b!1487823 c!137541) b!1487820))

(assert (= (and b!1487823 (not c!137541)) b!1487812))

(assert (= (and b!1487823 res!1011787) b!1487811))

(assert (= (and b!1487811 res!1011782) b!1487806))

(assert (= (and b!1487806 res!1011792) b!1487808))

(assert (= (and b!1487808 res!1011793) b!1487813))

(assert (= (and b!1487813 res!1011781) b!1487815))

(assert (= (and b!1487815 (not res!1011784)) b!1487814))

(assert (= (and b!1487814 res!1011789) b!1487818))

(assert (= (and b!1487806 (not res!1011790)) b!1487824))

(assert (= (and b!1487824 (not res!1011788)) b!1487826))

(declare-fun m!1372363 () Bool)

(assert (=> b!1487816 m!1372363))

(assert (=> b!1487816 m!1372363))

(declare-fun m!1372365 () Bool)

(assert (=> b!1487816 m!1372365))

(declare-fun m!1372367 () Bool)

(assert (=> b!1487816 m!1372367))

(declare-fun m!1372369 () Bool)

(assert (=> b!1487816 m!1372369))

(declare-fun m!1372371 () Bool)

(assert (=> b!1487810 m!1372371))

(declare-fun m!1372373 () Bool)

(assert (=> start!126742 m!1372373))

(declare-fun m!1372375 () Bool)

(assert (=> start!126742 m!1372375))

(declare-fun m!1372377 () Bool)

(assert (=> b!1487808 m!1372377))

(assert (=> b!1487808 m!1372377))

(declare-fun m!1372379 () Bool)

(assert (=> b!1487808 m!1372379))

(assert (=> b!1487826 m!1372377))

(assert (=> b!1487826 m!1372377))

(declare-fun m!1372381 () Bool)

(assert (=> b!1487826 m!1372381))

(declare-fun m!1372383 () Bool)

(assert (=> b!1487824 m!1372383))

(declare-fun m!1372385 () Bool)

(assert (=> b!1487818 m!1372385))

(declare-fun m!1372387 () Bool)

(assert (=> b!1487818 m!1372387))

(declare-fun m!1372389 () Bool)

(assert (=> b!1487815 m!1372389))

(assert (=> b!1487815 m!1372377))

(assert (=> b!1487815 m!1372367))

(declare-fun m!1372391 () Bool)

(assert (=> b!1487815 m!1372391))

(assert (=> b!1487807 m!1372377))

(assert (=> b!1487807 m!1372377))

(declare-fun m!1372393 () Bool)

(assert (=> b!1487807 m!1372393))

(assert (=> b!1487825 m!1372377))

(assert (=> b!1487825 m!1372377))

(declare-fun m!1372395 () Bool)

(assert (=> b!1487825 m!1372395))

(assert (=> b!1487825 m!1372395))

(assert (=> b!1487825 m!1372377))

(declare-fun m!1372397 () Bool)

(assert (=> b!1487825 m!1372397))

(declare-fun m!1372399 () Bool)

(assert (=> b!1487805 m!1372399))

(assert (=> b!1487805 m!1372399))

(declare-fun m!1372401 () Bool)

(assert (=> b!1487805 m!1372401))

(declare-fun m!1372403 () Bool)

(assert (=> b!1487820 m!1372403))

(declare-fun m!1372405 () Bool)

(assert (=> b!1487813 m!1372405))

(assert (=> b!1487813 m!1372377))

(assert (=> b!1487809 m!1372367))

(declare-fun m!1372407 () Bool)

(assert (=> b!1487809 m!1372407))

(assert (=> b!1487821 m!1372377))

(assert (=> b!1487821 m!1372377))

(declare-fun m!1372409 () Bool)

(assert (=> b!1487821 m!1372409))

(declare-fun m!1372411 () Bool)

(assert (=> b!1487806 m!1372411))

(assert (=> b!1487806 m!1372367))

(assert (=> b!1487806 m!1372391))

(assert (=> b!1487806 m!1372389))

(declare-fun m!1372413 () Bool)

(assert (=> b!1487806 m!1372413))

(assert (=> b!1487806 m!1372377))

(assert (=> b!1487812 m!1372387))

(assert (=> b!1487812 m!1372385))

(declare-fun m!1372415 () Bool)

(assert (=> b!1487822 m!1372415))

(push 1)

