; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125788 () Bool)

(assert start!125788)

(declare-fun b!1472264 () Bool)

(declare-fun res!999950 () Bool)

(declare-fun e!826277 () Bool)

(assert (=> b!1472264 (=> (not res!999950) (not e!826277))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99122 0))(
  ( (array!99123 (arr!47846 (Array (_ BitVec 32) (_ BitVec 64))) (size!48396 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99122)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472264 (= res!999950 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48396 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48396 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48396 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999953 () Bool)

(assert (=> start!125788 (=> (not res!999953) (not e!826277))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125788 (= res!999953 (validMask!0 mask!2687))))

(assert (=> start!125788 e!826277))

(assert (=> start!125788 true))

(declare-fun array_inv!36874 (array!99122) Bool)

(assert (=> start!125788 (array_inv!36874 a!2862)))

(declare-fun b!1472265 () Bool)

(declare-fun res!999954 () Bool)

(declare-fun e!826279 () Bool)

(assert (=> b!1472265 (=> (not res!999954) (not e!826279))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472265 (= res!999954 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!826278 () Bool)

(declare-fun b!1472266 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472266 (= e!826278 (or (= (select (arr!47846 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47846 a!2862) intermediateBeforeIndex!19) (select (arr!47846 a!2862) j!93))))))

(declare-fun b!1472267 () Bool)

(declare-fun res!999959 () Bool)

(assert (=> b!1472267 (=> (not res!999959) (not e!826277))))

(declare-datatypes ((List!34347 0))(
  ( (Nil!34344) (Cons!34343 (h!35699 (_ BitVec 64)) (t!49041 List!34347)) )
))
(declare-fun arrayNoDuplicates!0 (array!99122 (_ BitVec 32) List!34347) Bool)

(assert (=> b!1472267 (= res!999959 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34344))))

(declare-fun b!1472268 () Bool)

(declare-fun res!999947 () Bool)

(assert (=> b!1472268 (=> (not res!999947) (not e!826279))))

(declare-fun e!826282 () Bool)

(assert (=> b!1472268 (= res!999947 e!826282)))

(declare-fun c!135672 () Bool)

(assert (=> b!1472268 (= c!135672 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472269 () Bool)

(declare-fun res!999948 () Bool)

(assert (=> b!1472269 (=> (not res!999948) (not e!826277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472269 (= res!999948 (validKeyInArray!0 (select (arr!47846 a!2862) i!1006)))))

(declare-fun b!1472270 () Bool)

(declare-fun e!826283 () Bool)

(declare-fun e!826281 () Bool)

(assert (=> b!1472270 (= e!826283 e!826281)))

(declare-fun res!999958 () Bool)

(assert (=> b!1472270 (=> (not res!999958) (not e!826281))))

(declare-datatypes ((SeekEntryResult!12086 0))(
  ( (MissingZero!12086 (index!50736 (_ BitVec 32))) (Found!12086 (index!50737 (_ BitVec 32))) (Intermediate!12086 (undefined!12898 Bool) (index!50738 (_ BitVec 32)) (x!132321 (_ BitVec 32))) (Undefined!12086) (MissingVacant!12086 (index!50739 (_ BitVec 32))) )
))
(declare-fun lt!643521 () SeekEntryResult!12086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99122 (_ BitVec 32)) SeekEntryResult!12086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472270 (= res!999958 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47846 a!2862) j!93) mask!2687) (select (arr!47846 a!2862) j!93) a!2862 mask!2687) lt!643521))))

(assert (=> b!1472270 (= lt!643521 (Intermediate!12086 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472271 () Bool)

(declare-fun res!999956 () Bool)

(assert (=> b!1472271 (=> (not res!999956) (not e!826277))))

(assert (=> b!1472271 (= res!999956 (validKeyInArray!0 (select (arr!47846 a!2862) j!93)))))

(declare-fun b!1472272 () Bool)

(declare-fun res!999960 () Bool)

(assert (=> b!1472272 (=> (not res!999960) (not e!826278))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99122 (_ BitVec 32)) SeekEntryResult!12086)

(assert (=> b!1472272 (= res!999960 (= (seekEntryOrOpen!0 (select (arr!47846 a!2862) j!93) a!2862 mask!2687) (Found!12086 j!93)))))

(declare-fun b!1472273 () Bool)

(declare-fun lt!643522 () (_ BitVec 64))

(declare-fun lt!643524 () array!99122)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99122 (_ BitVec 32)) SeekEntryResult!12086)

(assert (=> b!1472273 (= e!826282 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643522 lt!643524 mask!2687) (seekEntryOrOpen!0 lt!643522 lt!643524 mask!2687)))))

(declare-fun b!1472274 () Bool)

(assert (=> b!1472274 (= e!826279 (not true))))

(assert (=> b!1472274 e!826278))

(declare-fun res!999957 () Bool)

