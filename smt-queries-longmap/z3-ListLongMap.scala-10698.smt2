; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125328 () Bool)

(assert start!125328)

(declare-fun b!1464297 () Bool)

(declare-fun res!993400 () Bool)

(declare-fun e!822911 () Bool)

(assert (=> b!1464297 (=> (not res!993400) (not e!822911))))

(declare-datatypes ((array!98776 0))(
  ( (array!98777 (arr!47676 (Array (_ BitVec 32) (_ BitVec 64))) (size!48226 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98776)

(declare-datatypes ((List!34177 0))(
  ( (Nil!34174) (Cons!34173 (h!35523 (_ BitVec 64)) (t!48871 List!34177)) )
))
(declare-fun arrayNoDuplicates!0 (array!98776 (_ BitVec 32) List!34177) Bool)

(assert (=> b!1464297 (= res!993400 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34174))))

(declare-fun b!1464298 () Bool)

(declare-fun res!993409 () Bool)

(declare-fun e!822918 () Bool)

(assert (=> b!1464298 (=> res!993409 e!822918)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11928 0))(
  ( (MissingZero!11928 (index!50104 (_ BitVec 32))) (Found!11928 (index!50105 (_ BitVec 32))) (Intermediate!11928 (undefined!12740 Bool) (index!50106 (_ BitVec 32)) (x!131689 (_ BitVec 32))) (Undefined!11928) (MissingVacant!11928 (index!50107 (_ BitVec 32))) )
))
(declare-fun lt!641046 () SeekEntryResult!11928)

(declare-fun lt!641040 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11928)

(assert (=> b!1464298 (= res!993409 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641040 (select (arr!47676 a!2862) j!93) a!2862 mask!2687) lt!641046)))))

(declare-fun b!1464299 () Bool)

(declare-fun e!822919 () Bool)

(assert (=> b!1464299 (= e!822919 e!822918)))

(declare-fun res!993398 () Bool)

(assert (=> b!1464299 (=> res!993398 e!822918)))

(assert (=> b!1464299 (= res!993398 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641040 #b00000000000000000000000000000000) (bvsge lt!641040 (size!48226 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464299 (= lt!641040 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464300 () Bool)

(declare-fun e!822913 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641045 () array!98776)

(declare-fun lt!641041 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11928)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98776 (_ BitVec 32)) SeekEntryResult!11928)

(assert (=> b!1464300 (= e!822913 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641040 intermediateAfterIndex!19 lt!641041 lt!641045 mask!2687) (seekEntryOrOpen!0 lt!641041 lt!641045 mask!2687))))))

(declare-fun b!1464301 () Bool)

(declare-fun res!993407 () Bool)

