; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124802 () Bool)

(assert start!124802)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!815526 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1448085 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!635405 () (_ BitVec 64))

(declare-datatypes ((array!98250 0))(
  ( (array!98251 (arr!47413 (Array (_ BitVec 32) (_ BitVec 64))) (size!47963 (_ BitVec 32))) )
))
(declare-fun lt!635406 () array!98250)

(declare-datatypes ((SeekEntryResult!11665 0))(
  ( (MissingZero!11665 (index!49052 (_ BitVec 32))) (Found!11665 (index!49053 (_ BitVec 32))) (Intermediate!11665 (undefined!12477 Bool) (index!49054 (_ BitVec 32)) (x!130722 (_ BitVec 32))) (Undefined!11665) (MissingVacant!11665 (index!49055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98250 (_ BitVec 32)) SeekEntryResult!11665)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98250 (_ BitVec 32)) SeekEntryResult!11665)

(assert (=> b!1448085 (= e!815526 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635405 lt!635406 mask!2687) (seekEntryOrOpen!0 lt!635405 lt!635406 mask!2687)))))

(declare-fun e!815530 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448086 () Bool)

(assert (=> b!1448086 (= e!815530 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448087 () Bool)

(declare-fun res!979672 () Bool)

(declare-fun e!815525 () Bool)

(assert (=> b!1448087 (=> (not res!979672) (not e!815525))))

(declare-fun a!2862 () array!98250)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448087 (= res!979672 (validKeyInArray!0 (select (arr!47413 a!2862) i!1006)))))

(declare-fun b!1448088 () Bool)

(declare-fun e!815527 () Bool)

(declare-fun e!815529 () Bool)

(assert (=> b!1448088 (= e!815527 e!815529)))

(declare-fun res!979678 () Bool)

(assert (=> b!1448088 (=> (not res!979678) (not e!815529))))

(declare-fun lt!635400 () SeekEntryResult!11665)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98250 (_ BitVec 32)) SeekEntryResult!11665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448088 (= res!979678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47413 a!2862) j!93) mask!2687) (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!635400))))

