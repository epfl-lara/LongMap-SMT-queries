; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124606 () Bool)

(assert start!124606)

(declare-fun b!1442846 () Bool)

(declare-fun e!813150 () Bool)

(declare-fun e!813152 () Bool)

(assert (=> b!1442846 (= e!813150 e!813152)))

(declare-fun res!975018 () Bool)

(assert (=> b!1442846 (=> (not res!975018) (not e!813152))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11567 0))(
  ( (MissingZero!11567 (index!48660 (_ BitVec 32))) (Found!11567 (index!48661 (_ BitVec 32))) (Intermediate!11567 (undefined!12379 Bool) (index!48662 (_ BitVec 32)) (x!130368 (_ BitVec 32))) (Undefined!11567) (MissingVacant!11567 (index!48663 (_ BitVec 32))) )
))
(declare-fun lt!633683 () SeekEntryResult!11567)

(assert (=> b!1442846 (= res!975018 (= lt!633683 (Intermediate!11567 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633684 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98054 0))(
  ( (array!98055 (arr!47315 (Array (_ BitVec 32) (_ BitVec 64))) (size!47865 (_ BitVec 32))) )
))
(declare-fun lt!633680 () array!98054)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98054 (_ BitVec 32)) SeekEntryResult!11567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442846 (= lt!633683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633684 mask!2687) lt!633684 lt!633680 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98054)