(assert (=> b!1472274 (=> (not res!999957) (not e!826278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99122 (_ BitVec 32)) Bool)

(assert (=> b!1472274 (= res!999957 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49512 0))(
  ( (Unit!49513) )
))
(declare-fun lt!643523 () Unit!49512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49512)

(assert (=> b!1472274 (= lt!643523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!643520 () SeekEntryResult!12086)

(declare-fun b!1472275 () Bool)

(assert (=> b!1472275 (= e!826282 (= lt!643520 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643522 lt!643524 mask!2687)))))

(declare-fun b!1472276 () Bool)

(assert (=> b!1472276 (= e!826277 e!826283)))

(declare-fun res!999961 () Bool)

(assert (=> b!1472276 (=> (not res!999961) (not e!826283))))

(assert (=> b!1472276 (= res!999961 (= (select (store (arr!47846 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472276 (= lt!643524 (array!99123 (store (arr!47846 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48396 a!2862)))))

(declare-fun b!1472277 () Bool)

(declare-fun res!999949 () Bool)

(assert (=> b!1472277 (=> (not res!999949) (not e!826281))))

(assert (=> b!1472277 (= res!999949 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47846 a!2862) j!93) a!2862 mask!2687) lt!643521))))

(declare-fun b!1472278 () Bool)

(declare-fun res!999955 () Bool)

(assert (=> b!1472278 (=> (not res!999955) (not e!826277))))

(assert (=> b!1472278 (= res!999955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472279 () Bool)

(declare-fun res!999951 () Bool)

(assert (=> b!1472279 (=> (not res!999951) (not e!826277))))

(assert (=> b!1472279 (= res!999951 (and (= (size!48396 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48396 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48396 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472280 () Bool)

(assert (=> b!1472280 (= e!826281 e!826279)))

(declare-fun res!999952 () Bool)

(assert (=> b!1472280 (=> (not res!999952) (not e!826279))))

(assert (=> b!1472280 (= res!999952 (= lt!643520 (Intermediate!12086 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472280 (= lt!643520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643522 mask!2687) lt!643522 lt!643524 mask!2687))))

(assert (=> b!1472280 (= lt!643522 (select (store (arr!47846 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125788 res!999953) b!1472279))

(assert (= (and b!1472279 res!999951) b!1472269))

(assert (= (and b!1472269 res!999948) b!1472271))

(assert (= (and b!1472271 res!999956) b!1472278))

(assert (= (and b!1472278 res!999955) b!1472267))

(assert (= (and b!1472267 res!999959) b!1472264))

(assert (= (and b!1472264 res!999950) b!1472276))

(assert (= (and b!1472276 res!999961) b!1472270))

(assert (= (and b!1472270 res!999958) b!1472277))

(assert (= (and b!1472277 res!999949) b!1472280))

(assert (= (and b!1472280 res!999952) b!1472268))

(assert (= (and b!1472268 c!135672) b!1472275))

(assert (= (and b!1472268 (not c!135672)) b!1472273))

(assert (= (and b!1472268 res!999947) b!1472265))

(assert (= (and b!1472265 res!999954) b!1472274))

(assert (= (and b!1472274 res!999957) b!1472272))

(assert (= (and b!1472272 res!999960) b!1472266))

(declare-fun m!1358995 () Bool)

(assert (=> b!1472267 m!1358995))

(declare-fun m!1358997 () Bool)

(assert (=> b!1472277 m!1358997))

(assert (=> b!1472277 m!1358997))

(declare-fun m!1358999 () Bool)

(assert (=> b!1472277 m!1358999))

(assert (=> b!1472271 m!1358997))

(assert (=> b!1472271 m!1358997))

(declare-fun m!1359001 () Bool)

(assert (=> b!1472271 m!1359001))

(declare-fun m!1359003 () Bool)

(assert (=> start!125788 m!1359003))

(declare-fun m!1359005 () Bool)

(assert (=> start!125788 m!1359005))

(declare-fun m!1359007 () Bool)

(assert (=> b!1472278 m!1359007))

(declare-fun m!1359009 () Bool)

(assert (=> b!1472275 m!1359009))

(declare-fun m!1359011 () Bool)

(assert (=> b!1472273 m!1359011))

(declare-fun m!1359013 () Bool)

(assert (=> b!1472273 m!1359013))

(assert (=> b!1472272 m!1358997))

(assert (=> b!1472272 m!1358997))

(declare-fun m!1359015 () Bool)

(assert (=> b!1472272 m!1359015))

(assert (=> b!1472270 m!1358997))

(assert (=> b!1472270 m!1358997))

(declare-fun m!1359017 () Bool)

(assert (=> b!1472270 m!1359017))

(assert (=> b!1472270 m!1359017))

(assert (=> b!1472270 m!1358997))

(declare-fun m!1359019 () Bool)

(assert (=> b!1472270 m!1359019))

(declare-fun m!1359021 () Bool)

(assert (=> b!1472276 m!1359021))

(declare-fun m!1359023 () Bool)

(assert (=> b!1472276 m!1359023))

(declare-fun m!1359025 () Bool)

(assert (=> b!1472269 m!1359025))

(assert (=> b!1472269 m!1359025))

(declare-fun m!1359027 () Bool)

(assert (=> b!1472269 m!1359027))

(declare-fun m!1359029 () Bool)

(assert (=> b!1472266 m!1359029))

(assert (=> b!1472266 m!1358997))

(declare-fun m!1359031 () Bool)

(assert (=> b!1472274 m!1359031))

(declare-fun m!1359033 () Bool)

(assert (=> b!1472274 m!1359033))

(declare-fun m!1359035 () Bool)

(assert (=> b!1472280 m!1359035))

(assert (=> b!1472280 m!1359035))

(declare-fun m!1359037 () Bool)

(assert (=> b!1472280 m!1359037))

(assert (=> b!1472280 m!1359021))

(declare-fun m!1359039 () Bool)

(assert (=> b!1472280 m!1359039))

(push 1)

