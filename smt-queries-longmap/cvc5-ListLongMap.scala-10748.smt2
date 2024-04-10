; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125686 () Bool)

(assert start!125686)

(declare-fun b!1470828 () Bool)

(declare-fun res!998921 () Bool)

(declare-fun e!825611 () Bool)

(assert (=> b!1470828 (=> (not res!998921) (not e!825611))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99077 0))(
  ( (array!99078 (arr!47825 (Array (_ BitVec 32) (_ BitVec 64))) (size!48375 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99077)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12065 0))(
  ( (MissingZero!12065 (index!50652 (_ BitVec 32))) (Found!12065 (index!50653 (_ BitVec 32))) (Intermediate!12065 (undefined!12877 Bool) (index!50654 (_ BitVec 32)) (x!132235 (_ BitVec 32))) (Undefined!12065) (MissingVacant!12065 (index!50655 (_ BitVec 32))) )
))
(declare-fun lt!643047 () SeekEntryResult!12065)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99077 (_ BitVec 32)) SeekEntryResult!12065)

(assert (=> b!1470828 (= res!998921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47825 a!2862) j!93) a!2862 mask!2687) lt!643047))))

(declare-fun b!1470830 () Bool)

(declare-fun e!825613 () Bool)

(assert (=> b!1470830 (= e!825613 e!825611)))

(declare-fun res!998922 () Bool)

(assert (=> b!1470830 (=> (not res!998922) (not e!825611))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470830 (= res!998922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47825 a!2862) j!93) mask!2687) (select (arr!47825 a!2862) j!93) a!2862 mask!2687) lt!643047))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470830 (= lt!643047 (Intermediate!12065 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470831 () Bool)

(declare-fun lt!643046 () (_ BitVec 64))

(declare-fun lt!643049 () array!99077)

(declare-fun e!825617 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99077 (_ BitVec 32)) SeekEntryResult!12065)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99077 (_ BitVec 32)) SeekEntryResult!12065)

(assert (=> b!1470831 (= e!825617 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643046 lt!643049 mask!2687) (seekEntryOrOpen!0 lt!643046 lt!643049 mask!2687)))))

(declare-fun lt!643048 () SeekEntryResult!12065)

(declare-fun b!1470832 () Bool)

(assert (=> b!1470832 (= e!825617 (= lt!643048 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643046 lt!643049 mask!2687)))))

(declare-fun e!825616 () Bool)

(declare-fun b!1470833 () Bool)

(assert (=> b!1470833 (= e!825616 (= (seekEntryOrOpen!0 (select (arr!47825 a!2862) j!93) a!2862 mask!2687) (Found!12065 j!93)))))

(declare-fun b!1470834 () Bool)

(declare-fun res!998914 () Bool)

(declare-fun e!825612 () Bool)

(assert (=> b!1470834 (=> (not res!998914) (not e!825612))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470834 (= res!998914 (validKeyInArray!0 (select (arr!47825 a!2862) i!1006)))))

(declare-fun b!1470835 () Bool)

(declare-fun res!998913 () Bool)

(assert (=> b!1470835 (=> (not res!998913) (not e!825612))))

(declare-datatypes ((List!34326 0))(
  ( (Nil!34323) (Cons!34322 (h!35675 (_ BitVec 64)) (t!49020 List!34326)) )
))
(declare-fun arrayNoDuplicates!0 (array!99077 (_ BitVec 32) List!34326) Bool)

(assert (=> b!1470835 (= res!998913 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34323))))

(declare-fun b!1470836 () Bool)

(declare-fun res!998915 () Bool)

(assert (=> b!1470836 (=> (not res!998915) (not e!825612))))

