; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125418 () Bool)

(assert start!125418)

(declare-fun b!1467272 () Bool)

(declare-fun e!824201 () Bool)

(declare-fun e!824199 () Bool)

(assert (=> b!1467272 (= e!824201 e!824199)))

(declare-fun res!995839 () Bool)

(assert (=> b!1467272 (=> (not res!995839) (not e!824199))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11973 0))(
  ( (MissingZero!11973 (index!50284 (_ BitVec 32))) (Found!11973 (index!50285 (_ BitVec 32))) (Intermediate!11973 (undefined!12785 Bool) (index!50286 (_ BitVec 32)) (x!131854 (_ BitVec 32))) (Undefined!11973) (MissingVacant!11973 (index!50287 (_ BitVec 32))) )
))
(declare-fun lt!642053 () SeekEntryResult!11973)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467272 (= res!995839 (= lt!642053 (Intermediate!11973 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98866 0))(
  ( (array!98867 (arr!47721 (Array (_ BitVec 32) (_ BitVec 64))) (size!48271 (_ BitVec 32))) )
))
(declare-fun lt!642059 () array!98866)

(declare-fun lt!642057 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467272 (= lt!642053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642057 mask!2687) lt!642057 lt!642059 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98866)

(assert (=> b!1467272 (= lt!642057 (select (store (arr!47721 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467273 () Bool)

(declare-fun e!824207 () Bool)

(declare-fun e!824206 () Bool)

(assert (=> b!1467273 (= e!824207 e!824206)))

(declare-fun res!995841 () Bool)

(assert (=> b!1467273 (=> res!995841 e!824206)))

(assert (=> b!1467273 (= res!995841 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!642060 () SeekEntryResult!11973)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11973)

(assert (=> b!1467273 (= lt!642060 (seekEntryOrOpen!0 lt!642057 lt!642059 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642055 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49442 0))(
  ( (Unit!49443) )
))
(declare-fun lt!642056 () Unit!49442)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49442)

(assert (=> b!1467273 (= lt!642056 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642055 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467274 () Bool)

(declare-fun res!995834 () Bool)

(declare-fun e!824198 () Bool)

(assert (=> b!1467274 (=> (not res!995834) (not e!824198))))

(assert (=> b!1467274 (= res!995834 (and (= (size!48271 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48271 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48271 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467275 () Bool)

(declare-fun e!824205 () Bool)

(assert (=> b!1467275 (= e!824199 (not e!824205))))

(declare-fun res!995829 () Bool)

(assert (=> b!1467275 (=> res!995829 e!824205)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1467275 (= res!995829 (or (and (= (select (arr!47721 a!2862) index!646) (select (store (arr!47721 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47721 a!2862) index!646) (select (arr!47721 a!2862) j!93))) (= (select (arr!47721 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467275 (and (= lt!642060 (Found!11973 j!93)) (or (= (select (arr!47721 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47721 a!2862) intermediateBeforeIndex!19) (select (arr!47721 a!2862) j!93))))))

(assert (=> b!1467275 (= lt!642060 (seekEntryOrOpen!0 (select (arr!47721 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98866 (_ BitVec 32)) Bool)

(assert (=> b!1467275 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642054 () Unit!49442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49442)

(assert (=> b!1467275 (= lt!642054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467276 () Bool)

(declare-fun res!995828 () Bool)

(assert (=> b!1467276 (=> (not res!995828) (not e!824198))))

(declare-datatypes ((List!34222 0))(
  ( (Nil!34219) (Cons!34218 (h!35568 (_ BitVec 64)) (t!48916 List!34222)) )
))
(declare-fun arrayNoDuplicates!0 (array!98866 (_ BitVec 32) List!34222) Bool)

(assert (=> b!1467276 (= res!995828 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34219))))

(declare-fun b!1467277 () Bool)

(declare-fun res!995845 () Bool)

(assert (=> b!1467277 (=> (not res!995845) (not e!824198))))

(assert (=> b!1467277 (= res!995845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467278 () Bool)

(declare-fun res!995842 () Bool)

(assert (=> b!1467278 (=> res!995842 e!824207)))

(declare-fun lt!642058 () SeekEntryResult!11973)

(assert (=> b!1467278 (= res!995842 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642055 (select (arr!47721 a!2862) j!93) a!2862 mask!2687) lt!642058)))))

(declare-fun b!1467279 () Bool)

(declare-fun e!824200 () Bool)

(assert (=> b!1467279 (= e!824200 (= lt!642053 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642057 lt!642059 mask!2687)))))

(declare-fun b!1467281 () Bool)

(declare-fun res!995844 () Bool)

(assert (=> b!1467281 (=> (not res!995844) (not e!824201))))

(assert (=> b!1467281 (= res!995844 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47721 a!2862) j!93) a!2862 mask!2687) lt!642058))))

(declare-fun b!1467282 () Bool)

(assert (=> b!1467282 (= e!824205 e!824207)))

(declare-fun res!995830 () Bool)

(assert (=> b!1467282 (=> res!995830 e!824207)))

(assert (=> b!1467282 (= res!995830 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642055 #b00000000000000000000000000000000) (bvsge lt!642055 (size!48271 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467282 (= lt!642055 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467283 () Bool)

(declare-fun res!995831 () Bool)

(assert (=> b!1467283 (=> (not res!995831) (not e!824198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467283 (= res!995831 (validKeyInArray!0 (select (arr!47721 a!2862) j!93)))))

(declare-fun b!1467284 () Bool)

(declare-fun e!824204 () Bool)

(assert (=> b!1467284 (= e!824198 e!824204)))

(declare-fun res!995836 () Bool)

(assert (=> b!1467284 (=> (not res!995836) (not e!824204))))

(assert (=> b!1467284 (= res!995836 (= (select (store (arr!47721 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467284 (= lt!642059 (array!98867 (store (arr!47721 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48271 a!2862)))))

(declare-fun b!1467285 () Bool)

(assert (=> b!1467285 (= e!824204 e!824201)))

(declare-fun res!995827 () Bool)

(assert (=> b!1467285 (=> (not res!995827) (not e!824201))))

(assert (=> b!1467285 (= res!995827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47721 a!2862) j!93) mask!2687) (select (arr!47721 a!2862) j!93) a!2862 mask!2687) lt!642058))))

(assert (=> b!1467285 (= lt!642058 (Intermediate!11973 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467286 () Bool)

(declare-fun res!995833 () Bool)

(assert (=> b!1467286 (=> res!995833 e!824207)))

(assert (=> b!1467286 (= res!995833 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467287 () Bool)

(declare-fun res!995838 () Bool)

(assert (=> b!1467287 (=> (not res!995838) (not e!824199))))

(assert (=> b!1467287 (= res!995838 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467288 () Bool)

(declare-fun res!995840 () Bool)

(assert (=> b!1467288 (=> (not res!995840) (not e!824198))))

(assert (=> b!1467288 (= res!995840 (validKeyInArray!0 (select (arr!47721 a!2862) i!1006)))))

(declare-fun b!1467289 () Bool)

(declare-fun res!995837 () Bool)

(assert (=> b!1467289 (=> (not res!995837) (not e!824199))))

(assert (=> b!1467289 (= res!995837 e!824200)))

(declare-fun c!135233 () Bool)

(assert (=> b!1467289 (= c!135233 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!824202 () Bool)

(declare-fun b!1467290 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11973)

(assert (=> b!1467290 (= e!824202 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642055 intermediateAfterIndex!19 lt!642057 lt!642059 mask!2687) (seekEntryOrOpen!0 lt!642057 lt!642059 mask!2687))))))

(declare-fun res!995843 () Bool)

(assert (=> start!125418 (=> (not res!995843) (not e!824198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125418 (= res!995843 (validMask!0 mask!2687))))

(assert (=> start!125418 e!824198))

(assert (=> start!125418 true))

(declare-fun array_inv!36749 (array!98866) Bool)

(assert (=> start!125418 (array_inv!36749 a!2862)))

(declare-fun b!1467280 () Bool)

(declare-fun res!995835 () Bool)

(assert (=> b!1467280 (=> (not res!995835) (not e!824198))))

(assert (=> b!1467280 (= res!995835 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48271 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48271 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48271 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467291 () Bool)

(assert (=> b!1467291 (= e!824202 (not (= lt!642053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642055 lt!642057 lt!642059 mask!2687))))))

(declare-fun b!1467292 () Bool)

(assert (=> b!1467292 (= e!824200 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642057 lt!642059 mask!2687) (seekEntryOrOpen!0 lt!642057 lt!642059 mask!2687)))))

(declare-fun b!1467293 () Bool)

(declare-fun res!995832 () Bool)

(assert (=> b!1467293 (=> res!995832 e!824207)))

(assert (=> b!1467293 (= res!995832 e!824202)))

(declare-fun c!135234 () Bool)

(assert (=> b!1467293 (= c!135234 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467294 () Bool)

(assert (=> b!1467294 (= e!824206 (validKeyInArray!0 lt!642057))))

(assert (= (and start!125418 res!995843) b!1467274))

(assert (= (and b!1467274 res!995834) b!1467288))

(assert (= (and b!1467288 res!995840) b!1467283))

(assert (= (and b!1467283 res!995831) b!1467277))

(assert (= (and b!1467277 res!995845) b!1467276))

(assert (= (and b!1467276 res!995828) b!1467280))

(assert (= (and b!1467280 res!995835) b!1467284))

(assert (= (and b!1467284 res!995836) b!1467285))

(assert (= (and b!1467285 res!995827) b!1467281))

(assert (= (and b!1467281 res!995844) b!1467272))

(assert (= (and b!1467272 res!995839) b!1467289))

(assert (= (and b!1467289 c!135233) b!1467279))

(assert (= (and b!1467289 (not c!135233)) b!1467292))

(assert (= (and b!1467289 res!995837) b!1467287))

(assert (= (and b!1467287 res!995838) b!1467275))

(assert (= (and b!1467275 (not res!995829)) b!1467282))

(assert (= (and b!1467282 (not res!995830)) b!1467278))

(assert (= (and b!1467278 (not res!995842)) b!1467293))

(assert (= (and b!1467293 c!135234) b!1467291))

(assert (= (and b!1467293 (not c!135234)) b!1467290))

(assert (= (and b!1467293 (not res!995832)) b!1467286))

(assert (= (and b!1467286 (not res!995833)) b!1467273))

(assert (= (and b!1467273 (not res!995841)) b!1467294))

(declare-fun m!1354185 () Bool)

(assert (=> b!1467285 m!1354185))

(assert (=> b!1467285 m!1354185))

(declare-fun m!1354187 () Bool)

(assert (=> b!1467285 m!1354187))

(assert (=> b!1467285 m!1354187))

(assert (=> b!1467285 m!1354185))

(declare-fun m!1354189 () Bool)

(assert (=> b!1467285 m!1354189))

(declare-fun m!1354191 () Bool)

(assert (=> b!1467294 m!1354191))

(declare-fun m!1354193 () Bool)

(assert (=> b!1467272 m!1354193))

(assert (=> b!1467272 m!1354193))

(declare-fun m!1354195 () Bool)

(assert (=> b!1467272 m!1354195))

(declare-fun m!1354197 () Bool)

(assert (=> b!1467272 m!1354197))

(declare-fun m!1354199 () Bool)

(assert (=> b!1467272 m!1354199))

(assert (=> b!1467283 m!1354185))

(assert (=> b!1467283 m!1354185))

(declare-fun m!1354201 () Bool)

(assert (=> b!1467283 m!1354201))

(declare-fun m!1354203 () Bool)

(assert (=> b!1467290 m!1354203))

(declare-fun m!1354205 () Bool)

(assert (=> b!1467290 m!1354205))

(assert (=> b!1467278 m!1354185))

(assert (=> b!1467278 m!1354185))

(declare-fun m!1354207 () Bool)

(assert (=> b!1467278 m!1354207))

(declare-fun m!1354209 () Bool)

(assert (=> b!1467277 m!1354209))

(declare-fun m!1354211 () Bool)

(assert (=> start!125418 m!1354211))

(declare-fun m!1354213 () Bool)

(assert (=> start!125418 m!1354213))

(declare-fun m!1354215 () Bool)

(assert (=> b!1467282 m!1354215))

(assert (=> b!1467284 m!1354197))

(declare-fun m!1354217 () Bool)

(assert (=> b!1467284 m!1354217))

(declare-fun m!1354219 () Bool)

(assert (=> b!1467291 m!1354219))

(assert (=> b!1467273 m!1354205))

(declare-fun m!1354221 () Bool)

(assert (=> b!1467273 m!1354221))

(declare-fun m!1354223 () Bool)

(assert (=> b!1467292 m!1354223))

(assert (=> b!1467292 m!1354205))

(declare-fun m!1354225 () Bool)

(assert (=> b!1467276 m!1354225))

(declare-fun m!1354227 () Bool)

(assert (=> b!1467279 m!1354227))

(assert (=> b!1467281 m!1354185))

(assert (=> b!1467281 m!1354185))

(declare-fun m!1354229 () Bool)

(assert (=> b!1467281 m!1354229))

(declare-fun m!1354231 () Bool)

(assert (=> b!1467288 m!1354231))

(assert (=> b!1467288 m!1354231))

(declare-fun m!1354233 () Bool)

(assert (=> b!1467288 m!1354233))

(declare-fun m!1354235 () Bool)

(assert (=> b!1467275 m!1354235))

(assert (=> b!1467275 m!1354197))

(declare-fun m!1354237 () Bool)

(assert (=> b!1467275 m!1354237))

(declare-fun m!1354239 () Bool)

(assert (=> b!1467275 m!1354239))

(declare-fun m!1354241 () Bool)

(assert (=> b!1467275 m!1354241))

(assert (=> b!1467275 m!1354185))

(declare-fun m!1354243 () Bool)

(assert (=> b!1467275 m!1354243))

(declare-fun m!1354245 () Bool)

(assert (=> b!1467275 m!1354245))

(assert (=> b!1467275 m!1354185))

(check-sat (not b!1467276) (not b!1467290) (not b!1467292) (not b!1467294) (not b!1467291) (not b!1467273) (not b!1467275) (not b!1467288) (not b!1467285) (not start!125418) (not b!1467272) (not b!1467277) (not b!1467282) (not b!1467278) (not b!1467281) (not b!1467283) (not b!1467279))
(check-sat)
