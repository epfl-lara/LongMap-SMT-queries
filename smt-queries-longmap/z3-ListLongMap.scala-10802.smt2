; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126402 () Bool)

(assert start!126402)

(declare-fun b!1482077 () Bool)

(declare-fun res!1007332 () Bool)

(declare-fun e!831142 () Bool)

(assert (=> b!1482077 (=> (not res!1007332) (not e!831142))))

(declare-datatypes ((array!99421 0))(
  ( (array!99422 (arr!47988 (Array (_ BitVec 32) (_ BitVec 64))) (size!48538 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99421)

(declare-datatypes ((List!34489 0))(
  ( (Nil!34486) (Cons!34485 (h!35856 (_ BitVec 64)) (t!49183 List!34489)) )
))
(declare-fun arrayNoDuplicates!0 (array!99421 (_ BitVec 32) List!34489) Bool)

(assert (=> b!1482077 (= res!1007332 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34486))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1482078 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!831141 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482078 (= e!831141 (and (or (= (select (arr!47988 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47988 a!2862) intermediateBeforeIndex!19) (select (arr!47988 a!2862) j!93))) (or (and (= (select (arr!47988 a!2862) index!646) (select (store (arr!47988 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47988 a!2862) index!646) (select (arr!47988 a!2862) j!93))) (= (select (arr!47988 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47988 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482079 () Bool)

(declare-fun e!831139 () Bool)

(declare-fun e!831138 () Bool)

(assert (=> b!1482079 (= e!831139 e!831138)))

(declare-fun res!1007339 () Bool)

(assert (=> b!1482079 (=> (not res!1007339) (not e!831138))))

(declare-datatypes ((SeekEntryResult!12228 0))(
  ( (MissingZero!12228 (index!51304 (_ BitVec 32))) (Found!12228 (index!51305 (_ BitVec 32))) (Intermediate!12228 (undefined!13040 Bool) (index!51306 (_ BitVec 32)) (x!132887 (_ BitVec 32))) (Undefined!12228) (MissingVacant!12228 (index!51307 (_ BitVec 32))) )
))
(declare-fun lt!646964 () SeekEntryResult!12228)

(assert (=> b!1482079 (= res!1007339 (= lt!646964 (Intermediate!12228 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!646968 () array!99421)

(declare-fun lt!646965 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99421 (_ BitVec 32)) SeekEntryResult!12228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482079 (= lt!646964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646965 mask!2687) lt!646965 lt!646968 mask!2687))))

(assert (=> b!1482079 (= lt!646965 (select (store (arr!47988 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!831140 () Bool)

(declare-fun b!1482080 () Bool)

(assert (=> b!1482080 (= e!831140 (= lt!646964 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646965 lt!646968 mask!2687)))))

(declare-fun b!1482081 () Bool)

(declare-fun res!1007330 () Bool)

(assert (=> b!1482081 (=> (not res!1007330) (not e!831142))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482081 (= res!1007330 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48538 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48538 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48538 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482083 () Bool)

(declare-fun res!1007334 () Bool)

(assert (=> b!1482083 (=> (not res!1007334) (not e!831138))))

(assert (=> b!1482083 (= res!1007334 e!831140)))

(declare-fun c!136896 () Bool)

(assert (=> b!1482083 (= c!136896 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482084 () Bool)

(declare-fun e!831137 () Bool)

(assert (=> b!1482084 (= e!831142 e!831137)))

(declare-fun res!1007331 () Bool)

(assert (=> b!1482084 (=> (not res!1007331) (not e!831137))))

(assert (=> b!1482084 (= res!1007331 (= (select (store (arr!47988 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482084 (= lt!646968 (array!99422 (store (arr!47988 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48538 a!2862)))))

(declare-fun b!1482085 () Bool)

(declare-fun res!1007328 () Bool)

(assert (=> b!1482085 (=> (not res!1007328) (not e!831139))))

(declare-fun lt!646966 () SeekEntryResult!12228)

(assert (=> b!1482085 (= res!1007328 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47988 a!2862) j!93) a!2862 mask!2687) lt!646966))))

(declare-fun b!1482086 () Bool)

(declare-fun res!1007335 () Bool)

(assert (=> b!1482086 (=> (not res!1007335) (not e!831142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482086 (= res!1007335 (validKeyInArray!0 (select (arr!47988 a!2862) j!93)))))

(declare-fun b!1482087 () Bool)

(declare-fun res!1007327 () Bool)

(assert (=> b!1482087 (=> (not res!1007327) (not e!831141))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99421 (_ BitVec 32)) SeekEntryResult!12228)

(assert (=> b!1482087 (= res!1007327 (= (seekEntryOrOpen!0 (select (arr!47988 a!2862) j!93) a!2862 mask!2687) (Found!12228 j!93)))))

(declare-fun b!1482088 () Bool)

(assert (=> b!1482088 (= e!831137 e!831139)))

(declare-fun res!1007341 () Bool)

(assert (=> b!1482088 (=> (not res!1007341) (not e!831139))))

(assert (=> b!1482088 (= res!1007341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47988 a!2862) j!93) mask!2687) (select (arr!47988 a!2862) j!93) a!2862 mask!2687) lt!646966))))

(assert (=> b!1482088 (= lt!646966 (Intermediate!12228 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482089 () Bool)

(declare-fun res!1007338 () Bool)

(assert (=> b!1482089 (=> (not res!1007338) (not e!831142))))

(assert (=> b!1482089 (= res!1007338 (and (= (size!48538 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48538 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48538 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482090 () Bool)

(declare-fun res!1007337 () Bool)

(assert (=> b!1482090 (=> (not res!1007337) (not e!831142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99421 (_ BitVec 32)) Bool)

(assert (=> b!1482090 (= res!1007337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482091 () Bool)

(declare-fun res!1007333 () Bool)

(assert (=> b!1482091 (=> (not res!1007333) (not e!831138))))

(assert (=> b!1482091 (= res!1007333 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482082 () Bool)

(declare-fun res!1007329 () Bool)

(assert (=> b!1482082 (=> (not res!1007329) (not e!831142))))

(assert (=> b!1482082 (= res!1007329 (validKeyInArray!0 (select (arr!47988 a!2862) i!1006)))))

(declare-fun res!1007336 () Bool)

(assert (=> start!126402 (=> (not res!1007336) (not e!831142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126402 (= res!1007336 (validMask!0 mask!2687))))

(assert (=> start!126402 e!831142))

(assert (=> start!126402 true))

(declare-fun array_inv!37016 (array!99421) Bool)

(assert (=> start!126402 (array_inv!37016 a!2862)))

(declare-fun b!1482092 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99421 (_ BitVec 32)) SeekEntryResult!12228)

(assert (=> b!1482092 (= e!831140 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646965 lt!646968 mask!2687) (seekEntryOrOpen!0 lt!646965 lt!646968 mask!2687)))))

(declare-fun b!1482093 () Bool)

(assert (=> b!1482093 (= e!831138 (not true))))

(assert (=> b!1482093 e!831141))

(declare-fun res!1007340 () Bool)

(assert (=> b!1482093 (=> (not res!1007340) (not e!831141))))

(assert (=> b!1482093 (= res!1007340 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49796 0))(
  ( (Unit!49797) )
))
(declare-fun lt!646967 () Unit!49796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49796)

(assert (=> b!1482093 (= lt!646967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126402 res!1007336) b!1482089))

(assert (= (and b!1482089 res!1007338) b!1482082))

(assert (= (and b!1482082 res!1007329) b!1482086))

(assert (= (and b!1482086 res!1007335) b!1482090))

(assert (= (and b!1482090 res!1007337) b!1482077))

(assert (= (and b!1482077 res!1007332) b!1482081))

(assert (= (and b!1482081 res!1007330) b!1482084))

(assert (= (and b!1482084 res!1007331) b!1482088))

(assert (= (and b!1482088 res!1007341) b!1482085))

(assert (= (and b!1482085 res!1007328) b!1482079))

(assert (= (and b!1482079 res!1007339) b!1482083))

(assert (= (and b!1482083 c!136896) b!1482080))

(assert (= (and b!1482083 (not c!136896)) b!1482092))

(assert (= (and b!1482083 res!1007334) b!1482091))

(assert (= (and b!1482091 res!1007333) b!1482093))

(assert (= (and b!1482093 res!1007340) b!1482087))

(assert (= (and b!1482087 res!1007327) b!1482078))

(declare-fun m!1367805 () Bool)

(assert (=> b!1482088 m!1367805))

(assert (=> b!1482088 m!1367805))

(declare-fun m!1367807 () Bool)

(assert (=> b!1482088 m!1367807))

(assert (=> b!1482088 m!1367807))

(assert (=> b!1482088 m!1367805))

(declare-fun m!1367809 () Bool)

(assert (=> b!1482088 m!1367809))

(declare-fun m!1367811 () Bool)

(assert (=> b!1482078 m!1367811))

(declare-fun m!1367813 () Bool)

(assert (=> b!1482078 m!1367813))

(declare-fun m!1367815 () Bool)

(assert (=> b!1482078 m!1367815))

(declare-fun m!1367817 () Bool)

(assert (=> b!1482078 m!1367817))

(assert (=> b!1482078 m!1367805))

(assert (=> b!1482085 m!1367805))

(assert (=> b!1482085 m!1367805))

(declare-fun m!1367819 () Bool)

(assert (=> b!1482085 m!1367819))

(declare-fun m!1367821 () Bool)

(assert (=> b!1482077 m!1367821))

(declare-fun m!1367823 () Bool)

(assert (=> b!1482093 m!1367823))

(declare-fun m!1367825 () Bool)

(assert (=> b!1482093 m!1367825))

(declare-fun m!1367827 () Bool)

(assert (=> start!126402 m!1367827))

(declare-fun m!1367829 () Bool)

(assert (=> start!126402 m!1367829))

(declare-fun m!1367831 () Bool)

(assert (=> b!1482090 m!1367831))

(assert (=> b!1482086 m!1367805))

(assert (=> b!1482086 m!1367805))

(declare-fun m!1367833 () Bool)

(assert (=> b!1482086 m!1367833))

(assert (=> b!1482087 m!1367805))

(assert (=> b!1482087 m!1367805))

(declare-fun m!1367835 () Bool)

(assert (=> b!1482087 m!1367835))

(declare-fun m!1367837 () Bool)

(assert (=> b!1482082 m!1367837))

(assert (=> b!1482082 m!1367837))

(declare-fun m!1367839 () Bool)

(assert (=> b!1482082 m!1367839))

(declare-fun m!1367841 () Bool)

(assert (=> b!1482079 m!1367841))

(assert (=> b!1482079 m!1367841))

(declare-fun m!1367843 () Bool)

(assert (=> b!1482079 m!1367843))

(assert (=> b!1482079 m!1367811))

(declare-fun m!1367845 () Bool)

(assert (=> b!1482079 m!1367845))

(declare-fun m!1367847 () Bool)

(assert (=> b!1482092 m!1367847))

(declare-fun m!1367849 () Bool)

(assert (=> b!1482092 m!1367849))

(declare-fun m!1367851 () Bool)

(assert (=> b!1482080 m!1367851))

(assert (=> b!1482084 m!1367811))

(declare-fun m!1367853 () Bool)

(assert (=> b!1482084 m!1367853))

(check-sat (not b!1482087) (not b!1482080) (not b!1482088) (not b!1482082) (not b!1482079) (not b!1482093) (not b!1482077) (not b!1482090) (not b!1482085) (not b!1482092) (not start!126402) (not b!1482086))
(check-sat)
