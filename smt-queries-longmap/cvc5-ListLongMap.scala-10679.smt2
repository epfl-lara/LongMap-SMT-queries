; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125212 () Bool)

(assert start!125212)

(declare-fun b!1460549 () Bool)

(declare-fun res!990309 () Bool)

(declare-fun e!821225 () Bool)

(assert (=> b!1460549 (=> (not res!990309) (not e!821225))))

(declare-datatypes ((array!98660 0))(
  ( (array!98661 (arr!47618 (Array (_ BitVec 32) (_ BitVec 64))) (size!48168 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98660)

(declare-datatypes ((List!34119 0))(
  ( (Nil!34116) (Cons!34115 (h!35465 (_ BitVec 64)) (t!48813 List!34119)) )
))
(declare-fun arrayNoDuplicates!0 (array!98660 (_ BitVec 32) List!34119) Bool)

(assert (=> b!1460549 (= res!990309 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34116))))

(declare-fun b!1460550 () Bool)

(declare-fun res!990318 () Bool)

(declare-fun e!821223 () Bool)

(assert (=> b!1460550 (=> (not res!990318) (not e!821223))))

(declare-fun e!821219 () Bool)

(assert (=> b!1460550 (= res!990318 e!821219)))

(declare-fun c!134631 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460550 (= c!134631 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460551 () Bool)

(declare-fun res!990310 () Bool)

(declare-fun e!821221 () Bool)

(assert (=> b!1460551 (=> (not res!990310) (not e!821221))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11870 0))(
  ( (MissingZero!11870 (index!49872 (_ BitVec 32))) (Found!11870 (index!49873 (_ BitVec 32))) (Intermediate!11870 (undefined!12682 Bool) (index!49874 (_ BitVec 32)) (x!131479 (_ BitVec 32))) (Undefined!11870) (MissingVacant!11870 (index!49875 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98660 (_ BitVec 32)) SeekEntryResult!11870)

(assert (=> b!1460551 (= res!990310 (= (seekEntryOrOpen!0 (select (arr!47618 a!2862) j!93) a!2862 mask!2687) (Found!11870 j!93)))))

(declare-fun b!1460552 () Bool)

(declare-fun e!821222 () Bool)

(assert (=> b!1460552 (= e!821222 e!821223)))

(declare-fun res!990314 () Bool)

(assert (=> b!1460552 (=> (not res!990314) (not e!821223))))

(declare-fun lt!639854 () SeekEntryResult!11870)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460552 (= res!990314 (= lt!639854 (Intermediate!11870 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639856 () (_ BitVec 64))

(declare-fun lt!639855 () array!98660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98660 (_ BitVec 32)) SeekEntryResult!11870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460552 (= lt!639854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639856 mask!2687) lt!639856 lt!639855 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460552 (= lt!639856 (select (store (arr!47618 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460553 () Bool)

(declare-fun res!990313 () Bool)

(assert (=> b!1460553 (=> (not res!990313) (not e!821225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98660 (_ BitVec 32)) Bool)

(assert (=> b!1460553 (= res!990313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1460554 () Bool)

(assert (=> b!1460554 (= e!821221 (or (= (select (arr!47618 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47618 a!2862) intermediateBeforeIndex!19) (select (arr!47618 a!2862) j!93))))))

(declare-fun b!1460555 () Bool)

(declare-fun res!990320 () Bool)

(assert (=> b!1460555 (=> (not res!990320) (not e!821225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460555 (= res!990320 (validKeyInArray!0 (select (arr!47618 a!2862) i!1006)))))

(declare-fun b!1460556 () Bool)

(declare-fun e!821220 () Bool)

(assert (=> b!1460556 (= e!821225 e!821220)))

(declare-fun res!990319 () Bool)

(assert (=> b!1460556 (=> (not res!990319) (not e!821220))))

(assert (=> b!1460556 (= res!990319 (= (select (store (arr!47618 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460556 (= lt!639855 (array!98661 (store (arr!47618 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48168 a!2862)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1460557 () Bool)

(assert (=> b!1460557 (= e!821223 (not (or (and (= (select (arr!47618 a!2862) index!646) (select (store (arr!47618 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47618 a!2862) index!646) (select (arr!47618 a!2862) j!93))) (= (select (arr!47618 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1460557 e!821221))

(declare-fun res!990308 () Bool)

(assert (=> b!1460557 (=> (not res!990308) (not e!821221))))

(assert (=> b!1460557 (= res!990308 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49236 0))(
  ( (Unit!49237) )
))
(declare-fun lt!639857 () Unit!49236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49236)

(assert (=> b!1460557 (= lt!639857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460559 () Bool)

(assert (=> b!1460559 (= e!821220 e!821222)))

(declare-fun res!990311 () Bool)

(assert (=> b!1460559 (=> (not res!990311) (not e!821222))))

(declare-fun lt!639858 () SeekEntryResult!11870)

(assert (=> b!1460559 (= res!990311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47618 a!2862) j!93) mask!2687) (select (arr!47618 a!2862) j!93) a!2862 mask!2687) lt!639858))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460559 (= lt!639858 (Intermediate!11870 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460560 () Bool)

(declare-fun res!990317 () Bool)

(assert (=> b!1460560 (=> (not res!990317) (not e!821225))))

(assert (=> b!1460560 (= res!990317 (and (= (size!48168 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48168 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48168 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460561 () Bool)

(assert (=> b!1460561 (= e!821219 (= lt!639854 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639856 lt!639855 mask!2687)))))

(declare-fun b!1460562 () Bool)

(declare-fun res!990322 () Bool)

(assert (=> b!1460562 (=> (not res!990322) (not e!821223))))

(assert (=> b!1460562 (= res!990322 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460563 () Bool)

(declare-fun res!990316 () Bool)

(assert (=> b!1460563 (=> (not res!990316) (not e!821225))))

(assert (=> b!1460563 (= res!990316 (validKeyInArray!0 (select (arr!47618 a!2862) j!93)))))

(declare-fun b!1460558 () Bool)

(declare-fun res!990315 () Bool)

(assert (=> b!1460558 (=> (not res!990315) (not e!821222))))

(assert (=> b!1460558 (= res!990315 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47618 a!2862) j!93) a!2862 mask!2687) lt!639858))))

(declare-fun res!990312 () Bool)

(assert (=> start!125212 (=> (not res!990312) (not e!821225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125212 (= res!990312 (validMask!0 mask!2687))))

(assert (=> start!125212 e!821225))

(assert (=> start!125212 true))

(declare-fun array_inv!36646 (array!98660) Bool)

(assert (=> start!125212 (array_inv!36646 a!2862)))

(declare-fun b!1460564 () Bool)

(declare-fun res!990321 () Bool)

(assert (=> b!1460564 (=> (not res!990321) (not e!821225))))

(assert (=> b!1460564 (= res!990321 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48168 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48168 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48168 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460565 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98660 (_ BitVec 32)) SeekEntryResult!11870)

(assert (=> b!1460565 (= e!821219 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639856 lt!639855 mask!2687) (seekEntryOrOpen!0 lt!639856 lt!639855 mask!2687)))))

(assert (= (and start!125212 res!990312) b!1460560))

(assert (= (and b!1460560 res!990317) b!1460555))

(assert (= (and b!1460555 res!990320) b!1460563))

(assert (= (and b!1460563 res!990316) b!1460553))

(assert (= (and b!1460553 res!990313) b!1460549))

(assert (= (and b!1460549 res!990309) b!1460564))

(assert (= (and b!1460564 res!990321) b!1460556))

(assert (= (and b!1460556 res!990319) b!1460559))

(assert (= (and b!1460559 res!990311) b!1460558))

(assert (= (and b!1460558 res!990315) b!1460552))

(assert (= (and b!1460552 res!990314) b!1460550))

(assert (= (and b!1460550 c!134631) b!1460561))

(assert (= (and b!1460550 (not c!134631)) b!1460565))

(assert (= (and b!1460550 res!990318) b!1460562))

(assert (= (and b!1460562 res!990322) b!1460557))

(assert (= (and b!1460557 res!990308) b!1460551))

(assert (= (and b!1460551 res!990310) b!1460554))

(declare-fun m!1348225 () Bool)

(assert (=> b!1460552 m!1348225))

(assert (=> b!1460552 m!1348225))

(declare-fun m!1348227 () Bool)

(assert (=> b!1460552 m!1348227))

(declare-fun m!1348229 () Bool)

(assert (=> b!1460552 m!1348229))

(declare-fun m!1348231 () Bool)

(assert (=> b!1460552 m!1348231))

(declare-fun m!1348233 () Bool)

(assert (=> b!1460561 m!1348233))

(declare-fun m!1348235 () Bool)

(assert (=> b!1460549 m!1348235))

(declare-fun m!1348237 () Bool)

(assert (=> b!1460558 m!1348237))

(assert (=> b!1460558 m!1348237))

(declare-fun m!1348239 () Bool)

(assert (=> b!1460558 m!1348239))

(assert (=> b!1460563 m!1348237))

(assert (=> b!1460563 m!1348237))

(declare-fun m!1348241 () Bool)

(assert (=> b!1460563 m!1348241))

(assert (=> b!1460559 m!1348237))

(assert (=> b!1460559 m!1348237))

(declare-fun m!1348243 () Bool)

(assert (=> b!1460559 m!1348243))

(assert (=> b!1460559 m!1348243))

(assert (=> b!1460559 m!1348237))

(declare-fun m!1348245 () Bool)

(assert (=> b!1460559 m!1348245))

(assert (=> b!1460556 m!1348229))

(declare-fun m!1348247 () Bool)

(assert (=> b!1460556 m!1348247))

(declare-fun m!1348249 () Bool)

(assert (=> b!1460553 m!1348249))

(declare-fun m!1348251 () Bool)

(assert (=> start!125212 m!1348251))

(declare-fun m!1348253 () Bool)

(assert (=> start!125212 m!1348253))

(declare-fun m!1348255 () Bool)

(assert (=> b!1460565 m!1348255))

(declare-fun m!1348257 () Bool)

(assert (=> b!1460565 m!1348257))

(declare-fun m!1348259 () Bool)

(assert (=> b!1460554 m!1348259))

(assert (=> b!1460554 m!1348237))

(assert (=> b!1460551 m!1348237))

(assert (=> b!1460551 m!1348237))

(declare-fun m!1348261 () Bool)

(assert (=> b!1460551 m!1348261))

(declare-fun m!1348263 () Bool)

(assert (=> b!1460555 m!1348263))

(assert (=> b!1460555 m!1348263))

(declare-fun m!1348265 () Bool)

(assert (=> b!1460555 m!1348265))

(declare-fun m!1348267 () Bool)

(assert (=> b!1460557 m!1348267))

(assert (=> b!1460557 m!1348229))

(declare-fun m!1348269 () Bool)

(assert (=> b!1460557 m!1348269))

(declare-fun m!1348271 () Bool)

(assert (=> b!1460557 m!1348271))

(declare-fun m!1348273 () Bool)

(assert (=> b!1460557 m!1348273))

(assert (=> b!1460557 m!1348237))

(push 1)

(assert (not b!1460561))

(assert (not b!1460549))

(assert (not b!1460558))

(assert (not b!1460565))

(assert (not b!1460557))

(assert (not b!1460555))

(assert (not b!1460553))

(assert (not b!1460551))

(assert (not start!125212))

(assert (not b!1460552))

(assert (not b!1460563))

(assert (not b!1460559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

