; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127182 () Bool)

(assert start!127182)

(declare-fun b!1492928 () Bool)

(declare-fun e!836593 () Bool)

(assert (=> b!1492928 (= e!836593 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650843 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492928 (= lt!650843 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1492929 () Bool)

(declare-fun e!836595 () Bool)

(assert (=> b!1492929 (= e!836595 (not e!836593))))

(declare-fun res!1015037 () Bool)

(assert (=> b!1492929 (=> res!1015037 e!836593)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99793 0))(
  ( (array!99794 (arr!48163 (Array (_ BitVec 32) (_ BitVec 64))) (size!48714 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99793)

(assert (=> b!1492929 (= res!1015037 (or (and (= (select (arr!48163 a!2862) index!646) (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48163 a!2862) index!646) (select (arr!48163 a!2862) j!93))) (= (select (arr!48163 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836596 () Bool)

(assert (=> b!1492929 e!836596))

(declare-fun res!1015028 () Bool)

(assert (=> b!1492929 (=> (not res!1015028) (not e!836596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99793 (_ BitVec 32)) Bool)

(assert (=> b!1492929 (= res!1015028 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49973 0))(
  ( (Unit!49974) )
))
(declare-fun lt!650840 () Unit!49973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49973)

(assert (=> b!1492929 (= lt!650840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492930 () Bool)

(declare-fun res!1015024 () Bool)

(declare-fun e!836591 () Bool)

(assert (=> b!1492930 (=> (not res!1015024) (not e!836591))))

(assert (=> b!1492930 (= res!1015024 (and (= (size!48714 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48714 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48714 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492931 () Bool)

(declare-fun e!836594 () Bool)

(declare-fun e!836592 () Bool)

(assert (=> b!1492931 (= e!836594 e!836592)))

(declare-fun res!1015022 () Bool)

(assert (=> b!1492931 (=> (not res!1015022) (not e!836592))))

(declare-datatypes ((SeekEntryResult!12300 0))(
  ( (MissingZero!12300 (index!51592 (_ BitVec 32))) (Found!12300 (index!51593 (_ BitVec 32))) (Intermediate!12300 (undefined!13112 Bool) (index!51594 (_ BitVec 32)) (x!133365 (_ BitVec 32))) (Undefined!12300) (MissingVacant!12300 (index!51595 (_ BitVec 32))) )
))
(declare-fun lt!650845 () SeekEntryResult!12300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492931 (= res!1015022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48163 a!2862) j!93) mask!2687) (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!650845))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492931 (= lt!650845 (Intermediate!12300 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492932 () Bool)

(declare-fun res!1015029 () Bool)

(assert (=> b!1492932 (=> (not res!1015029) (not e!836591))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492932 (= res!1015029 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48714 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48714 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48714 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492933 () Bool)

(declare-fun res!1015023 () Bool)

(assert (=> b!1492933 (=> (not res!1015023) (not e!836591))))

(assert (=> b!1492933 (= res!1015023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492934 () Bool)

(declare-fun res!1015026 () Bool)

(assert (=> b!1492934 (=> (not res!1015026) (not e!836596))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12300)

(assert (=> b!1492934 (= res!1015026 (= (seekEntryOrOpen!0 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) (Found!12300 j!93)))))

(declare-fun b!1492935 () Bool)

(declare-fun res!1015032 () Bool)

(assert (=> b!1492935 (=> (not res!1015032) (not e!836591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492935 (= res!1015032 (validKeyInArray!0 (select (arr!48163 a!2862) i!1006)))))

(declare-fun b!1492936 () Bool)

(assert (=> b!1492936 (= e!836592 e!836595)))

(declare-fun res!1015034 () Bool)

(assert (=> b!1492936 (=> (not res!1015034) (not e!836595))))

(declare-fun lt!650842 () SeekEntryResult!12300)

(assert (=> b!1492936 (= res!1015034 (= lt!650842 (Intermediate!12300 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650841 () array!99793)

(declare-fun lt!650844 () (_ BitVec 64))

(assert (=> b!1492936 (= lt!650842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650844 mask!2687) lt!650844 lt!650841 mask!2687))))

(assert (=> b!1492936 (= lt!650844 (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!836597 () Bool)

(declare-fun b!1492937 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12300)

(assert (=> b!1492937 (= e!836597 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650844 lt!650841 mask!2687) (seekEntryOrOpen!0 lt!650844 lt!650841 mask!2687)))))

(declare-fun b!1492938 () Bool)

(declare-fun res!1015025 () Bool)

(assert (=> b!1492938 (=> (not res!1015025) (not e!836591))))

(assert (=> b!1492938 (= res!1015025 (validKeyInArray!0 (select (arr!48163 a!2862) j!93)))))

(declare-fun b!1492939 () Bool)

(declare-fun res!1015036 () Bool)

(assert (=> b!1492939 (=> (not res!1015036) (not e!836591))))

(declare-datatypes ((List!34651 0))(
  ( (Nil!34648) (Cons!34647 (h!36044 (_ BitVec 64)) (t!49337 List!34651)) )
))
(declare-fun arrayNoDuplicates!0 (array!99793 (_ BitVec 32) List!34651) Bool)

(assert (=> b!1492939 (= res!1015036 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34648))))

(declare-fun b!1492940 () Bool)

(assert (=> b!1492940 (= e!836596 (or (= (select (arr!48163 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48163 a!2862) intermediateBeforeIndex!19) (select (arr!48163 a!2862) j!93))))))

(declare-fun b!1492941 () Bool)

(assert (=> b!1492941 (= e!836591 e!836594)))

(declare-fun res!1015030 () Bool)

(assert (=> b!1492941 (=> (not res!1015030) (not e!836594))))

(assert (=> b!1492941 (= res!1015030 (= (select (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492941 (= lt!650841 (array!99794 (store (arr!48163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48714 a!2862)))))

(declare-fun b!1492942 () Bool)

(declare-fun res!1015027 () Bool)

(assert (=> b!1492942 (=> (not res!1015027) (not e!836592))))

(assert (=> b!1492942 (= res!1015027 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48163 a!2862) j!93) a!2862 mask!2687) lt!650845))))

(declare-fun b!1492943 () Bool)

(declare-fun res!1015031 () Bool)

(assert (=> b!1492943 (=> (not res!1015031) (not e!836595))))

(assert (=> b!1492943 (= res!1015031 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492944 () Bool)

(assert (=> b!1492944 (= e!836597 (= lt!650842 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650844 lt!650841 mask!2687)))))

(declare-fun b!1492945 () Bool)

(declare-fun res!1015033 () Bool)

(assert (=> b!1492945 (=> (not res!1015033) (not e!836595))))

(assert (=> b!1492945 (= res!1015033 e!836597)))

(declare-fun c!138490 () Bool)

(assert (=> b!1492945 (= c!138490 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1015035 () Bool)

(assert (=> start!127182 (=> (not res!1015035) (not e!836591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127182 (= res!1015035 (validMask!0 mask!2687))))

(assert (=> start!127182 e!836591))

(assert (=> start!127182 true))

(declare-fun array_inv!37444 (array!99793) Bool)

(assert (=> start!127182 (array_inv!37444 a!2862)))

(assert (= (and start!127182 res!1015035) b!1492930))

(assert (= (and b!1492930 res!1015024) b!1492935))

(assert (= (and b!1492935 res!1015032) b!1492938))

(assert (= (and b!1492938 res!1015025) b!1492933))

(assert (= (and b!1492933 res!1015023) b!1492939))

(assert (= (and b!1492939 res!1015036) b!1492932))

(assert (= (and b!1492932 res!1015029) b!1492941))

(assert (= (and b!1492941 res!1015030) b!1492931))

(assert (= (and b!1492931 res!1015022) b!1492942))

(assert (= (and b!1492942 res!1015027) b!1492936))

(assert (= (and b!1492936 res!1015034) b!1492945))

(assert (= (and b!1492945 c!138490) b!1492944))

(assert (= (and b!1492945 (not c!138490)) b!1492937))

(assert (= (and b!1492945 res!1015033) b!1492943))

(assert (= (and b!1492943 res!1015031) b!1492929))

(assert (= (and b!1492929 res!1015028) b!1492934))

(assert (= (and b!1492934 res!1015026) b!1492940))

(assert (= (and b!1492929 (not res!1015037)) b!1492928))

(declare-fun m!1377055 () Bool)

(assert (=> b!1492944 m!1377055))

(declare-fun m!1377057 () Bool)

(assert (=> b!1492940 m!1377057))

(declare-fun m!1377059 () Bool)

(assert (=> b!1492940 m!1377059))

(declare-fun m!1377061 () Bool)

(assert (=> b!1492928 m!1377061))

(declare-fun m!1377063 () Bool)

(assert (=> b!1492929 m!1377063))

(declare-fun m!1377065 () Bool)

(assert (=> b!1492929 m!1377065))

(declare-fun m!1377067 () Bool)

(assert (=> b!1492929 m!1377067))

(declare-fun m!1377069 () Bool)

(assert (=> b!1492929 m!1377069))

(declare-fun m!1377071 () Bool)

(assert (=> b!1492929 m!1377071))

(assert (=> b!1492929 m!1377059))

(assert (=> b!1492931 m!1377059))

(assert (=> b!1492931 m!1377059))

(declare-fun m!1377073 () Bool)

(assert (=> b!1492931 m!1377073))

(assert (=> b!1492931 m!1377073))

(assert (=> b!1492931 m!1377059))

(declare-fun m!1377075 () Bool)

(assert (=> b!1492931 m!1377075))

(declare-fun m!1377077 () Bool)

(assert (=> b!1492935 m!1377077))

(assert (=> b!1492935 m!1377077))

(declare-fun m!1377079 () Bool)

(assert (=> b!1492935 m!1377079))

(declare-fun m!1377081 () Bool)

(assert (=> b!1492937 m!1377081))

(declare-fun m!1377083 () Bool)

(assert (=> b!1492937 m!1377083))

(assert (=> b!1492934 m!1377059))

(assert (=> b!1492934 m!1377059))

(declare-fun m!1377085 () Bool)

(assert (=> b!1492934 m!1377085))

(declare-fun m!1377087 () Bool)

(assert (=> start!127182 m!1377087))

(declare-fun m!1377089 () Bool)

(assert (=> start!127182 m!1377089))

(declare-fun m!1377091 () Bool)

(assert (=> b!1492939 m!1377091))

(assert (=> b!1492941 m!1377065))

(declare-fun m!1377093 () Bool)

(assert (=> b!1492941 m!1377093))

(declare-fun m!1377095 () Bool)

(assert (=> b!1492933 m!1377095))

(declare-fun m!1377097 () Bool)

(assert (=> b!1492936 m!1377097))

(assert (=> b!1492936 m!1377097))

(declare-fun m!1377099 () Bool)

(assert (=> b!1492936 m!1377099))

(assert (=> b!1492936 m!1377065))

(declare-fun m!1377101 () Bool)

(assert (=> b!1492936 m!1377101))

(assert (=> b!1492938 m!1377059))

(assert (=> b!1492938 m!1377059))

(declare-fun m!1377103 () Bool)

(assert (=> b!1492938 m!1377103))

(assert (=> b!1492942 m!1377059))

(assert (=> b!1492942 m!1377059))

(declare-fun m!1377105 () Bool)

(assert (=> b!1492942 m!1377105))

(check-sat (not b!1492939) (not b!1492938) (not b!1492933) (not b!1492934) (not b!1492935) (not b!1492936) (not b!1492944) (not b!1492929) (not b!1492942) (not b!1492937) (not b!1492931) (not start!127182) (not b!1492928))
(check-sat)
