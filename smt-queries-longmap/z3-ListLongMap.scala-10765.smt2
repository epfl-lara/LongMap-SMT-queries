; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125910 () Bool)

(assert start!125910)

(declare-fun b!1474262 () Bool)

(declare-fun e!827198 () Bool)

(declare-fun e!827202 () Bool)

(assert (=> b!1474262 (= e!827198 e!827202)))

(declare-fun res!1001492 () Bool)

(assert (=> b!1474262 (=> (not res!1001492) (not e!827202))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99187 0))(
  ( (array!99188 (arr!47877 (Array (_ BitVec 32) (_ BitVec 64))) (size!48427 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99187)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474262 (= res!1001492 (= (select (store (arr!47877 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644201 () array!99187)

(assert (=> b!1474262 (= lt!644201 (array!99188 (store (arr!47877 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48427 a!2862)))))

(declare-fun b!1474263 () Bool)

(declare-fun res!1001487 () Bool)

(assert (=> b!1474263 (=> (not res!1001487) (not e!827198))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474263 (= res!1001487 (validKeyInArray!0 (select (arr!47877 a!2862) j!93)))))

(declare-fun b!1474264 () Bool)

(declare-fun res!1001493 () Bool)

(assert (=> b!1474264 (=> (not res!1001493) (not e!827198))))

(declare-datatypes ((List!34378 0))(
  ( (Nil!34375) (Cons!34374 (h!35733 (_ BitVec 64)) (t!49072 List!34378)) )
))
(declare-fun arrayNoDuplicates!0 (array!99187 (_ BitVec 32) List!34378) Bool)

(assert (=> b!1474264 (= res!1001493 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34375))))

(declare-fun b!1474265 () Bool)

(declare-fun e!827203 () Bool)

(declare-fun e!827200 () Bool)

(assert (=> b!1474265 (= e!827203 e!827200)))

(declare-fun res!1001489 () Bool)

(assert (=> b!1474265 (=> (not res!1001489) (not e!827200))))

(declare-datatypes ((SeekEntryResult!12117 0))(
  ( (MissingZero!12117 (index!50860 (_ BitVec 32))) (Found!12117 (index!50861 (_ BitVec 32))) (Intermediate!12117 (undefined!12929 Bool) (index!50862 (_ BitVec 32)) (x!132441 (_ BitVec 32))) (Undefined!12117) (MissingVacant!12117 (index!50863 (_ BitVec 32))) )
))
(declare-fun lt!644202 () SeekEntryResult!12117)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474265 (= res!1001489 (= lt!644202 (Intermediate!12117 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!644199 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474265 (= lt!644202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644199 mask!2687) lt!644199 lt!644201 mask!2687))))

(assert (=> b!1474265 (= lt!644199 (select (store (arr!47877 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474266 () Bool)

(assert (=> b!1474266 (= e!827200 (not true))))

(declare-fun e!827201 () Bool)

(assert (=> b!1474266 e!827201))

(declare-fun res!1001491 () Bool)

(assert (=> b!1474266 (=> (not res!1001491) (not e!827201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99187 (_ BitVec 32)) Bool)

(assert (=> b!1474266 (= res!1001491 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49574 0))(
  ( (Unit!49575) )
))
(declare-fun lt!644200 () Unit!49574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49574)

(assert (=> b!1474266 (= lt!644200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!827199 () Bool)

(declare-fun b!1474267 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474267 (= e!827199 (= lt!644202 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644199 lt!644201 mask!2687)))))

(declare-fun b!1474268 () Bool)

(declare-fun res!1001497 () Bool)

(assert (=> b!1474268 (=> (not res!1001497) (not e!827200))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474268 (= res!1001497 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12117)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12117)

(assert (=> b!1474269 (= e!827199 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644199 lt!644201 mask!2687) (seekEntryOrOpen!0 lt!644199 lt!644201 mask!2687)))))

(declare-fun b!1474270 () Bool)

(declare-fun res!1001490 () Bool)

(assert (=> b!1474270 (=> (not res!1001490) (not e!827198))))

(assert (=> b!1474270 (= res!1001490 (and (= (size!48427 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48427 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48427 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474271 () Bool)

(declare-fun res!1001496 () Bool)

(assert (=> b!1474271 (=> (not res!1001496) (not e!827198))))

(assert (=> b!1474271 (= res!1001496 (validKeyInArray!0 (select (arr!47877 a!2862) i!1006)))))

(declare-fun b!1474272 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1474272 (= e!827201 (or (= (select (arr!47877 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47877 a!2862) intermediateBeforeIndex!19) (select (arr!47877 a!2862) j!93))))))

(declare-fun b!1474273 () Bool)

(declare-fun res!1001498 () Bool)

(assert (=> b!1474273 (=> (not res!1001498) (not e!827203))))

(declare-fun lt!644198 () SeekEntryResult!12117)

(assert (=> b!1474273 (= res!1001498 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47877 a!2862) j!93) a!2862 mask!2687) lt!644198))))

(declare-fun b!1474274 () Bool)

(declare-fun res!1001495 () Bool)

(assert (=> b!1474274 (=> (not res!1001495) (not e!827198))))

(assert (=> b!1474274 (= res!1001495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48427 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48427 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48427 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474276 () Bool)

(declare-fun res!1001486 () Bool)

(assert (=> b!1474276 (=> (not res!1001486) (not e!827200))))

(assert (=> b!1474276 (= res!1001486 e!827199)))

(declare-fun c!135903 () Bool)

(assert (=> b!1474276 (= c!135903 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474277 () Bool)

(declare-fun res!1001500 () Bool)

(assert (=> b!1474277 (=> (not res!1001500) (not e!827198))))

(assert (=> b!1474277 (= res!1001500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474278 () Bool)

(assert (=> b!1474278 (= e!827202 e!827203)))

(declare-fun res!1001488 () Bool)

(assert (=> b!1474278 (=> (not res!1001488) (not e!827203))))

(assert (=> b!1474278 (= res!1001488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47877 a!2862) j!93) mask!2687) (select (arr!47877 a!2862) j!93) a!2862 mask!2687) lt!644198))))

(assert (=> b!1474278 (= lt!644198 (Intermediate!12117 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1001494 () Bool)

(assert (=> start!125910 (=> (not res!1001494) (not e!827198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125910 (= res!1001494 (validMask!0 mask!2687))))

(assert (=> start!125910 e!827198))

(assert (=> start!125910 true))

(declare-fun array_inv!36905 (array!99187) Bool)

(assert (=> start!125910 (array_inv!36905 a!2862)))

(declare-fun b!1474275 () Bool)

(declare-fun res!1001499 () Bool)

(assert (=> b!1474275 (=> (not res!1001499) (not e!827201))))

(assert (=> b!1474275 (= res!1001499 (= (seekEntryOrOpen!0 (select (arr!47877 a!2862) j!93) a!2862 mask!2687) (Found!12117 j!93)))))

(assert (= (and start!125910 res!1001494) b!1474270))

(assert (= (and b!1474270 res!1001490) b!1474271))

(assert (= (and b!1474271 res!1001496) b!1474263))

(assert (= (and b!1474263 res!1001487) b!1474277))

(assert (= (and b!1474277 res!1001500) b!1474264))

(assert (= (and b!1474264 res!1001493) b!1474274))

(assert (= (and b!1474274 res!1001495) b!1474262))

(assert (= (and b!1474262 res!1001492) b!1474278))

(assert (= (and b!1474278 res!1001488) b!1474273))

(assert (= (and b!1474273 res!1001498) b!1474265))

(assert (= (and b!1474265 res!1001489) b!1474276))

(assert (= (and b!1474276 c!135903) b!1474267))

(assert (= (and b!1474276 (not c!135903)) b!1474269))

(assert (= (and b!1474276 res!1001486) b!1474268))

(assert (= (and b!1474268 res!1001497) b!1474266))

(assert (= (and b!1474266 res!1001491) b!1474275))

(assert (= (and b!1474275 res!1001499) b!1474272))

(declare-fun m!1360727 () Bool)

(assert (=> b!1474269 m!1360727))

(declare-fun m!1360729 () Bool)

(assert (=> b!1474269 m!1360729))

(declare-fun m!1360731 () Bool)

(assert (=> b!1474265 m!1360731))

(assert (=> b!1474265 m!1360731))

(declare-fun m!1360733 () Bool)

(assert (=> b!1474265 m!1360733))

(declare-fun m!1360735 () Bool)

(assert (=> b!1474265 m!1360735))

(declare-fun m!1360737 () Bool)

(assert (=> b!1474265 m!1360737))

(declare-fun m!1360739 () Bool)

(assert (=> b!1474264 m!1360739))

(declare-fun m!1360741 () Bool)

(assert (=> b!1474277 m!1360741))

(declare-fun m!1360743 () Bool)

(assert (=> b!1474271 m!1360743))

(assert (=> b!1474271 m!1360743))

(declare-fun m!1360745 () Bool)

(assert (=> b!1474271 m!1360745))

(declare-fun m!1360747 () Bool)

(assert (=> b!1474263 m!1360747))

(assert (=> b!1474263 m!1360747))

(declare-fun m!1360749 () Bool)

(assert (=> b!1474263 m!1360749))

(declare-fun m!1360751 () Bool)

(assert (=> b!1474266 m!1360751))

(declare-fun m!1360753 () Bool)

(assert (=> b!1474266 m!1360753))

(assert (=> b!1474278 m!1360747))

(assert (=> b!1474278 m!1360747))

(declare-fun m!1360755 () Bool)

(assert (=> b!1474278 m!1360755))

(assert (=> b!1474278 m!1360755))

(assert (=> b!1474278 m!1360747))

(declare-fun m!1360757 () Bool)

(assert (=> b!1474278 m!1360757))

(assert (=> b!1474275 m!1360747))

(assert (=> b!1474275 m!1360747))

(declare-fun m!1360759 () Bool)

(assert (=> b!1474275 m!1360759))

(declare-fun m!1360761 () Bool)

(assert (=> b!1474272 m!1360761))

(assert (=> b!1474272 m!1360747))

(assert (=> b!1474273 m!1360747))

(assert (=> b!1474273 m!1360747))

(declare-fun m!1360763 () Bool)

(assert (=> b!1474273 m!1360763))

(declare-fun m!1360765 () Bool)

(assert (=> start!125910 m!1360765))

(declare-fun m!1360767 () Bool)

(assert (=> start!125910 m!1360767))

(assert (=> b!1474262 m!1360735))

(declare-fun m!1360769 () Bool)

(assert (=> b!1474262 m!1360769))

(declare-fun m!1360771 () Bool)

(assert (=> b!1474267 m!1360771))

(check-sat (not b!1474278) (not b!1474269) (not b!1474273) (not b!1474266) (not b!1474271) (not b!1474265) (not start!125910) (not b!1474275) (not b!1474264) (not b!1474263) (not b!1474277) (not b!1474267))
(check-sat)
