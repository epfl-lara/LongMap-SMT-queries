; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127364 () Bool)

(assert start!127364)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!838440 () Bool)

(declare-fun lt!652332 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!652331 () (_ BitVec 32))

(declare-datatypes ((array!99826 0))(
  ( (array!99827 (arr!48177 (Array (_ BitVec 32) (_ BitVec 64))) (size!48727 (_ BitVec 32))) )
))
(declare-fun lt!652333 () array!99826)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1497131 () Bool)

(declare-datatypes ((SeekEntryResult!12417 0))(
  ( (MissingZero!12417 (index!52060 (_ BitVec 32))) (Found!12417 (index!52061 (_ BitVec 32))) (Intermediate!12417 (undefined!13229 Bool) (index!52062 (_ BitVec 32)) (x!133683 (_ BitVec 32))) (Undefined!12417) (MissingVacant!12417 (index!52063 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99826 (_ BitVec 32)) SeekEntryResult!12417)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99826 (_ BitVec 32)) SeekEntryResult!12417)

(assert (=> b!1497131 (= e!838440 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652331 intermediateAfterIndex!19 lt!652332 lt!652333 mask!2687) (seekEntryOrOpen!0 lt!652332 lt!652333 mask!2687))))))

(declare-fun b!1497132 () Bool)

(declare-fun res!1018364 () Bool)

(declare-fun e!838441 () Bool)

(assert (=> b!1497132 (=> (not res!1018364) (not e!838441))))

(declare-fun a!2862 () array!99826)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497132 (= res!1018364 (validKeyInArray!0 (select (arr!48177 a!2862) j!93)))))

(declare-fun b!1497134 () Bool)

(declare-fun res!1018352 () Bool)

