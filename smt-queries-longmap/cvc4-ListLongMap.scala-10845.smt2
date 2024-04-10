; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126920 () Bool)

(assert start!126920)

(declare-fun b!1491652 () Bool)

(declare-fun e!835722 () Bool)

(declare-fun e!835725 () Bool)

(assert (=> b!1491652 (= e!835722 (not e!835725))))

(declare-fun res!1014802 () Bool)

(assert (=> b!1491652 (=> res!1014802 e!835725)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99693 0))(
  ( (array!99694 (arr!48118 (Array (_ BitVec 32) (_ BitVec 64))) (size!48668 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99693)

(assert (=> b!1491652 (= res!1014802 (or (and (= (select (arr!48118 a!2862) index!646) (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48118 a!2862) index!646) (select (arr!48118 a!2862) j!93))) (= (select (arr!48118 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835727 () Bool)

(assert (=> b!1491652 e!835727))

(declare-fun res!1014810 () Bool)

(assert (=> b!1491652 (=> (not res!1014810) (not e!835727))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99693 (_ BitVec 32)) Bool)

(assert (=> b!1491652 (= res!1014810 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50056 0))(
  ( (Unit!50057) )
))
(declare-fun lt!650349 () Unit!50056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50056)

(assert (=> b!1491652 (= lt!650349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491653 () Bool)

(declare-fun res!1014798 () Bool)

(assert (=> b!1491653 (=> (not res!1014798) (not e!835722))))

(declare-fun e!835724 () Bool)

(assert (=> b!1491653 (= res!1014798 e!835724)))

(declare-fun c!137955 () Bool)

(assert (=> b!1491653 (= c!137955 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491654 () Bool)

(declare-fun res!1014809 () Bool)

(declare-fun e!835720 () Bool)

(assert (=> b!1491654 (=> (not res!1014809) (not e!835720))))

(declare-datatypes ((SeekEntryResult!12358 0))(
  ( (MissingZero!12358 (index!51824 (_ BitVec 32))) (Found!12358 (index!51825 (_ BitVec 32))) (Intermediate!12358 (undefined!13170 Bool) (index!51826 (_ BitVec 32)) (x!133406 (_ BitVec 32))) (Undefined!12358) (MissingVacant!12358 (index!51827 (_ BitVec 32))) )
))
(declare-fun lt!650352 () SeekEntryResult!12358)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99693 (_ BitVec 32)) SeekEntryResult!12358)

(assert (=> b!1491654 (= res!1014809 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!650352))))

(declare-fun lt!650348 () (_ BitVec 64))

(declare-fun b!1491655 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!650350 () array!99693)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99693 (_ BitVec 32)) SeekEntryResult!12358)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99693 (_ BitVec 32)) SeekEntryResult!12358)

(assert (=> b!1491655 (= e!835724 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650348 lt!650350 mask!2687) (seekEntryOrOpen!0 lt!650348 lt!650350 mask!2687)))))

(declare-fun b!1491656 () Bool)

(declare-fun e!835721 () Bool)

(assert (=> b!1491656 (= e!835721 e!835720)))

(declare-fun res!1014806 () Bool)

(assert (=> b!1491656 (=> (not res!1014806) (not e!835720))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491656 (= res!1014806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!650352))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491656 (= lt!650352 (Intermediate!12358 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491657 () Bool)

(declare-fun res!1014811 () Bool)

(declare-fun e!835726 () Bool)

(assert (=> b!1491657 (=> (not res!1014811) (not e!835726))))

(declare-datatypes ((List!34619 0))(
  ( (Nil!34616) (Cons!34615 (h!35998 (_ BitVec 64)) (t!49313 List!34619)) )
))
(declare-fun arrayNoDuplicates!0 (array!99693 (_ BitVec 32) List!34619) Bool)

(assert (=> b!1491657 (= res!1014811 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34616))))

(declare-fun b!1491658 () Bool)

(assert (=> b!1491658 (= e!835727 (or (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) (select (arr!48118 a!2862) j!93))))))

(declare-fun b!1491659 () Bool)

(declare-fun res!1014801 () Bool)

(assert (=> b!1491659 (=> (not res!1014801) (not e!835726))))

(assert (=> b!1491659 (= res!1014801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48668 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48668 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48668 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491660 () Bool)

(declare-fun res!1014800 () Bool)

(assert (=> b!1491660 (=> (not res!1014800) (not e!835726))))

(assert (=> b!1491660 (= res!1014800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491661 () Bool)

(declare-fun res!1014805 () Bool)

(assert (=> b!1491661 (=> (not res!1014805) (not e!835727))))

(assert (=> b!1491661 (= res!1014805 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) (Found!12358 j!93)))))

(declare-fun b!1491662 () Bool)

(declare-fun res!1014807 () Bool)

(assert (=> b!1491662 (=> (not res!1014807) (not e!835726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491662 (= res!1014807 (validKeyInArray!0 (select (arr!48118 a!2862) j!93)))))

(declare-fun b!1491663 () Bool)

(assert (=> b!1491663 (= e!835725 true)))

(declare-fun lt!650347 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491663 (= lt!650347 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1014808 () Bool)

(assert (=> start!126920 (=> (not res!1014808) (not e!835726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126920 (= res!1014808 (validMask!0 mask!2687))))

(assert (=> start!126920 e!835726))

(assert (=> start!126920 true))

(declare-fun array_inv!37146 (array!99693) Bool)

(assert (=> start!126920 (array_inv!37146 a!2862)))

(declare-fun b!1491664 () Bool)

(declare-fun res!1014804 () Bool)

(assert (=> b!1491664 (=> (not res!1014804) (not e!835726))))

(assert (=> b!1491664 (= res!1014804 (validKeyInArray!0 (select (arr!48118 a!2862) i!1006)))))

(declare-fun b!1491665 () Bool)

(declare-fun lt!650351 () SeekEntryResult!12358)

(assert (=> b!1491665 (= e!835724 (= lt!650351 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650348 lt!650350 mask!2687)))))

(declare-fun b!1491666 () Bool)

(assert (=> b!1491666 (= e!835726 e!835721)))

(declare-fun res!1014799 () Bool)

(assert (=> b!1491666 (=> (not res!1014799) (not e!835721))))

(assert (=> b!1491666 (= res!1014799 (= (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491666 (= lt!650350 (array!99694 (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48668 a!2862)))))

(declare-fun b!1491667 () Bool)

(declare-fun res!1014803 () Bool)

(assert (=> b!1491667 (=> (not res!1014803) (not e!835726))))

(assert (=> b!1491667 (= res!1014803 (and (= (size!48668 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48668 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48668 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491668 () Bool)

(assert (=> b!1491668 (= e!835720 e!835722)))

(declare-fun res!1014796 () Bool)

(assert (=> b!1491668 (=> (not res!1014796) (not e!835722))))

(assert (=> b!1491668 (= res!1014796 (= lt!650351 (Intermediate!12358 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491668 (= lt!650351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650348 mask!2687) lt!650348 lt!650350 mask!2687))))

(assert (=> b!1491668 (= lt!650348 (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491669 () Bool)

(declare-fun res!1014797 () Bool)

(assert (=> b!1491669 (=> (not res!1014797) (not e!835722))))

(assert (=> b!1491669 (= res!1014797 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126920 res!1014808) b!1491667))

(assert (= (and b!1491667 res!1014803) b!1491664))

(assert (= (and b!1491664 res!1014804) b!1491662))

(assert (= (and b!1491662 res!1014807) b!1491660))

(assert (= (and b!1491660 res!1014800) b!1491657))

(assert (= (and b!1491657 res!1014811) b!1491659))

(assert (= (and b!1491659 res!1014801) b!1491666))

(assert (= (and b!1491666 res!1014799) b!1491656))

(assert (= (and b!1491656 res!1014806) b!1491654))

(assert (= (and b!1491654 res!1014809) b!1491668))

(assert (= (and b!1491668 res!1014796) b!1491653))

(assert (= (and b!1491653 c!137955) b!1491665))

(assert (= (and b!1491653 (not c!137955)) b!1491655))

(assert (= (and b!1491653 res!1014798) b!1491669))

(assert (= (and b!1491669 res!1014797) b!1491652))

(assert (= (and b!1491652 res!1014810) b!1491661))

(assert (= (and b!1491661 res!1014805) b!1491658))

(assert (= (and b!1491652 (not res!1014802)) b!1491663))

(declare-fun m!1375767 () Bool)

(assert (=> b!1491652 m!1375767))

(declare-fun m!1375769 () Bool)

(assert (=> b!1491652 m!1375769))

(declare-fun m!1375771 () Bool)

(assert (=> b!1491652 m!1375771))

(declare-fun m!1375773 () Bool)

(assert (=> b!1491652 m!1375773))

(declare-fun m!1375775 () Bool)

(assert (=> b!1491652 m!1375775))

(declare-fun m!1375777 () Bool)

(assert (=> b!1491652 m!1375777))

(assert (=> b!1491666 m!1375769))

(declare-fun m!1375779 () Bool)

(assert (=> b!1491666 m!1375779))

(declare-fun m!1375781 () Bool)

(assert (=> b!1491660 m!1375781))

(assert (=> b!1491661 m!1375777))

(assert (=> b!1491661 m!1375777))

(declare-fun m!1375783 () Bool)

(assert (=> b!1491661 m!1375783))

(declare-fun m!1375785 () Bool)

(assert (=> b!1491663 m!1375785))

(declare-fun m!1375787 () Bool)

(assert (=> b!1491655 m!1375787))

(declare-fun m!1375789 () Bool)

(assert (=> b!1491655 m!1375789))

(declare-fun m!1375791 () Bool)

(assert (=> start!126920 m!1375791))

(declare-fun m!1375793 () Bool)

(assert (=> start!126920 m!1375793))

(declare-fun m!1375795 () Bool)

(assert (=> b!1491657 m!1375795))

(declare-fun m!1375797 () Bool)

(assert (=> b!1491658 m!1375797))

(assert (=> b!1491658 m!1375777))

(assert (=> b!1491656 m!1375777))

(assert (=> b!1491656 m!1375777))

(declare-fun m!1375799 () Bool)

(assert (=> b!1491656 m!1375799))

(assert (=> b!1491656 m!1375799))

(assert (=> b!1491656 m!1375777))

(declare-fun m!1375801 () Bool)

(assert (=> b!1491656 m!1375801))

(assert (=> b!1491662 m!1375777))

(assert (=> b!1491662 m!1375777))

(declare-fun m!1375803 () Bool)

(assert (=> b!1491662 m!1375803))

(declare-fun m!1375805 () Bool)

(assert (=> b!1491668 m!1375805))

(assert (=> b!1491668 m!1375805))

(declare-fun m!1375807 () Bool)

(assert (=> b!1491668 m!1375807))

(assert (=> b!1491668 m!1375769))

(declare-fun m!1375809 () Bool)

(assert (=> b!1491668 m!1375809))

(declare-fun m!1375811 () Bool)

(assert (=> b!1491665 m!1375811))

(declare-fun m!1375813 () Bool)

(assert (=> b!1491664 m!1375813))

(assert (=> b!1491664 m!1375813))

(declare-fun m!1375815 () Bool)

(assert (=> b!1491664 m!1375815))

(assert (=> b!1491654 m!1375777))

(assert (=> b!1491654 m!1375777))

(declare-fun m!1375817 () Bool)

(assert (=> b!1491654 m!1375817))

(push 1)

