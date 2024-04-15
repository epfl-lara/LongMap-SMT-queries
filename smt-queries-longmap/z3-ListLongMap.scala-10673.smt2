; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125146 () Bool)

(assert start!125146)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639216 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11852 0))(
  ( (MissingZero!11852 (index!49800 (_ BitVec 32))) (Found!11852 (index!49801 (_ BitVec 32))) (Intermediate!11852 (undefined!12664 Bool) (index!49802 (_ BitVec 32)) (x!131408 (_ BitVec 32))) (Undefined!11852) (MissingVacant!11852 (index!49803 (_ BitVec 32))) )
))
(declare-fun lt!639217 () SeekEntryResult!11852)

(declare-datatypes ((array!98572 0))(
  ( (array!98573 (arr!47575 (Array (_ BitVec 32) (_ BitVec 64))) (size!48127 (_ BitVec 32))) )
))
(declare-fun lt!639222 () array!98572)

(declare-fun b!1459257 () Bool)

(declare-fun e!820652 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459257 (= e!820652 (= lt!639217 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639216 lt!639222 mask!2687)))))

(declare-fun b!1459258 () Bool)

(declare-fun res!989322 () Bool)

(declare-fun e!820651 () Bool)

(assert (=> b!1459258 (=> (not res!989322) (not e!820651))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98572)

(assert (=> b!1459258 (= res!989322 (and (= (size!48127 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48127 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48127 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459259 () Bool)

(declare-fun res!989323 () Bool)

(declare-fun e!820650 () Bool)

(assert (=> b!1459259 (=> (not res!989323) (not e!820650))))

(declare-fun lt!639215 () SeekEntryResult!11852)

(assert (=> b!1459259 (= res!989323 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!639215))))

(declare-fun lt!639214 () (_ BitVec 32))

(declare-fun e!820653 () Bool)

(declare-fun b!1459260 () Bool)

(declare-fun lt!639220 () SeekEntryResult!11852)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459260 (= e!820653 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639214 intermediateAfterIndex!19 lt!639216 lt!639222 mask!2687) lt!639220)))))

(declare-fun b!1459261 () Bool)

(assert (=> b!1459261 (= e!820653 (not (= lt!639217 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639214 lt!639216 lt!639222 mask!2687))))))

(declare-fun b!1459262 () Bool)

(declare-fun e!820654 () Bool)

(assert (=> b!1459262 (= e!820651 e!820654)))

(declare-fun res!989319 () Bool)

(assert (=> b!1459262 (=> (not res!989319) (not e!820654))))

