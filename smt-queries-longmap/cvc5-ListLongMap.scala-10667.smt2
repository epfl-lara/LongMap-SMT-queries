; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125140 () Bool)

(assert start!125140)

(declare-fun b!1458264 () Bool)

(declare-fun res!988425 () Bool)

(declare-fun e!820263 () Bool)

(assert (=> b!1458264 (=> res!988425 e!820263)))

(declare-fun lt!638983 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11834 0))(
  ( (MissingZero!11834 (index!49728 (_ BitVec 32))) (Found!11834 (index!49729 (_ BitVec 32))) (Intermediate!11834 (undefined!12646 Bool) (index!49730 (_ BitVec 32)) (x!131347 (_ BitVec 32))) (Undefined!11834) (MissingVacant!11834 (index!49731 (_ BitVec 32))) )
))
(declare-fun lt!638984 () SeekEntryResult!11834)

(declare-datatypes ((array!98588 0))(
  ( (array!98589 (arr!47582 (Array (_ BitVec 32) (_ BitVec 64))) (size!48132 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98588)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98588 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458264 (= res!988425 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638983 (select (arr!47582 a!2862) j!93) a!2862 mask!2687) lt!638984)))))

(declare-fun b!1458265 () Bool)

(declare-fun res!988421 () Bool)

(declare-fun e!820269 () Bool)

(assert (=> b!1458265 (=> (not res!988421) (not e!820269))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458265 (= res!988421 (validKeyInArray!0 (select (arr!47582 a!2862) i!1006)))))

(declare-fun b!1458266 () Bool)

(declare-fun res!988419 () Bool)

(assert (=> b!1458266 (=> (not res!988419) (not e!820269))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458266 (= res!988419 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48132 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48132 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48132 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458267 () Bool)

(declare-fun res!988426 () Bool)

(assert (=> b!1458267 (=> (not res!988426) (not e!820269))))

(assert (=> b!1458267 (= res!988426 (validKeyInArray!0 (select (arr!47582 a!2862) j!93)))))

(declare-fun lt!638981 () SeekEntryResult!11834)

(declare-fun b!1458268 () Bool)

(declare-fun lt!638978 () array!98588)

(declare-fun e!820266 () Bool)

(declare-fun lt!638982 () (_ BitVec 64))

(assert (=> b!1458268 (= e!820266 (= lt!638981 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638982 lt!638978 mask!2687)))))

(declare-fun e!820270 () Bool)

(declare-fun b!1458269 () Bool)

(assert (=> b!1458269 (= e!820270 (not (= lt!638981 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638983 lt!638982 lt!638978 mask!2687))))))

(declare-fun b!1458270 () Bool)

(declare-fun res!988429 () Bool)