(assert (=> b!1464301 (=> (not res!993407) (not e!822911))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464301 (= res!993407 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48226 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48226 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48226 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464302 () Bool)

(declare-fun e!822920 () Bool)

(declare-fun e!822914 () Bool)

(assert (=> b!1464302 (= e!822920 e!822914)))

(declare-fun res!993406 () Bool)

(assert (=> b!1464302 (=> (not res!993406) (not e!822914))))

(declare-fun lt!641043 () SeekEntryResult!11928)

(assert (=> b!1464302 (= res!993406 (= lt!641043 (Intermediate!11928 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464302 (= lt!641043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641041 mask!2687) lt!641041 lt!641045 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464302 (= lt!641041 (select (store (arr!47676 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464303 () Bool)

(assert (=> b!1464303 (= e!822914 (not e!822919))))

(declare-fun res!993399 () Bool)

(assert (=> b!1464303 (=> res!993399 e!822919)))

(assert (=> b!1464303 (= res!993399 (or (and (= (select (arr!47676 a!2862) index!646) (select (store (arr!47676 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47676 a!2862) index!646) (select (arr!47676 a!2862) j!93))) (= (select (arr!47676 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822916 () Bool)

(assert (=> b!1464303 e!822916))

(declare-fun res!993396 () Bool)

(assert (=> b!1464303 (=> (not res!993396) (not e!822916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98776 (_ BitVec 32)) Bool)

(assert (=> b!1464303 (= res!993396 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49352 0))(
  ( (Unit!49353) )
))
(declare-fun lt!641042 () Unit!49352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49352)

(assert (=> b!1464303 (= lt!641042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464304 () Bool)

(declare-fun res!993393 () Bool)

(assert (=> b!1464304 (=> (not res!993393) (not e!822916))))

(assert (=> b!1464304 (= res!993393 (= (seekEntryOrOpen!0 (select (arr!47676 a!2862) j!93) a!2862 mask!2687) (Found!11928 j!93)))))

(declare-fun res!993403 () Bool)

(assert (=> start!125328 (=> (not res!993403) (not e!822911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125328 (= res!993403 (validMask!0 mask!2687))))

(assert (=> start!125328 e!822911))

(assert (=> start!125328 true))

(declare-fun array_inv!36704 (array!98776) Bool)

(assert (=> start!125328 (array_inv!36704 a!2862)))

(declare-fun b!1464305 () Bool)

(declare-fun res!993392 () Bool)

(assert (=> b!1464305 (=> (not res!993392) (not e!822911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464305 (= res!993392 (validKeyInArray!0 (select (arr!47676 a!2862) i!1006)))))

(declare-fun b!1464306 () Bool)

(declare-fun e!822915 () Bool)

(assert (=> b!1464306 (= e!822915 e!822920)))

(declare-fun res!993405 () Bool)

(assert (=> b!1464306 (=> (not res!993405) (not e!822920))))

(assert (=> b!1464306 (= res!993405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47676 a!2862) j!93) mask!2687) (select (arr!47676 a!2862) j!93) a!2862 mask!2687) lt!641046))))

(assert (=> b!1464306 (= lt!641046 (Intermediate!11928 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464307 () Bool)

(declare-fun res!993404 () Bool)

(assert (=> b!1464307 (=> (not res!993404) (not e!822911))))

(assert (=> b!1464307 (= res!993404 (and (= (size!48226 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48226 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48226 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464308 () Bool)

(assert (=> b!1464308 (= e!822913 (not (= lt!641043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641040 lt!641041 lt!641045 mask!2687))))))

(declare-fun b!1464309 () Bool)

(assert (=> b!1464309 (= e!822911 e!822915)))

(declare-fun res!993401 () Bool)

(assert (=> b!1464309 (=> (not res!993401) (not e!822915))))

(assert (=> b!1464309 (= res!993401 (= (select (store (arr!47676 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464309 (= lt!641045 (array!98777 (store (arr!47676 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48226 a!2862)))))

(declare-fun b!1464310 () Bool)

(declare-fun res!993408 () Bool)

(assert (=> b!1464310 (=> (not res!993408) (not e!822914))))

(declare-fun e!822912 () Bool)

(assert (=> b!1464310 (= res!993408 e!822912)))

(declare-fun c!134964 () Bool)

(assert (=> b!1464310 (= c!134964 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464311 () Bool)

(assert (=> b!1464311 (= e!822912 (= lt!641043 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641041 lt!641045 mask!2687)))))

(declare-fun b!1464312 () Bool)

(assert (=> b!1464312 (= e!822916 (or (= (select (arr!47676 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47676 a!2862) intermediateBeforeIndex!19) (select (arr!47676 a!2862) j!93))))))

(declare-fun b!1464313 () Bool)

(declare-fun res!993402 () Bool)

(assert (=> b!1464313 (=> (not res!993402) (not e!822911))))

(assert (=> b!1464313 (= res!993402 (validKeyInArray!0 (select (arr!47676 a!2862) j!93)))))

(declare-fun b!1464314 () Bool)

(declare-fun res!993394 () Bool)

(assert (=> b!1464314 (=> (not res!993394) (not e!822911))))

(assert (=> b!1464314 (= res!993394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464315 () Bool)

(assert (=> b!1464315 (= e!822912 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641041 lt!641045 mask!2687) (seekEntryOrOpen!0 lt!641041 lt!641045 mask!2687)))))

(declare-fun b!1464316 () Bool)

(declare-fun res!993397 () Bool)

(assert (=> b!1464316 (=> (not res!993397) (not e!822920))))

(assert (=> b!1464316 (= res!993397 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47676 a!2862) j!93) a!2862 mask!2687) lt!641046))))

(declare-fun b!1464317 () Bool)

(declare-fun res!993395 () Bool)

(assert (=> b!1464317 (=> (not res!993395) (not e!822914))))

(assert (=> b!1464317 (= res!993395 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464318 () Bool)

(assert (=> b!1464318 (= e!822918 true)))

(declare-fun lt!641044 () Bool)

(assert (=> b!1464318 (= lt!641044 e!822913)))

(declare-fun c!134963 () Bool)

(assert (=> b!1464318 (= c!134963 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125328 res!993403) b!1464307))

(assert (= (and b!1464307 res!993404) b!1464305))

(assert (= (and b!1464305 res!993392) b!1464313))

(assert (= (and b!1464313 res!993402) b!1464314))

(assert (= (and b!1464314 res!993394) b!1464297))

(assert (= (and b!1464297 res!993400) b!1464301))

(assert (= (and b!1464301 res!993407) b!1464309))

(assert (= (and b!1464309 res!993401) b!1464306))

(assert (= (and b!1464306 res!993405) b!1464316))

(assert (= (and b!1464316 res!993397) b!1464302))

(assert (= (and b!1464302 res!993406) b!1464310))

(assert (= (and b!1464310 c!134964) b!1464311))

(assert (= (and b!1464310 (not c!134964)) b!1464315))

(assert (= (and b!1464310 res!993408) b!1464317))

(assert (= (and b!1464317 res!993395) b!1464303))

(assert (= (and b!1464303 res!993396) b!1464304))

(assert (= (and b!1464304 res!993393) b!1464312))

(assert (= (and b!1464303 (not res!993399)) b!1464299))

(assert (= (and b!1464299 (not res!993398)) b!1464298))

(assert (= (and b!1464298 (not res!993409)) b!1464318))

(assert (= (and b!1464318 c!134963) b!1464308))

(assert (= (and b!1464318 (not c!134963)) b!1464300))

(declare-fun m!1351529 () Bool)

(assert (=> b!1464316 m!1351529))

(assert (=> b!1464316 m!1351529))

(declare-fun m!1351531 () Bool)

(assert (=> b!1464316 m!1351531))

(declare-fun m!1351533 () Bool)

(assert (=> b!1464297 m!1351533))

(declare-fun m!1351535 () Bool)

(assert (=> b!1464311 m!1351535))

(declare-fun m!1351537 () Bool)

(assert (=> b!1464308 m!1351537))

(declare-fun m!1351539 () Bool)

(assert (=> b!1464315 m!1351539))

(declare-fun m!1351541 () Bool)

(assert (=> b!1464315 m!1351541))

(assert (=> b!1464306 m!1351529))

(assert (=> b!1464306 m!1351529))

(declare-fun m!1351543 () Bool)

(assert (=> b!1464306 m!1351543))

(assert (=> b!1464306 m!1351543))

(assert (=> b!1464306 m!1351529))

(declare-fun m!1351545 () Bool)

(assert (=> b!1464306 m!1351545))

(declare-fun m!1351547 () Bool)

(assert (=> b!1464309 m!1351547))

(declare-fun m!1351549 () Bool)

(assert (=> b!1464309 m!1351549))

(declare-fun m!1351551 () Bool)

(assert (=> b!1464312 m!1351551))

(assert (=> b!1464312 m!1351529))

(declare-fun m!1351553 () Bool)

(assert (=> b!1464302 m!1351553))

(assert (=> b!1464302 m!1351553))

(declare-fun m!1351555 () Bool)

(assert (=> b!1464302 m!1351555))

(assert (=> b!1464302 m!1351547))

(declare-fun m!1351557 () Bool)

(assert (=> b!1464302 m!1351557))

(declare-fun m!1351559 () Bool)

(assert (=> b!1464305 m!1351559))

(assert (=> b!1464305 m!1351559))

(declare-fun m!1351561 () Bool)

(assert (=> b!1464305 m!1351561))

(declare-fun m!1351563 () Bool)

(assert (=> b!1464300 m!1351563))

(assert (=> b!1464300 m!1351541))

(declare-fun m!1351565 () Bool)

(assert (=> b!1464314 m!1351565))

(declare-fun m!1351567 () Bool)

(assert (=> b!1464303 m!1351567))

(assert (=> b!1464303 m!1351547))

(declare-fun m!1351569 () Bool)

(assert (=> b!1464303 m!1351569))

(declare-fun m!1351571 () Bool)

(assert (=> b!1464303 m!1351571))

(declare-fun m!1351573 () Bool)

(assert (=> b!1464303 m!1351573))

(assert (=> b!1464303 m!1351529))

(assert (=> b!1464313 m!1351529))

(assert (=> b!1464313 m!1351529))

(declare-fun m!1351575 () Bool)

(assert (=> b!1464313 m!1351575))

(declare-fun m!1351577 () Bool)

(assert (=> start!125328 m!1351577))

(declare-fun m!1351579 () Bool)

(assert (=> start!125328 m!1351579))

(declare-fun m!1351581 () Bool)

(assert (=> b!1464299 m!1351581))

(assert (=> b!1464298 m!1351529))

(assert (=> b!1464298 m!1351529))

(declare-fun m!1351583 () Bool)

(assert (=> b!1464298 m!1351583))

(assert (=> b!1464304 m!1351529))

(assert (=> b!1464304 m!1351529))

(declare-fun m!1351585 () Bool)

(assert (=> b!1464304 m!1351585))

(check-sat (not b!1464314) (not b!1464304) (not b!1464303) (not b!1464311) (not b!1464299) (not b!1464316) (not b!1464297) (not start!125328) (not b!1464313) (not b!1464315) (not b!1464300) (not b!1464298) (not b!1464305) (not b!1464308) (not b!1464302) (not b!1464306))
(check-sat)
