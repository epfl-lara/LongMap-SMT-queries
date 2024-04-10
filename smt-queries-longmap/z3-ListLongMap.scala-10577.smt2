; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124602 () Bool)

(assert start!124602)

(declare-fun b!1442744 () Bool)

(declare-fun e!813107 () Bool)

(assert (=> b!1442744 (= e!813107 (not true))))

(declare-fun e!813110 () Bool)

(assert (=> b!1442744 e!813110))

(declare-fun res!974934 () Bool)

(assert (=> b!1442744 (=> (not res!974934) (not e!813110))))

(declare-datatypes ((array!98050 0))(
  ( (array!98051 (arr!47313 (Array (_ BitVec 32) (_ BitVec 64))) (size!47863 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98050)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98050 (_ BitVec 32)) Bool)

(assert (=> b!1442744 (= res!974934 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48626 0))(
  ( (Unit!48627) )
))
(declare-fun lt!633654 () Unit!48626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48626)

(assert (=> b!1442744 (= lt!633654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442745 () Bool)

(declare-fun res!974937 () Bool)

(declare-fun e!813104 () Bool)

(assert (=> b!1442745 (=> (not res!974937) (not e!813104))))

(assert (=> b!1442745 (= res!974937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442746 () Bool)

(declare-fun res!974938 () Bool)

(assert (=> b!1442746 (=> (not res!974938) (not e!813110))))

(declare-datatypes ((SeekEntryResult!11565 0))(
  ( (MissingZero!11565 (index!48652 (_ BitVec 32))) (Found!11565 (index!48653 (_ BitVec 32))) (Intermediate!11565 (undefined!12377 Bool) (index!48654 (_ BitVec 32)) (x!130358 (_ BitVec 32))) (Undefined!11565) (MissingVacant!11565 (index!48655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11565)

(assert (=> b!1442746 (= res!974938 (= (seekEntryOrOpen!0 (select (arr!47313 a!2862) j!93) a!2862 mask!2687) (Found!11565 j!93)))))

(declare-fun b!1442747 () Bool)

(declare-fun e!813108 () Bool)

(assert (=> b!1442747 (= e!813108 e!813107)))

(declare-fun res!974932 () Bool)

(assert (=> b!1442747 (=> (not res!974932) (not e!813107))))

(declare-fun lt!633653 () SeekEntryResult!11565)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442747 (= res!974932 (= lt!633653 (Intermediate!11565 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633651 () array!98050)

(declare-fun lt!633650 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442747 (= lt!633653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633650 mask!2687) lt!633650 lt!633651 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442747 (= lt!633650 (select (store (arr!47313 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442748 () Bool)

(declare-fun res!974939 () Bool)

(assert (=> b!1442748 (=> (not res!974939) (not e!813104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442748 (= res!974939 (validKeyInArray!0 (select (arr!47313 a!2862) j!93)))))

(declare-fun e!813106 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1442749 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11565)

(assert (=> b!1442749 (= e!813106 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633650 lt!633651 mask!2687) (seekEntryOrOpen!0 lt!633650 lt!633651 mask!2687)))))

(declare-fun b!1442750 () Bool)

(declare-fun res!974930 () Bool)

(assert (=> b!1442750 (=> (not res!974930) (not e!813104))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442750 (= res!974930 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47863 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47863 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47863 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442751 () Bool)

(declare-fun res!974933 () Bool)

(assert (=> b!1442751 (=> (not res!974933) (not e!813108))))

(declare-fun lt!633652 () SeekEntryResult!11565)

(assert (=> b!1442751 (= res!974933 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47313 a!2862) j!93) a!2862 mask!2687) lt!633652))))

(declare-fun b!1442753 () Bool)

(declare-fun res!974931 () Bool)

(assert (=> b!1442753 (=> (not res!974931) (not e!813107))))

(assert (=> b!1442753 (= res!974931 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442754 () Bool)

(declare-fun res!974940 () Bool)

(assert (=> b!1442754 (=> (not res!974940) (not e!813104))))

(assert (=> b!1442754 (= res!974940 (validKeyInArray!0 (select (arr!47313 a!2862) i!1006)))))

(declare-fun b!1442755 () Bool)

(assert (=> b!1442755 (= e!813110 (or (= (select (arr!47313 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47313 a!2862) intermediateBeforeIndex!19) (select (arr!47313 a!2862) j!93))))))

(declare-fun b!1442756 () Bool)

(declare-fun res!974935 () Bool)

(assert (=> b!1442756 (=> (not res!974935) (not e!813104))))

(assert (=> b!1442756 (= res!974935 (and (= (size!47863 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47863 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47863 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442757 () Bool)

(declare-fun e!813105 () Bool)

(assert (=> b!1442757 (= e!813105 e!813108)))

(declare-fun res!974929 () Bool)

(assert (=> b!1442757 (=> (not res!974929) (not e!813108))))

(assert (=> b!1442757 (= res!974929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47313 a!2862) j!93) mask!2687) (select (arr!47313 a!2862) j!93) a!2862 mask!2687) lt!633652))))

(assert (=> b!1442757 (= lt!633652 (Intermediate!11565 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442758 () Bool)

(assert (=> b!1442758 (= e!813106 (= lt!633653 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633650 lt!633651 mask!2687)))))

(declare-fun b!1442752 () Bool)

(declare-fun res!974928 () Bool)

(assert (=> b!1442752 (=> (not res!974928) (not e!813107))))

(assert (=> b!1442752 (= res!974928 e!813106)))

(declare-fun c!133419 () Bool)

(assert (=> b!1442752 (= c!133419 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!974941 () Bool)

(assert (=> start!124602 (=> (not res!974941) (not e!813104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124602 (= res!974941 (validMask!0 mask!2687))))

(assert (=> start!124602 e!813104))

(assert (=> start!124602 true))

(declare-fun array_inv!36341 (array!98050) Bool)

(assert (=> start!124602 (array_inv!36341 a!2862)))

(declare-fun b!1442759 () Bool)

(declare-fun res!974927 () Bool)

(assert (=> b!1442759 (=> (not res!974927) (not e!813104))))

(declare-datatypes ((List!33814 0))(
  ( (Nil!33811) (Cons!33810 (h!35160 (_ BitVec 64)) (t!48508 List!33814)) )
))
(declare-fun arrayNoDuplicates!0 (array!98050 (_ BitVec 32) List!33814) Bool)

(assert (=> b!1442759 (= res!974927 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33811))))

(declare-fun b!1442760 () Bool)

(assert (=> b!1442760 (= e!813104 e!813105)))

(declare-fun res!974936 () Bool)

(assert (=> b!1442760 (=> (not res!974936) (not e!813105))))

(assert (=> b!1442760 (= res!974936 (= (select (store (arr!47313 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442760 (= lt!633651 (array!98051 (store (arr!47313 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47863 a!2862)))))

(assert (= (and start!124602 res!974941) b!1442756))

(assert (= (and b!1442756 res!974935) b!1442754))

(assert (= (and b!1442754 res!974940) b!1442748))

(assert (= (and b!1442748 res!974939) b!1442745))

(assert (= (and b!1442745 res!974937) b!1442759))

(assert (= (and b!1442759 res!974927) b!1442750))

(assert (= (and b!1442750 res!974930) b!1442760))

(assert (= (and b!1442760 res!974936) b!1442757))

(assert (= (and b!1442757 res!974929) b!1442751))

(assert (= (and b!1442751 res!974933) b!1442747))

(assert (= (and b!1442747 res!974932) b!1442752))

(assert (= (and b!1442752 c!133419) b!1442758))

(assert (= (and b!1442752 (not c!133419)) b!1442749))

(assert (= (and b!1442752 res!974928) b!1442753))

(assert (= (and b!1442753 res!974931) b!1442744))

(assert (= (and b!1442744 res!974934) b!1442746))

(assert (= (and b!1442746 res!974938) b!1442755))

(declare-fun m!1331867 () Bool)

(assert (=> b!1442749 m!1331867))

(declare-fun m!1331869 () Bool)

(assert (=> b!1442749 m!1331869))

(declare-fun m!1331871 () Bool)

(assert (=> b!1442745 m!1331871))

(declare-fun m!1331873 () Bool)

(assert (=> b!1442758 m!1331873))

(declare-fun m!1331875 () Bool)

(assert (=> b!1442748 m!1331875))

(assert (=> b!1442748 m!1331875))

(declare-fun m!1331877 () Bool)

(assert (=> b!1442748 m!1331877))

(declare-fun m!1331879 () Bool)

(assert (=> b!1442754 m!1331879))

(assert (=> b!1442754 m!1331879))

(declare-fun m!1331881 () Bool)

(assert (=> b!1442754 m!1331881))

(declare-fun m!1331883 () Bool)

(assert (=> start!124602 m!1331883))

(declare-fun m!1331885 () Bool)

(assert (=> start!124602 m!1331885))

(declare-fun m!1331887 () Bool)

(assert (=> b!1442744 m!1331887))

(declare-fun m!1331889 () Bool)

(assert (=> b!1442744 m!1331889))

(declare-fun m!1331891 () Bool)

(assert (=> b!1442760 m!1331891))

(declare-fun m!1331893 () Bool)

(assert (=> b!1442760 m!1331893))

(declare-fun m!1331895 () Bool)

(assert (=> b!1442747 m!1331895))

(assert (=> b!1442747 m!1331895))

(declare-fun m!1331897 () Bool)

(assert (=> b!1442747 m!1331897))

(assert (=> b!1442747 m!1331891))

(declare-fun m!1331899 () Bool)

(assert (=> b!1442747 m!1331899))

(assert (=> b!1442751 m!1331875))

(assert (=> b!1442751 m!1331875))

(declare-fun m!1331901 () Bool)

(assert (=> b!1442751 m!1331901))

(declare-fun m!1331903 () Bool)

(assert (=> b!1442755 m!1331903))

(assert (=> b!1442755 m!1331875))

(declare-fun m!1331905 () Bool)

(assert (=> b!1442759 m!1331905))

(assert (=> b!1442757 m!1331875))

(assert (=> b!1442757 m!1331875))

(declare-fun m!1331907 () Bool)

(assert (=> b!1442757 m!1331907))

(assert (=> b!1442757 m!1331907))

(assert (=> b!1442757 m!1331875))

(declare-fun m!1331909 () Bool)

(assert (=> b!1442757 m!1331909))

(assert (=> b!1442746 m!1331875))

(assert (=> b!1442746 m!1331875))

(declare-fun m!1331911 () Bool)

(assert (=> b!1442746 m!1331911))

(check-sat (not b!1442758) (not b!1442745) (not b!1442747) (not b!1442744) (not b!1442754) (not b!1442748) (not b!1442746) (not start!124602) (not b!1442759) (not b!1442757) (not b!1442749) (not b!1442751))
(check-sat)
