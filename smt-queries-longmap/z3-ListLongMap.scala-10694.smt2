; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125580 () Bool)

(assert start!125580)

(declare-fun b!1465147 () Bool)

(declare-fun res!993307 () Bool)

(declare-fun e!823585 () Bool)

(assert (=> b!1465147 (=> (not res!993307) (not e!823585))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98866 0))(
  ( (array!98867 (arr!47716 (Array (_ BitVec 32) (_ BitVec 64))) (size!48267 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98866)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465147 (= res!993307 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48267 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48267 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48267 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465148 () Bool)

(declare-fun res!993303 () Bool)

(assert (=> b!1465148 (=> (not res!993303) (not e!823585))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465148 (= res!993303 (validKeyInArray!0 (select (arr!47716 a!2862) i!1006)))))

(declare-fun b!1465149 () Bool)

(declare-fun e!823587 () Bool)

(declare-fun e!823591 () Bool)

(assert (=> b!1465149 (= e!823587 (not e!823591))))

(declare-fun res!993313 () Bool)

(assert (=> b!1465149 (=> res!993313 e!823591)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465149 (= res!993313 (or (and (= (select (arr!47716 a!2862) index!646) (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47716 a!2862) index!646) (select (arr!47716 a!2862) j!93))) (= (select (arr!47716 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823590 () Bool)

(assert (=> b!1465149 e!823590))

(declare-fun res!993308 () Bool)

(assert (=> b!1465149 (=> (not res!993308) (not e!823590))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98866 (_ BitVec 32)) Bool)

(assert (=> b!1465149 (= res!993308 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49259 0))(
  ( (Unit!49260) )
))
(declare-fun lt!641408 () Unit!49259)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49259)

(assert (=> b!1465149 (= lt!641408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465150 () Bool)

(declare-fun res!993304 () Bool)

(declare-fun e!823584 () Bool)

(assert (=> b!1465150 (=> res!993304 e!823584)))

(declare-datatypes ((SeekEntryResult!11865 0))(
  ( (MissingZero!11865 (index!49852 (_ BitVec 32))) (Found!11865 (index!49853 (_ BitVec 32))) (Intermediate!11865 (undefined!12677 Bool) (index!49854 (_ BitVec 32)) (x!131627 (_ BitVec 32))) (Undefined!11865) (MissingVacant!11865 (index!49855 (_ BitVec 32))) )
))
(declare-fun lt!641406 () SeekEntryResult!11865)

(declare-fun lt!641409 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11865)

(assert (=> b!1465150 (= res!993304 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641409 (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641406)))))

(declare-fun lt!641405 () (_ BitVec 64))

(declare-fun lt!641404 () array!98866)

(declare-fun e!823588 () Bool)

(declare-fun lt!641410 () SeekEntryResult!11865)

(declare-fun b!1465151 () Bool)

(assert (=> b!1465151 (= e!823588 (not (= lt!641410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641409 lt!641405 lt!641404 mask!2687))))))

(declare-fun e!823589 () Bool)

(declare-fun b!1465152 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11865)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11865)

(assert (=> b!1465152 (= e!823589 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641405 lt!641404 mask!2687) (seekEntryOrOpen!0 lt!641405 lt!641404 mask!2687)))))

(declare-fun b!1465153 () Bool)

(assert (=> b!1465153 (= e!823590 (or (= (select (arr!47716 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47716 a!2862) intermediateBeforeIndex!19) (select (arr!47716 a!2862) j!93))))))

(declare-fun b!1465154 () Bool)

(declare-fun res!993317 () Bool)

(assert (=> b!1465154 (=> (not res!993317) (not e!823590))))

(assert (=> b!1465154 (= res!993317 (= (seekEntryOrOpen!0 (select (arr!47716 a!2862) j!93) a!2862 mask!2687) (Found!11865 j!93)))))

(declare-fun b!1465155 () Bool)

(assert (=> b!1465155 (= e!823584 true)))

(declare-fun lt!641407 () Bool)

(assert (=> b!1465155 (= lt!641407 e!823588)))

(declare-fun c!135444 () Bool)

(assert (=> b!1465155 (= c!135444 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465156 () Bool)

(declare-fun res!993305 () Bool)

(assert (=> b!1465156 (=> (not res!993305) (not e!823585))))

(assert (=> b!1465156 (= res!993305 (validKeyInArray!0 (select (arr!47716 a!2862) j!93)))))

(declare-fun b!1465157 () Bool)

(declare-fun e!823592 () Bool)

(assert (=> b!1465157 (= e!823592 e!823587)))

(declare-fun res!993311 () Bool)

(assert (=> b!1465157 (=> (not res!993311) (not e!823587))))

(assert (=> b!1465157 (= res!993311 (= lt!641410 (Intermediate!11865 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465157 (= lt!641410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641405 mask!2687) lt!641405 lt!641404 mask!2687))))

(assert (=> b!1465157 (= lt!641405 (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465158 () Bool)

(declare-fun e!823593 () Bool)

(assert (=> b!1465158 (= e!823593 e!823592)))

(declare-fun res!993302 () Bool)

(assert (=> b!1465158 (=> (not res!993302) (not e!823592))))

(assert (=> b!1465158 (= res!993302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47716 a!2862) j!93) mask!2687) (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641406))))

(assert (=> b!1465158 (= lt!641406 (Intermediate!11865 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465159 () Bool)

(declare-fun res!993316 () Bool)

(assert (=> b!1465159 (=> (not res!993316) (not e!823592))))

(assert (=> b!1465159 (= res!993316 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641406))))

(declare-fun b!1465160 () Bool)

(assert (=> b!1465160 (= e!823591 e!823584)))

(declare-fun res!993300 () Bool)

(assert (=> b!1465160 (=> res!993300 e!823584)))

(assert (=> b!1465160 (= res!993300 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641409 #b00000000000000000000000000000000) (bvsge lt!641409 (size!48267 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465160 (= lt!641409 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1465161 () Bool)

(declare-fun res!993306 () Bool)

(assert (=> b!1465161 (=> (not res!993306) (not e!823587))))

(assert (=> b!1465161 (= res!993306 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465162 () Bool)

(assert (=> b!1465162 (= e!823589 (= lt!641410 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641405 lt!641404 mask!2687)))))

(declare-fun b!1465163 () Bool)

(declare-fun res!993312 () Bool)

(assert (=> b!1465163 (=> (not res!993312) (not e!823585))))

(declare-datatypes ((List!34204 0))(
  ( (Nil!34201) (Cons!34200 (h!35564 (_ BitVec 64)) (t!48890 List!34204)) )
))
(declare-fun arrayNoDuplicates!0 (array!98866 (_ BitVec 32) List!34204) Bool)

(assert (=> b!1465163 (= res!993312 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34201))))

(declare-fun b!1465164 () Bool)

(declare-fun res!993301 () Bool)

(assert (=> b!1465164 (=> (not res!993301) (not e!823585))))

(assert (=> b!1465164 (= res!993301 (and (= (size!48267 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48267 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48267 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465165 () Bool)

(assert (=> b!1465165 (= e!823585 e!823593)))

(declare-fun res!993315 () Bool)

(assert (=> b!1465165 (=> (not res!993315) (not e!823593))))

(assert (=> b!1465165 (= res!993315 (= (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465165 (= lt!641404 (array!98867 (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48267 a!2862)))))

(declare-fun b!1465166 () Bool)

(declare-fun res!993314 () Bool)

(assert (=> b!1465166 (=> (not res!993314) (not e!823587))))

(assert (=> b!1465166 (= res!993314 e!823589)))

(declare-fun c!135445 () Bool)

(assert (=> b!1465166 (= c!135445 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!993310 () Bool)

(assert (=> start!125580 (=> (not res!993310) (not e!823585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125580 (= res!993310 (validMask!0 mask!2687))))

(assert (=> start!125580 e!823585))

(assert (=> start!125580 true))

(declare-fun array_inv!36997 (array!98866) Bool)

(assert (=> start!125580 (array_inv!36997 a!2862)))

(declare-fun b!1465167 () Bool)

(assert (=> b!1465167 (= e!823588 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641409 intermediateAfterIndex!19 lt!641405 lt!641404 mask!2687) (seekEntryOrOpen!0 lt!641405 lt!641404 mask!2687))))))

(declare-fun b!1465168 () Bool)

(declare-fun res!993309 () Bool)

(assert (=> b!1465168 (=> (not res!993309) (not e!823585))))

(assert (=> b!1465168 (= res!993309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125580 res!993310) b!1465164))

(assert (= (and b!1465164 res!993301) b!1465148))

(assert (= (and b!1465148 res!993303) b!1465156))

(assert (= (and b!1465156 res!993305) b!1465168))

(assert (= (and b!1465168 res!993309) b!1465163))

(assert (= (and b!1465163 res!993312) b!1465147))

(assert (= (and b!1465147 res!993307) b!1465165))

(assert (= (and b!1465165 res!993315) b!1465158))

(assert (= (and b!1465158 res!993302) b!1465159))

(assert (= (and b!1465159 res!993316) b!1465157))

(assert (= (and b!1465157 res!993311) b!1465166))

(assert (= (and b!1465166 c!135445) b!1465162))

(assert (= (and b!1465166 (not c!135445)) b!1465152))

(assert (= (and b!1465166 res!993314) b!1465161))

(assert (= (and b!1465161 res!993306) b!1465149))

(assert (= (and b!1465149 res!993308) b!1465154))

(assert (= (and b!1465154 res!993317) b!1465153))

(assert (= (and b!1465149 (not res!993313)) b!1465160))

(assert (= (and b!1465160 (not res!993300)) b!1465150))

(assert (= (and b!1465150 (not res!993304)) b!1465155))

(assert (= (and b!1465155 c!135444) b!1465151))

(assert (= (and b!1465155 (not c!135444)) b!1465167))

(declare-fun m!1352461 () Bool)

(assert (=> b!1465151 m!1352461))

(declare-fun m!1352463 () Bool)

(assert (=> b!1465154 m!1352463))

(assert (=> b!1465154 m!1352463))

(declare-fun m!1352465 () Bool)

(assert (=> b!1465154 m!1352465))

(declare-fun m!1352467 () Bool)

(assert (=> start!125580 m!1352467))

(declare-fun m!1352469 () Bool)

(assert (=> start!125580 m!1352469))

(declare-fun m!1352471 () Bool)

(assert (=> b!1465168 m!1352471))

(declare-fun m!1352473 () Bool)

(assert (=> b!1465149 m!1352473))

(declare-fun m!1352475 () Bool)

(assert (=> b!1465149 m!1352475))

(declare-fun m!1352477 () Bool)

(assert (=> b!1465149 m!1352477))

(declare-fun m!1352479 () Bool)

(assert (=> b!1465149 m!1352479))

(declare-fun m!1352481 () Bool)

(assert (=> b!1465149 m!1352481))

(assert (=> b!1465149 m!1352463))

(assert (=> b!1465165 m!1352475))

(declare-fun m!1352483 () Bool)

(assert (=> b!1465165 m!1352483))

(assert (=> b!1465150 m!1352463))

(assert (=> b!1465150 m!1352463))

(declare-fun m!1352485 () Bool)

(assert (=> b!1465150 m!1352485))

(assert (=> b!1465156 m!1352463))

(assert (=> b!1465156 m!1352463))

(declare-fun m!1352487 () Bool)

(assert (=> b!1465156 m!1352487))

(assert (=> b!1465158 m!1352463))

(assert (=> b!1465158 m!1352463))

(declare-fun m!1352489 () Bool)

(assert (=> b!1465158 m!1352489))

(assert (=> b!1465158 m!1352489))

(assert (=> b!1465158 m!1352463))

(declare-fun m!1352491 () Bool)

(assert (=> b!1465158 m!1352491))

(declare-fun m!1352493 () Bool)

(assert (=> b!1465157 m!1352493))

(assert (=> b!1465157 m!1352493))

(declare-fun m!1352495 () Bool)

(assert (=> b!1465157 m!1352495))

(assert (=> b!1465157 m!1352475))

(declare-fun m!1352497 () Bool)

(assert (=> b!1465157 m!1352497))

(declare-fun m!1352499 () Bool)

(assert (=> b!1465152 m!1352499))

(declare-fun m!1352501 () Bool)

(assert (=> b!1465152 m!1352501))

(declare-fun m!1352503 () Bool)

(assert (=> b!1465167 m!1352503))

(assert (=> b!1465167 m!1352501))

(declare-fun m!1352505 () Bool)

(assert (=> b!1465163 m!1352505))

(declare-fun m!1352507 () Bool)

(assert (=> b!1465148 m!1352507))

(assert (=> b!1465148 m!1352507))

(declare-fun m!1352509 () Bool)

(assert (=> b!1465148 m!1352509))

(declare-fun m!1352511 () Bool)

(assert (=> b!1465160 m!1352511))

(declare-fun m!1352513 () Bool)

(assert (=> b!1465153 m!1352513))

(assert (=> b!1465153 m!1352463))

(declare-fun m!1352515 () Bool)

(assert (=> b!1465162 m!1352515))

(assert (=> b!1465159 m!1352463))

(assert (=> b!1465159 m!1352463))

(declare-fun m!1352517 () Bool)

(assert (=> b!1465159 m!1352517))

(check-sat (not b!1465150) (not b!1465156) (not b!1465160) (not b!1465157) (not b!1465148) (not b!1465154) (not b!1465168) (not b!1465149) (not start!125580) (not b!1465151) (not b!1465167) (not b!1465152) (not b!1465163) (not b!1465159) (not b!1465162) (not b!1465158))
(check-sat)
