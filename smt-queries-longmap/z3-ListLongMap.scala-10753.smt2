; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125778 () Bool)

(assert start!125778)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1472009 () Bool)

(declare-datatypes ((array!99112 0))(
  ( (array!99113 (arr!47841 (Array (_ BitVec 32) (_ BitVec 64))) (size!48391 (_ BitVec 32))) )
))
(declare-fun lt!643445 () array!99112)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643448 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12081 0))(
  ( (MissingZero!12081 (index!50716 (_ BitVec 32))) (Found!12081 (index!50717 (_ BitVec 32))) (Intermediate!12081 (undefined!12893 Bool) (index!50718 (_ BitVec 32)) (x!132300 (_ BitVec 32))) (Undefined!12081) (MissingVacant!12081 (index!50719 (_ BitVec 32))) )
))
(declare-fun lt!643446 () SeekEntryResult!12081)

(declare-fun e!826174 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99112 (_ BitVec 32)) SeekEntryResult!12081)

(assert (=> b!1472009 (= e!826174 (= lt!643446 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643448 lt!643445 mask!2687)))))

(declare-fun b!1472010 () Bool)

(declare-fun e!826177 () Bool)

(declare-fun e!826173 () Bool)

(assert (=> b!1472010 (= e!826177 e!826173)))

(declare-fun res!999722 () Bool)

