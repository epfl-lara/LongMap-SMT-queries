; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125236 () Bool)

(assert start!125236)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!821539 () Bool)

(declare-fun lt!640076 () (_ BitVec 32))

(declare-fun b!1461261 () Bool)

(declare-datatypes ((array!98684 0))(
  ( (array!98685 (arr!47630 (Array (_ BitVec 32) (_ BitVec 64))) (size!48180 (_ BitVec 32))) )
))
(declare-fun lt!640079 () array!98684)

(declare-datatypes ((SeekEntryResult!11882 0))(
  ( (MissingZero!11882 (index!49920 (_ BitVec 32))) (Found!11882 (index!49921 (_ BitVec 32))) (Intermediate!11882 (undefined!12694 Bool) (index!49922 (_ BitVec 32)) (x!131523 (_ BitVec 32))) (Undefined!11882) (MissingVacant!11882 (index!49923 (_ BitVec 32))) )
))
(declare-fun lt!640080 () SeekEntryResult!11882)

(declare-fun lt!640077 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98684 (_ BitVec 32)) SeekEntryResult!11882)

(assert (=> b!1461261 (= e!821539 (not (= lt!640080 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640076 lt!640077 lt!640079 mask!2687))))))

(declare-fun b!1461262 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98684 (_ BitVec 32)) SeekEntryResult!11882)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98684 (_ BitVec 32)) SeekEntryResult!11882)

(assert (=> b!1461262 (= e!821539 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640076 intermediateAfterIndex!19 lt!640077 lt!640079 mask!2687) (seekEntryOrOpen!0 lt!640077 lt!640079 mask!2687))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1461263 () Bool)

(declare-fun e!821535 () Bool)

(declare-fun a!2862 () array!98684)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461263 (= e!821535 (or (= (select (arr!47630 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47630 a!2862) intermediateBeforeIndex!19) (select (arr!47630 a!2862) j!93))))))

(declare-fun b!1461264 () Bool)

(declare-fun res!990919 () Bool)

(declare-fun e!821534 () Bool)

(assert (=> b!1461264 (=> res!990919 e!821534)))

(declare-fun lt!640075 () SeekEntryResult!11882)

(assert (=> b!1461264 (= res!990919 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640076 (select (arr!47630 a!2862) j!93) a!2862 mask!2687) lt!640075)))))

(declare-fun b!1461265 () Bool)

(declare-fun res!990925 () Bool)

(declare-fun e!821532 () Bool)