(assert (=> b!1459262 (= res!989319 (= (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459262 (= lt!639222 (array!98573 (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48127 a!2862)))))

(declare-fun b!1459263 () Bool)

(declare-fun e!820649 () Bool)

(assert (=> b!1459263 (= e!820650 e!820649)))

(declare-fun res!989314 () Bool)

(assert (=> b!1459263 (=> (not res!989314) (not e!820649))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459263 (= res!989314 (= lt!639217 (Intermediate!11852 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459263 (= lt!639217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639216 mask!2687) lt!639216 lt!639222 mask!2687))))

(assert (=> b!1459263 (= lt!639216 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459264 () Bool)

(declare-fun res!989310 () Bool)

(assert (=> b!1459264 (=> (not res!989310) (not e!820651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459264 (= res!989310 (validKeyInArray!0 (select (arr!47575 a!2862) i!1006)))))

(declare-fun b!1459265 () Bool)

(declare-fun res!989311 () Bool)

(declare-fun e!820655 () Bool)

(assert (=> b!1459265 (=> res!989311 e!820655)))

(assert (=> b!1459265 (= res!989311 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639214 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!639215)))))

(declare-fun b!1459267 () Bool)

(declare-fun res!989321 () Bool)

(assert (=> b!1459267 (=> (not res!989321) (not e!820651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98572 (_ BitVec 32)) Bool)

(assert (=> b!1459267 (= res!989321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459268 () Bool)

(declare-fun res!989316 () Bool)

(assert (=> b!1459268 (=> (not res!989316) (not e!820651))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459268 (= res!989316 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48127 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48127 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48127 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459269 () Bool)

(declare-fun res!989312 () Bool)

(assert (=> b!1459269 (=> (not res!989312) (not e!820649))))

(assert (=> b!1459269 (= res!989312 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459270 () Bool)

(assert (=> b!1459270 (= e!820654 e!820650)))

(declare-fun res!989317 () Bool)

(assert (=> b!1459270 (=> (not res!989317) (not e!820650))))

(assert (=> b!1459270 (= res!989317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47575 a!2862) j!93) mask!2687) (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!639215))))

(assert (=> b!1459270 (= lt!639215 (Intermediate!11852 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459271 () Bool)

(assert (=> b!1459271 (= e!820655 true)))

(declare-fun lt!639218 () SeekEntryResult!11852)

(assert (=> b!1459271 (= lt!639218 lt!639220)))

(declare-datatypes ((Unit!49041 0))(
  ( (Unit!49042) )
))
(declare-fun lt!639219 () Unit!49041)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49041)

(assert (=> b!1459271 (= lt!639219 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639214 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459272 () Bool)

(declare-fun res!989325 () Bool)

(assert (=> b!1459272 (=> res!989325 e!820655)))

(assert (=> b!1459272 (= res!989325 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459273 (= e!820652 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639216 lt!639222 mask!2687) (seekEntryOrOpen!0 lt!639216 lt!639222 mask!2687)))))

(declare-fun b!1459274 () Bool)

(declare-fun res!989315 () Bool)

(assert (=> b!1459274 (=> (not res!989315) (not e!820651))))

(declare-datatypes ((List!34154 0))(
  ( (Nil!34151) (Cons!34150 (h!35500 (_ BitVec 64)) (t!48840 List!34154)) )
))
(declare-fun arrayNoDuplicates!0 (array!98572 (_ BitVec 32) List!34154) Bool)

(assert (=> b!1459274 (= res!989315 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34151))))

(declare-fun b!1459266 () Bool)

(declare-fun res!989318 () Bool)

(assert (=> b!1459266 (=> (not res!989318) (not e!820651))))

(assert (=> b!1459266 (= res!989318 (validKeyInArray!0 (select (arr!47575 a!2862) j!93)))))

(declare-fun res!989326 () Bool)

(assert (=> start!125146 (=> (not res!989326) (not e!820651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125146 (= res!989326 (validMask!0 mask!2687))))

(assert (=> start!125146 e!820651))

(assert (=> start!125146 true))

(declare-fun array_inv!36808 (array!98572) Bool)

(assert (=> start!125146 (array_inv!36808 a!2862)))

(declare-fun b!1459275 () Bool)

(declare-fun res!989320 () Bool)

(assert (=> b!1459275 (=> res!989320 e!820655)))

(assert (=> b!1459275 (= res!989320 e!820653)))

(declare-fun c!134487 () Bool)

(assert (=> b!1459275 (= c!134487 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459276 () Bool)

(declare-fun res!989324 () Bool)

(assert (=> b!1459276 (=> (not res!989324) (not e!820649))))

(assert (=> b!1459276 (= res!989324 e!820652)))

(declare-fun c!134488 () Bool)

(assert (=> b!1459276 (= c!134488 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459277 () Bool)

(declare-fun e!820656 () Bool)

(assert (=> b!1459277 (= e!820656 e!820655)))

(declare-fun res!989313 () Bool)

(assert (=> b!1459277 (=> res!989313 e!820655)))

(assert (=> b!1459277 (= res!989313 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639214 #b00000000000000000000000000000000) (bvsge lt!639214 (size!48127 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459277 (= lt!639214 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459277 (= lt!639220 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639216 lt!639222 mask!2687))))

(assert (=> b!1459277 (= lt!639220 (seekEntryOrOpen!0 lt!639216 lt!639222 mask!2687))))

(declare-fun b!1459278 () Bool)

(assert (=> b!1459278 (= e!820649 (not e!820656))))

(declare-fun res!989309 () Bool)

(assert (=> b!1459278 (=> res!989309 e!820656)))

(assert (=> b!1459278 (= res!989309 (or (and (= (select (arr!47575 a!2862) index!646) (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459278 (and (= lt!639218 (Found!11852 j!93)) (or (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) (select (arr!47575 a!2862) j!93))) (let ((bdg!53513 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47575 a!2862) index!646) bdg!53513) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53513 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459278 (= lt!639218 (seekEntryOrOpen!0 (select (arr!47575 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459278 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639221 () Unit!49041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49041)

(assert (=> b!1459278 (= lt!639221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125146 res!989326) b!1459258))

(assert (= (and b!1459258 res!989322) b!1459264))

(assert (= (and b!1459264 res!989310) b!1459266))

(assert (= (and b!1459266 res!989318) b!1459267))

(assert (= (and b!1459267 res!989321) b!1459274))

(assert (= (and b!1459274 res!989315) b!1459268))

(assert (= (and b!1459268 res!989316) b!1459262))

(assert (= (and b!1459262 res!989319) b!1459270))

(assert (= (and b!1459270 res!989317) b!1459259))

(assert (= (and b!1459259 res!989323) b!1459263))

(assert (= (and b!1459263 res!989314) b!1459276))

(assert (= (and b!1459276 c!134488) b!1459257))

(assert (= (and b!1459276 (not c!134488)) b!1459273))

(assert (= (and b!1459276 res!989324) b!1459269))

(assert (= (and b!1459269 res!989312) b!1459278))

(assert (= (and b!1459278 (not res!989309)) b!1459277))

(assert (= (and b!1459277 (not res!989313)) b!1459265))

(assert (= (and b!1459265 (not res!989311)) b!1459275))

(assert (= (and b!1459275 c!134487) b!1459261))

(assert (= (and b!1459275 (not c!134487)) b!1459260))

(assert (= (and b!1459275 (not res!989320)) b!1459272))

(assert (= (and b!1459272 (not res!989325)) b!1459271))

(declare-fun m!1346535 () Bool)

(assert (=> b!1459262 m!1346535))

(declare-fun m!1346537 () Bool)

(assert (=> b!1459262 m!1346537))

(declare-fun m!1346539 () Bool)

(assert (=> b!1459261 m!1346539))

(declare-fun m!1346541 () Bool)

(assert (=> b!1459266 m!1346541))

(assert (=> b!1459266 m!1346541))

(declare-fun m!1346543 () Bool)

(assert (=> b!1459266 m!1346543))

(assert (=> b!1459265 m!1346541))

(assert (=> b!1459265 m!1346541))

(declare-fun m!1346545 () Bool)

(assert (=> b!1459265 m!1346545))

(declare-fun m!1346547 () Bool)

(assert (=> b!1459278 m!1346547))

(assert (=> b!1459278 m!1346535))

(declare-fun m!1346549 () Bool)

(assert (=> b!1459278 m!1346549))

(declare-fun m!1346551 () Bool)

(assert (=> b!1459278 m!1346551))

(declare-fun m!1346553 () Bool)

(assert (=> b!1459278 m!1346553))

(assert (=> b!1459278 m!1346541))

(declare-fun m!1346555 () Bool)

(assert (=> b!1459278 m!1346555))

(declare-fun m!1346557 () Bool)

(assert (=> b!1459278 m!1346557))

(assert (=> b!1459278 m!1346541))

(declare-fun m!1346559 () Bool)

(assert (=> b!1459277 m!1346559))

(declare-fun m!1346561 () Bool)

(assert (=> b!1459277 m!1346561))

(declare-fun m!1346563 () Bool)

(assert (=> b!1459277 m!1346563))

(declare-fun m!1346565 () Bool)

(assert (=> start!125146 m!1346565))

(declare-fun m!1346567 () Bool)

(assert (=> start!125146 m!1346567))

(declare-fun m!1346569 () Bool)

(assert (=> b!1459264 m!1346569))

(assert (=> b!1459264 m!1346569))

(declare-fun m!1346571 () Bool)

(assert (=> b!1459264 m!1346571))

(declare-fun m!1346573 () Bool)

(assert (=> b!1459271 m!1346573))

(declare-fun m!1346575 () Bool)

(assert (=> b!1459257 m!1346575))

(assert (=> b!1459270 m!1346541))

(assert (=> b!1459270 m!1346541))

(declare-fun m!1346577 () Bool)

(assert (=> b!1459270 m!1346577))

(assert (=> b!1459270 m!1346577))

(assert (=> b!1459270 m!1346541))

(declare-fun m!1346579 () Bool)

(assert (=> b!1459270 m!1346579))

(declare-fun m!1346581 () Bool)

(assert (=> b!1459267 m!1346581))

(assert (=> b!1459259 m!1346541))

(assert (=> b!1459259 m!1346541))

(declare-fun m!1346583 () Bool)

(assert (=> b!1459259 m!1346583))

(assert (=> b!1459273 m!1346561))

(assert (=> b!1459273 m!1346563))

(declare-fun m!1346585 () Bool)

(assert (=> b!1459260 m!1346585))

(declare-fun m!1346587 () Bool)

(assert (=> b!1459274 m!1346587))

(declare-fun m!1346589 () Bool)

(assert (=> b!1459263 m!1346589))

(assert (=> b!1459263 m!1346589))

(declare-fun m!1346591 () Bool)

(assert (=> b!1459263 m!1346591))

(assert (=> b!1459263 m!1346535))

(declare-fun m!1346593 () Bool)

(assert (=> b!1459263 m!1346593))

(check-sat (not b!1459264) (not start!125146) (not b!1459278) (not b!1459270) (not b!1459266) (not b!1459261) (not b!1459263) (not b!1459267) (not b!1459265) (not b!1459257) (not b!1459260) (not b!1459277) (not b!1459259) (not b!1459271) (not b!1459274) (not b!1459273))
(check-sat)
