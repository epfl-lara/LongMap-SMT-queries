; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127352 () Bool)

(assert start!127352)

(declare-fun b!1496735 () Bool)

(declare-fun e!838280 () Bool)

(declare-fun e!838276 () Bool)

(assert (=> b!1496735 (= e!838280 e!838276)))

(declare-fun res!1018042 () Bool)

(assert (=> b!1496735 (=> (not res!1018042) (not e!838276))))

(declare-datatypes ((SeekEntryResult!12411 0))(
  ( (MissingZero!12411 (index!52036 (_ BitVec 32))) (Found!12411 (index!52037 (_ BitVec 32))) (Intermediate!12411 (undefined!13223 Bool) (index!52038 (_ BitVec 32)) (x!133661 (_ BitVec 32))) (Undefined!12411) (MissingVacant!12411 (index!52039 (_ BitVec 32))) )
))
(declare-fun lt!652188 () SeekEntryResult!12411)

(declare-datatypes ((array!99814 0))(
  ( (array!99815 (arr!48171 (Array (_ BitVec 32) (_ BitVec 64))) (size!48721 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99814)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99814 (_ BitVec 32)) SeekEntryResult!12411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496735 (= res!1018042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48171 a!2862) j!93) mask!2687) (select (arr!48171 a!2862) j!93) a!2862 mask!2687) lt!652188))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496735 (= lt!652188 (Intermediate!12411 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496736 () Bool)

(declare-fun e!838281 () Bool)

(assert (=> b!1496736 (= e!838276 e!838281)))

(declare-fun res!1018028 () Bool)

(assert (=> b!1496736 (=> (not res!1018028) (not e!838281))))

(declare-fun lt!652189 () SeekEntryResult!12411)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496736 (= res!1018028 (= lt!652189 (Intermediate!12411 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!652185 () array!99814)

(declare-fun lt!652190 () (_ BitVec 64))

(assert (=> b!1496736 (= lt!652189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652190 mask!2687) lt!652190 lt!652185 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496736 (= lt!652190 (select (store (arr!48171 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496737 () Bool)

(declare-fun res!1018030 () Bool)

(declare-fun e!838277 () Bool)

(assert (=> b!1496737 (=> (not res!1018030) (not e!838277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99814 (_ BitVec 32)) Bool)

(assert (=> b!1496737 (= res!1018030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496738 () Bool)

(declare-fun e!838279 () Bool)

(declare-fun e!838282 () Bool)

(assert (=> b!1496738 (= e!838279 e!838282)))

(declare-fun res!1018025 () Bool)

(assert (=> b!1496738 (=> res!1018025 e!838282)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!652186 () (_ BitVec 32))

(assert (=> b!1496738 (= res!1018025 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652186 #b00000000000000000000000000000000) (bvsge lt!652186 (size!48721 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496738 (= lt!652186 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!838274 () Bool)

(declare-fun b!1496739 () Bool)

(assert (=> b!1496739 (= e!838274 (= lt!652189 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652190 lt!652185 mask!2687)))))

(declare-fun b!1496740 () Bool)

(assert (=> b!1496740 (= e!838282 true)))

(declare-fun lt!652191 () SeekEntryResult!12411)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99814 (_ BitVec 32)) SeekEntryResult!12411)

(assert (=> b!1496740 (= lt!652191 (seekEntryOrOpen!0 lt!652190 lt!652185 mask!2687))))

(declare-datatypes ((Unit!50162 0))(
  ( (Unit!50163) )
))
(declare-fun lt!652187 () Unit!50162)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50162)

(assert (=> b!1496740 (= lt!652187 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652186 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496741 () Bool)

(assert (=> b!1496741 (= e!838281 (not e!838279))))

(declare-fun res!1018034 () Bool)

(assert (=> b!1496741 (=> res!1018034 e!838279)))

(assert (=> b!1496741 (= res!1018034 (or (and (= (select (arr!48171 a!2862) index!646) (select (store (arr!48171 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48171 a!2862) index!646) (select (arr!48171 a!2862) j!93))) (= (select (arr!48171 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496741 (and (= lt!652191 (Found!12411 j!93)) (or (= (select (arr!48171 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48171 a!2862) intermediateBeforeIndex!19) (select (arr!48171 a!2862) j!93))))))

(assert (=> b!1496741 (= lt!652191 (seekEntryOrOpen!0 (select (arr!48171 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496741 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652192 () Unit!50162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50162)

(assert (=> b!1496741 (= lt!652192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496742 () Bool)

(declare-fun res!1018033 () Bool)

(assert (=> b!1496742 (=> (not res!1018033) (not e!838277))))

(declare-datatypes ((List!34672 0))(
  ( (Nil!34669) (Cons!34668 (h!36065 (_ BitVec 64)) (t!49366 List!34672)) )
))
(declare-fun arrayNoDuplicates!0 (array!99814 (_ BitVec 32) List!34672) Bool)

(assert (=> b!1496742 (= res!1018033 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34669))))

(declare-fun b!1496743 () Bool)

(declare-fun res!1018038 () Bool)

(assert (=> b!1496743 (=> res!1018038 e!838282)))

(declare-fun e!838275 () Bool)

(assert (=> b!1496743 (= res!1018038 e!838275)))

(declare-fun c!138890 () Bool)

(assert (=> b!1496743 (= c!138890 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496744 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99814 (_ BitVec 32)) SeekEntryResult!12411)

(assert (=> b!1496744 (= e!838274 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652190 lt!652185 mask!2687) (seekEntryOrOpen!0 lt!652190 lt!652185 mask!2687)))))

(declare-fun b!1496745 () Bool)

(assert (=> b!1496745 (= e!838275 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652186 intermediateAfterIndex!19 lt!652190 lt!652185 mask!2687) (seekEntryOrOpen!0 lt!652190 lt!652185 mask!2687))))))

(declare-fun b!1496746 () Bool)

(declare-fun res!1018041 () Bool)

(assert (=> b!1496746 (=> (not res!1018041) (not e!838277))))

(assert (=> b!1496746 (= res!1018041 (and (= (size!48721 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48721 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48721 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496748 () Bool)

(assert (=> b!1496748 (= e!838275 (not (= lt!652189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652186 lt!652190 lt!652185 mask!2687))))))

(declare-fun b!1496749 () Bool)

(declare-fun res!1018035 () Bool)

(assert (=> b!1496749 (=> (not res!1018035) (not e!838276))))

(assert (=> b!1496749 (= res!1018035 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48171 a!2862) j!93) a!2862 mask!2687) lt!652188))))

(declare-fun b!1496750 () Bool)

(declare-fun res!1018031 () Bool)

(assert (=> b!1496750 (=> (not res!1018031) (not e!838277))))

(assert (=> b!1496750 (= res!1018031 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48721 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48721 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48721 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496751 () Bool)

(declare-fun res!1018029 () Bool)

(assert (=> b!1496751 (=> (not res!1018029) (not e!838281))))

(assert (=> b!1496751 (= res!1018029 e!838274)))

(declare-fun c!138889 () Bool)

(assert (=> b!1496751 (= c!138889 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496752 () Bool)

(assert (=> b!1496752 (= e!838277 e!838280)))

(declare-fun res!1018026 () Bool)

(assert (=> b!1496752 (=> (not res!1018026) (not e!838280))))

(assert (=> b!1496752 (= res!1018026 (= (select (store (arr!48171 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496752 (= lt!652185 (array!99815 (store (arr!48171 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48721 a!2862)))))

(declare-fun b!1496753 () Bool)

(declare-fun res!1018032 () Bool)

(assert (=> b!1496753 (=> (not res!1018032) (not e!838281))))

(assert (=> b!1496753 (= res!1018032 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496754 () Bool)

(declare-fun res!1018037 () Bool)

(assert (=> b!1496754 (=> res!1018037 e!838282)))

(assert (=> b!1496754 (= res!1018037 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652186 (select (arr!48171 a!2862) j!93) a!2862 mask!2687) lt!652188)))))

(declare-fun res!1018040 () Bool)

(assert (=> start!127352 (=> (not res!1018040) (not e!838277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127352 (= res!1018040 (validMask!0 mask!2687))))

(assert (=> start!127352 e!838277))

(assert (=> start!127352 true))

(declare-fun array_inv!37199 (array!99814) Bool)

(assert (=> start!127352 (array_inv!37199 a!2862)))

(declare-fun b!1496747 () Bool)

(declare-fun res!1018039 () Bool)

(assert (=> b!1496747 (=> res!1018039 e!838282)))

(assert (=> b!1496747 (= res!1018039 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496755 () Bool)

(declare-fun res!1018036 () Bool)

(assert (=> b!1496755 (=> (not res!1018036) (not e!838277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496755 (= res!1018036 (validKeyInArray!0 (select (arr!48171 a!2862) j!93)))))

(declare-fun b!1496756 () Bool)

(declare-fun res!1018027 () Bool)

(assert (=> b!1496756 (=> (not res!1018027) (not e!838277))))

(assert (=> b!1496756 (= res!1018027 (validKeyInArray!0 (select (arr!48171 a!2862) i!1006)))))

(assert (= (and start!127352 res!1018040) b!1496746))

(assert (= (and b!1496746 res!1018041) b!1496756))

(assert (= (and b!1496756 res!1018027) b!1496755))

(assert (= (and b!1496755 res!1018036) b!1496737))

(assert (= (and b!1496737 res!1018030) b!1496742))

(assert (= (and b!1496742 res!1018033) b!1496750))

(assert (= (and b!1496750 res!1018031) b!1496752))

(assert (= (and b!1496752 res!1018026) b!1496735))

(assert (= (and b!1496735 res!1018042) b!1496749))

(assert (= (and b!1496749 res!1018035) b!1496736))

(assert (= (and b!1496736 res!1018028) b!1496751))

(assert (= (and b!1496751 c!138889) b!1496739))

(assert (= (and b!1496751 (not c!138889)) b!1496744))

(assert (= (and b!1496751 res!1018029) b!1496753))

(assert (= (and b!1496753 res!1018032) b!1496741))

(assert (= (and b!1496741 (not res!1018034)) b!1496738))

(assert (= (and b!1496738 (not res!1018025)) b!1496754))

(assert (= (and b!1496754 (not res!1018037)) b!1496743))

(assert (= (and b!1496743 c!138890) b!1496748))

(assert (= (and b!1496743 (not c!138890)) b!1496745))

(assert (= (and b!1496743 (not res!1018038)) b!1496747))

(assert (= (and b!1496747 (not res!1018039)) b!1496740))

(declare-fun m!1379875 () Bool)

(assert (=> b!1496740 m!1379875))

(declare-fun m!1379877 () Bool)

(assert (=> b!1496740 m!1379877))

(declare-fun m!1379879 () Bool)

(assert (=> b!1496755 m!1379879))

(assert (=> b!1496755 m!1379879))

(declare-fun m!1379881 () Bool)

(assert (=> b!1496755 m!1379881))

(declare-fun m!1379883 () Bool)

(assert (=> b!1496742 m!1379883))

(assert (=> b!1496749 m!1379879))

(assert (=> b!1496749 m!1379879))

(declare-fun m!1379885 () Bool)

(assert (=> b!1496749 m!1379885))

(declare-fun m!1379887 () Bool)

(assert (=> b!1496745 m!1379887))

(assert (=> b!1496745 m!1379875))

(declare-fun m!1379889 () Bool)

(assert (=> b!1496752 m!1379889))

(declare-fun m!1379891 () Bool)

(assert (=> b!1496752 m!1379891))

(declare-fun m!1379893 () Bool)

(assert (=> b!1496739 m!1379893))

(assert (=> b!1496735 m!1379879))

(assert (=> b!1496735 m!1379879))

(declare-fun m!1379895 () Bool)

(assert (=> b!1496735 m!1379895))

(assert (=> b!1496735 m!1379895))

(assert (=> b!1496735 m!1379879))

(declare-fun m!1379897 () Bool)

(assert (=> b!1496735 m!1379897))

(declare-fun m!1379899 () Bool)

(assert (=> start!127352 m!1379899))

(declare-fun m!1379901 () Bool)

(assert (=> start!127352 m!1379901))

(declare-fun m!1379903 () Bool)

(assert (=> b!1496756 m!1379903))

(assert (=> b!1496756 m!1379903))

(declare-fun m!1379905 () Bool)

(assert (=> b!1496756 m!1379905))

(declare-fun m!1379907 () Bool)

(assert (=> b!1496737 m!1379907))

(declare-fun m!1379909 () Bool)

(assert (=> b!1496744 m!1379909))

(assert (=> b!1496744 m!1379875))

(declare-fun m!1379911 () Bool)

(assert (=> b!1496748 m!1379911))

(declare-fun m!1379913 () Bool)

(assert (=> b!1496738 m!1379913))

(declare-fun m!1379915 () Bool)

(assert (=> b!1496736 m!1379915))

(assert (=> b!1496736 m!1379915))

(declare-fun m!1379917 () Bool)

(assert (=> b!1496736 m!1379917))

(assert (=> b!1496736 m!1379889))

(declare-fun m!1379919 () Bool)

(assert (=> b!1496736 m!1379919))

(assert (=> b!1496754 m!1379879))

(assert (=> b!1496754 m!1379879))

(declare-fun m!1379921 () Bool)

(assert (=> b!1496754 m!1379921))

(declare-fun m!1379923 () Bool)

(assert (=> b!1496741 m!1379923))

(assert (=> b!1496741 m!1379889))

(declare-fun m!1379925 () Bool)

(assert (=> b!1496741 m!1379925))

(declare-fun m!1379927 () Bool)

(assert (=> b!1496741 m!1379927))

(declare-fun m!1379929 () Bool)

(assert (=> b!1496741 m!1379929))

(assert (=> b!1496741 m!1379879))

(declare-fun m!1379931 () Bool)

(assert (=> b!1496741 m!1379931))

(declare-fun m!1379933 () Bool)

(assert (=> b!1496741 m!1379933))

(assert (=> b!1496741 m!1379879))

(check-sat (not b!1496748) (not b!1496740) (not start!127352) (not b!1496755) (not b!1496756) (not b!1496738) (not b!1496742) (not b!1496741) (not b!1496735) (not b!1496739) (not b!1496754) (not b!1496737) (not b!1496749) (not b!1496745) (not b!1496744) (not b!1496736))
(check-sat)
