; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126556 () Bool)

(assert start!126556)

(declare-fun b!1485304 () Bool)

(declare-fun res!1010009 () Bool)

(declare-fun e!832694 () Bool)

(assert (=> b!1485304 (=> (not res!1010009) (not e!832694))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99518 0))(
  ( (array!99519 (arr!48035 (Array (_ BitVec 32) (_ BitVec 64))) (size!48585 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99518)

(assert (=> b!1485304 (= res!1010009 (and (= (size!48585 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48585 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48585 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485305 () Bool)

(declare-fun e!832689 () Bool)

(declare-fun e!832697 () Bool)

(assert (=> b!1485305 (= e!832689 e!832697)))

(declare-fun res!1010007 () Bool)

(assert (=> b!1485305 (=> res!1010007 e!832697)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648053 () (_ BitVec 64))

(assert (=> b!1485305 (= res!1010007 (or (and (= (select (arr!48035 a!2862) index!646) lt!648053) (= (select (arr!48035 a!2862) index!646) (select (arr!48035 a!2862) j!93))) (= (select (arr!48035 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485305 (= lt!648053 (select (store (arr!48035 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485306 () Bool)

(declare-fun res!1010002 () Bool)

(declare-fun e!832688 () Bool)

(assert (=> b!1485306 (=> (not res!1010002) (not e!832688))))

(declare-datatypes ((SeekEntryResult!12275 0))(
  ( (MissingZero!12275 (index!51492 (_ BitVec 32))) (Found!12275 (index!51493 (_ BitVec 32))) (Intermediate!12275 (undefined!13087 Bool) (index!51494 (_ BitVec 32)) (x!133071 (_ BitVec 32))) (Undefined!12275) (MissingVacant!12275 (index!51495 (_ BitVec 32))) )
))
(declare-fun lt!648048 () SeekEntryResult!12275)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99518 (_ BitVec 32)) SeekEntryResult!12275)

(assert (=> b!1485306 (= res!1010002 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48035 a!2862) j!93) a!2862 mask!2687) lt!648048))))

(declare-fun lt!648050 () array!99518)

(declare-fun lt!648054 () (_ BitVec 64))

(declare-fun b!1485307 () Bool)

(declare-fun e!832690 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99518 (_ BitVec 32)) SeekEntryResult!12275)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99518 (_ BitVec 32)) SeekEntryResult!12275)

(assert (=> b!1485307 (= e!832690 (= (seekEntryOrOpen!0 lt!648054 lt!648050 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648054 lt!648050 mask!2687)))))

(declare-fun b!1485308 () Bool)

(declare-fun e!832693 () Bool)

(declare-fun e!832695 () Bool)

(assert (=> b!1485308 (= e!832693 (not e!832695))))

(declare-fun res!1010003 () Bool)

(assert (=> b!1485308 (=> res!1010003 e!832695)))

(assert (=> b!1485308 (= res!1010003 (or (and (= (select (arr!48035 a!2862) index!646) (select (store (arr!48035 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48035 a!2862) index!646) (select (arr!48035 a!2862) j!93))) (= (select (arr!48035 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485308 e!832689))

(declare-fun res!1010008 () Bool)

(assert (=> b!1485308 (=> (not res!1010008) (not e!832689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99518 (_ BitVec 32)) Bool)

(assert (=> b!1485308 (= res!1010008 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49890 0))(
  ( (Unit!49891) )
))
(declare-fun lt!648052 () Unit!49890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49890)

(assert (=> b!1485308 (= lt!648052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1010006 () Bool)

(assert (=> start!126556 (=> (not res!1010006) (not e!832694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126556 (= res!1010006 (validMask!0 mask!2687))))

(assert (=> start!126556 e!832694))

(assert (=> start!126556 true))

(declare-fun array_inv!37063 (array!99518) Bool)

(assert (=> start!126556 (array_inv!37063 a!2862)))

(declare-fun b!1485309 () Bool)

(declare-fun res!1010004 () Bool)

(assert (=> b!1485309 (=> (not res!1010004) (not e!832694))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485309 (= res!1010004 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48585 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48585 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48585 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485310 () Bool)

(declare-fun res!1010010 () Bool)

(assert (=> b!1485310 (=> (not res!1010010) (not e!832694))))

(assert (=> b!1485310 (= res!1010010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485311 () Bool)

(declare-fun e!832696 () Bool)

(assert (=> b!1485311 (= e!832696 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648054 lt!648050 mask!2687) (seekEntryOrOpen!0 lt!648054 lt!648050 mask!2687)))))

(declare-fun b!1485312 () Bool)

(declare-fun res!1010014 () Bool)

(assert (=> b!1485312 (=> (not res!1010014) (not e!832693))))

(assert (=> b!1485312 (= res!1010014 e!832696)))

(declare-fun c!137175 () Bool)

(assert (=> b!1485312 (= c!137175 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485313 () Bool)

(assert (=> b!1485313 (= e!832695 true)))

(declare-fun lt!648051 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485313 (= lt!648051 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485314 () Bool)

(declare-fun lt!648049 () SeekEntryResult!12275)

(assert (=> b!1485314 (= e!832696 (= lt!648049 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648054 lt!648050 mask!2687)))))

(declare-fun b!1485315 () Bool)

(declare-fun res!1009999 () Bool)

(assert (=> b!1485315 (=> (not res!1009999) (not e!832694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485315 (= res!1009999 (validKeyInArray!0 (select (arr!48035 a!2862) j!93)))))

(declare-fun b!1485316 () Bool)

(assert (=> b!1485316 (= e!832688 e!832693)))

(declare-fun res!1010017 () Bool)

(assert (=> b!1485316 (=> (not res!1010017) (not e!832693))))

(assert (=> b!1485316 (= res!1010017 (= lt!648049 (Intermediate!12275 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485316 (= lt!648049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648054 mask!2687) lt!648054 lt!648050 mask!2687))))

(assert (=> b!1485316 (= lt!648054 (select (store (arr!48035 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485317 () Bool)

(assert (=> b!1485317 (= e!832697 e!832690)))

(declare-fun res!1010000 () Bool)

(assert (=> b!1485317 (=> (not res!1010000) (not e!832690))))

(assert (=> b!1485317 (= res!1010000 (and (= index!646 intermediateAfterIndex!19) (= lt!648053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485318 () Bool)

(declare-fun e!832692 () Bool)

(assert (=> b!1485318 (= e!832692 e!832688)))

(declare-fun res!1010011 () Bool)

(assert (=> b!1485318 (=> (not res!1010011) (not e!832688))))

(assert (=> b!1485318 (= res!1010011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48035 a!2862) j!93) mask!2687) (select (arr!48035 a!2862) j!93) a!2862 mask!2687) lt!648048))))

(assert (=> b!1485318 (= lt!648048 (Intermediate!12275 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485319 () Bool)

(declare-fun res!1010005 () Bool)

(assert (=> b!1485319 (=> (not res!1010005) (not e!832693))))

(assert (=> b!1485319 (= res!1010005 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485320 () Bool)

(assert (=> b!1485320 (= e!832694 e!832692)))

(declare-fun res!1010012 () Bool)

(assert (=> b!1485320 (=> (not res!1010012) (not e!832692))))

(assert (=> b!1485320 (= res!1010012 (= (select (store (arr!48035 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485320 (= lt!648050 (array!99519 (store (arr!48035 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48585 a!2862)))))

(declare-fun b!1485321 () Bool)

(declare-fun res!1010016 () Bool)

(assert (=> b!1485321 (=> (not res!1010016) (not e!832694))))

(assert (=> b!1485321 (= res!1010016 (validKeyInArray!0 (select (arr!48035 a!2862) i!1006)))))

(declare-fun b!1485322 () Bool)

(declare-fun res!1010015 () Bool)

(assert (=> b!1485322 (=> (not res!1010015) (not e!832689))))

(assert (=> b!1485322 (= res!1010015 (or (= (select (arr!48035 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48035 a!2862) intermediateBeforeIndex!19) (select (arr!48035 a!2862) j!93))))))

(declare-fun b!1485323 () Bool)

(declare-fun res!1010001 () Bool)

(assert (=> b!1485323 (=> (not res!1010001) (not e!832689))))

(assert (=> b!1485323 (= res!1010001 (= (seekEntryOrOpen!0 (select (arr!48035 a!2862) j!93) a!2862 mask!2687) (Found!12275 j!93)))))

(declare-fun b!1485324 () Bool)

(declare-fun res!1010013 () Bool)

(assert (=> b!1485324 (=> (not res!1010013) (not e!832694))))

(declare-datatypes ((List!34536 0))(
  ( (Nil!34533) (Cons!34532 (h!35906 (_ BitVec 64)) (t!49230 List!34536)) )
))
(declare-fun arrayNoDuplicates!0 (array!99518 (_ BitVec 32) List!34536) Bool)

(assert (=> b!1485324 (= res!1010013 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34533))))

(assert (= (and start!126556 res!1010006) b!1485304))

(assert (= (and b!1485304 res!1010009) b!1485321))

(assert (= (and b!1485321 res!1010016) b!1485315))

(assert (= (and b!1485315 res!1009999) b!1485310))

(assert (= (and b!1485310 res!1010010) b!1485324))

(assert (= (and b!1485324 res!1010013) b!1485309))

(assert (= (and b!1485309 res!1010004) b!1485320))

(assert (= (and b!1485320 res!1010012) b!1485318))

(assert (= (and b!1485318 res!1010011) b!1485306))

(assert (= (and b!1485306 res!1010002) b!1485316))

(assert (= (and b!1485316 res!1010017) b!1485312))

(assert (= (and b!1485312 c!137175) b!1485314))

(assert (= (and b!1485312 (not c!137175)) b!1485311))

(assert (= (and b!1485312 res!1010014) b!1485319))

(assert (= (and b!1485319 res!1010005) b!1485308))

(assert (= (and b!1485308 res!1010008) b!1485323))

(assert (= (and b!1485323 res!1010001) b!1485322))

(assert (= (and b!1485322 res!1010015) b!1485305))

(assert (= (and b!1485305 (not res!1010007)) b!1485317))

(assert (= (and b!1485317 res!1010000) b!1485307))

(assert (= (and b!1485308 (not res!1010003)) b!1485313))

(declare-fun m!1370461 () Bool)

(assert (=> b!1485315 m!1370461))

(assert (=> b!1485315 m!1370461))

(declare-fun m!1370463 () Bool)

(assert (=> b!1485315 m!1370463))

(declare-fun m!1370465 () Bool)

(assert (=> b!1485308 m!1370465))

(declare-fun m!1370467 () Bool)

(assert (=> b!1485308 m!1370467))

(declare-fun m!1370469 () Bool)

(assert (=> b!1485308 m!1370469))

(declare-fun m!1370471 () Bool)

(assert (=> b!1485308 m!1370471))

(declare-fun m!1370473 () Bool)

(assert (=> b!1485308 m!1370473))

(assert (=> b!1485308 m!1370461))

(assert (=> b!1485305 m!1370471))

(assert (=> b!1485305 m!1370461))

(assert (=> b!1485305 m!1370467))

(assert (=> b!1485305 m!1370469))

(assert (=> b!1485306 m!1370461))

(assert (=> b!1485306 m!1370461))

(declare-fun m!1370475 () Bool)

(assert (=> b!1485306 m!1370475))

(assert (=> b!1485318 m!1370461))

(assert (=> b!1485318 m!1370461))

(declare-fun m!1370477 () Bool)

(assert (=> b!1485318 m!1370477))

(assert (=> b!1485318 m!1370477))

(assert (=> b!1485318 m!1370461))

(declare-fun m!1370479 () Bool)

(assert (=> b!1485318 m!1370479))

(declare-fun m!1370481 () Bool)

(assert (=> start!126556 m!1370481))

(declare-fun m!1370483 () Bool)

(assert (=> start!126556 m!1370483))

(assert (=> b!1485320 m!1370467))

(declare-fun m!1370485 () Bool)

(assert (=> b!1485320 m!1370485))

(declare-fun m!1370487 () Bool)

(assert (=> b!1485311 m!1370487))

(declare-fun m!1370489 () Bool)

(assert (=> b!1485311 m!1370489))

(declare-fun m!1370491 () Bool)

(assert (=> b!1485324 m!1370491))

(declare-fun m!1370493 () Bool)

(assert (=> b!1485316 m!1370493))

(assert (=> b!1485316 m!1370493))

(declare-fun m!1370495 () Bool)

(assert (=> b!1485316 m!1370495))

(assert (=> b!1485316 m!1370467))

(declare-fun m!1370497 () Bool)

(assert (=> b!1485316 m!1370497))

(assert (=> b!1485323 m!1370461))

(assert (=> b!1485323 m!1370461))

(declare-fun m!1370499 () Bool)

(assert (=> b!1485323 m!1370499))

(declare-fun m!1370501 () Bool)

(assert (=> b!1485321 m!1370501))

(assert (=> b!1485321 m!1370501))

(declare-fun m!1370503 () Bool)

(assert (=> b!1485321 m!1370503))

(assert (=> b!1485307 m!1370489))

(assert (=> b!1485307 m!1370487))

(declare-fun m!1370505 () Bool)

(assert (=> b!1485310 m!1370505))

(declare-fun m!1370507 () Bool)

(assert (=> b!1485313 m!1370507))

(declare-fun m!1370509 () Bool)

(assert (=> b!1485322 m!1370509))

(assert (=> b!1485322 m!1370461))

(declare-fun m!1370511 () Bool)

(assert (=> b!1485314 m!1370511))

(push 1)