(assert (=> b!1497134 (=> (not res!1018352) (not e!838441))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497134 (= res!1018352 (and (= (size!48727 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48727 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48727 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497135 () Bool)

(declare-fun e!838437 () Bool)

(declare-fun e!838439 () Bool)

(assert (=> b!1497135 (= e!838437 e!838439)))

(declare-fun res!1018354 () Bool)

(assert (=> b!1497135 (=> (not res!1018354) (not e!838439))))

(declare-fun lt!652335 () SeekEntryResult!12417)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497135 (= res!1018354 (= lt!652335 (Intermediate!12417 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99826 (_ BitVec 32)) SeekEntryResult!12417)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497135 (= lt!652335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652332 mask!2687) lt!652332 lt!652333 mask!2687))))

(assert (=> b!1497135 (= lt!652332 (select (store (arr!48177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497136 () Bool)

(declare-fun res!1018363 () Bool)

(declare-fun e!838442 () Bool)

(assert (=> b!1497136 (=> res!1018363 e!838442)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497136 (= res!1018363 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497137 () Bool)

(declare-fun e!838444 () Bool)

(assert (=> b!1497137 (= e!838439 (not e!838444))))

(declare-fun res!1018362 () Bool)

(assert (=> b!1497137 (=> res!1018362 e!838444)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497137 (= res!1018362 (or (and (= (select (arr!48177 a!2862) index!646) (select (store (arr!48177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48177 a!2862) index!646) (select (arr!48177 a!2862) j!93))) (= (select (arr!48177 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!652336 () SeekEntryResult!12417)

(assert (=> b!1497137 (and (= lt!652336 (Found!12417 j!93)) (or (= (select (arr!48177 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48177 a!2862) intermediateBeforeIndex!19) (select (arr!48177 a!2862) j!93))))))

(assert (=> b!1497137 (= lt!652336 (seekEntryOrOpen!0 (select (arr!48177 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99826 (_ BitVec 32)) Bool)

(assert (=> b!1497137 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50174 0))(
  ( (Unit!50175) )
))
(declare-fun lt!652329 () Unit!50174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50174)

(assert (=> b!1497137 (= lt!652329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497138 () Bool)

(assert (=> b!1497138 (= e!838440 (not (= lt!652335 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652331 lt!652332 lt!652333 mask!2687))))))

(declare-fun b!1497139 () Bool)

(declare-fun res!1018355 () Bool)

(assert (=> b!1497139 (=> (not res!1018355) (not e!838441))))

(assert (=> b!1497139 (= res!1018355 (validKeyInArray!0 (select (arr!48177 a!2862) i!1006)))))

(declare-fun b!1497140 () Bool)

(assert (=> b!1497140 (= e!838442 true)))

(assert (=> b!1497140 (= lt!652336 (seekEntryOrOpen!0 lt!652332 lt!652333 mask!2687))))

(declare-fun lt!652334 () Unit!50174)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50174)

(assert (=> b!1497140 (= lt!652334 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652331 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497141 () Bool)

(assert (=> b!1497141 (= e!838444 e!838442)))

(declare-fun res!1018350 () Bool)

(assert (=> b!1497141 (=> res!1018350 e!838442)))

(assert (=> b!1497141 (= res!1018350 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652331 #b00000000000000000000000000000000) (bvsge lt!652331 (size!48727 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497141 (= lt!652331 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497142 () Bool)

(declare-fun e!838436 () Bool)

(assert (=> b!1497142 (= e!838441 e!838436)))

(declare-fun res!1018353 () Bool)

(assert (=> b!1497142 (=> (not res!1018353) (not e!838436))))

(assert (=> b!1497142 (= res!1018353 (= (select (store (arr!48177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497142 (= lt!652333 (array!99827 (store (arr!48177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48727 a!2862)))))

(declare-fun b!1497133 () Bool)

(declare-fun res!1018360 () Bool)

(assert (=> b!1497133 (=> (not res!1018360) (not e!838437))))

(declare-fun lt!652330 () SeekEntryResult!12417)

(assert (=> b!1497133 (= res!1018360 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48177 a!2862) j!93) a!2862 mask!2687) lt!652330))))

(declare-fun res!1018358 () Bool)

(assert (=> start!127364 (=> (not res!1018358) (not e!838441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127364 (= res!1018358 (validMask!0 mask!2687))))

(assert (=> start!127364 e!838441))

(assert (=> start!127364 true))

(declare-fun array_inv!37205 (array!99826) Bool)

(assert (=> start!127364 (array_inv!37205 a!2862)))

(declare-fun b!1497143 () Bool)

(assert (=> b!1497143 (= e!838436 e!838437)))

(declare-fun res!1018357 () Bool)

(assert (=> b!1497143 (=> (not res!1018357) (not e!838437))))

(assert (=> b!1497143 (= res!1018357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48177 a!2862) j!93) mask!2687) (select (arr!48177 a!2862) j!93) a!2862 mask!2687) lt!652330))))

(assert (=> b!1497143 (= lt!652330 (Intermediate!12417 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497144 () Bool)

(declare-fun res!1018361 () Bool)

(assert (=> b!1497144 (=> (not res!1018361) (not e!838441))))

(assert (=> b!1497144 (= res!1018361 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48727 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48727 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48727 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497145 () Bool)

(declare-fun res!1018351 () Bool)

(assert (=> b!1497145 (=> (not res!1018351) (not e!838441))))

(assert (=> b!1497145 (= res!1018351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497146 () Bool)

(declare-fun res!1018365 () Bool)

(assert (=> b!1497146 (=> res!1018365 e!838442)))

(assert (=> b!1497146 (= res!1018365 e!838440)))

(declare-fun c!138926 () Bool)

(assert (=> b!1497146 (= c!138926 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497147 () Bool)

(declare-fun e!838443 () Bool)

(assert (=> b!1497147 (= e!838443 (= lt!652335 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652332 lt!652333 mask!2687)))))

(declare-fun b!1497148 () Bool)

(declare-fun res!1018366 () Bool)

(assert (=> b!1497148 (=> (not res!1018366) (not e!838441))))

(declare-datatypes ((List!34678 0))(
  ( (Nil!34675) (Cons!34674 (h!36071 (_ BitVec 64)) (t!49372 List!34678)) )
))
(declare-fun arrayNoDuplicates!0 (array!99826 (_ BitVec 32) List!34678) Bool)

(assert (=> b!1497148 (= res!1018366 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34675))))

(declare-fun b!1497149 () Bool)

(assert (=> b!1497149 (= e!838443 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652332 lt!652333 mask!2687) (seekEntryOrOpen!0 lt!652332 lt!652333 mask!2687)))))

(declare-fun b!1497150 () Bool)

(declare-fun res!1018356 () Bool)

(assert (=> b!1497150 (=> res!1018356 e!838442)))

(assert (=> b!1497150 (= res!1018356 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652331 (select (arr!48177 a!2862) j!93) a!2862 mask!2687) lt!652330)))))

(declare-fun b!1497151 () Bool)

(declare-fun res!1018359 () Bool)

(assert (=> b!1497151 (=> (not res!1018359) (not e!838439))))

(assert (=> b!1497151 (= res!1018359 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497152 () Bool)

(declare-fun res!1018349 () Bool)

(assert (=> b!1497152 (=> (not res!1018349) (not e!838439))))

(assert (=> b!1497152 (= res!1018349 e!838443)))

(declare-fun c!138925 () Bool)

(assert (=> b!1497152 (= c!138925 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!127364 res!1018358) b!1497134))

(assert (= (and b!1497134 res!1018352) b!1497139))

(assert (= (and b!1497139 res!1018355) b!1497132))

(assert (= (and b!1497132 res!1018364) b!1497145))

(assert (= (and b!1497145 res!1018351) b!1497148))

(assert (= (and b!1497148 res!1018366) b!1497144))

(assert (= (and b!1497144 res!1018361) b!1497142))

(assert (= (and b!1497142 res!1018353) b!1497143))

(assert (= (and b!1497143 res!1018357) b!1497133))

(assert (= (and b!1497133 res!1018360) b!1497135))

(assert (= (and b!1497135 res!1018354) b!1497152))

(assert (= (and b!1497152 c!138925) b!1497147))

(assert (= (and b!1497152 (not c!138925)) b!1497149))

(assert (= (and b!1497152 res!1018349) b!1497151))

(assert (= (and b!1497151 res!1018359) b!1497137))

(assert (= (and b!1497137 (not res!1018362)) b!1497141))

(assert (= (and b!1497141 (not res!1018350)) b!1497150))

(assert (= (and b!1497150 (not res!1018356)) b!1497146))

(assert (= (and b!1497146 c!138926) b!1497138))

(assert (= (and b!1497146 (not c!138926)) b!1497131))

(assert (= (and b!1497146 (not res!1018365)) b!1497136))

(assert (= (and b!1497136 (not res!1018363)) b!1497140))

(declare-fun m!1380235 () Bool)

(assert (=> b!1497137 m!1380235))

(declare-fun m!1380237 () Bool)

(assert (=> b!1497137 m!1380237))

(declare-fun m!1380239 () Bool)

(assert (=> b!1497137 m!1380239))

(declare-fun m!1380241 () Bool)

(assert (=> b!1497137 m!1380241))

(declare-fun m!1380243 () Bool)

(assert (=> b!1497137 m!1380243))

(declare-fun m!1380245 () Bool)

(assert (=> b!1497137 m!1380245))

(declare-fun m!1380247 () Bool)

(assert (=> b!1497137 m!1380247))

(declare-fun m!1380249 () Bool)

(assert (=> b!1497137 m!1380249))

(assert (=> b!1497137 m!1380245))

(declare-fun m!1380251 () Bool)

(assert (=> b!1497131 m!1380251))

(declare-fun m!1380253 () Bool)

(assert (=> b!1497131 m!1380253))

(assert (=> b!1497150 m!1380245))

(assert (=> b!1497150 m!1380245))

(declare-fun m!1380255 () Bool)

(assert (=> b!1497150 m!1380255))

(assert (=> b!1497142 m!1380237))

(declare-fun m!1380257 () Bool)

(assert (=> b!1497142 m!1380257))

(declare-fun m!1380259 () Bool)

(assert (=> b!1497147 m!1380259))

(declare-fun m!1380261 () Bool)

(assert (=> start!127364 m!1380261))

(declare-fun m!1380263 () Bool)

(assert (=> start!127364 m!1380263))

(assert (=> b!1497140 m!1380253))

(declare-fun m!1380265 () Bool)

(assert (=> b!1497140 m!1380265))

(declare-fun m!1380267 () Bool)

(assert (=> b!1497139 m!1380267))

(assert (=> b!1497139 m!1380267))

(declare-fun m!1380269 () Bool)

(assert (=> b!1497139 m!1380269))

(declare-fun m!1380271 () Bool)

(assert (=> b!1497145 m!1380271))

(assert (=> b!1497143 m!1380245))

(assert (=> b!1497143 m!1380245))

(declare-fun m!1380273 () Bool)

(assert (=> b!1497143 m!1380273))

(assert (=> b!1497143 m!1380273))

(assert (=> b!1497143 m!1380245))

(declare-fun m!1380275 () Bool)

(assert (=> b!1497143 m!1380275))

(declare-fun m!1380277 () Bool)

(assert (=> b!1497138 m!1380277))

(declare-fun m!1380279 () Bool)

(assert (=> b!1497149 m!1380279))

(assert (=> b!1497149 m!1380253))

(declare-fun m!1380281 () Bool)

(assert (=> b!1497141 m!1380281))

(assert (=> b!1497132 m!1380245))

(assert (=> b!1497132 m!1380245))

(declare-fun m!1380283 () Bool)

(assert (=> b!1497132 m!1380283))

(declare-fun m!1380285 () Bool)

(assert (=> b!1497148 m!1380285))

(assert (=> b!1497133 m!1380245))

(assert (=> b!1497133 m!1380245))

(declare-fun m!1380287 () Bool)

(assert (=> b!1497133 m!1380287))

(declare-fun m!1380289 () Bool)

(assert (=> b!1497135 m!1380289))

(assert (=> b!1497135 m!1380289))

(declare-fun m!1380291 () Bool)

(assert (=> b!1497135 m!1380291))

(assert (=> b!1497135 m!1380237))

(declare-fun m!1380293 () Bool)

(assert (=> b!1497135 m!1380293))

(check-sat (not b!1497133) (not b!1497135) (not b!1497132) (not b!1497148) (not b!1497139) (not b!1497145) (not b!1497147) (not b!1497141) (not b!1497138) (not b!1497140) (not b!1497150) (not b!1497143) (not start!127364) (not b!1497131) (not b!1497149) (not b!1497137))
(check-sat)