(assert (=> b!1470836 (= res!998915 (and (= (size!48375 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48375 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48375 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470837 () Bool)

(declare-fun res!998917 () Bool)

(declare-fun e!825615 () Bool)

(assert (=> b!1470837 (=> (not res!998917) (not e!825615))))

(assert (=> b!1470837 (= res!998917 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470838 () Bool)

(assert (=> b!1470838 (= e!825612 e!825613)))

(declare-fun res!998919 () Bool)

(assert (=> b!1470838 (=> (not res!998919) (not e!825613))))

(assert (=> b!1470838 (= res!998919 (= (select (store (arr!47825 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470838 (= lt!643049 (array!99078 (store (arr!47825 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48375 a!2862)))))

(declare-fun b!1470839 () Bool)

(assert (=> b!1470839 (= e!825615 (not true))))

(assert (=> b!1470839 e!825616))

(declare-fun res!998918 () Bool)

(assert (=> b!1470839 (=> (not res!998918) (not e!825616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99077 (_ BitVec 32)) Bool)

(assert (=> b!1470839 (= res!998918 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49470 0))(
  ( (Unit!49471) )
))
(declare-fun lt!643050 () Unit!49470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49470)

(assert (=> b!1470839 (= lt!643050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470840 () Bool)

(declare-fun res!998910 () Bool)

(assert (=> b!1470840 (=> (not res!998910) (not e!825612))))

(assert (=> b!1470840 (= res!998910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470829 () Bool)

(declare-fun res!998916 () Bool)

(assert (=> b!1470829 (=> (not res!998916) (not e!825615))))

(assert (=> b!1470829 (= res!998916 e!825617)))

(declare-fun c!135471 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470829 (= c!135471 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!998920 () Bool)

(assert (=> start!125686 (=> (not res!998920) (not e!825612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125686 (= res!998920 (validMask!0 mask!2687))))

(assert (=> start!125686 e!825612))

(assert (=> start!125686 true))

(declare-fun array_inv!36853 (array!99077) Bool)

(assert (=> start!125686 (array_inv!36853 a!2862)))

(declare-fun b!1470841 () Bool)

(declare-fun res!998911 () Bool)

(assert (=> b!1470841 (=> (not res!998911) (not e!825612))))

(assert (=> b!1470841 (= res!998911 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48375 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48375 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48375 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470842 () Bool)

(assert (=> b!1470842 (= e!825611 e!825615)))

(declare-fun res!998923 () Bool)

(assert (=> b!1470842 (=> (not res!998923) (not e!825615))))

(assert (=> b!1470842 (= res!998923 (= lt!643048 (Intermediate!12065 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470842 (= lt!643048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643046 mask!2687) lt!643046 lt!643049 mask!2687))))

(assert (=> b!1470842 (= lt!643046 (select (store (arr!47825 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470843 () Bool)

(declare-fun res!998912 () Bool)

(assert (=> b!1470843 (=> (not res!998912) (not e!825612))))

(assert (=> b!1470843 (= res!998912 (validKeyInArray!0 (select (arr!47825 a!2862) j!93)))))

(assert (= (and start!125686 res!998920) b!1470836))

(assert (= (and b!1470836 res!998915) b!1470834))

(assert (= (and b!1470834 res!998914) b!1470843))

(assert (= (and b!1470843 res!998912) b!1470840))

(assert (= (and b!1470840 res!998910) b!1470835))

(assert (= (and b!1470835 res!998913) b!1470841))

(assert (= (and b!1470841 res!998911) b!1470838))

(assert (= (and b!1470838 res!998919) b!1470830))

(assert (= (and b!1470830 res!998922) b!1470828))

(assert (= (and b!1470828 res!998921) b!1470842))

(assert (= (and b!1470842 res!998923) b!1470829))

(assert (= (and b!1470829 c!135471) b!1470832))

(assert (= (and b!1470829 (not c!135471)) b!1470831))

(assert (= (and b!1470829 res!998916) b!1470837))

(assert (= (and b!1470837 res!998917) b!1470839))

(assert (= (and b!1470839 res!998918) b!1470833))

(declare-fun m!1357795 () Bool)

(assert (=> b!1470838 m!1357795))

(declare-fun m!1357797 () Bool)

(assert (=> b!1470838 m!1357797))

(declare-fun m!1357799 () Bool)

(assert (=> start!125686 m!1357799))

(declare-fun m!1357801 () Bool)

(assert (=> start!125686 m!1357801))

(declare-fun m!1357803 () Bool)

(assert (=> b!1470840 m!1357803))

(declare-fun m!1357805 () Bool)

(assert (=> b!1470828 m!1357805))

(assert (=> b!1470828 m!1357805))

(declare-fun m!1357807 () Bool)

(assert (=> b!1470828 m!1357807))

(declare-fun m!1357809 () Bool)

(assert (=> b!1470842 m!1357809))

(assert (=> b!1470842 m!1357809))

(declare-fun m!1357811 () Bool)

(assert (=> b!1470842 m!1357811))

(assert (=> b!1470842 m!1357795))

(declare-fun m!1357813 () Bool)

(assert (=> b!1470842 m!1357813))

(declare-fun m!1357815 () Bool)

(assert (=> b!1470831 m!1357815))

(declare-fun m!1357817 () Bool)

(assert (=> b!1470831 m!1357817))

(declare-fun m!1357819 () Bool)

(assert (=> b!1470834 m!1357819))

(assert (=> b!1470834 m!1357819))

(declare-fun m!1357821 () Bool)

(assert (=> b!1470834 m!1357821))

(declare-fun m!1357823 () Bool)

(assert (=> b!1470832 m!1357823))

(assert (=> b!1470843 m!1357805))

(assert (=> b!1470843 m!1357805))

(declare-fun m!1357825 () Bool)

(assert (=> b!1470843 m!1357825))

(assert (=> b!1470833 m!1357805))

(assert (=> b!1470833 m!1357805))

(declare-fun m!1357827 () Bool)

(assert (=> b!1470833 m!1357827))

(assert (=> b!1470830 m!1357805))

(assert (=> b!1470830 m!1357805))

(declare-fun m!1357829 () Bool)

(assert (=> b!1470830 m!1357829))

(assert (=> b!1470830 m!1357829))

(assert (=> b!1470830 m!1357805))

(declare-fun m!1357831 () Bool)

(assert (=> b!1470830 m!1357831))

(declare-fun m!1357833 () Bool)

(assert (=> b!1470835 m!1357833))

(declare-fun m!1357835 () Bool)

(assert (=> b!1470839 m!1357835))

(declare-fun m!1357837 () Bool)

(assert (=> b!1470839 m!1357837))

(push 1)