(assert (=> b!1442846 (= lt!633684 (select (store (arr!47315 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442847 () Bool)

(declare-fun res!975028 () Bool)

(declare-fun e!813151 () Bool)

(assert (=> b!1442847 (=> (not res!975028) (not e!813151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442847 (= res!975028 (validKeyInArray!0 (select (arr!47315 a!2862) j!93)))))

(declare-fun b!1442848 () Bool)

(declare-fun res!975023 () Bool)

(declare-fun e!813149 () Bool)

(assert (=> b!1442848 (=> (not res!975023) (not e!813149))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98054 (_ BitVec 32)) SeekEntryResult!11567)

(assert (=> b!1442848 (= res!975023 (= (seekEntryOrOpen!0 (select (arr!47315 a!2862) j!93) a!2862 mask!2687) (Found!11567 j!93)))))

(declare-fun b!1442849 () Bool)

(declare-fun res!975020 () Bool)

(assert (=> b!1442849 (=> (not res!975020) (not e!813152))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442849 (= res!975020 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442850 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442850 (= e!813149 (or (= (select (arr!47315 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47315 a!2862) intermediateBeforeIndex!19) (select (arr!47315 a!2862) j!93))))))

(declare-fun b!1442851 () Bool)

(declare-fun e!813147 () Bool)

(assert (=> b!1442851 (= e!813147 e!813150)))

(declare-fun res!975025 () Bool)

(assert (=> b!1442851 (=> (not res!975025) (not e!813150))))

(declare-fun lt!633682 () SeekEntryResult!11567)

(assert (=> b!1442851 (= res!975025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47315 a!2862) j!93) mask!2687) (select (arr!47315 a!2862) j!93) a!2862 mask!2687) lt!633682))))

(assert (=> b!1442851 (= lt!633682 (Intermediate!11567 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442853 () Bool)

(declare-fun res!975029 () Bool)

(assert (=> b!1442853 (=> (not res!975029) (not e!813151))))

(declare-datatypes ((List!33816 0))(
  ( (Nil!33813) (Cons!33812 (h!35162 (_ BitVec 64)) (t!48510 List!33816)) )
))
(declare-fun arrayNoDuplicates!0 (array!98054 (_ BitVec 32) List!33816) Bool)

(assert (=> b!1442853 (= res!975029 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33813))))

(declare-fun b!1442854 () Bool)

(declare-fun res!975027 () Bool)

(assert (=> b!1442854 (=> (not res!975027) (not e!813151))))

(assert (=> b!1442854 (= res!975027 (validKeyInArray!0 (select (arr!47315 a!2862) i!1006)))))

(declare-fun b!1442855 () Bool)

(assert (=> b!1442855 (= e!813151 e!813147)))

(declare-fun res!975019 () Bool)

(assert (=> b!1442855 (=> (not res!975019) (not e!813147))))

(assert (=> b!1442855 (= res!975019 (= (select (store (arr!47315 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442855 (= lt!633680 (array!98055 (store (arr!47315 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47865 a!2862)))))

(declare-fun b!1442856 () Bool)

(declare-fun res!975030 () Bool)

(assert (=> b!1442856 (=> (not res!975030) (not e!813151))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1442856 (= res!975030 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47865 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47865 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47865 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442857 () Bool)

(declare-fun e!813148 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98054 (_ BitVec 32)) SeekEntryResult!11567)

(assert (=> b!1442857 (= e!813148 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633684 lt!633680 mask!2687) (seekEntryOrOpen!0 lt!633684 lt!633680 mask!2687)))))

(declare-fun b!1442858 () Bool)

(assert (=> b!1442858 (= e!813152 (not (or (not (= (select (arr!47315 a!2862) index!646) (select (store (arr!47315 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47315 a!2862) index!646) (select (arr!47315 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1442858 e!813149))

(declare-fun res!975024 () Bool)

(assert (=> b!1442858 (=> (not res!975024) (not e!813149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98054 (_ BitVec 32)) Bool)

(assert (=> b!1442858 (= res!975024 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48630 0))(
  ( (Unit!48631) )
))
(declare-fun lt!633681 () Unit!48630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48630)

(assert (=> b!1442858 (= lt!633681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442859 () Bool)

(declare-fun res!975017 () Bool)

(assert (=> b!1442859 (=> (not res!975017) (not e!813152))))

(assert (=> b!1442859 (= res!975017 e!813148)))

(declare-fun c!133425 () Bool)

(assert (=> b!1442859 (= c!133425 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442860 () Bool)

(assert (=> b!1442860 (= e!813148 (= lt!633683 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633684 lt!633680 mask!2687)))))

(declare-fun b!1442861 () Bool)

(declare-fun res!975026 () Bool)

(assert (=> b!1442861 (=> (not res!975026) (not e!813151))))

(assert (=> b!1442861 (= res!975026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442862 () Bool)

(declare-fun res!975031 () Bool)

(assert (=> b!1442862 (=> (not res!975031) (not e!813151))))

(assert (=> b!1442862 (= res!975031 (and (= (size!47865 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47865 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47865 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975022 () Bool)

(assert (=> start!124606 (=> (not res!975022) (not e!813151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124606 (= res!975022 (validMask!0 mask!2687))))

(assert (=> start!124606 e!813151))

(assert (=> start!124606 true))

(declare-fun array_inv!36343 (array!98054) Bool)

(assert (=> start!124606 (array_inv!36343 a!2862)))

(declare-fun b!1442852 () Bool)

(declare-fun res!975021 () Bool)

(assert (=> b!1442852 (=> (not res!975021) (not e!813150))))

(assert (=> b!1442852 (= res!975021 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47315 a!2862) j!93) a!2862 mask!2687) lt!633682))))

(assert (= (and start!124606 res!975022) b!1442862))

(assert (= (and b!1442862 res!975031) b!1442854))

(assert (= (and b!1442854 res!975027) b!1442847))

(assert (= (and b!1442847 res!975028) b!1442861))

(assert (= (and b!1442861 res!975026) b!1442853))

(assert (= (and b!1442853 res!975029) b!1442856))

(assert (= (and b!1442856 res!975030) b!1442855))

(assert (= (and b!1442855 res!975019) b!1442851))

(assert (= (and b!1442851 res!975025) b!1442852))

(assert (= (and b!1442852 res!975021) b!1442846))

(assert (= (and b!1442846 res!975018) b!1442859))

(assert (= (and b!1442859 c!133425) b!1442860))

(assert (= (and b!1442859 (not c!133425)) b!1442857))

(assert (= (and b!1442859 res!975017) b!1442849))

(assert (= (and b!1442849 res!975020) b!1442858))

(assert (= (and b!1442858 res!975024) b!1442848))

(assert (= (and b!1442848 res!975023) b!1442850))

(declare-fun m!1331959 () Bool)

(assert (=> b!1442853 m!1331959))

(declare-fun m!1331961 () Bool)

(assert (=> b!1442848 m!1331961))

(assert (=> b!1442848 m!1331961))

(declare-fun m!1331963 () Bool)

(assert (=> b!1442848 m!1331963))

(assert (=> b!1442852 m!1331961))

(assert (=> b!1442852 m!1331961))

(declare-fun m!1331965 () Bool)

(assert (=> b!1442852 m!1331965))

(declare-fun m!1331967 () Bool)

(assert (=> b!1442858 m!1331967))

(declare-fun m!1331969 () Bool)

(assert (=> b!1442858 m!1331969))

(declare-fun m!1331971 () Bool)

(assert (=> b!1442858 m!1331971))

(declare-fun m!1331973 () Bool)

(assert (=> b!1442858 m!1331973))

(declare-fun m!1331975 () Bool)

(assert (=> b!1442858 m!1331975))

(assert (=> b!1442858 m!1331961))

(declare-fun m!1331977 () Bool)

(assert (=> b!1442854 m!1331977))

(assert (=> b!1442854 m!1331977))

(declare-fun m!1331979 () Bool)

(assert (=> b!1442854 m!1331979))

(declare-fun m!1331981 () Bool)

(assert (=> b!1442850 m!1331981))

(assert (=> b!1442850 m!1331961))

(declare-fun m!1331983 () Bool)

(assert (=> b!1442846 m!1331983))

(assert (=> b!1442846 m!1331983))

(declare-fun m!1331985 () Bool)

(assert (=> b!1442846 m!1331985))

(assert (=> b!1442846 m!1331969))

(declare-fun m!1331987 () Bool)

(assert (=> b!1442846 m!1331987))

(declare-fun m!1331989 () Bool)

(assert (=> b!1442860 m!1331989))

(assert (=> b!1442855 m!1331969))

(declare-fun m!1331991 () Bool)

(assert (=> b!1442855 m!1331991))

(assert (=> b!1442851 m!1331961))

(assert (=> b!1442851 m!1331961))

(declare-fun m!1331993 () Bool)

(assert (=> b!1442851 m!1331993))

(assert (=> b!1442851 m!1331993))

(assert (=> b!1442851 m!1331961))

(declare-fun m!1331995 () Bool)

(assert (=> b!1442851 m!1331995))

(declare-fun m!1331997 () Bool)

(assert (=> start!124606 m!1331997))

(declare-fun m!1331999 () Bool)

(assert (=> start!124606 m!1331999))

(assert (=> b!1442847 m!1331961))

(assert (=> b!1442847 m!1331961))

(declare-fun m!1332001 () Bool)

(assert (=> b!1442847 m!1332001))

(declare-fun m!1332003 () Bool)

(assert (=> b!1442861 m!1332003))

(declare-fun m!1332005 () Bool)

(assert (=> b!1442857 m!1332005))

(declare-fun m!1332007 () Bool)

(assert (=> b!1442857 m!1332007))

(push 1)

(assert (not b!1442846))

(assert (not b!1442847))

(assert (not start!124606))

(assert (not b!1442852))

(assert (not b!1442848))

(assert (not b!1442854))

(assert (not b!1442851))

(assert (not b!1442861))

(assert (not b!1442860))

(assert (not b!1442853))

(assert (not b!1442857))

(assert (not b!1442858))

