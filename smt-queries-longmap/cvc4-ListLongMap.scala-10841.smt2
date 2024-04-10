; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126896 () Bool)

(assert start!126896)

(declare-fun b!1491004 () Bool)

(declare-fun e!835436 () Bool)

(declare-fun e!835437 () Bool)

(assert (=> b!1491004 (= e!835436 e!835437)))

(declare-fun res!1014227 () Bool)

(assert (=> b!1491004 (=> (not res!1014227) (not e!835437))))

(declare-datatypes ((SeekEntryResult!12346 0))(
  ( (MissingZero!12346 (index!51776 (_ BitVec 32))) (Found!12346 (index!51777 (_ BitVec 32))) (Intermediate!12346 (undefined!13158 Bool) (index!51778 (_ BitVec 32)) (x!133362 (_ BitVec 32))) (Undefined!12346) (MissingVacant!12346 (index!51779 (_ BitVec 32))) )
))
(declare-fun lt!650136 () SeekEntryResult!12346)

(declare-datatypes ((array!99669 0))(
  ( (array!99670 (arr!48106 (Array (_ BitVec 32) (_ BitVec 64))) (size!48656 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99669)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99669 (_ BitVec 32)) SeekEntryResult!12346)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491004 (= res!1014227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48106 a!2862) j!93) mask!2687) (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!650136))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491004 (= lt!650136 (Intermediate!12346 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491005 () Bool)

(declare-fun e!835434 () Bool)

(assert (=> b!1491005 (= e!835437 e!835434)))

(declare-fun res!1014225 () Bool)

(assert (=> b!1491005 (=> (not res!1014225) (not e!835434))))

(declare-fun lt!650132 () SeekEntryResult!12346)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491005 (= res!1014225 (= lt!650132 (Intermediate!12346 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650135 () array!99669)

(declare-fun lt!650133 () (_ BitVec 64))

(assert (=> b!1491005 (= lt!650132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650133 mask!2687) lt!650133 lt!650135 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491005 (= lt!650133 (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491006 () Bool)

(declare-fun res!1014226 () Bool)

(declare-fun e!835438 () Bool)

(assert (=> b!1491006 (=> (not res!1014226) (not e!835438))))

(assert (=> b!1491006 (= res!1014226 (and (= (size!48656 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48656 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48656 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491007 () Bool)

(assert (=> b!1491007 (= e!835438 e!835436)))

(declare-fun res!1014222 () Bool)

(assert (=> b!1491007 (=> (not res!1014222) (not e!835436))))

(assert (=> b!1491007 (= res!1014222 (= (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491007 (= lt!650135 (array!99670 (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48656 a!2862)))))

(declare-fun b!1491008 () Bool)

(declare-fun res!1014224 () Bool)

(assert (=> b!1491008 (=> (not res!1014224) (not e!835434))))

(declare-fun e!835435 () Bool)

(assert (=> b!1491008 (= res!1014224 e!835435)))

(declare-fun c!137919 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1491008 (= c!137919 (bvsle x!665 intermediateAfterX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1491009 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99669 (_ BitVec 32)) SeekEntryResult!12346)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99669 (_ BitVec 32)) SeekEntryResult!12346)

(assert (=> b!1491009 (= e!835435 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650133 lt!650135 mask!2687) (seekEntryOrOpen!0 lt!650133 lt!650135 mask!2687)))))

(declare-fun b!1491010 () Bool)

(declare-fun res!1014232 () Bool)

(assert (=> b!1491010 (=> (not res!1014232) (not e!835438))))

(declare-datatypes ((List!34607 0))(
  ( (Nil!34604) (Cons!34603 (h!35986 (_ BitVec 64)) (t!49301 List!34607)) )
))
(declare-fun arrayNoDuplicates!0 (array!99669 (_ BitVec 32) List!34607) Bool)

(assert (=> b!1491010 (= res!1014232 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34604))))

(declare-fun b!1491011 () Bool)

(declare-fun res!1014223 () Bool)

(assert (=> b!1491011 (=> (not res!1014223) (not e!835438))))

(assert (=> b!1491011 (= res!1014223 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48656 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48656 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48656 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491012 () Bool)

(declare-fun res!1014221 () Bool)

(declare-fun e!835432 () Bool)

(assert (=> b!1491012 (=> (not res!1014221) (not e!835432))))

(assert (=> b!1491012 (= res!1014221 (= (seekEntryOrOpen!0 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) (Found!12346 j!93)))))

(declare-fun b!1491013 () Bool)

(declare-fun e!835439 () Bool)

(assert (=> b!1491013 (= e!835434 (not e!835439))))

(declare-fun res!1014233 () Bool)

(assert (=> b!1491013 (=> res!1014233 e!835439)))

(assert (=> b!1491013 (= res!1014233 (or (and (= (select (arr!48106 a!2862) index!646) (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48106 a!2862) index!646) (select (arr!48106 a!2862) j!93))) (= (select (arr!48106 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491013 e!835432))

(declare-fun res!1014229 () Bool)

(assert (=> b!1491013 (=> (not res!1014229) (not e!835432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99669 (_ BitVec 32)) Bool)

(assert (=> b!1491013 (= res!1014229 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50032 0))(
  ( (Unit!50033) )
))
(declare-fun lt!650134 () Unit!50032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50032)

(assert (=> b!1491013 (= lt!650134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491014 () Bool)

(assert (=> b!1491014 (= e!835439 true)))

(declare-fun lt!650131 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491014 (= lt!650131 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1014231 () Bool)

(assert (=> start!126896 (=> (not res!1014231) (not e!835438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126896 (= res!1014231 (validMask!0 mask!2687))))

(assert (=> start!126896 e!835438))

(assert (=> start!126896 true))

(declare-fun array_inv!37134 (array!99669) Bool)

(assert (=> start!126896 (array_inv!37134 a!2862)))

(declare-fun b!1491015 () Bool)

(declare-fun res!1014230 () Bool)

(assert (=> b!1491015 (=> (not res!1014230) (not e!835437))))

(assert (=> b!1491015 (= res!1014230 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!650136))))

(declare-fun b!1491016 () Bool)

(declare-fun res!1014234 () Bool)

(assert (=> b!1491016 (=> (not res!1014234) (not e!835438))))

(assert (=> b!1491016 (= res!1014234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491017 () Bool)

(assert (=> b!1491017 (= e!835435 (= lt!650132 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650133 lt!650135 mask!2687)))))

(declare-fun b!1491018 () Bool)

(declare-fun res!1014220 () Bool)

(assert (=> b!1491018 (=> (not res!1014220) (not e!835438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491018 (= res!1014220 (validKeyInArray!0 (select (arr!48106 a!2862) i!1006)))))

(declare-fun b!1491019 () Bool)

(declare-fun res!1014235 () Bool)

(assert (=> b!1491019 (=> (not res!1014235) (not e!835434))))

(assert (=> b!1491019 (= res!1014235 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491020 () Bool)

(declare-fun res!1014228 () Bool)

(assert (=> b!1491020 (=> (not res!1014228) (not e!835438))))

(assert (=> b!1491020 (= res!1014228 (validKeyInArray!0 (select (arr!48106 a!2862) j!93)))))

(declare-fun b!1491021 () Bool)

(assert (=> b!1491021 (= e!835432 (or (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) (select (arr!48106 a!2862) j!93))))))

(assert (= (and start!126896 res!1014231) b!1491006))

(assert (= (and b!1491006 res!1014226) b!1491018))

(assert (= (and b!1491018 res!1014220) b!1491020))

(assert (= (and b!1491020 res!1014228) b!1491016))

(assert (= (and b!1491016 res!1014234) b!1491010))

(assert (= (and b!1491010 res!1014232) b!1491011))

(assert (= (and b!1491011 res!1014223) b!1491007))

(assert (= (and b!1491007 res!1014222) b!1491004))

(assert (= (and b!1491004 res!1014227) b!1491015))

(assert (= (and b!1491015 res!1014230) b!1491005))

(assert (= (and b!1491005 res!1014225) b!1491008))

(assert (= (and b!1491008 c!137919) b!1491017))

(assert (= (and b!1491008 (not c!137919)) b!1491009))

(assert (= (and b!1491008 res!1014224) b!1491019))

(assert (= (and b!1491019 res!1014235) b!1491013))

(assert (= (and b!1491013 res!1014229) b!1491012))

(assert (= (and b!1491012 res!1014221) b!1491021))

(assert (= (and b!1491013 (not res!1014233)) b!1491014))

(declare-fun m!1375143 () Bool)

(assert (=> start!126896 m!1375143))

(declare-fun m!1375145 () Bool)

(assert (=> start!126896 m!1375145))

(declare-fun m!1375147 () Bool)

(assert (=> b!1491020 m!1375147))

(assert (=> b!1491020 m!1375147))

(declare-fun m!1375149 () Bool)

(assert (=> b!1491020 m!1375149))

(assert (=> b!1491015 m!1375147))

(assert (=> b!1491015 m!1375147))

(declare-fun m!1375151 () Bool)

(assert (=> b!1491015 m!1375151))

(declare-fun m!1375153 () Bool)

(assert (=> b!1491005 m!1375153))

(assert (=> b!1491005 m!1375153))

(declare-fun m!1375155 () Bool)

(assert (=> b!1491005 m!1375155))

(declare-fun m!1375157 () Bool)

(assert (=> b!1491005 m!1375157))

(declare-fun m!1375159 () Bool)

(assert (=> b!1491005 m!1375159))

(declare-fun m!1375161 () Bool)

(assert (=> b!1491009 m!1375161))

(declare-fun m!1375163 () Bool)

(assert (=> b!1491009 m!1375163))

(declare-fun m!1375165 () Bool)

(assert (=> b!1491013 m!1375165))

(assert (=> b!1491013 m!1375157))

(declare-fun m!1375167 () Bool)

(assert (=> b!1491013 m!1375167))

(declare-fun m!1375169 () Bool)

(assert (=> b!1491013 m!1375169))

(declare-fun m!1375171 () Bool)

(assert (=> b!1491013 m!1375171))

(assert (=> b!1491013 m!1375147))

(declare-fun m!1375173 () Bool)

(assert (=> b!1491014 m!1375173))

(declare-fun m!1375175 () Bool)

(assert (=> b!1491010 m!1375175))

(declare-fun m!1375177 () Bool)

(assert (=> b!1491018 m!1375177))

(assert (=> b!1491018 m!1375177))

(declare-fun m!1375179 () Bool)

(assert (=> b!1491018 m!1375179))

(assert (=> b!1491012 m!1375147))

(assert (=> b!1491012 m!1375147))

(declare-fun m!1375181 () Bool)

(assert (=> b!1491012 m!1375181))

(assert (=> b!1491007 m!1375157))

(declare-fun m!1375183 () Bool)

(assert (=> b!1491007 m!1375183))

(declare-fun m!1375185 () Bool)

(assert (=> b!1491016 m!1375185))

(assert (=> b!1491004 m!1375147))

(assert (=> b!1491004 m!1375147))

(declare-fun m!1375187 () Bool)

(assert (=> b!1491004 m!1375187))

(assert (=> b!1491004 m!1375187))

(assert (=> b!1491004 m!1375147))

(declare-fun m!1375189 () Bool)

(assert (=> b!1491004 m!1375189))

(declare-fun m!1375191 () Bool)

(assert (=> b!1491021 m!1375191))

(assert (=> b!1491021 m!1375147))

(declare-fun m!1375193 () Bool)

(assert (=> b!1491017 m!1375193))

(push 1)

