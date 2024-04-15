; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126770 () Bool)

(assert start!126770)

(declare-fun b!1488287 () Bool)

(declare-fun res!1012113 () Bool)

(declare-fun e!834205 () Bool)

(assert (=> b!1488287 (=> (not res!1012113) (not e!834205))))

(declare-datatypes ((array!99541 0))(
  ( (array!99542 (arr!48043 (Array (_ BitVec 32) (_ BitVec 64))) (size!48595 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99541)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488287 (= res!1012113 (validKeyInArray!0 (select (arr!48043 a!2862) j!93)))))

(declare-fun res!1012101 () Bool)

(assert (=> start!126770 (=> (not res!1012101) (not e!834205))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126770 (= res!1012101 (validMask!0 mask!2687))))

(assert (=> start!126770 e!834205))

(assert (=> start!126770 true))

(declare-fun array_inv!37276 (array!99541) Bool)

(assert (=> start!126770 (array_inv!37276 a!2862)))

(declare-fun b!1488288 () Bool)

(declare-fun res!1012107 () Bool)

(assert (=> b!1488288 (=> (not res!1012107) (not e!834205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99541 (_ BitVec 32)) Bool)

(assert (=> b!1488288 (= res!1012107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488289 () Bool)

(declare-fun res!1012106 () Bool)

(declare-fun e!834197 () Bool)

(assert (=> b!1488289 (=> (not res!1012106) (not e!834197))))

(declare-datatypes ((SeekEntryResult!12308 0))(
  ( (MissingZero!12308 (index!51624 (_ BitVec 32))) (Found!12308 (index!51625 (_ BitVec 32))) (Intermediate!12308 (undefined!13120 Bool) (index!51626 (_ BitVec 32)) (x!133221 (_ BitVec 32))) (Undefined!12308) (MissingVacant!12308 (index!51627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488289 (= res!1012106 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) (Found!12308 j!93)))))

(declare-fun b!1488290 () Bool)

(declare-fun res!1012102 () Bool)

(assert (=> b!1488290 (=> (not res!1012102) (not e!834205))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488290 (= res!1012102 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48595 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48595 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48595 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!648975 () (_ BitVec 32))

(declare-fun e!834204 () Bool)

(declare-fun lt!648976 () array!99541)

(declare-fun b!1488291 () Bool)

(declare-fun lt!648977 () SeekEntryResult!12308)

(declare-fun lt!648974 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488291 (= e!834204 (not (= lt!648977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648975 lt!648974 lt!648976 mask!2687))))))

(declare-fun b!1488292 () Bool)

(declare-fun e!834203 () Bool)

(assert (=> b!1488292 (= e!834203 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1488293 () Bool)

(declare-fun res!1012105 () Bool)

(assert (=> b!1488293 (=> (not res!1012105) (not e!834205))))

(declare-datatypes ((List!34622 0))(
  ( (Nil!34619) (Cons!34618 (h!36001 (_ BitVec 64)) (t!49308 List!34622)) )
))
(declare-fun arrayNoDuplicates!0 (array!99541 (_ BitVec 32) List!34622) Bool)

(assert (=> b!1488293 (= res!1012105 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34619))))

(declare-fun b!1488294 () Bool)

(declare-fun e!834206 () Bool)

(assert (=> b!1488294 (= e!834206 (= lt!648977 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648974 lt!648976 mask!2687)))))

(declare-fun b!1488295 () Bool)

(declare-fun res!1012103 () Bool)

(declare-fun e!834200 () Bool)

(assert (=> b!1488295 (=> (not res!1012103) (not e!834200))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488295 (= res!1012103 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488296 () Bool)

(declare-fun e!834199 () Bool)

(assert (=> b!1488296 (= e!834205 e!834199)))

(declare-fun res!1012114 () Bool)

(assert (=> b!1488296 (=> (not res!1012114) (not e!834199))))

(assert (=> b!1488296 (= res!1012114 (= (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488296 (= lt!648976 (array!99542 (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48595 a!2862)))))

(declare-fun b!1488297 () Bool)

(declare-fun e!834201 () Bool)

(assert (=> b!1488297 (= e!834200 (not e!834201))))

(declare-fun res!1012104 () Bool)

(assert (=> b!1488297 (=> res!1012104 e!834201)))

(assert (=> b!1488297 (= res!1012104 (or (and (= (select (arr!48043 a!2862) index!646) (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48043 a!2862) index!646) (select (arr!48043 a!2862) j!93))) (= (select (arr!48043 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488297 e!834197))

(declare-fun res!1012098 () Bool)

(assert (=> b!1488297 (=> (not res!1012098) (not e!834197))))

(assert (=> b!1488297 (= res!1012098 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49797 0))(
  ( (Unit!49798) )
))
(declare-fun lt!648978 () Unit!49797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49797)

(assert (=> b!1488297 (= lt!648978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488298 () Bool)

(assert (=> b!1488298 (= e!834197 (and (or (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) (select (arr!48043 a!2862) j!93))) (let ((bdg!54653 (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48043 a!2862) index!646) bdg!54653) (= (select (arr!48043 a!2862) index!646) (select (arr!48043 a!2862) j!93))) (= (select (arr!48043 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54653 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!648980 () SeekEntryResult!12308)

(declare-fun b!1488299 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488299 (= e!834204 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648975 intermediateAfterIndex!19 lt!648974 lt!648976 mask!2687) lt!648980)))))

(declare-fun b!1488300 () Bool)

(declare-fun e!834198 () Bool)

(assert (=> b!1488300 (= e!834198 e!834200)))

(declare-fun res!1012108 () Bool)

(assert (=> b!1488300 (=> (not res!1012108) (not e!834200))))

(assert (=> b!1488300 (= res!1012108 (= lt!648977 (Intermediate!12308 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488300 (= lt!648977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648974 mask!2687) lt!648974 lt!648976 mask!2687))))

(assert (=> b!1488300 (= lt!648974 (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488301 () Bool)

(declare-fun res!1012099 () Bool)

(assert (=> b!1488301 (=> (not res!1012099) (not e!834198))))

(declare-fun lt!648979 () SeekEntryResult!12308)

(assert (=> b!1488301 (= res!1012099 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648979))))

(declare-fun b!1488302 () Bool)

(declare-fun res!1012109 () Bool)

(assert (=> b!1488302 (=> (not res!1012109) (not e!834205))))

(assert (=> b!1488302 (= res!1012109 (and (= (size!48595 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48595 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48595 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488303 () Bool)

(assert (=> b!1488303 (= e!834199 e!834198)))

(declare-fun res!1012097 () Bool)

(assert (=> b!1488303 (=> (not res!1012097) (not e!834198))))

(assert (=> b!1488303 (= res!1012097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648979))))

(assert (=> b!1488303 (= lt!648979 (Intermediate!12308 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488304 () Bool)

(assert (=> b!1488304 (= e!834201 e!834203)))

(declare-fun res!1012100 () Bool)

(assert (=> b!1488304 (=> res!1012100 e!834203)))

(assert (=> b!1488304 (= res!1012100 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648975 #b00000000000000000000000000000000) (bvsge lt!648975 (size!48595 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488304 (= lt!648975 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488304 (= lt!648980 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648974 lt!648976 mask!2687))))

(assert (=> b!1488304 (= lt!648980 (seekEntryOrOpen!0 lt!648974 lt!648976 mask!2687))))

(declare-fun b!1488305 () Bool)

(declare-fun res!1012110 () Bool)

(assert (=> b!1488305 (=> res!1012110 e!834203)))

(assert (=> b!1488305 (= res!1012110 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648975 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648979)))))

(declare-fun b!1488306 () Bool)

(declare-fun res!1012112 () Bool)

(assert (=> b!1488306 (=> res!1012112 e!834203)))

(assert (=> b!1488306 (= res!1012112 e!834204)))

(declare-fun c!137625 () Bool)

(assert (=> b!1488306 (= c!137625 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488307 () Bool)

(assert (=> b!1488307 (= e!834206 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648974 lt!648976 mask!2687) (seekEntryOrOpen!0 lt!648974 lt!648976 mask!2687)))))

(declare-fun b!1488308 () Bool)

(declare-fun res!1012096 () Bool)

(assert (=> b!1488308 (=> (not res!1012096) (not e!834205))))

(assert (=> b!1488308 (= res!1012096 (validKeyInArray!0 (select (arr!48043 a!2862) i!1006)))))

(declare-fun b!1488309 () Bool)

(declare-fun res!1012111 () Bool)

(assert (=> b!1488309 (=> (not res!1012111) (not e!834200))))

(assert (=> b!1488309 (= res!1012111 e!834206)))

(declare-fun c!137626 () Bool)

(assert (=> b!1488309 (= c!137626 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126770 res!1012101) b!1488302))

(assert (= (and b!1488302 res!1012109) b!1488308))

(assert (= (and b!1488308 res!1012096) b!1488287))

(assert (= (and b!1488287 res!1012113) b!1488288))

(assert (= (and b!1488288 res!1012107) b!1488293))

(assert (= (and b!1488293 res!1012105) b!1488290))

(assert (= (and b!1488290 res!1012102) b!1488296))

(assert (= (and b!1488296 res!1012114) b!1488303))

(assert (= (and b!1488303 res!1012097) b!1488301))

(assert (= (and b!1488301 res!1012099) b!1488300))

(assert (= (and b!1488300 res!1012108) b!1488309))

(assert (= (and b!1488309 c!137626) b!1488294))

(assert (= (and b!1488309 (not c!137626)) b!1488307))

(assert (= (and b!1488309 res!1012111) b!1488295))

(assert (= (and b!1488295 res!1012103) b!1488297))

(assert (= (and b!1488297 res!1012098) b!1488289))

(assert (= (and b!1488289 res!1012106) b!1488298))

(assert (= (and b!1488297 (not res!1012104)) b!1488304))

(assert (= (and b!1488304 (not res!1012100)) b!1488305))

(assert (= (and b!1488305 (not res!1012110)) b!1488306))

(assert (= (and b!1488306 c!137625) b!1488291))

(assert (= (and b!1488306 (not c!137625)) b!1488299))

(assert (= (and b!1488306 (not res!1012112)) b!1488292))

(declare-fun m!1372089 () Bool)

(assert (=> b!1488297 m!1372089))

(declare-fun m!1372091 () Bool)

(assert (=> b!1488297 m!1372091))

(declare-fun m!1372093 () Bool)

(assert (=> b!1488297 m!1372093))

(declare-fun m!1372095 () Bool)

(assert (=> b!1488297 m!1372095))

(declare-fun m!1372097 () Bool)

(assert (=> b!1488297 m!1372097))

(declare-fun m!1372099 () Bool)

(assert (=> b!1488297 m!1372099))

(assert (=> b!1488303 m!1372099))

(assert (=> b!1488303 m!1372099))

(declare-fun m!1372101 () Bool)

(assert (=> b!1488303 m!1372101))

(assert (=> b!1488303 m!1372101))

(assert (=> b!1488303 m!1372099))

(declare-fun m!1372103 () Bool)

(assert (=> b!1488303 m!1372103))

(declare-fun m!1372105 () Bool)

(assert (=> start!126770 m!1372105))

(declare-fun m!1372107 () Bool)

(assert (=> start!126770 m!1372107))

(assert (=> b!1488298 m!1372091))

(declare-fun m!1372109 () Bool)

(assert (=> b!1488298 m!1372109))

(assert (=> b!1488298 m!1372093))

(assert (=> b!1488298 m!1372095))

(assert (=> b!1488298 m!1372099))

(assert (=> b!1488301 m!1372099))

(assert (=> b!1488301 m!1372099))

(declare-fun m!1372111 () Bool)

(assert (=> b!1488301 m!1372111))

(declare-fun m!1372113 () Bool)

(assert (=> b!1488291 m!1372113))

(declare-fun m!1372115 () Bool)

(assert (=> b!1488294 m!1372115))

(declare-fun m!1372117 () Bool)

(assert (=> b!1488293 m!1372117))

(declare-fun m!1372119 () Bool)

(assert (=> b!1488304 m!1372119))

(declare-fun m!1372121 () Bool)

(assert (=> b!1488304 m!1372121))

(declare-fun m!1372123 () Bool)

(assert (=> b!1488304 m!1372123))

(assert (=> b!1488305 m!1372099))

(assert (=> b!1488305 m!1372099))

(declare-fun m!1372125 () Bool)

(assert (=> b!1488305 m!1372125))

(declare-fun m!1372127 () Bool)

(assert (=> b!1488288 m!1372127))

(declare-fun m!1372129 () Bool)

(assert (=> b!1488299 m!1372129))

(assert (=> b!1488296 m!1372091))

(declare-fun m!1372131 () Bool)

(assert (=> b!1488296 m!1372131))

(declare-fun m!1372133 () Bool)

(assert (=> b!1488308 m!1372133))

(assert (=> b!1488308 m!1372133))

(declare-fun m!1372135 () Bool)

(assert (=> b!1488308 m!1372135))

(declare-fun m!1372137 () Bool)

(assert (=> b!1488300 m!1372137))

(assert (=> b!1488300 m!1372137))

(declare-fun m!1372139 () Bool)

(assert (=> b!1488300 m!1372139))

(assert (=> b!1488300 m!1372091))

(declare-fun m!1372141 () Bool)

(assert (=> b!1488300 m!1372141))

(assert (=> b!1488307 m!1372121))

(assert (=> b!1488307 m!1372123))

(assert (=> b!1488287 m!1372099))

(assert (=> b!1488287 m!1372099))

(declare-fun m!1372143 () Bool)

(assert (=> b!1488287 m!1372143))

(assert (=> b!1488289 m!1372099))

(assert (=> b!1488289 m!1372099))

(declare-fun m!1372145 () Bool)

(assert (=> b!1488289 m!1372145))

(check-sat (not b!1488289) (not b!1488291) (not b!1488293) (not b!1488307) (not b!1488297) (not b!1488288) (not b!1488305) (not b!1488304) (not b!1488299) (not b!1488287) (not b!1488294) (not b!1488303) (not b!1488301) (not b!1488308) (not start!126770) (not b!1488300))
(check-sat)