(assert (=> b!1461265 (=> (not res!990925) (not e!821532))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461265 (= res!990925 (and (= (size!48180 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48180 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48180 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461266 () Bool)

(declare-fun res!990909 () Bool)

(assert (=> b!1461266 (=> (not res!990909) (not e!821532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98684 (_ BitVec 32)) Bool)

(assert (=> b!1461266 (= res!990909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461267 () Bool)

(declare-fun e!821536 () Bool)

(declare-fun e!821533 () Bool)

(assert (=> b!1461267 (= e!821536 e!821533)))

(declare-fun res!990912 () Bool)

(assert (=> b!1461267 (=> (not res!990912) (not e!821533))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461267 (= res!990912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47630 a!2862) j!93) mask!2687) (select (arr!47630 a!2862) j!93) a!2862 mask!2687) lt!640075))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461267 (= lt!640075 (Intermediate!11882 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461268 () Bool)

(declare-fun res!990921 () Bool)

(assert (=> b!1461268 (=> (not res!990921) (not e!821532))))

(declare-datatypes ((List!34131 0))(
  ( (Nil!34128) (Cons!34127 (h!35477 (_ BitVec 64)) (t!48825 List!34131)) )
))
(declare-fun arrayNoDuplicates!0 (array!98684 (_ BitVec 32) List!34131) Bool)

(assert (=> b!1461268 (= res!990921 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34128))))

(declare-fun b!1461269 () Bool)

(declare-fun res!990920 () Bool)

(assert (=> b!1461269 (=> (not res!990920) (not e!821535))))

(assert (=> b!1461269 (= res!990920 (= (seekEntryOrOpen!0 (select (arr!47630 a!2862) j!93) a!2862 mask!2687) (Found!11882 j!93)))))

(declare-fun b!1461270 () Bool)

(declare-fun res!990908 () Bool)

(declare-fun e!821540 () Bool)

(assert (=> b!1461270 (=> (not res!990908) (not e!821540))))

(assert (=> b!1461270 (= res!990908 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!990924 () Bool)

(assert (=> start!125236 (=> (not res!990924) (not e!821532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125236 (= res!990924 (validMask!0 mask!2687))))

(assert (=> start!125236 e!821532))

(assert (=> start!125236 true))

(declare-fun array_inv!36658 (array!98684) Bool)

(assert (=> start!125236 (array_inv!36658 a!2862)))

(declare-fun b!1461271 () Bool)

(declare-fun res!990917 () Bool)

(assert (=> b!1461271 (=> (not res!990917) (not e!821532))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1461271 (= res!990917 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48180 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48180 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48180 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461272 () Bool)

(assert (=> b!1461272 (= e!821534 true)))

(declare-fun lt!640078 () Bool)

(assert (=> b!1461272 (= lt!640078 e!821539)))

(declare-fun c!134688 () Bool)

(assert (=> b!1461272 (= c!134688 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461273 () Bool)

(declare-fun res!990915 () Bool)

(assert (=> b!1461273 (=> (not res!990915) (not e!821533))))

(assert (=> b!1461273 (= res!990915 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47630 a!2862) j!93) a!2862 mask!2687) lt!640075))))

(declare-fun b!1461274 () Bool)

(declare-fun e!821537 () Bool)

(assert (=> b!1461274 (= e!821540 (not e!821537))))

(declare-fun res!990916 () Bool)

(assert (=> b!1461274 (=> res!990916 e!821537)))

(assert (=> b!1461274 (= res!990916 (or (and (= (select (arr!47630 a!2862) index!646) (select (store (arr!47630 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47630 a!2862) index!646) (select (arr!47630 a!2862) j!93))) (= (select (arr!47630 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461274 e!821535))

(declare-fun res!990911 () Bool)

(assert (=> b!1461274 (=> (not res!990911) (not e!821535))))

(assert (=> b!1461274 (= res!990911 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49260 0))(
  ( (Unit!49261) )
))
(declare-fun lt!640074 () Unit!49260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49260)

(assert (=> b!1461274 (= lt!640074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!821538 () Bool)

(declare-fun b!1461275 () Bool)

(assert (=> b!1461275 (= e!821538 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640077 lt!640079 mask!2687) (seekEntryOrOpen!0 lt!640077 lt!640079 mask!2687)))))

(declare-fun b!1461276 () Bool)

(declare-fun res!990910 () Bool)

(assert (=> b!1461276 (=> (not res!990910) (not e!821540))))

(assert (=> b!1461276 (= res!990910 e!821538)))

(declare-fun c!134687 () Bool)

(assert (=> b!1461276 (= c!134687 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461277 () Bool)

(assert (=> b!1461277 (= e!821538 (= lt!640080 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640077 lt!640079 mask!2687)))))

(declare-fun b!1461278 () Bool)

(assert (=> b!1461278 (= e!821537 e!821534)))

(declare-fun res!990923 () Bool)

(assert (=> b!1461278 (=> res!990923 e!821534)))

(assert (=> b!1461278 (= res!990923 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640076 #b00000000000000000000000000000000) (bvsge lt!640076 (size!48180 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461278 (= lt!640076 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461279 () Bool)

(assert (=> b!1461279 (= e!821532 e!821536)))

(declare-fun res!990922 () Bool)

(assert (=> b!1461279 (=> (not res!990922) (not e!821536))))

(assert (=> b!1461279 (= res!990922 (= (select (store (arr!47630 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461279 (= lt!640079 (array!98685 (store (arr!47630 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48180 a!2862)))))

(declare-fun b!1461280 () Bool)

(declare-fun res!990914 () Bool)

(assert (=> b!1461280 (=> (not res!990914) (not e!821532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461280 (= res!990914 (validKeyInArray!0 (select (arr!47630 a!2862) j!93)))))

(declare-fun b!1461281 () Bool)

(assert (=> b!1461281 (= e!821533 e!821540)))

(declare-fun res!990918 () Bool)

(assert (=> b!1461281 (=> (not res!990918) (not e!821540))))

(assert (=> b!1461281 (= res!990918 (= lt!640080 (Intermediate!11882 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461281 (= lt!640080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640077 mask!2687) lt!640077 lt!640079 mask!2687))))

(assert (=> b!1461281 (= lt!640077 (select (store (arr!47630 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461282 () Bool)

(declare-fun res!990913 () Bool)

(assert (=> b!1461282 (=> (not res!990913) (not e!821532))))

(assert (=> b!1461282 (= res!990913 (validKeyInArray!0 (select (arr!47630 a!2862) i!1006)))))

(assert (= (and start!125236 res!990924) b!1461265))

(assert (= (and b!1461265 res!990925) b!1461282))

(assert (= (and b!1461282 res!990913) b!1461280))

(assert (= (and b!1461280 res!990914) b!1461266))

(assert (= (and b!1461266 res!990909) b!1461268))

(assert (= (and b!1461268 res!990921) b!1461271))

(assert (= (and b!1461271 res!990917) b!1461279))

(assert (= (and b!1461279 res!990922) b!1461267))

(assert (= (and b!1461267 res!990912) b!1461273))

(assert (= (and b!1461273 res!990915) b!1461281))

(assert (= (and b!1461281 res!990918) b!1461276))

(assert (= (and b!1461276 c!134687) b!1461277))

(assert (= (and b!1461276 (not c!134687)) b!1461275))

(assert (= (and b!1461276 res!990910) b!1461270))

(assert (= (and b!1461270 res!990908) b!1461274))

(assert (= (and b!1461274 res!990911) b!1461269))

(assert (= (and b!1461269 res!990920) b!1461263))

(assert (= (and b!1461274 (not res!990916)) b!1461278))

(assert (= (and b!1461278 (not res!990923)) b!1461264))

(assert (= (and b!1461264 (not res!990919)) b!1461272))

(assert (= (and b!1461272 c!134688) b!1461261))

(assert (= (and b!1461272 (not c!134688)) b!1461262))

(declare-fun m!1348861 () Bool)

(assert (=> start!125236 m!1348861))

(declare-fun m!1348863 () Bool)

(assert (=> start!125236 m!1348863))

(declare-fun m!1348865 () Bool)

(assert (=> b!1461268 m!1348865))

(declare-fun m!1348867 () Bool)

(assert (=> b!1461262 m!1348867))

(declare-fun m!1348869 () Bool)

(assert (=> b!1461262 m!1348869))

(declare-fun m!1348871 () Bool)

(assert (=> b!1461277 m!1348871))

(declare-fun m!1348873 () Bool)

(assert (=> b!1461273 m!1348873))

(assert (=> b!1461273 m!1348873))

(declare-fun m!1348875 () Bool)

(assert (=> b!1461273 m!1348875))

(assert (=> b!1461264 m!1348873))

(assert (=> b!1461264 m!1348873))

(declare-fun m!1348877 () Bool)

(assert (=> b!1461264 m!1348877))

(declare-fun m!1348879 () Bool)

(assert (=> b!1461278 m!1348879))

(declare-fun m!1348881 () Bool)

(assert (=> b!1461281 m!1348881))

(assert (=> b!1461281 m!1348881))

(declare-fun m!1348883 () Bool)

(assert (=> b!1461281 m!1348883))

(declare-fun m!1348885 () Bool)

(assert (=> b!1461281 m!1348885))

(declare-fun m!1348887 () Bool)

(assert (=> b!1461281 m!1348887))

(declare-fun m!1348889 () Bool)

(assert (=> b!1461263 m!1348889))

(assert (=> b!1461263 m!1348873))

(assert (=> b!1461267 m!1348873))

(assert (=> b!1461267 m!1348873))

(declare-fun m!1348891 () Bool)

(assert (=> b!1461267 m!1348891))

(assert (=> b!1461267 m!1348891))

(assert (=> b!1461267 m!1348873))

(declare-fun m!1348893 () Bool)

(assert (=> b!1461267 m!1348893))

(declare-fun m!1348895 () Bool)

(assert (=> b!1461261 m!1348895))

(assert (=> b!1461279 m!1348885))

(declare-fun m!1348897 () Bool)

(assert (=> b!1461279 m!1348897))

(assert (=> b!1461269 m!1348873))

(assert (=> b!1461269 m!1348873))

(declare-fun m!1348899 () Bool)

(assert (=> b!1461269 m!1348899))

(declare-fun m!1348901 () Bool)

(assert (=> b!1461282 m!1348901))

(assert (=> b!1461282 m!1348901))

(declare-fun m!1348903 () Bool)

(assert (=> b!1461282 m!1348903))

(declare-fun m!1348905 () Bool)

(assert (=> b!1461274 m!1348905))

(assert (=> b!1461274 m!1348885))

(declare-fun m!1348907 () Bool)

(assert (=> b!1461274 m!1348907))

(declare-fun m!1348909 () Bool)

(assert (=> b!1461274 m!1348909))

(declare-fun m!1348911 () Bool)

(assert (=> b!1461274 m!1348911))

(assert (=> b!1461274 m!1348873))

(declare-fun m!1348913 () Bool)

(assert (=> b!1461275 m!1348913))

(assert (=> b!1461275 m!1348869))

(assert (=> b!1461280 m!1348873))

(assert (=> b!1461280 m!1348873))

(declare-fun m!1348915 () Bool)

(assert (=> b!1461280 m!1348915))

(declare-fun m!1348917 () Bool)

(assert (=> b!1461266 m!1348917))

(push 1)