(assert (=> b!1472010 (=> (not res!999722) (not e!826173))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99112)

(assert (=> b!1472010 (= res!999722 (= (select (store (arr!47841 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472010 (= lt!643445 (array!99113 (store (arr!47841 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48391 a!2862)))))

(declare-fun b!1472011 () Bool)

(declare-fun e!826175 () Bool)

(declare-fun e!826172 () Bool)

(assert (=> b!1472011 (= e!826175 e!826172)))

(declare-fun res!999736 () Bool)

(assert (=> b!1472011 (=> (not res!999736) (not e!826172))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472011 (= res!999736 (= lt!643446 (Intermediate!12081 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472011 (= lt!643446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643448 mask!2687) lt!643448 lt!643445 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472011 (= lt!643448 (select (store (arr!47841 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472012 () Bool)

(declare-fun res!999725 () Bool)

(assert (=> b!1472012 (=> (not res!999725) (not e!826177))))

(assert (=> b!1472012 (= res!999725 (and (= (size!48391 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48391 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48391 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472013 () Bool)

(declare-fun res!999723 () Bool)

(assert (=> b!1472013 (=> (not res!999723) (not e!826172))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472013 (= res!999723 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472014 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99112 (_ BitVec 32)) SeekEntryResult!12081)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99112 (_ BitVec 32)) SeekEntryResult!12081)

(assert (=> b!1472014 (= e!826174 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643448 lt!643445 mask!2687) (seekEntryOrOpen!0 lt!643448 lt!643445 mask!2687)))))

(declare-fun b!1472015 () Bool)

(declare-fun res!999731 () Bool)

(assert (=> b!1472015 (=> (not res!999731) (not e!826177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472015 (= res!999731 (validKeyInArray!0 (select (arr!47841 a!2862) i!1006)))))

(declare-fun b!1472016 () Bool)

(assert (=> b!1472016 (= e!826172 (not true))))

(declare-fun e!826176 () Bool)

(assert (=> b!1472016 e!826176))

(declare-fun res!999729 () Bool)

(assert (=> b!1472016 (=> (not res!999729) (not e!826176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99112 (_ BitVec 32)) Bool)

(assert (=> b!1472016 (= res!999729 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49502 0))(
  ( (Unit!49503) )
))
(declare-fun lt!643447 () Unit!49502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49502)

(assert (=> b!1472016 (= lt!643447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472017 () Bool)

(declare-fun res!999734 () Bool)

(assert (=> b!1472017 (=> (not res!999734) (not e!826177))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472017 (= res!999734 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48391 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48391 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48391 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472019 () Bool)

(declare-fun res!999724 () Bool)

(assert (=> b!1472019 (=> (not res!999724) (not e!826177))))

(assert (=> b!1472019 (= res!999724 (validKeyInArray!0 (select (arr!47841 a!2862) j!93)))))

(declare-fun b!1472020 () Bool)

(assert (=> b!1472020 (= e!826173 e!826175)))

(declare-fun res!999730 () Bool)

(assert (=> b!1472020 (=> (not res!999730) (not e!826175))))

(declare-fun lt!643449 () SeekEntryResult!12081)

(assert (=> b!1472020 (= res!999730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47841 a!2862) j!93) mask!2687) (select (arr!47841 a!2862) j!93) a!2862 mask!2687) lt!643449))))

(assert (=> b!1472020 (= lt!643449 (Intermediate!12081 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472021 () Bool)

(declare-fun res!999728 () Bool)

(assert (=> b!1472021 (=> (not res!999728) (not e!826172))))

(assert (=> b!1472021 (= res!999728 e!826174)))

(declare-fun c!135657 () Bool)

(assert (=> b!1472021 (= c!135657 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472022 () Bool)

(declare-fun res!999732 () Bool)

(assert (=> b!1472022 (=> (not res!999732) (not e!826177))))

(declare-datatypes ((List!34342 0))(
  ( (Nil!34339) (Cons!34338 (h!35694 (_ BitVec 64)) (t!49036 List!34342)) )
))
(declare-fun arrayNoDuplicates!0 (array!99112 (_ BitVec 32) List!34342) Bool)

(assert (=> b!1472022 (= res!999732 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34339))))

(declare-fun b!1472023 () Bool)

(declare-fun res!999726 () Bool)

(assert (=> b!1472023 (=> (not res!999726) (not e!826177))))

(assert (=> b!1472023 (= res!999726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472018 () Bool)

(declare-fun res!999727 () Bool)

(assert (=> b!1472018 (=> (not res!999727) (not e!826175))))

(assert (=> b!1472018 (= res!999727 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47841 a!2862) j!93) a!2862 mask!2687) lt!643449))))

(declare-fun res!999733 () Bool)

(assert (=> start!125778 (=> (not res!999733) (not e!826177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125778 (= res!999733 (validMask!0 mask!2687))))

(assert (=> start!125778 e!826177))

(assert (=> start!125778 true))

(declare-fun array_inv!36869 (array!99112) Bool)

(assert (=> start!125778 (array_inv!36869 a!2862)))

(declare-fun b!1472024 () Bool)

(declare-fun res!999735 () Bool)

(assert (=> b!1472024 (=> (not res!999735) (not e!826176))))

(assert (=> b!1472024 (= res!999735 (= (seekEntryOrOpen!0 (select (arr!47841 a!2862) j!93) a!2862 mask!2687) (Found!12081 j!93)))))

(declare-fun b!1472025 () Bool)

(assert (=> b!1472025 (= e!826176 (or (= (select (arr!47841 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47841 a!2862) intermediateBeforeIndex!19) (select (arr!47841 a!2862) j!93))))))

(assert (= (and start!125778 res!999733) b!1472012))

(assert (= (and b!1472012 res!999725) b!1472015))

(assert (= (and b!1472015 res!999731) b!1472019))

(assert (= (and b!1472019 res!999724) b!1472023))

(assert (= (and b!1472023 res!999726) b!1472022))

(assert (= (and b!1472022 res!999732) b!1472017))

(assert (= (and b!1472017 res!999734) b!1472010))

(assert (= (and b!1472010 res!999722) b!1472020))

(assert (= (and b!1472020 res!999730) b!1472018))

(assert (= (and b!1472018 res!999727) b!1472011))

(assert (= (and b!1472011 res!999736) b!1472021))

(assert (= (and b!1472021 c!135657) b!1472009))

(assert (= (and b!1472021 (not c!135657)) b!1472014))

(assert (= (and b!1472021 res!999728) b!1472013))

(assert (= (and b!1472013 res!999723) b!1472016))

(assert (= (and b!1472016 res!999729) b!1472024))

(assert (= (and b!1472024 res!999735) b!1472025))

(declare-fun m!1358765 () Bool)

(assert (=> b!1472022 m!1358765))

(declare-fun m!1358767 () Bool)

(assert (=> b!1472010 m!1358767))

(declare-fun m!1358769 () Bool)

(assert (=> b!1472010 m!1358769))

(declare-fun m!1358771 () Bool)

(assert (=> b!1472015 m!1358771))

(assert (=> b!1472015 m!1358771))

(declare-fun m!1358773 () Bool)

(assert (=> b!1472015 m!1358773))

(declare-fun m!1358775 () Bool)

(assert (=> b!1472020 m!1358775))

(assert (=> b!1472020 m!1358775))

(declare-fun m!1358777 () Bool)

(assert (=> b!1472020 m!1358777))

(assert (=> b!1472020 m!1358777))

(assert (=> b!1472020 m!1358775))

(declare-fun m!1358779 () Bool)

(assert (=> b!1472020 m!1358779))

(assert (=> b!1472019 m!1358775))

(assert (=> b!1472019 m!1358775))

(declare-fun m!1358781 () Bool)

(assert (=> b!1472019 m!1358781))

(declare-fun m!1358783 () Bool)

(assert (=> b!1472009 m!1358783))

(declare-fun m!1358785 () Bool)

(assert (=> b!1472016 m!1358785))

(declare-fun m!1358787 () Bool)

(assert (=> b!1472016 m!1358787))

(assert (=> b!1472024 m!1358775))

(assert (=> b!1472024 m!1358775))

(declare-fun m!1358789 () Bool)

(assert (=> b!1472024 m!1358789))

(declare-fun m!1358791 () Bool)

(assert (=> start!125778 m!1358791))

(declare-fun m!1358793 () Bool)

(assert (=> start!125778 m!1358793))

(declare-fun m!1358795 () Bool)

(assert (=> b!1472025 m!1358795))

(assert (=> b!1472025 m!1358775))

(assert (=> b!1472018 m!1358775))

(assert (=> b!1472018 m!1358775))

(declare-fun m!1358797 () Bool)

(assert (=> b!1472018 m!1358797))

(declare-fun m!1358799 () Bool)

(assert (=> b!1472023 m!1358799))

(declare-fun m!1358801 () Bool)

(assert (=> b!1472014 m!1358801))

(declare-fun m!1358803 () Bool)

(assert (=> b!1472014 m!1358803))

(declare-fun m!1358805 () Bool)

(assert (=> b!1472011 m!1358805))

(assert (=> b!1472011 m!1358805))

(declare-fun m!1358807 () Bool)

(assert (=> b!1472011 m!1358807))

(assert (=> b!1472011 m!1358767))

(declare-fun m!1358809 () Bool)

(assert (=> b!1472011 m!1358809))

(check-sat (not start!125778) (not b!1472018) (not b!1472020) (not b!1472009) (not b!1472022) (not b!1472023) (not b!1472016) (not b!1472024) (not b!1472014) (not b!1472011) (not b!1472015) (not b!1472019))
(check-sat)
