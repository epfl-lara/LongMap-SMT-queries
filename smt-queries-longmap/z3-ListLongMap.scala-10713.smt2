; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125694 () Bool)

(assert start!125694)

(declare-fun b!1468911 () Bool)

(declare-fun res!996380 () Bool)

(declare-fun e!825239 () Bool)

(assert (=> b!1468911 (=> (not res!996380) (not e!825239))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98980 0))(
  ( (array!98981 (arr!47773 (Array (_ BitVec 32) (_ BitVec 64))) (size!48324 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98980)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468911 (= res!996380 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48324 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48324 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48324 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!996385 () Bool)

(assert (=> start!125694 (=> (not res!996385) (not e!825239))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125694 (= res!996385 (validMask!0 mask!2687))))

(assert (=> start!125694 e!825239))

(assert (=> start!125694 true))

(declare-fun array_inv!37054 (array!98980) Bool)

(assert (=> start!125694 (array_inv!37054 a!2862)))

(declare-fun b!1468912 () Bool)

(declare-fun e!825235 () Bool)

(declare-fun lt!642667 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468912 (= e!825235 (validKeyInArray!0 lt!642667))))

(declare-fun b!1468913 () Bool)

(declare-fun e!825234 () Bool)

(assert (=> b!1468913 (= e!825239 e!825234)))

(declare-fun res!996386 () Bool)

(assert (=> b!1468913 (=> (not res!996386) (not e!825234))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468913 (= res!996386 (= (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642668 () array!98980)

(assert (=> b!1468913 (= lt!642668 (array!98981 (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48324 a!2862)))))

(declare-fun b!1468914 () Bool)

(declare-fun e!825237 () Bool)

(declare-fun e!825233 () Bool)

(assert (=> b!1468914 (= e!825237 e!825233)))

(declare-fun res!996395 () Bool)

(assert (=> b!1468914 (=> (not res!996395) (not e!825233))))

(declare-datatypes ((SeekEntryResult!11922 0))(
  ( (MissingZero!11922 (index!50080 (_ BitVec 32))) (Found!11922 (index!50081 (_ BitVec 32))) (Intermediate!11922 (undefined!12734 Bool) (index!50082 (_ BitVec 32)) (x!131836 (_ BitVec 32))) (Undefined!11922) (MissingVacant!11922 (index!50083 (_ BitVec 32))) )
))
(declare-fun lt!642670 () SeekEntryResult!11922)

(assert (=> b!1468914 (= res!996395 (= lt!642670 (Intermediate!11922 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!11922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468914 (= lt!642670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642667 mask!2687) lt!642667 lt!642668 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1468914 (= lt!642667 (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1468915 () Bool)

(declare-fun res!996393 () Bool)

(declare-fun e!825236 () Bool)

(assert (=> b!1468915 (=> res!996393 e!825236)))

(assert (=> b!1468915 (= res!996393 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun lt!642671 () (_ BitVec 32))

(declare-fun b!1468916 () Bool)

(declare-fun e!825238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!11922)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98980 (_ BitVec 32)) SeekEntryResult!11922)

(assert (=> b!1468916 (= e!825238 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642671 intermediateAfterIndex!19 lt!642667 lt!642668 mask!2687) (seekEntryOrOpen!0 lt!642667 lt!642668 mask!2687))))))

(declare-fun b!1468917 () Bool)

(declare-fun res!996384 () Bool)

(assert (=> b!1468917 (=> res!996384 e!825236)))

(declare-fun lt!642666 () SeekEntryResult!11922)

(assert (=> b!1468917 (= res!996384 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642671 (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642666)))))

(declare-fun b!1468918 () Bool)

(declare-fun res!996391 () Bool)

(assert (=> b!1468918 (=> (not res!996391) (not e!825239))))

(assert (=> b!1468918 (= res!996391 (validKeyInArray!0 (select (arr!47773 a!2862) i!1006)))))

(declare-fun b!1468919 () Bool)

(declare-fun e!825232 () Bool)

(assert (=> b!1468919 (= e!825233 (not e!825232))))

(declare-fun res!996383 () Bool)

(assert (=> b!1468919 (=> res!996383 e!825232)))

(assert (=> b!1468919 (= res!996383 (or (and (= (select (arr!47773 a!2862) index!646) (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47773 a!2862) index!646) (select (arr!47773 a!2862) j!93))) (= (select (arr!47773 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!642673 () SeekEntryResult!11922)

(assert (=> b!1468919 (and (= lt!642673 (Found!11922 j!93)) (or (= (select (arr!47773 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47773 a!2862) intermediateBeforeIndex!19) (select (arr!47773 a!2862) j!93))))))

(assert (=> b!1468919 (= lt!642673 (seekEntryOrOpen!0 (select (arr!47773 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98980 (_ BitVec 32)) Bool)

(assert (=> b!1468919 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49373 0))(
  ( (Unit!49374) )
))
(declare-fun lt!642669 () Unit!49373)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49373)

(assert (=> b!1468919 (= lt!642669 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1468920 () Bool)

(declare-fun res!996394 () Bool)

(assert (=> b!1468920 (=> (not res!996394) (not e!825239))))

(declare-datatypes ((List!34261 0))(
  ( (Nil!34258) (Cons!34257 (h!35621 (_ BitVec 64)) (t!48947 List!34261)) )
))
(declare-fun arrayNoDuplicates!0 (array!98980 (_ BitVec 32) List!34261) Bool)

(assert (=> b!1468920 (= res!996394 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34258))))

(declare-fun b!1468921 () Bool)

(assert (=> b!1468921 (= e!825232 e!825236)))

(declare-fun res!996392 () Bool)

(assert (=> b!1468921 (=> res!996392 e!825236)))

(assert (=> b!1468921 (= res!996392 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642671 #b00000000000000000000000000000000) (bvsge lt!642671 (size!48324 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468921 (= lt!642671 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1468922 () Bool)

(declare-fun e!825240 () Bool)

(assert (=> b!1468922 (= e!825240 (= lt!642670 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642667 lt!642668 mask!2687)))))

(declare-fun b!1468923 () Bool)

(assert (=> b!1468923 (= e!825238 (not (= lt!642670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642671 lt!642667 lt!642668 mask!2687))))))

(declare-fun b!1468924 () Bool)

(declare-fun res!996397 () Bool)

(assert (=> b!1468924 (=> (not res!996397) (not e!825237))))

(assert (=> b!1468924 (= res!996397 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642666))))

(declare-fun b!1468925 () Bool)

(declare-fun res!996389 () Bool)

(assert (=> b!1468925 (=> (not res!996389) (not e!825233))))

(assert (=> b!1468925 (= res!996389 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1468926 () Bool)

(declare-fun res!996382 () Bool)

(assert (=> b!1468926 (=> (not res!996382) (not e!825239))))

(assert (=> b!1468926 (= res!996382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468927 () Bool)

(assert (=> b!1468927 (= e!825234 e!825237)))

(declare-fun res!996390 () Bool)

(assert (=> b!1468927 (=> (not res!996390) (not e!825237))))

(assert (=> b!1468927 (= res!996390 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47773 a!2862) j!93) mask!2687) (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642666))))

(assert (=> b!1468927 (= lt!642666 (Intermediate!11922 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468928 () Bool)

(declare-fun res!996396 () Bool)

(assert (=> b!1468928 (=> res!996396 e!825236)))

(assert (=> b!1468928 (= res!996396 e!825238)))

(declare-fun c!135787 () Bool)

(assert (=> b!1468928 (= c!135787 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1468929 () Bool)

(declare-fun res!996387 () Bool)

(assert (=> b!1468929 (=> (not res!996387) (not e!825239))))

(assert (=> b!1468929 (= res!996387 (validKeyInArray!0 (select (arr!47773 a!2862) j!93)))))

(declare-fun b!1468930 () Bool)

(assert (=> b!1468930 (= e!825236 e!825235)))

(declare-fun res!996381 () Bool)

(assert (=> b!1468930 (=> res!996381 e!825235)))

(assert (=> b!1468930 (= res!996381 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1468930 (= lt!642673 (seekEntryOrOpen!0 lt!642667 lt!642668 mask!2687))))

(declare-fun lt!642672 () Unit!49373)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49373)

(assert (=> b!1468930 (= lt!642672 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642671 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1468931 () Bool)

(declare-fun res!996388 () Bool)

(assert (=> b!1468931 (=> (not res!996388) (not e!825233))))

(assert (=> b!1468931 (= res!996388 e!825240)))

(declare-fun c!135786 () Bool)

(assert (=> b!1468931 (= c!135786 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1468932 () Bool)

(declare-fun res!996398 () Bool)

(assert (=> b!1468932 (=> (not res!996398) (not e!825239))))

(assert (=> b!1468932 (= res!996398 (and (= (size!48324 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48324 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48324 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468933 () Bool)

(assert (=> b!1468933 (= e!825240 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642667 lt!642668 mask!2687) (seekEntryOrOpen!0 lt!642667 lt!642668 mask!2687)))))

(assert (= (and start!125694 res!996385) b!1468932))

(assert (= (and b!1468932 res!996398) b!1468918))

(assert (= (and b!1468918 res!996391) b!1468929))

(assert (= (and b!1468929 res!996387) b!1468926))

(assert (= (and b!1468926 res!996382) b!1468920))

(assert (= (and b!1468920 res!996394) b!1468911))

(assert (= (and b!1468911 res!996380) b!1468913))

(assert (= (and b!1468913 res!996386) b!1468927))

(assert (= (and b!1468927 res!996390) b!1468924))

(assert (= (and b!1468924 res!996397) b!1468914))

(assert (= (and b!1468914 res!996395) b!1468931))

(assert (= (and b!1468931 c!135786) b!1468922))

(assert (= (and b!1468931 (not c!135786)) b!1468933))

(assert (= (and b!1468931 res!996388) b!1468925))

(assert (= (and b!1468925 res!996389) b!1468919))

(assert (= (and b!1468919 (not res!996383)) b!1468921))

(assert (= (and b!1468921 (not res!996392)) b!1468917))

(assert (= (and b!1468917 (not res!996384)) b!1468928))

(assert (= (and b!1468928 c!135787) b!1468923))

(assert (= (and b!1468928 (not c!135787)) b!1468916))

(assert (= (and b!1468928 (not res!996396)) b!1468915))

(assert (= (and b!1468915 (not res!996393)) b!1468930))

(assert (= (and b!1468930 (not res!996381)) b!1468912))

(declare-fun m!1355809 () Bool)

(assert (=> b!1468929 m!1355809))

(assert (=> b!1468929 m!1355809))

(declare-fun m!1355811 () Bool)

(assert (=> b!1468929 m!1355811))

(declare-fun m!1355813 () Bool)

(assert (=> start!125694 m!1355813))

(declare-fun m!1355815 () Bool)

(assert (=> start!125694 m!1355815))

(declare-fun m!1355817 () Bool)

(assert (=> b!1468918 m!1355817))

(assert (=> b!1468918 m!1355817))

(declare-fun m!1355819 () Bool)

(assert (=> b!1468918 m!1355819))

(declare-fun m!1355821 () Bool)

(assert (=> b!1468926 m!1355821))

(declare-fun m!1355823 () Bool)

(assert (=> b!1468913 m!1355823))

(declare-fun m!1355825 () Bool)

(assert (=> b!1468913 m!1355825))

(declare-fun m!1355827 () Bool)

(assert (=> b!1468920 m!1355827))

(declare-fun m!1355829 () Bool)

(assert (=> b!1468912 m!1355829))

(assert (=> b!1468924 m!1355809))

(assert (=> b!1468924 m!1355809))

(declare-fun m!1355831 () Bool)

(assert (=> b!1468924 m!1355831))

(declare-fun m!1355833 () Bool)

(assert (=> b!1468914 m!1355833))

(assert (=> b!1468914 m!1355833))

(declare-fun m!1355835 () Bool)

(assert (=> b!1468914 m!1355835))

(assert (=> b!1468914 m!1355823))

(declare-fun m!1355837 () Bool)

(assert (=> b!1468914 m!1355837))

(declare-fun m!1355839 () Bool)

(assert (=> b!1468919 m!1355839))

(assert (=> b!1468919 m!1355823))

(declare-fun m!1355841 () Bool)

(assert (=> b!1468919 m!1355841))

(declare-fun m!1355843 () Bool)

(assert (=> b!1468919 m!1355843))

(declare-fun m!1355845 () Bool)

(assert (=> b!1468919 m!1355845))

(assert (=> b!1468919 m!1355809))

(declare-fun m!1355847 () Bool)

(assert (=> b!1468919 m!1355847))

(declare-fun m!1355849 () Bool)

(assert (=> b!1468919 m!1355849))

(assert (=> b!1468919 m!1355809))

(declare-fun m!1355851 () Bool)

(assert (=> b!1468930 m!1355851))

(declare-fun m!1355853 () Bool)

(assert (=> b!1468930 m!1355853))

(declare-fun m!1355855 () Bool)

(assert (=> b!1468921 m!1355855))

(declare-fun m!1355857 () Bool)

(assert (=> b!1468923 m!1355857))

(declare-fun m!1355859 () Bool)

(assert (=> b!1468922 m!1355859))

(assert (=> b!1468927 m!1355809))

(assert (=> b!1468927 m!1355809))

(declare-fun m!1355861 () Bool)

(assert (=> b!1468927 m!1355861))

(assert (=> b!1468927 m!1355861))

(assert (=> b!1468927 m!1355809))

(declare-fun m!1355863 () Bool)

(assert (=> b!1468927 m!1355863))

(declare-fun m!1355865 () Bool)

(assert (=> b!1468933 m!1355865))

(assert (=> b!1468933 m!1355851))

(declare-fun m!1355867 () Bool)

(assert (=> b!1468916 m!1355867))

(assert (=> b!1468916 m!1355851))

(assert (=> b!1468917 m!1355809))

(assert (=> b!1468917 m!1355809))

(declare-fun m!1355869 () Bool)

(assert (=> b!1468917 m!1355869))

(check-sat (not b!1468926) (not b!1468917) (not b!1468929) (not b!1468921) (not b!1468927) (not b!1468918) (not b!1468919) (not b!1468924) (not b!1468912) (not b!1468922) (not b!1468923) (not start!125694) (not b!1468916) (not b!1468920) (not b!1468930) (not b!1468933) (not b!1468914))
(check-sat)