(assert (=> b!1458270 (=> (not res!988429) (not e!820269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98588 (_ BitVec 32)) Bool)

(assert (=> b!1458270 (= res!988429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458271 () Bool)

(declare-fun e!820268 () Bool)

(declare-fun e!820262 () Bool)

(assert (=> b!1458271 (= e!820268 (not e!820262))))

(declare-fun res!988417 () Bool)

(assert (=> b!1458271 (=> res!988417 e!820262)))

(assert (=> b!1458271 (= res!988417 (or (and (= (select (arr!47582 a!2862) index!646) (select (store (arr!47582 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47582 a!2862) index!646) (select (arr!47582 a!2862) j!93))) (= (select (arr!47582 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820265 () Bool)

(assert (=> b!1458271 e!820265))

(declare-fun res!988432 () Bool)

(assert (=> b!1458271 (=> (not res!988432) (not e!820265))))

(assert (=> b!1458271 (= res!988432 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49164 0))(
  ( (Unit!49165) )
))
(declare-fun lt!638980 () Unit!49164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49164)

(assert (=> b!1458271 (= lt!638980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458272 () Bool)

(declare-fun res!988431 () Bool)

(assert (=> b!1458272 (=> (not res!988431) (not e!820265))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98588 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458272 (= res!988431 (= (seekEntryOrOpen!0 (select (arr!47582 a!2862) j!93) a!2862 mask!2687) (Found!11834 j!93)))))

(declare-fun res!988422 () Bool)

(assert (=> start!125140 (=> (not res!988422) (not e!820269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125140 (= res!988422 (validMask!0 mask!2687))))

(assert (=> start!125140 e!820269))

(assert (=> start!125140 true))

(declare-fun array_inv!36610 (array!98588) Bool)

(assert (=> start!125140 (array_inv!36610 a!2862)))

(declare-fun b!1458273 () Bool)

(declare-fun res!988416 () Bool)

(assert (=> b!1458273 (=> (not res!988416) (not e!820268))))

(assert (=> b!1458273 (= res!988416 e!820266)))

(declare-fun c!134435 () Bool)

(assert (=> b!1458273 (= c!134435 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458274 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98588 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458274 (= e!820266 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638982 lt!638978 mask!2687) (seekEntryOrOpen!0 lt!638982 lt!638978 mask!2687)))))

(declare-fun b!1458275 () Bool)

(declare-fun e!820271 () Bool)

(assert (=> b!1458275 (= e!820269 e!820271)))

(declare-fun res!988424 () Bool)

(assert (=> b!1458275 (=> (not res!988424) (not e!820271))))

(assert (=> b!1458275 (= res!988424 (= (select (store (arr!47582 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458275 (= lt!638978 (array!98589 (store (arr!47582 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48132 a!2862)))))

(declare-fun b!1458276 () Bool)

(assert (=> b!1458276 (= e!820265 (and (or (= (select (arr!47582 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47582 a!2862) intermediateBeforeIndex!19) (select (arr!47582 a!2862) j!93))) (let ((bdg!53413 (select (store (arr!47582 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47582 a!2862) index!646) bdg!53413) (= (select (arr!47582 a!2862) index!646) (select (arr!47582 a!2862) j!93))) (= (select (arr!47582 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53413 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458277 () Bool)

(assert (=> b!1458277 (= e!820263 true)))

(declare-fun lt!638985 () Bool)

(assert (=> b!1458277 (= lt!638985 e!820270)))

(declare-fun c!134436 () Bool)

(assert (=> b!1458277 (= c!134436 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458278 () Bool)

(declare-fun res!988418 () Bool)

(assert (=> b!1458278 (=> (not res!988418) (not e!820269))))

(declare-datatypes ((List!34083 0))(
  ( (Nil!34080) (Cons!34079 (h!35429 (_ BitVec 64)) (t!48777 List!34083)) )
))
(declare-fun arrayNoDuplicates!0 (array!98588 (_ BitVec 32) List!34083) Bool)

(assert (=> b!1458278 (= res!988418 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34080))))

(declare-fun b!1458279 () Bool)

(assert (=> b!1458279 (= e!820262 e!820263)))

(declare-fun res!988423 () Bool)

(assert (=> b!1458279 (=> res!988423 e!820263)))

(assert (=> b!1458279 (= res!988423 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638983 #b00000000000000000000000000000000) (bvsge lt!638983 (size!48132 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458279 (= lt!638983 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638979 () SeekEntryResult!11834)

(assert (=> b!1458279 (= lt!638979 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638982 lt!638978 mask!2687))))

(assert (=> b!1458279 (= lt!638979 (seekEntryOrOpen!0 lt!638982 lt!638978 mask!2687))))

(declare-fun b!1458280 () Bool)

(declare-fun res!988427 () Bool)

(assert (=> b!1458280 (=> (not res!988427) (not e!820268))))

(assert (=> b!1458280 (= res!988427 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458281 () Bool)

(declare-fun res!988430 () Bool)

(assert (=> b!1458281 (=> (not res!988430) (not e!820269))))

(assert (=> b!1458281 (= res!988430 (and (= (size!48132 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48132 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48132 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458282 () Bool)

(declare-fun e!820264 () Bool)

(assert (=> b!1458282 (= e!820271 e!820264)))

(declare-fun res!988420 () Bool)

(assert (=> b!1458282 (=> (not res!988420) (not e!820264))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458282 (= res!988420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47582 a!2862) j!93) mask!2687) (select (arr!47582 a!2862) j!93) a!2862 mask!2687) lt!638984))))

(assert (=> b!1458282 (= lt!638984 (Intermediate!11834 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458283 () Bool)

(declare-fun res!988428 () Bool)

(assert (=> b!1458283 (=> (not res!988428) (not e!820264))))

(assert (=> b!1458283 (= res!988428 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47582 a!2862) j!93) a!2862 mask!2687) lt!638984))))

(declare-fun b!1458284 () Bool)

(assert (=> b!1458284 (= e!820270 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638983 intermediateAfterIndex!19 lt!638982 lt!638978 mask!2687) lt!638979)))))

(declare-fun b!1458285 () Bool)

(assert (=> b!1458285 (= e!820264 e!820268)))

(declare-fun res!988415 () Bool)

(assert (=> b!1458285 (=> (not res!988415) (not e!820268))))

(assert (=> b!1458285 (= res!988415 (= lt!638981 (Intermediate!11834 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458285 (= lt!638981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638982 mask!2687) lt!638982 lt!638978 mask!2687))))

(assert (=> b!1458285 (= lt!638982 (select (store (arr!47582 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125140 res!988422) b!1458281))

(assert (= (and b!1458281 res!988430) b!1458265))

(assert (= (and b!1458265 res!988421) b!1458267))

(assert (= (and b!1458267 res!988426) b!1458270))

(assert (= (and b!1458270 res!988429) b!1458278))

(assert (= (and b!1458278 res!988418) b!1458266))

(assert (= (and b!1458266 res!988419) b!1458275))

(assert (= (and b!1458275 res!988424) b!1458282))

(assert (= (and b!1458282 res!988420) b!1458283))

(assert (= (and b!1458283 res!988428) b!1458285))

(assert (= (and b!1458285 res!988415) b!1458273))

(assert (= (and b!1458273 c!134435) b!1458268))

(assert (= (and b!1458273 (not c!134435)) b!1458274))

(assert (= (and b!1458273 res!988416) b!1458280))

(assert (= (and b!1458280 res!988427) b!1458271))

(assert (= (and b!1458271 res!988432) b!1458272))

(assert (= (and b!1458272 res!988431) b!1458276))

(assert (= (and b!1458271 (not res!988417)) b!1458279))

(assert (= (and b!1458279 (not res!988423)) b!1458264))

(assert (= (and b!1458264 (not res!988425)) b!1458277))

(assert (= (and b!1458277 c!134436) b!1458269))

(assert (= (and b!1458277 (not c!134436)) b!1458284))

(declare-fun m!1346143 () Bool)

(assert (=> b!1458275 m!1346143))

(declare-fun m!1346145 () Bool)

(assert (=> b!1458275 m!1346145))

(declare-fun m!1346147 () Bool)

(assert (=> b!1458279 m!1346147))

(declare-fun m!1346149 () Bool)

(assert (=> b!1458279 m!1346149))

(declare-fun m!1346151 () Bool)

(assert (=> b!1458279 m!1346151))

(declare-fun m!1346153 () Bool)

(assert (=> start!125140 m!1346153))

(declare-fun m!1346155 () Bool)

(assert (=> start!125140 m!1346155))

(assert (=> b!1458274 m!1346149))

(assert (=> b!1458274 m!1346151))

(declare-fun m!1346157 () Bool)

(assert (=> b!1458278 m!1346157))

(declare-fun m!1346159 () Bool)

(assert (=> b!1458265 m!1346159))

(assert (=> b!1458265 m!1346159))

(declare-fun m!1346161 () Bool)

(assert (=> b!1458265 m!1346161))

(declare-fun m!1346163 () Bool)

(assert (=> b!1458268 m!1346163))

(declare-fun m!1346165 () Bool)

(assert (=> b!1458282 m!1346165))

(assert (=> b!1458282 m!1346165))

(declare-fun m!1346167 () Bool)

(assert (=> b!1458282 m!1346167))

(assert (=> b!1458282 m!1346167))

(assert (=> b!1458282 m!1346165))

(declare-fun m!1346169 () Bool)

(assert (=> b!1458282 m!1346169))

(assert (=> b!1458283 m!1346165))

(assert (=> b!1458283 m!1346165))

(declare-fun m!1346171 () Bool)

(assert (=> b!1458283 m!1346171))

(assert (=> b!1458264 m!1346165))

(assert (=> b!1458264 m!1346165))

(declare-fun m!1346173 () Bool)

(assert (=> b!1458264 m!1346173))

(declare-fun m!1346175 () Bool)

(assert (=> b!1458271 m!1346175))

(assert (=> b!1458271 m!1346143))

(declare-fun m!1346177 () Bool)

(assert (=> b!1458271 m!1346177))

(declare-fun m!1346179 () Bool)

(assert (=> b!1458271 m!1346179))

(declare-fun m!1346181 () Bool)

(assert (=> b!1458271 m!1346181))

(assert (=> b!1458271 m!1346165))

(declare-fun m!1346183 () Bool)

(assert (=> b!1458270 m!1346183))

(assert (=> b!1458267 m!1346165))

(assert (=> b!1458267 m!1346165))

(declare-fun m!1346185 () Bool)

(assert (=> b!1458267 m!1346185))

(declare-fun m!1346187 () Bool)

(assert (=> b!1458285 m!1346187))

(assert (=> b!1458285 m!1346187))

(declare-fun m!1346189 () Bool)

(assert (=> b!1458285 m!1346189))

(assert (=> b!1458285 m!1346143))

(declare-fun m!1346191 () Bool)

(assert (=> b!1458285 m!1346191))

(assert (=> b!1458272 m!1346165))

(assert (=> b!1458272 m!1346165))

(declare-fun m!1346193 () Bool)

(assert (=> b!1458272 m!1346193))

(declare-fun m!1346195 () Bool)

(assert (=> b!1458284 m!1346195))

(declare-fun m!1346197 () Bool)

(assert (=> b!1458269 m!1346197))

(assert (=> b!1458276 m!1346143))

(declare-fun m!1346199 () Bool)

(assert (=> b!1458276 m!1346199))

(assert (=> b!1458276 m!1346177))

(assert (=> b!1458276 m!1346179))

(assert (=> b!1458276 m!1346165))

(push 1)

