; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125346 () Bool)

(assert start!125346)

(declare-fun b!1459195 () Bool)

(declare-fun e!820920 () Bool)

(declare-fun e!820921 () Bool)

(assert (=> b!1459195 (= e!820920 e!820921)))

(declare-fun res!988608 () Bool)

(assert (=> b!1459195 (=> (not res!988608) (not e!820921))))

(declare-datatypes ((SeekEntryResult!11778 0))(
  ( (MissingZero!11778 (index!49504 (_ BitVec 32))) (Found!11778 (index!49505 (_ BitVec 32))) (Intermediate!11778 (undefined!12590 Bool) (index!49506 (_ BitVec 32)) (x!131299 (_ BitVec 32))) (Undefined!11778) (MissingVacant!11778 (index!49507 (_ BitVec 32))) )
))
(declare-fun lt!639317 () SeekEntryResult!11778)

(declare-datatypes ((array!98689 0))(
  ( (array!98690 (arr!47629 (Array (_ BitVec 32) (_ BitVec 64))) (size!48180 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98689)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98689 (_ BitVec 32)) SeekEntryResult!11778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459195 (= res!988608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47629 a!2862) j!93) mask!2687) (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!639317))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459195 (= lt!639317 (Intermediate!11778 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459196 () Bool)

(declare-fun res!988597 () Bool)

(declare-fun e!820922 () Bool)

(assert (=> b!1459196 (=> (not res!988597) (not e!820922))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459196 (= res!988597 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48180 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48180 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48180 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459197 () Bool)

(declare-fun res!988605 () Bool)

(assert (=> b!1459197 (=> (not res!988605) (not e!820922))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459197 (= res!988605 (validKeyInArray!0 (select (arr!47629 a!2862) i!1006)))))

(declare-fun b!1459198 () Bool)

(declare-fun e!820927 () Bool)

(declare-fun e!820925 () Bool)

(assert (=> b!1459198 (= e!820927 e!820925)))

(declare-fun res!988601 () Bool)

(assert (=> b!1459198 (=> res!988601 e!820925)))

(declare-fun lt!639315 () (_ BitVec 32))

(assert (=> b!1459198 (= res!988601 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639315 #b00000000000000000000000000000000) (bvsge lt!639315 (size!48180 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459198 (= lt!639315 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!639314 () array!98689)

(declare-fun lt!639316 () (_ BitVec 64))

(declare-fun lt!639313 () SeekEntryResult!11778)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98689 (_ BitVec 32)) SeekEntryResult!11778)

(assert (=> b!1459198 (= lt!639313 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639316 lt!639314 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98689 (_ BitVec 32)) SeekEntryResult!11778)

(assert (=> b!1459198 (= lt!639313 (seekEntryOrOpen!0 lt!639316 lt!639314 mask!2687))))

(declare-fun b!1459200 () Bool)

(declare-fun res!988602 () Bool)

(assert (=> b!1459200 (=> (not res!988602) (not e!820922))))

(assert (=> b!1459200 (= res!988602 (and (= (size!48180 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48180 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48180 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459201 () Bool)

(assert (=> b!1459201 (= e!820922 e!820920)))

(declare-fun res!988595 () Bool)

(assert (=> b!1459201 (=> (not res!988595) (not e!820920))))

(assert (=> b!1459201 (= res!988595 (= (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459201 (= lt!639314 (array!98690 (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48180 a!2862)))))

(declare-fun b!1459202 () Bool)

(declare-fun res!988593 () Bool)

(declare-fun e!820926 () Bool)

(assert (=> b!1459202 (=> (not res!988593) (not e!820926))))

(assert (=> b!1459202 (= res!988593 (= (seekEntryOrOpen!0 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) (Found!11778 j!93)))))

(declare-fun b!1459203 () Bool)

(declare-fun res!988598 () Bool)

(assert (=> b!1459203 (=> (not res!988598) (not e!820922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98689 (_ BitVec 32)) Bool)

(assert (=> b!1459203 (= res!988598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459204 () Bool)

(declare-fun e!820928 () Bool)

(assert (=> b!1459204 (= e!820921 e!820928)))

(declare-fun res!988606 () Bool)

(assert (=> b!1459204 (=> (not res!988606) (not e!820928))))

(declare-fun lt!639312 () SeekEntryResult!11778)

(assert (=> b!1459204 (= res!988606 (= lt!639312 (Intermediate!11778 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459204 (= lt!639312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639316 mask!2687) lt!639316 lt!639314 mask!2687))))

(assert (=> b!1459204 (= lt!639316 (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459205 () Bool)

(declare-fun res!988594 () Bool)

(assert (=> b!1459205 (=> res!988594 e!820925)))

(assert (=> b!1459205 (= res!988594 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639315 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!639317)))))

(declare-fun b!1459206 () Bool)

(assert (=> b!1459206 (= e!820926 (and (or (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) (select (arr!47629 a!2862) j!93))) (let ((bdg!53378 (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47629 a!2862) index!646) bdg!53378) (= (select (arr!47629 a!2862) index!646) (select (arr!47629 a!2862) j!93))) (= (select (arr!47629 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53378 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1459207 () Bool)

(declare-fun e!820924 () Bool)

(assert (=> b!1459207 (= e!820924 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639315 intermediateAfterIndex!19 lt!639316 lt!639314 mask!2687) lt!639313)))))

(declare-fun b!1459208 () Bool)

(declare-fun res!988600 () Bool)

(assert (=> b!1459208 (=> (not res!988600) (not e!820928))))

(assert (=> b!1459208 (= res!988600 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459209 () Bool)

(assert (=> b!1459209 (= e!820928 (not e!820927))))

(declare-fun res!988599 () Bool)

(assert (=> b!1459209 (=> res!988599 e!820927)))

(assert (=> b!1459209 (= res!988599 (or (and (= (select (arr!47629 a!2862) index!646) (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47629 a!2862) index!646) (select (arr!47629 a!2862) j!93))) (= (select (arr!47629 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459209 e!820926))

(declare-fun res!988610 () Bool)

(assert (=> b!1459209 (=> (not res!988610) (not e!820926))))

(assert (=> b!1459209 (= res!988610 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49085 0))(
  ( (Unit!49086) )
))
(declare-fun lt!639319 () Unit!49085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49085)

(assert (=> b!1459209 (= lt!639319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459210 () Bool)

(assert (=> b!1459210 (= e!820924 (not (= lt!639312 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639315 lt!639316 lt!639314 mask!2687))))))

(declare-fun b!1459211 () Bool)

(declare-fun res!988609 () Bool)

(assert (=> b!1459211 (=> (not res!988609) (not e!820922))))

(declare-datatypes ((List!34117 0))(
  ( (Nil!34114) (Cons!34113 (h!35474 (_ BitVec 64)) (t!48803 List!34117)) )
))
(declare-fun arrayNoDuplicates!0 (array!98689 (_ BitVec 32) List!34117) Bool)

(assert (=> b!1459211 (= res!988609 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34114))))

(declare-fun b!1459212 () Bool)

(assert (=> b!1459212 (= e!820925 true)))

(declare-fun lt!639318 () Bool)

(assert (=> b!1459212 (= lt!639318 e!820924)))

(declare-fun c!134821 () Bool)

(assert (=> b!1459212 (= c!134821 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459213 () Bool)

(declare-fun e!820923 () Bool)

(assert (=> b!1459213 (= e!820923 (= lt!639312 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639316 lt!639314 mask!2687)))))

(declare-fun res!988607 () Bool)

(assert (=> start!125346 (=> (not res!988607) (not e!820922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125346 (= res!988607 (validMask!0 mask!2687))))

(assert (=> start!125346 e!820922))

(assert (=> start!125346 true))

(declare-fun array_inv!36910 (array!98689) Bool)

(assert (=> start!125346 (array_inv!36910 a!2862)))

(declare-fun b!1459199 () Bool)

(assert (=> b!1459199 (= e!820923 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639316 lt!639314 mask!2687) (seekEntryOrOpen!0 lt!639316 lt!639314 mask!2687)))))

(declare-fun b!1459214 () Bool)

(declare-fun res!988604 () Bool)

(assert (=> b!1459214 (=> (not res!988604) (not e!820921))))

(assert (=> b!1459214 (= res!988604 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!639317))))

(declare-fun b!1459215 () Bool)

(declare-fun res!988603 () Bool)

(assert (=> b!1459215 (=> (not res!988603) (not e!820928))))

(assert (=> b!1459215 (= res!988603 e!820923)))

(declare-fun c!134820 () Bool)

(assert (=> b!1459215 (= c!134820 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459216 () Bool)

(declare-fun res!988596 () Bool)

(assert (=> b!1459216 (=> (not res!988596) (not e!820922))))

(assert (=> b!1459216 (= res!988596 (validKeyInArray!0 (select (arr!47629 a!2862) j!93)))))

(assert (= (and start!125346 res!988607) b!1459200))

(assert (= (and b!1459200 res!988602) b!1459197))

(assert (= (and b!1459197 res!988605) b!1459216))

(assert (= (and b!1459216 res!988596) b!1459203))

(assert (= (and b!1459203 res!988598) b!1459211))

(assert (= (and b!1459211 res!988609) b!1459196))

(assert (= (and b!1459196 res!988597) b!1459201))

(assert (= (and b!1459201 res!988595) b!1459195))

(assert (= (and b!1459195 res!988608) b!1459214))

(assert (= (and b!1459214 res!988604) b!1459204))

(assert (= (and b!1459204 res!988606) b!1459215))

(assert (= (and b!1459215 c!134820) b!1459213))

(assert (= (and b!1459215 (not c!134820)) b!1459199))

(assert (= (and b!1459215 res!988603) b!1459208))

(assert (= (and b!1459208 res!988600) b!1459209))

(assert (= (and b!1459209 res!988610) b!1459202))

(assert (= (and b!1459202 res!988593) b!1459206))

(assert (= (and b!1459209 (not res!988599)) b!1459198))

(assert (= (and b!1459198 (not res!988601)) b!1459205))

(assert (= (and b!1459205 (not res!988594)) b!1459212))

(assert (= (and b!1459212 c!134821) b!1459210))

(assert (= (and b!1459212 (not c!134821)) b!1459207))

(declare-fun m!1347235 () Bool)

(assert (=> b!1459195 m!1347235))

(assert (=> b!1459195 m!1347235))

(declare-fun m!1347237 () Bool)

(assert (=> b!1459195 m!1347237))

(assert (=> b!1459195 m!1347237))

(assert (=> b!1459195 m!1347235))

(declare-fun m!1347239 () Bool)

(assert (=> b!1459195 m!1347239))

(declare-fun m!1347241 () Bool)

(assert (=> b!1459199 m!1347241))

(declare-fun m!1347243 () Bool)

(assert (=> b!1459199 m!1347243))

(declare-fun m!1347245 () Bool)

(assert (=> start!125346 m!1347245))

(declare-fun m!1347247 () Bool)

(assert (=> start!125346 m!1347247))

(declare-fun m!1347249 () Bool)

(assert (=> b!1459209 m!1347249))

(declare-fun m!1347251 () Bool)

(assert (=> b!1459209 m!1347251))

(declare-fun m!1347253 () Bool)

(assert (=> b!1459209 m!1347253))

(declare-fun m!1347255 () Bool)

(assert (=> b!1459209 m!1347255))

(declare-fun m!1347257 () Bool)

(assert (=> b!1459209 m!1347257))

(assert (=> b!1459209 m!1347235))

(declare-fun m!1347259 () Bool)

(assert (=> b!1459207 m!1347259))

(declare-fun m!1347261 () Bool)

(assert (=> b!1459197 m!1347261))

(assert (=> b!1459197 m!1347261))

(declare-fun m!1347263 () Bool)

(assert (=> b!1459197 m!1347263))

(declare-fun m!1347265 () Bool)

(assert (=> b!1459210 m!1347265))

(declare-fun m!1347267 () Bool)

(assert (=> b!1459204 m!1347267))

(assert (=> b!1459204 m!1347267))

(declare-fun m!1347269 () Bool)

(assert (=> b!1459204 m!1347269))

(assert (=> b!1459204 m!1347251))

(declare-fun m!1347271 () Bool)

(assert (=> b!1459204 m!1347271))

(declare-fun m!1347273 () Bool)

(assert (=> b!1459213 m!1347273))

(assert (=> b!1459202 m!1347235))

(assert (=> b!1459202 m!1347235))

(declare-fun m!1347275 () Bool)

(assert (=> b!1459202 m!1347275))

(declare-fun m!1347277 () Bool)

(assert (=> b!1459198 m!1347277))

(assert (=> b!1459198 m!1347241))

(assert (=> b!1459198 m!1347243))

(assert (=> b!1459205 m!1347235))

(assert (=> b!1459205 m!1347235))

(declare-fun m!1347279 () Bool)

(assert (=> b!1459205 m!1347279))

(declare-fun m!1347281 () Bool)

(assert (=> b!1459203 m!1347281))

(declare-fun m!1347283 () Bool)

(assert (=> b!1459211 m!1347283))

(assert (=> b!1459206 m!1347251))

(declare-fun m!1347285 () Bool)

(assert (=> b!1459206 m!1347285))

(assert (=> b!1459206 m!1347253))

(assert (=> b!1459206 m!1347255))

(assert (=> b!1459206 m!1347235))

(assert (=> b!1459216 m!1347235))

(assert (=> b!1459216 m!1347235))

(declare-fun m!1347287 () Bool)

(assert (=> b!1459216 m!1347287))

(assert (=> b!1459201 m!1347251))

(declare-fun m!1347289 () Bool)

(assert (=> b!1459201 m!1347289))

(assert (=> b!1459214 m!1347235))

(assert (=> b!1459214 m!1347235))

(declare-fun m!1347291 () Bool)

(assert (=> b!1459214 m!1347291))

(check-sat (not b!1459204) (not b!1459198) (not b!1459203) (not b!1459213) (not b!1459205) (not b!1459211) (not b!1459214) (not b!1459195) (not b!1459207) (not b!1459197) (not b!1459199) (not b!1459202) (not b!1459209) (not start!125346) (not b!1459210) (not b!1459216))
(check-sat)