(assert (=> b!1448088 (= lt!635400 (Intermediate!11665 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448089 () Bool)

(declare-fun res!979674 () Bool)

(assert (=> b!1448089 (=> (not res!979674) (not e!815525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98250 (_ BitVec 32)) Bool)

(assert (=> b!1448089 (= res!979674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448090 () Bool)

(declare-fun e!815533 () Bool)

(declare-fun e!815528 () Bool)

(assert (=> b!1448090 (= e!815533 e!815528)))

(declare-fun res!979673 () Bool)

(assert (=> b!1448090 (=> res!979673 e!815528)))

(assert (=> b!1448090 (= res!979673 (or (and (= (select (arr!47413 a!2862) index!646) (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47413 a!2862) index!646) (select (arr!47413 a!2862) j!93))) (not (= (select (arr!47413 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448091 () Bool)

(declare-fun res!979682 () Bool)

(assert (=> b!1448091 (=> (not res!979682) (not e!815529))))

(assert (=> b!1448091 (= res!979682 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!635400))))

(declare-fun b!1448093 () Bool)

(declare-fun e!815531 () Bool)

(assert (=> b!1448093 (= e!815531 true)))

(declare-fun lt!635402 () SeekEntryResult!11665)

(assert (=> b!1448093 (= lt!635402 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47413 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448094 () Bool)

(declare-fun res!979670 () Bool)

(assert (=> b!1448094 (=> (not res!979670) (not e!815525))))

(declare-datatypes ((List!33914 0))(
  ( (Nil!33911) (Cons!33910 (h!35260 (_ BitVec 64)) (t!48608 List!33914)) )
))
(declare-fun arrayNoDuplicates!0 (array!98250 (_ BitVec 32) List!33914) Bool)

(assert (=> b!1448094 (= res!979670 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33911))))

(declare-fun b!1448095 () Bool)

(declare-fun e!815534 () Bool)

(assert (=> b!1448095 (= e!815529 e!815534)))

(declare-fun res!979680 () Bool)

(assert (=> b!1448095 (=> (not res!979680) (not e!815534))))

(declare-fun lt!635404 () SeekEntryResult!11665)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448095 (= res!979680 (= lt!635404 (Intermediate!11665 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448095 (= lt!635404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635405 mask!2687) lt!635405 lt!635406 mask!2687))))

(assert (=> b!1448095 (= lt!635405 (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448096 () Bool)

(declare-fun res!979684 () Bool)

(assert (=> b!1448096 (=> (not res!979684) (not e!815525))))

(assert (=> b!1448096 (= res!979684 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47963 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47963 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47963 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448097 () Bool)

(declare-fun res!979679 () Bool)

(assert (=> b!1448097 (=> (not res!979679) (not e!815525))))

(assert (=> b!1448097 (= res!979679 (and (= (size!47963 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47963 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47963 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448098 () Bool)

(declare-fun res!979683 () Bool)

(assert (=> b!1448098 (=> (not res!979683) (not e!815534))))

(assert (=> b!1448098 (= res!979683 e!815526)))

(declare-fun c!133719 () Bool)

(assert (=> b!1448098 (= c!133719 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448099 () Bool)

(assert (=> b!1448099 (= e!815526 (= lt!635404 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635405 lt!635406 mask!2687)))))

(declare-fun b!1448100 () Bool)

(declare-fun res!979668 () Bool)

(assert (=> b!1448100 (=> (not res!979668) (not e!815534))))

(assert (=> b!1448100 (= res!979668 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448101 () Bool)

(declare-fun res!979676 () Bool)

(assert (=> b!1448101 (=> (not res!979676) (not e!815525))))

(assert (=> b!1448101 (= res!979676 (validKeyInArray!0 (select (arr!47413 a!2862) j!93)))))

(declare-fun b!1448092 () Bool)

(assert (=> b!1448092 (= e!815528 e!815530)))

(declare-fun res!979669 () Bool)

(assert (=> b!1448092 (=> (not res!979669) (not e!815530))))

(declare-fun lt!635403 () SeekEntryResult!11665)

(assert (=> b!1448092 (= res!979669 (= lt!635403 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47413 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!979671 () Bool)

(assert (=> start!124802 (=> (not res!979671) (not e!815525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124802 (= res!979671 (validMask!0 mask!2687))))

(assert (=> start!124802 e!815525))

(assert (=> start!124802 true))

(declare-fun array_inv!36441 (array!98250) Bool)

(assert (=> start!124802 (array_inv!36441 a!2862)))

(declare-fun b!1448102 () Bool)

(assert (=> b!1448102 (= e!815534 (not e!815531))))

(declare-fun res!979677 () Bool)

(assert (=> b!1448102 (=> res!979677 e!815531)))

(assert (=> b!1448102 (= res!979677 (or (and (= (select (arr!47413 a!2862) index!646) (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47413 a!2862) index!646) (select (arr!47413 a!2862) j!93))) (not (= (select (arr!47413 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448102 e!815533))

(declare-fun res!979675 () Bool)

(assert (=> b!1448102 (=> (not res!979675) (not e!815533))))

(assert (=> b!1448102 (= res!979675 (and (= lt!635403 (Found!11665 j!93)) (or (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) (select (arr!47413 a!2862) j!93)))))))

(assert (=> b!1448102 (= lt!635403 (seekEntryOrOpen!0 (select (arr!47413 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448102 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48826 0))(
  ( (Unit!48827) )
))
(declare-fun lt!635401 () Unit!48826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48826)

(assert (=> b!1448102 (= lt!635401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448103 () Bool)

(assert (=> b!1448103 (= e!815525 e!815527)))

(declare-fun res!979681 () Bool)

(assert (=> b!1448103 (=> (not res!979681) (not e!815527))))

(assert (=> b!1448103 (= res!979681 (= (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448103 (= lt!635406 (array!98251 (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47963 a!2862)))))

(assert (= (and start!124802 res!979671) b!1448097))

(assert (= (and b!1448097 res!979679) b!1448087))

(assert (= (and b!1448087 res!979672) b!1448101))

(assert (= (and b!1448101 res!979676) b!1448089))

(assert (= (and b!1448089 res!979674) b!1448094))

(assert (= (and b!1448094 res!979670) b!1448096))

(assert (= (and b!1448096 res!979684) b!1448103))

(assert (= (and b!1448103 res!979681) b!1448088))

(assert (= (and b!1448088 res!979678) b!1448091))

(assert (= (and b!1448091 res!979682) b!1448095))

(assert (= (and b!1448095 res!979680) b!1448098))

(assert (= (and b!1448098 c!133719) b!1448099))

(assert (= (and b!1448098 (not c!133719)) b!1448085))

(assert (= (and b!1448098 res!979683) b!1448100))

(assert (= (and b!1448100 res!979668) b!1448102))

(assert (= (and b!1448102 res!979675) b!1448090))

(assert (= (and b!1448090 (not res!979673)) b!1448092))

(assert (= (and b!1448092 res!979669) b!1448086))

(assert (= (and b!1448102 (not res!979677)) b!1448093))

(declare-fun m!1336867 () Bool)

(assert (=> b!1448095 m!1336867))

(assert (=> b!1448095 m!1336867))

(declare-fun m!1336869 () Bool)

(assert (=> b!1448095 m!1336869))

(declare-fun m!1336871 () Bool)

(assert (=> b!1448095 m!1336871))

(declare-fun m!1336873 () Bool)

(assert (=> b!1448095 m!1336873))

(declare-fun m!1336875 () Bool)

(assert (=> b!1448090 m!1336875))

(assert (=> b!1448090 m!1336871))

(declare-fun m!1336877 () Bool)

(assert (=> b!1448090 m!1336877))

(declare-fun m!1336879 () Bool)

(assert (=> b!1448090 m!1336879))

(assert (=> b!1448103 m!1336871))

(declare-fun m!1336881 () Bool)

(assert (=> b!1448103 m!1336881))

(assert (=> b!1448093 m!1336879))

(assert (=> b!1448093 m!1336879))

(declare-fun m!1336883 () Bool)

(assert (=> b!1448093 m!1336883))

(assert (=> b!1448088 m!1336879))

(assert (=> b!1448088 m!1336879))

(declare-fun m!1336885 () Bool)

(assert (=> b!1448088 m!1336885))

(assert (=> b!1448088 m!1336885))

(assert (=> b!1448088 m!1336879))

(declare-fun m!1336887 () Bool)

(assert (=> b!1448088 m!1336887))

(assert (=> b!1448101 m!1336879))

(assert (=> b!1448101 m!1336879))

(declare-fun m!1336889 () Bool)

(assert (=> b!1448101 m!1336889))

(declare-fun m!1336891 () Bool)

(assert (=> b!1448085 m!1336891))

(declare-fun m!1336893 () Bool)

(assert (=> b!1448085 m!1336893))

(declare-fun m!1336895 () Bool)

(assert (=> b!1448089 m!1336895))

(assert (=> b!1448092 m!1336879))

(assert (=> b!1448092 m!1336879))

(declare-fun m!1336897 () Bool)

(assert (=> b!1448092 m!1336897))

(declare-fun m!1336899 () Bool)

(assert (=> b!1448099 m!1336899))

(declare-fun m!1336901 () Bool)

(assert (=> b!1448094 m!1336901))

(assert (=> b!1448091 m!1336879))

(assert (=> b!1448091 m!1336879))

(declare-fun m!1336903 () Bool)

(assert (=> b!1448091 m!1336903))

(declare-fun m!1336905 () Bool)

(assert (=> b!1448102 m!1336905))

(assert (=> b!1448102 m!1336871))

(declare-fun m!1336907 () Bool)

(assert (=> b!1448102 m!1336907))

(assert (=> b!1448102 m!1336877))

(assert (=> b!1448102 m!1336875))

(assert (=> b!1448102 m!1336879))

(declare-fun m!1336909 () Bool)

(assert (=> b!1448102 m!1336909))

(declare-fun m!1336911 () Bool)

(assert (=> b!1448102 m!1336911))

(assert (=> b!1448102 m!1336879))

(declare-fun m!1336913 () Bool)

(assert (=> start!124802 m!1336913))

(declare-fun m!1336915 () Bool)

(assert (=> start!124802 m!1336915))

(declare-fun m!1336917 () Bool)

(assert (=> b!1448087 m!1336917))

(assert (=> b!1448087 m!1336917))

(declare-fun m!1336919 () Bool)

(assert (=> b!1448087 m!1336919))

(push 1)

