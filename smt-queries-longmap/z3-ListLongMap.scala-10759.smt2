; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126090 () Bool)

(assert start!126090)

(declare-fun b!1474582 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!827592 () Bool)

(declare-datatypes ((array!99262 0))(
  ( (array!99263 (arr!47911 (Array (_ BitVec 32) (_ BitVec 64))) (size!48462 (_ BitVec 32))) )
))
(declare-fun lt!644342 () array!99262)

(declare-datatypes ((SeekEntryResult!12048 0))(
  ( (MissingZero!12048 (index!50584 (_ BitVec 32))) (Found!12048 (index!50585 (_ BitVec 32))) (Intermediate!12048 (undefined!12860 Bool) (index!50586 (_ BitVec 32)) (x!132348 (_ BitVec 32))) (Undefined!12048) (MissingVacant!12048 (index!50587 (_ BitVec 32))) )
))
(declare-fun lt!644339 () SeekEntryResult!12048)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!644341 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12048)

(assert (=> b!1474582 (= e!827592 (= lt!644339 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644341 lt!644342 mask!2687)))))

(declare-fun b!1474583 () Bool)

(declare-fun e!827593 () Bool)

(declare-fun e!827594 () Bool)

(assert (=> b!1474583 (= e!827593 e!827594)))

(declare-fun res!1001100 () Bool)

(assert (=> b!1474583 (=> (not res!1001100) (not e!827594))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99262)

(assert (=> b!1474583 (= res!1001100 (= (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474583 (= lt!644342 (array!99263 (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48462 a!2862)))))

(declare-fun b!1474584 () Bool)

(declare-fun res!1001105 () Bool)

(assert (=> b!1474584 (=> (not res!1001105) (not e!827593))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474584 (= res!1001105 (and (= (size!48462 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48462 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48462 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474585 () Bool)

(declare-fun res!1001098 () Bool)

(assert (=> b!1474585 (=> (not res!1001098) (not e!827593))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474585 (= res!1001098 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48462 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48462 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48462 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474586 () Bool)

(declare-fun e!827596 () Bool)

(declare-fun e!827597 () Bool)

(assert (=> b!1474586 (= e!827596 e!827597)))

(declare-fun res!1001095 () Bool)

(assert (=> b!1474586 (=> (not res!1001095) (not e!827597))))

(assert (=> b!1474586 (= res!1001095 (= lt!644339 (Intermediate!12048 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474586 (= lt!644339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644342 mask!2687))))

(assert (=> b!1474586 (= lt!644341 (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474587 () Bool)

(declare-fun res!1001107 () Bool)

(assert (=> b!1474587 (=> (not res!1001107) (not e!827596))))

(declare-fun lt!644344 () SeekEntryResult!12048)

(assert (=> b!1474587 (= res!1001107 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!644344))))

(declare-fun e!827595 () Bool)

(declare-fun lt!644343 () SeekEntryResult!12048)

(declare-fun b!1474588 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12048)

(assert (=> b!1474588 (= e!827595 (= lt!644343 (seekEntryOrOpen!0 lt!644341 lt!644342 mask!2687)))))

(declare-fun b!1474589 () Bool)

(declare-fun res!1001104 () Bool)

(assert (=> b!1474589 (=> (not res!1001104) (not e!827593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99262 (_ BitVec 32)) Bool)

(assert (=> b!1474589 (= res!1001104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474590 () Bool)

(assert (=> b!1474590 (= e!827597 (not e!827595))))

(declare-fun res!1001101 () Bool)

(assert (=> b!1474590 (=> res!1001101 e!827595)))

(assert (=> b!1474590 (= res!1001101 (or (not (= (select (arr!47911 a!2862) index!646) (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47911 a!2862) index!646) (select (arr!47911 a!2862) j!93)))))))

(assert (=> b!1474590 (and (= lt!644343 (Found!12048 j!93)) (or (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) (select (arr!47911 a!2862) j!93))))))

(assert (=> b!1474590 (= lt!644343 (seekEntryOrOpen!0 (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1474590 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49469 0))(
  ( (Unit!49470) )
))
(declare-fun lt!644340 () Unit!49469)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49469)

(assert (=> b!1474590 (= lt!644340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1001106 () Bool)

(assert (=> start!126090 (=> (not res!1001106) (not e!827593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126090 (= res!1001106 (validMask!0 mask!2687))))

(assert (=> start!126090 e!827593))

(assert (=> start!126090 true))

(declare-fun array_inv!37192 (array!99262) Bool)

(assert (=> start!126090 (array_inv!37192 a!2862)))

(declare-fun b!1474591 () Bool)

(declare-fun res!1001096 () Bool)

(assert (=> b!1474591 (=> (not res!1001096) (not e!827593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474591 (= res!1001096 (validKeyInArray!0 (select (arr!47911 a!2862) j!93)))))

(declare-fun b!1474592 () Bool)

(declare-fun res!1001099 () Bool)

(assert (=> b!1474592 (=> (not res!1001099) (not e!827597))))

(assert (=> b!1474592 (= res!1001099 e!827592)))

(declare-fun c!136267 () Bool)

(assert (=> b!1474592 (= c!136267 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474593 () Bool)

(assert (=> b!1474593 (= e!827594 e!827596)))

(declare-fun res!1001103 () Bool)

(assert (=> b!1474593 (=> (not res!1001103) (not e!827596))))

(assert (=> b!1474593 (= res!1001103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!644344))))

(assert (=> b!1474593 (= lt!644344 (Intermediate!12048 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474594 () Bool)

(declare-fun res!1001102 () Bool)

(assert (=> b!1474594 (=> (not res!1001102) (not e!827593))))

(assert (=> b!1474594 (= res!1001102 (validKeyInArray!0 (select (arr!47911 a!2862) i!1006)))))

(declare-fun b!1474595 () Bool)

(declare-fun res!1001108 () Bool)

(assert (=> b!1474595 (=> (not res!1001108) (not e!827593))))

(declare-datatypes ((List!34399 0))(
  ( (Nil!34396) (Cons!34395 (h!35765 (_ BitVec 64)) (t!49085 List!34399)) )
))
(declare-fun arrayNoDuplicates!0 (array!99262 (_ BitVec 32) List!34399) Bool)

(assert (=> b!1474595 (= res!1001108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34396))))

(declare-fun b!1474596 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99262 (_ BitVec 32)) SeekEntryResult!12048)

(assert (=> b!1474596 (= e!827592 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644341 lt!644342 mask!2687) (seekEntryOrOpen!0 lt!644341 lt!644342 mask!2687)))))

(declare-fun b!1474597 () Bool)

(declare-fun res!1001097 () Bool)

(assert (=> b!1474597 (=> (not res!1001097) (not e!827597))))

(assert (=> b!1474597 (= res!1001097 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126090 res!1001106) b!1474584))

(assert (= (and b!1474584 res!1001105) b!1474594))

(assert (= (and b!1474594 res!1001102) b!1474591))

(assert (= (and b!1474591 res!1001096) b!1474589))

(assert (= (and b!1474589 res!1001104) b!1474595))

(assert (= (and b!1474595 res!1001108) b!1474585))

(assert (= (and b!1474585 res!1001098) b!1474583))

(assert (= (and b!1474583 res!1001100) b!1474593))

(assert (= (and b!1474593 res!1001103) b!1474587))

(assert (= (and b!1474587 res!1001107) b!1474586))

(assert (= (and b!1474586 res!1001095) b!1474592))

(assert (= (and b!1474592 c!136267) b!1474582))

(assert (= (and b!1474592 (not c!136267)) b!1474596))

(assert (= (and b!1474592 res!1001099) b!1474597))

(assert (= (and b!1474597 res!1001097) b!1474590))

(assert (= (and b!1474590 (not res!1001101)) b!1474588))

(declare-fun m!1361233 () Bool)

(assert (=> b!1474582 m!1361233))

(declare-fun m!1361235 () Bool)

(assert (=> b!1474589 m!1361235))

(declare-fun m!1361237 () Bool)

(assert (=> start!126090 m!1361237))

(declare-fun m!1361239 () Bool)

(assert (=> start!126090 m!1361239))

(declare-fun m!1361241 () Bool)

(assert (=> b!1474587 m!1361241))

(assert (=> b!1474587 m!1361241))

(declare-fun m!1361243 () Bool)

(assert (=> b!1474587 m!1361243))

(declare-fun m!1361245 () Bool)

(assert (=> b!1474583 m!1361245))

(declare-fun m!1361247 () Bool)

(assert (=> b!1474583 m!1361247))

(declare-fun m!1361249 () Bool)

(assert (=> b!1474596 m!1361249))

(declare-fun m!1361251 () Bool)

(assert (=> b!1474596 m!1361251))

(declare-fun m!1361253 () Bool)

(assert (=> b!1474586 m!1361253))

(assert (=> b!1474586 m!1361253))

(declare-fun m!1361255 () Bool)

(assert (=> b!1474586 m!1361255))

(assert (=> b!1474586 m!1361245))

(declare-fun m!1361257 () Bool)

(assert (=> b!1474586 m!1361257))

(assert (=> b!1474591 m!1361241))

(assert (=> b!1474591 m!1361241))

(declare-fun m!1361259 () Bool)

(assert (=> b!1474591 m!1361259))

(declare-fun m!1361261 () Bool)

(assert (=> b!1474594 m!1361261))

(assert (=> b!1474594 m!1361261))

(declare-fun m!1361263 () Bool)

(assert (=> b!1474594 m!1361263))

(declare-fun m!1361265 () Bool)

(assert (=> b!1474590 m!1361265))

(assert (=> b!1474590 m!1361245))

(declare-fun m!1361267 () Bool)

(assert (=> b!1474590 m!1361267))

(declare-fun m!1361269 () Bool)

(assert (=> b!1474590 m!1361269))

(declare-fun m!1361271 () Bool)

(assert (=> b!1474590 m!1361271))

(assert (=> b!1474590 m!1361241))

(declare-fun m!1361273 () Bool)

(assert (=> b!1474590 m!1361273))

(declare-fun m!1361275 () Bool)

(assert (=> b!1474590 m!1361275))

(assert (=> b!1474590 m!1361241))

(assert (=> b!1474593 m!1361241))

(assert (=> b!1474593 m!1361241))

(declare-fun m!1361277 () Bool)

(assert (=> b!1474593 m!1361277))

(assert (=> b!1474593 m!1361277))

(assert (=> b!1474593 m!1361241))

(declare-fun m!1361279 () Bool)

(assert (=> b!1474593 m!1361279))

(assert (=> b!1474588 m!1361251))

(declare-fun m!1361281 () Bool)

(assert (=> b!1474595 m!1361281))

(check-sat (not b!1474582) (not b!1474589) (not b!1474586) (not b!1474595) (not start!126090) (not b!1474587) (not b!1474590) (not b!1474588) (not b!1474594) (not b!1474591) (not b!1474593) (not b!1474596))
(check-sat)
(get-model)

(declare-fun b!1474704 () Bool)

(declare-fun e!827649 () Bool)

(declare-fun e!827652 () Bool)

(assert (=> b!1474704 (= e!827649 e!827652)))

(declare-fun c!136276 () Bool)

(assert (=> b!1474704 (= c!136276 (validKeyInArray!0 (select (arr!47911 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474705 () Bool)

(declare-fun e!827651 () Bool)

(assert (=> b!1474705 (= e!827651 e!827649)))

(declare-fun res!1001201 () Bool)

(assert (=> b!1474705 (=> (not res!1001201) (not e!827649))))

(declare-fun e!827650 () Bool)

(assert (=> b!1474705 (= res!1001201 (not e!827650))))

(declare-fun res!1001199 () Bool)

(assert (=> b!1474705 (=> (not res!1001199) (not e!827650))))

(assert (=> b!1474705 (= res!1001199 (validKeyInArray!0 (select (arr!47911 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474706 () Bool)

(declare-fun call!67833 () Bool)

(assert (=> b!1474706 (= e!827652 call!67833)))

(declare-fun b!1474707 () Bool)

(declare-fun contains!9948 (List!34399 (_ BitVec 64)) Bool)

(assert (=> b!1474707 (= e!827650 (contains!9948 Nil!34396 (select (arr!47911 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474708 () Bool)

(assert (=> b!1474708 (= e!827652 call!67833)))

(declare-fun d!156027 () Bool)

(declare-fun res!1001200 () Bool)

(assert (=> d!156027 (=> res!1001200 e!827651)))

(assert (=> d!156027 (= res!1001200 (bvsge #b00000000000000000000000000000000 (size!48462 a!2862)))))

(assert (=> d!156027 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34396) e!827651)))

(declare-fun bm!67830 () Bool)

(assert (=> bm!67830 (= call!67833 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136276 (Cons!34395 (select (arr!47911 a!2862) #b00000000000000000000000000000000) Nil!34396) Nil!34396)))))

(assert (= (and d!156027 (not res!1001200)) b!1474705))

(assert (= (and b!1474705 res!1001199) b!1474707))

(assert (= (and b!1474705 res!1001201) b!1474704))

(assert (= (and b!1474704 c!136276) b!1474708))

(assert (= (and b!1474704 (not c!136276)) b!1474706))

(assert (= (or b!1474708 b!1474706) bm!67830))

(declare-fun m!1361383 () Bool)

(assert (=> b!1474704 m!1361383))

(assert (=> b!1474704 m!1361383))

(declare-fun m!1361385 () Bool)

(assert (=> b!1474704 m!1361385))

(assert (=> b!1474705 m!1361383))

(assert (=> b!1474705 m!1361383))

(assert (=> b!1474705 m!1361385))

(assert (=> b!1474707 m!1361383))

(assert (=> b!1474707 m!1361383))

(declare-fun m!1361387 () Bool)

(assert (=> b!1474707 m!1361387))

(assert (=> bm!67830 m!1361383))

(declare-fun m!1361389 () Bool)

(assert (=> bm!67830 m!1361389))

(assert (=> b!1474595 d!156027))

(declare-fun b!1474721 () Bool)

(declare-fun e!827660 () SeekEntryResult!12048)

(assert (=> b!1474721 (= e!827660 Undefined!12048)))

(declare-fun b!1474722 () Bool)

(declare-fun c!136285 () Bool)

(declare-fun lt!644385 () (_ BitVec 64))

(assert (=> b!1474722 (= c!136285 (= lt!644385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827661 () SeekEntryResult!12048)

(declare-fun e!827659 () SeekEntryResult!12048)

(assert (=> b!1474722 (= e!827661 e!827659)))

(declare-fun b!1474723 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474723 (= e!827659 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!644341 lt!644342 mask!2687))))

(declare-fun b!1474724 () Bool)

(assert (=> b!1474724 (= e!827659 (MissingVacant!12048 intermediateAfterIndex!19))))

(declare-fun lt!644386 () SeekEntryResult!12048)

(declare-fun d!156029 () Bool)

(get-info :version)

(assert (=> d!156029 (and (or ((_ is Undefined!12048) lt!644386) (not ((_ is Found!12048) lt!644386)) (and (bvsge (index!50585 lt!644386) #b00000000000000000000000000000000) (bvslt (index!50585 lt!644386) (size!48462 lt!644342)))) (or ((_ is Undefined!12048) lt!644386) ((_ is Found!12048) lt!644386) (not ((_ is MissingVacant!12048) lt!644386)) (not (= (index!50587 lt!644386) intermediateAfterIndex!19)) (and (bvsge (index!50587 lt!644386) #b00000000000000000000000000000000) (bvslt (index!50587 lt!644386) (size!48462 lt!644342)))) (or ((_ is Undefined!12048) lt!644386) (ite ((_ is Found!12048) lt!644386) (= (select (arr!47911 lt!644342) (index!50585 lt!644386)) lt!644341) (and ((_ is MissingVacant!12048) lt!644386) (= (index!50587 lt!644386) intermediateAfterIndex!19) (= (select (arr!47911 lt!644342) (index!50587 lt!644386)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156029 (= lt!644386 e!827660)))

(declare-fun c!136283 () Bool)

(assert (=> d!156029 (= c!136283 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156029 (= lt!644385 (select (arr!47911 lt!644342) index!646))))

(assert (=> d!156029 (validMask!0 mask!2687)))

(assert (=> d!156029 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644341 lt!644342 mask!2687) lt!644386)))

(declare-fun b!1474725 () Bool)

(assert (=> b!1474725 (= e!827661 (Found!12048 index!646))))

(declare-fun b!1474726 () Bool)

(assert (=> b!1474726 (= e!827660 e!827661)))

(declare-fun c!136284 () Bool)

(assert (=> b!1474726 (= c!136284 (= lt!644385 lt!644341))))

(assert (= (and d!156029 c!136283) b!1474721))

(assert (= (and d!156029 (not c!136283)) b!1474726))

(assert (= (and b!1474726 c!136284) b!1474725))

(assert (= (and b!1474726 (not c!136284)) b!1474722))

(assert (= (and b!1474722 c!136285) b!1474724))

(assert (= (and b!1474722 (not c!136285)) b!1474723))

(declare-fun m!1361391 () Bool)

(assert (=> b!1474723 m!1361391))

(assert (=> b!1474723 m!1361391))

(declare-fun m!1361393 () Bool)

(assert (=> b!1474723 m!1361393))

(declare-fun m!1361395 () Bool)

(assert (=> d!156029 m!1361395))

(declare-fun m!1361397 () Bool)

(assert (=> d!156029 m!1361397))

(declare-fun m!1361399 () Bool)

(assert (=> d!156029 m!1361399))

(assert (=> d!156029 m!1361237))

(assert (=> b!1474596 d!156029))

(declare-fun d!156031 () Bool)

(declare-fun lt!644393 () SeekEntryResult!12048)

(assert (=> d!156031 (and (or ((_ is Undefined!12048) lt!644393) (not ((_ is Found!12048) lt!644393)) (and (bvsge (index!50585 lt!644393) #b00000000000000000000000000000000) (bvslt (index!50585 lt!644393) (size!48462 lt!644342)))) (or ((_ is Undefined!12048) lt!644393) ((_ is Found!12048) lt!644393) (not ((_ is MissingZero!12048) lt!644393)) (and (bvsge (index!50584 lt!644393) #b00000000000000000000000000000000) (bvslt (index!50584 lt!644393) (size!48462 lt!644342)))) (or ((_ is Undefined!12048) lt!644393) ((_ is Found!12048) lt!644393) ((_ is MissingZero!12048) lt!644393) (not ((_ is MissingVacant!12048) lt!644393)) (and (bvsge (index!50587 lt!644393) #b00000000000000000000000000000000) (bvslt (index!50587 lt!644393) (size!48462 lt!644342)))) (or ((_ is Undefined!12048) lt!644393) (ite ((_ is Found!12048) lt!644393) (= (select (arr!47911 lt!644342) (index!50585 lt!644393)) lt!644341) (ite ((_ is MissingZero!12048) lt!644393) (= (select (arr!47911 lt!644342) (index!50584 lt!644393)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12048) lt!644393) (= (select (arr!47911 lt!644342) (index!50587 lt!644393)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827669 () SeekEntryResult!12048)

(assert (=> d!156031 (= lt!644393 e!827669)))

(declare-fun c!136294 () Bool)

(declare-fun lt!644395 () SeekEntryResult!12048)

(assert (=> d!156031 (= c!136294 (and ((_ is Intermediate!12048) lt!644395) (undefined!12860 lt!644395)))))

(assert (=> d!156031 (= lt!644395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644342 mask!2687))))

(assert (=> d!156031 (validMask!0 mask!2687)))

(assert (=> d!156031 (= (seekEntryOrOpen!0 lt!644341 lt!644342 mask!2687) lt!644393)))

(declare-fun b!1474739 () Bool)

(declare-fun e!827670 () SeekEntryResult!12048)

(assert (=> b!1474739 (= e!827670 (MissingZero!12048 (index!50586 lt!644395)))))

(declare-fun b!1474740 () Bool)

(assert (=> b!1474740 (= e!827670 (seekKeyOrZeroReturnVacant!0 (x!132348 lt!644395) (index!50586 lt!644395) (index!50586 lt!644395) lt!644341 lt!644342 mask!2687))))

(declare-fun b!1474741 () Bool)

(declare-fun e!827668 () SeekEntryResult!12048)

(assert (=> b!1474741 (= e!827668 (Found!12048 (index!50586 lt!644395)))))

(declare-fun b!1474742 () Bool)

(assert (=> b!1474742 (= e!827669 e!827668)))

(declare-fun lt!644394 () (_ BitVec 64))

(assert (=> b!1474742 (= lt!644394 (select (arr!47911 lt!644342) (index!50586 lt!644395)))))

(declare-fun c!136293 () Bool)

(assert (=> b!1474742 (= c!136293 (= lt!644394 lt!644341))))

(declare-fun b!1474743 () Bool)

(assert (=> b!1474743 (= e!827669 Undefined!12048)))

(declare-fun b!1474744 () Bool)

(declare-fun c!136292 () Bool)

(assert (=> b!1474744 (= c!136292 (= lt!644394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474744 (= e!827668 e!827670)))

(assert (= (and d!156031 c!136294) b!1474743))

(assert (= (and d!156031 (not c!136294)) b!1474742))

(assert (= (and b!1474742 c!136293) b!1474741))

(assert (= (and b!1474742 (not c!136293)) b!1474744))

(assert (= (and b!1474744 c!136292) b!1474739))

(assert (= (and b!1474744 (not c!136292)) b!1474740))

(declare-fun m!1361401 () Bool)

(assert (=> d!156031 m!1361401))

(assert (=> d!156031 m!1361237))

(assert (=> d!156031 m!1361253))

(assert (=> d!156031 m!1361253))

(assert (=> d!156031 m!1361255))

(declare-fun m!1361403 () Bool)

(assert (=> d!156031 m!1361403))

(declare-fun m!1361405 () Bool)

(assert (=> d!156031 m!1361405))

(declare-fun m!1361407 () Bool)

(assert (=> b!1474740 m!1361407))

(declare-fun m!1361409 () Bool)

(assert (=> b!1474742 m!1361409))

(assert (=> b!1474596 d!156031))

(declare-fun b!1474788 () Bool)

(declare-fun e!827700 () SeekEntryResult!12048)

(assert (=> b!1474788 (= e!827700 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644341 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!644341 lt!644342 mask!2687))))

(declare-fun b!1474789 () Bool)

(declare-fun lt!644418 () SeekEntryResult!12048)

(assert (=> b!1474789 (and (bvsge (index!50586 lt!644418) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644418) (size!48462 lt!644342)))))

(declare-fun res!1001220 () Bool)

(assert (=> b!1474789 (= res!1001220 (= (select (arr!47911 lt!644342) (index!50586 lt!644418)) lt!644341))))

(declare-fun e!827699 () Bool)

(assert (=> b!1474789 (=> res!1001220 e!827699)))

(declare-fun e!827703 () Bool)

(assert (=> b!1474789 (= e!827703 e!827699)))

(declare-fun b!1474790 () Bool)

(declare-fun e!827701 () Bool)

(assert (=> b!1474790 (= e!827701 e!827703)))

(declare-fun res!1001221 () Bool)

(assert (=> b!1474790 (= res!1001221 (and ((_ is Intermediate!12048) lt!644418) (not (undefined!12860 lt!644418)) (bvslt (x!132348 lt!644418) #b01111111111111111111111111111110) (bvsge (x!132348 lt!644418) #b00000000000000000000000000000000) (bvsge (x!132348 lt!644418) #b00000000000000000000000000000000)))))

(assert (=> b!1474790 (=> (not res!1001221) (not e!827703))))

(declare-fun b!1474791 () Bool)

(assert (=> b!1474791 (= e!827701 (bvsge (x!132348 lt!644418) #b01111111111111111111111111111110))))

(declare-fun d!156035 () Bool)

(assert (=> d!156035 e!827701))

(declare-fun c!136309 () Bool)

(assert (=> d!156035 (= c!136309 (and ((_ is Intermediate!12048) lt!644418) (undefined!12860 lt!644418)))))

(declare-fun e!827702 () SeekEntryResult!12048)

(assert (=> d!156035 (= lt!644418 e!827702)))

(declare-fun c!136307 () Bool)

(assert (=> d!156035 (= c!136307 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644419 () (_ BitVec 64))

(assert (=> d!156035 (= lt!644419 (select (arr!47911 lt!644342) (toIndex!0 lt!644341 mask!2687)))))

(assert (=> d!156035 (validMask!0 mask!2687)))

(assert (=> d!156035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644342 mask!2687) lt!644418)))

(declare-fun b!1474787 () Bool)

(assert (=> b!1474787 (and (bvsge (index!50586 lt!644418) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644418) (size!48462 lt!644342)))))

(assert (=> b!1474787 (= e!827699 (= (select (arr!47911 lt!644342) (index!50586 lt!644418)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474792 () Bool)

(assert (=> b!1474792 (= e!827702 e!827700)))

(declare-fun c!136308 () Bool)

(assert (=> b!1474792 (= c!136308 (or (= lt!644419 lt!644341) (= (bvadd lt!644419 lt!644419) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474793 () Bool)

(assert (=> b!1474793 (= e!827700 (Intermediate!12048 false (toIndex!0 lt!644341 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474794 () Bool)

(assert (=> b!1474794 (= e!827702 (Intermediate!12048 true (toIndex!0 lt!644341 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474795 () Bool)

(assert (=> b!1474795 (and (bvsge (index!50586 lt!644418) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644418) (size!48462 lt!644342)))))

(declare-fun res!1001222 () Bool)

(assert (=> b!1474795 (= res!1001222 (= (select (arr!47911 lt!644342) (index!50586 lt!644418)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474795 (=> res!1001222 e!827699)))

(assert (= (and d!156035 c!136307) b!1474794))

(assert (= (and d!156035 (not c!136307)) b!1474792))

(assert (= (and b!1474792 c!136308) b!1474793))

(assert (= (and b!1474792 (not c!136308)) b!1474788))

(assert (= (and d!156035 c!136309) b!1474791))

(assert (= (and d!156035 (not c!136309)) b!1474790))

(assert (= (and b!1474790 res!1001221) b!1474789))

(assert (= (and b!1474789 (not res!1001220)) b!1474795))

(assert (= (and b!1474795 (not res!1001222)) b!1474787))

(declare-fun m!1361435 () Bool)

(assert (=> b!1474787 m!1361435))

(assert (=> b!1474788 m!1361253))

(declare-fun m!1361437 () Bool)

(assert (=> b!1474788 m!1361437))

(assert (=> b!1474788 m!1361437))

(declare-fun m!1361439 () Bool)

(assert (=> b!1474788 m!1361439))

(assert (=> b!1474789 m!1361435))

(assert (=> b!1474795 m!1361435))

(assert (=> d!156035 m!1361253))

(declare-fun m!1361441 () Bool)

(assert (=> d!156035 m!1361441))

(assert (=> d!156035 m!1361237))

(assert (=> b!1474586 d!156035))

(declare-fun d!156045 () Bool)

(declare-fun lt!644425 () (_ BitVec 32))

(declare-fun lt!644424 () (_ BitVec 32))

(assert (=> d!156045 (= lt!644425 (bvmul (bvxor lt!644424 (bvlshr lt!644424 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156045 (= lt!644424 ((_ extract 31 0) (bvand (bvxor lt!644341 (bvlshr lt!644341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156045 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001223 (let ((h!35768 ((_ extract 31 0) (bvand (bvxor lt!644341 (bvlshr lt!644341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132353 (bvmul (bvxor h!35768 (bvlshr h!35768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132353 (bvlshr x!132353 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001223 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001223 #b00000000000000000000000000000000))))))

(assert (=> d!156045 (= (toIndex!0 lt!644341 mask!2687) (bvand (bvxor lt!644425 (bvlshr lt!644425 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474586 d!156045))

(declare-fun e!827705 () SeekEntryResult!12048)

(declare-fun b!1474797 () Bool)

(assert (=> b!1474797 (= e!827705 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474798 () Bool)

(declare-fun lt!644426 () SeekEntryResult!12048)

(assert (=> b!1474798 (and (bvsge (index!50586 lt!644426) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644426) (size!48462 a!2862)))))

(declare-fun res!1001224 () Bool)

(assert (=> b!1474798 (= res!1001224 (= (select (arr!47911 a!2862) (index!50586 lt!644426)) (select (arr!47911 a!2862) j!93)))))

(declare-fun e!827704 () Bool)

(assert (=> b!1474798 (=> res!1001224 e!827704)))

(declare-fun e!827708 () Bool)

(assert (=> b!1474798 (= e!827708 e!827704)))

(declare-fun b!1474799 () Bool)

(declare-fun e!827706 () Bool)

(assert (=> b!1474799 (= e!827706 e!827708)))

(declare-fun res!1001225 () Bool)

(assert (=> b!1474799 (= res!1001225 (and ((_ is Intermediate!12048) lt!644426) (not (undefined!12860 lt!644426)) (bvslt (x!132348 lt!644426) #b01111111111111111111111111111110) (bvsge (x!132348 lt!644426) #b00000000000000000000000000000000) (bvsge (x!132348 lt!644426) x!665)))))

(assert (=> b!1474799 (=> (not res!1001225) (not e!827708))))

(declare-fun b!1474800 () Bool)

(assert (=> b!1474800 (= e!827706 (bvsge (x!132348 lt!644426) #b01111111111111111111111111111110))))

(declare-fun d!156047 () Bool)

(assert (=> d!156047 e!827706))

(declare-fun c!136312 () Bool)

(assert (=> d!156047 (= c!136312 (and ((_ is Intermediate!12048) lt!644426) (undefined!12860 lt!644426)))))

(declare-fun e!827707 () SeekEntryResult!12048)

(assert (=> d!156047 (= lt!644426 e!827707)))

(declare-fun c!136310 () Bool)

(assert (=> d!156047 (= c!136310 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644427 () (_ BitVec 64))

(assert (=> d!156047 (= lt!644427 (select (arr!47911 a!2862) index!646))))

(assert (=> d!156047 (validMask!0 mask!2687)))

(assert (=> d!156047 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!644426)))

(declare-fun b!1474796 () Bool)

(assert (=> b!1474796 (and (bvsge (index!50586 lt!644426) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644426) (size!48462 a!2862)))))

(assert (=> b!1474796 (= e!827704 (= (select (arr!47911 a!2862) (index!50586 lt!644426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474801 () Bool)

(assert (=> b!1474801 (= e!827707 e!827705)))

(declare-fun c!136311 () Bool)

(assert (=> b!1474801 (= c!136311 (or (= lt!644427 (select (arr!47911 a!2862) j!93)) (= (bvadd lt!644427 lt!644427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474802 () Bool)

(assert (=> b!1474802 (= e!827705 (Intermediate!12048 false index!646 x!665))))

(declare-fun b!1474803 () Bool)

(assert (=> b!1474803 (= e!827707 (Intermediate!12048 true index!646 x!665))))

(declare-fun b!1474804 () Bool)

(assert (=> b!1474804 (and (bvsge (index!50586 lt!644426) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644426) (size!48462 a!2862)))))

(declare-fun res!1001226 () Bool)

(assert (=> b!1474804 (= res!1001226 (= (select (arr!47911 a!2862) (index!50586 lt!644426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474804 (=> res!1001226 e!827704)))

(assert (= (and d!156047 c!136310) b!1474803))

(assert (= (and d!156047 (not c!136310)) b!1474801))

(assert (= (and b!1474801 c!136311) b!1474802))

(assert (= (and b!1474801 (not c!136311)) b!1474797))

(assert (= (and d!156047 c!136312) b!1474800))

(assert (= (and d!156047 (not c!136312)) b!1474799))

(assert (= (and b!1474799 res!1001225) b!1474798))

(assert (= (and b!1474798 (not res!1001224)) b!1474804))

(assert (= (and b!1474804 (not res!1001226)) b!1474796))

(declare-fun m!1361443 () Bool)

(assert (=> b!1474796 m!1361443))

(assert (=> b!1474797 m!1361391))

(assert (=> b!1474797 m!1361391))

(assert (=> b!1474797 m!1361241))

(declare-fun m!1361445 () Bool)

(assert (=> b!1474797 m!1361445))

(assert (=> b!1474798 m!1361443))

(assert (=> b!1474804 m!1361443))

(assert (=> d!156047 m!1361271))

(assert (=> d!156047 m!1361237))

(assert (=> b!1474587 d!156047))

(assert (=> b!1474588 d!156031))

(declare-fun b!1474849 () Bool)

(declare-fun e!827737 () Bool)

(declare-fun call!67842 () Bool)

(assert (=> b!1474849 (= e!827737 call!67842)))

(declare-fun b!1474850 () Bool)

(declare-fun e!827736 () Bool)

(assert (=> b!1474850 (= e!827736 call!67842)))

(declare-fun d!156049 () Bool)

(declare-fun res!1001244 () Bool)

(declare-fun e!827735 () Bool)

(assert (=> d!156049 (=> res!1001244 e!827735)))

(assert (=> d!156049 (= res!1001244 (bvsge #b00000000000000000000000000000000 (size!48462 a!2862)))))

(assert (=> d!156049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827735)))

(declare-fun b!1474851 () Bool)

(assert (=> b!1474851 (= e!827735 e!827736)))

(declare-fun c!136327 () Bool)

(assert (=> b!1474851 (= c!136327 (validKeyInArray!0 (select (arr!47911 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67839 () Bool)

(assert (=> bm!67839 (= call!67842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474852 () Bool)

(assert (=> b!1474852 (= e!827736 e!827737)))

(declare-fun lt!644443 () (_ BitVec 64))

(assert (=> b!1474852 (= lt!644443 (select (arr!47911 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644442 () Unit!49469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99262 (_ BitVec 64) (_ BitVec 32)) Unit!49469)

(assert (=> b!1474852 (= lt!644442 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644443 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1474852 (arrayContainsKey!0 a!2862 lt!644443 #b00000000000000000000000000000000)))

(declare-fun lt!644444 () Unit!49469)

(assert (=> b!1474852 (= lt!644444 lt!644442)))

(declare-fun res!1001243 () Bool)

(assert (=> b!1474852 (= res!1001243 (= (seekEntryOrOpen!0 (select (arr!47911 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12048 #b00000000000000000000000000000000)))))

(assert (=> b!1474852 (=> (not res!1001243) (not e!827737))))

(assert (= (and d!156049 (not res!1001244)) b!1474851))

(assert (= (and b!1474851 c!136327) b!1474852))

(assert (= (and b!1474851 (not c!136327)) b!1474850))

(assert (= (and b!1474852 res!1001243) b!1474849))

(assert (= (or b!1474849 b!1474850) bm!67839))

(assert (=> b!1474851 m!1361383))

(assert (=> b!1474851 m!1361383))

(assert (=> b!1474851 m!1361385))

(declare-fun m!1361447 () Bool)

(assert (=> bm!67839 m!1361447))

(assert (=> b!1474852 m!1361383))

(declare-fun m!1361449 () Bool)

(assert (=> b!1474852 m!1361449))

(declare-fun m!1361451 () Bool)

(assert (=> b!1474852 m!1361451))

(assert (=> b!1474852 m!1361383))

(declare-fun m!1361453 () Bool)

(assert (=> b!1474852 m!1361453))

(assert (=> b!1474589 d!156049))

(declare-fun d!156051 () Bool)

(declare-fun lt!644445 () SeekEntryResult!12048)

(assert (=> d!156051 (and (or ((_ is Undefined!12048) lt!644445) (not ((_ is Found!12048) lt!644445)) (and (bvsge (index!50585 lt!644445) #b00000000000000000000000000000000) (bvslt (index!50585 lt!644445) (size!48462 a!2862)))) (or ((_ is Undefined!12048) lt!644445) ((_ is Found!12048) lt!644445) (not ((_ is MissingZero!12048) lt!644445)) (and (bvsge (index!50584 lt!644445) #b00000000000000000000000000000000) (bvslt (index!50584 lt!644445) (size!48462 a!2862)))) (or ((_ is Undefined!12048) lt!644445) ((_ is Found!12048) lt!644445) ((_ is MissingZero!12048) lt!644445) (not ((_ is MissingVacant!12048) lt!644445)) (and (bvsge (index!50587 lt!644445) #b00000000000000000000000000000000) (bvslt (index!50587 lt!644445) (size!48462 a!2862)))) (or ((_ is Undefined!12048) lt!644445) (ite ((_ is Found!12048) lt!644445) (= (select (arr!47911 a!2862) (index!50585 lt!644445)) (select (arr!47911 a!2862) j!93)) (ite ((_ is MissingZero!12048) lt!644445) (= (select (arr!47911 a!2862) (index!50584 lt!644445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12048) lt!644445) (= (select (arr!47911 a!2862) (index!50587 lt!644445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827739 () SeekEntryResult!12048)

(assert (=> d!156051 (= lt!644445 e!827739)))

(declare-fun c!136330 () Bool)

(declare-fun lt!644447 () SeekEntryResult!12048)

(assert (=> d!156051 (= c!136330 (and ((_ is Intermediate!12048) lt!644447) (undefined!12860 lt!644447)))))

(assert (=> d!156051 (= lt!644447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156051 (validMask!0 mask!2687)))

(assert (=> d!156051 (= (seekEntryOrOpen!0 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!644445)))

(declare-fun b!1474853 () Bool)

(declare-fun e!827740 () SeekEntryResult!12048)

(assert (=> b!1474853 (= e!827740 (MissingZero!12048 (index!50586 lt!644447)))))

(declare-fun b!1474854 () Bool)

(assert (=> b!1474854 (= e!827740 (seekKeyOrZeroReturnVacant!0 (x!132348 lt!644447) (index!50586 lt!644447) (index!50586 lt!644447) (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474855 () Bool)

(declare-fun e!827738 () SeekEntryResult!12048)

(assert (=> b!1474855 (= e!827738 (Found!12048 (index!50586 lt!644447)))))

(declare-fun b!1474856 () Bool)

(assert (=> b!1474856 (= e!827739 e!827738)))

(declare-fun lt!644446 () (_ BitVec 64))

(assert (=> b!1474856 (= lt!644446 (select (arr!47911 a!2862) (index!50586 lt!644447)))))

(declare-fun c!136329 () Bool)

(assert (=> b!1474856 (= c!136329 (= lt!644446 (select (arr!47911 a!2862) j!93)))))

(declare-fun b!1474857 () Bool)

(assert (=> b!1474857 (= e!827739 Undefined!12048)))

(declare-fun b!1474858 () Bool)

(declare-fun c!136328 () Bool)

(assert (=> b!1474858 (= c!136328 (= lt!644446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474858 (= e!827738 e!827740)))

(assert (= (and d!156051 c!136330) b!1474857))

(assert (= (and d!156051 (not c!136330)) b!1474856))

(assert (= (and b!1474856 c!136329) b!1474855))

(assert (= (and b!1474856 (not c!136329)) b!1474858))

(assert (= (and b!1474858 c!136328) b!1474853))

(assert (= (and b!1474858 (not c!136328)) b!1474854))

(declare-fun m!1361455 () Bool)

(assert (=> d!156051 m!1361455))

(assert (=> d!156051 m!1361237))

(assert (=> d!156051 m!1361241))

(assert (=> d!156051 m!1361277))

(assert (=> d!156051 m!1361277))

(assert (=> d!156051 m!1361241))

(assert (=> d!156051 m!1361279))

(declare-fun m!1361457 () Bool)

(assert (=> d!156051 m!1361457))

(declare-fun m!1361459 () Bool)

(assert (=> d!156051 m!1361459))

(assert (=> b!1474854 m!1361241))

(declare-fun m!1361461 () Bool)

(assert (=> b!1474854 m!1361461))

(declare-fun m!1361463 () Bool)

(assert (=> b!1474856 m!1361463))

(assert (=> b!1474590 d!156051))

(declare-fun b!1474859 () Bool)

(declare-fun e!827743 () Bool)

(declare-fun call!67843 () Bool)

(assert (=> b!1474859 (= e!827743 call!67843)))

(declare-fun b!1474860 () Bool)

(declare-fun e!827742 () Bool)

(assert (=> b!1474860 (= e!827742 call!67843)))

(declare-fun d!156053 () Bool)

(declare-fun res!1001246 () Bool)

(declare-fun e!827741 () Bool)

(assert (=> d!156053 (=> res!1001246 e!827741)))

(assert (=> d!156053 (= res!1001246 (bvsge j!93 (size!48462 a!2862)))))

(assert (=> d!156053 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827741)))

(declare-fun b!1474861 () Bool)

(assert (=> b!1474861 (= e!827741 e!827742)))

(declare-fun c!136331 () Bool)

(assert (=> b!1474861 (= c!136331 (validKeyInArray!0 (select (arr!47911 a!2862) j!93)))))

(declare-fun bm!67840 () Bool)

(assert (=> bm!67840 (= call!67843 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474862 () Bool)

(assert (=> b!1474862 (= e!827742 e!827743)))

(declare-fun lt!644449 () (_ BitVec 64))

(assert (=> b!1474862 (= lt!644449 (select (arr!47911 a!2862) j!93))))

(declare-fun lt!644448 () Unit!49469)

(assert (=> b!1474862 (= lt!644448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644449 j!93))))

(assert (=> b!1474862 (arrayContainsKey!0 a!2862 lt!644449 #b00000000000000000000000000000000)))

(declare-fun lt!644450 () Unit!49469)

(assert (=> b!1474862 (= lt!644450 lt!644448)))

(declare-fun res!1001245 () Bool)

(assert (=> b!1474862 (= res!1001245 (= (seekEntryOrOpen!0 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) (Found!12048 j!93)))))

(assert (=> b!1474862 (=> (not res!1001245) (not e!827743))))

(assert (= (and d!156053 (not res!1001246)) b!1474861))

(assert (= (and b!1474861 c!136331) b!1474862))

(assert (= (and b!1474861 (not c!136331)) b!1474860))

(assert (= (and b!1474862 res!1001245) b!1474859))

(assert (= (or b!1474859 b!1474860) bm!67840))

(assert (=> b!1474861 m!1361241))

(assert (=> b!1474861 m!1361241))

(assert (=> b!1474861 m!1361259))

(declare-fun m!1361465 () Bool)

(assert (=> bm!67840 m!1361465))

(assert (=> b!1474862 m!1361241))

(declare-fun m!1361467 () Bool)

(assert (=> b!1474862 m!1361467))

(declare-fun m!1361469 () Bool)

(assert (=> b!1474862 m!1361469))

(assert (=> b!1474862 m!1361241))

(assert (=> b!1474862 m!1361273))

(assert (=> b!1474590 d!156053))

(declare-fun d!156055 () Bool)

(assert (=> d!156055 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644459 () Unit!49469)

(declare-fun choose!38 (array!99262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49469)

(assert (=> d!156055 (= lt!644459 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156055 (validMask!0 mask!2687)))

(assert (=> d!156055 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644459)))

(declare-fun bs!42544 () Bool)

(assert (= bs!42544 d!156055))

(assert (=> bs!42544 m!1361275))

(declare-fun m!1361493 () Bool)

(assert (=> bs!42544 m!1361493))

(assert (=> bs!42544 m!1361237))

(assert (=> b!1474590 d!156055))

(declare-fun d!156063 () Bool)

(assert (=> d!156063 (= (validKeyInArray!0 (select (arr!47911 a!2862) j!93)) (and (not (= (select (arr!47911 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47911 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474591 d!156063))

(declare-fun e!827760 () SeekEntryResult!12048)

(declare-fun b!1474891 () Bool)

(assert (=> b!1474891 (= e!827760 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!644341 lt!644342 mask!2687))))

(declare-fun b!1474892 () Bool)

(declare-fun lt!644460 () SeekEntryResult!12048)

(assert (=> b!1474892 (and (bvsge (index!50586 lt!644460) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644460) (size!48462 lt!644342)))))

(declare-fun res!1001258 () Bool)

(assert (=> b!1474892 (= res!1001258 (= (select (arr!47911 lt!644342) (index!50586 lt!644460)) lt!644341))))

(declare-fun e!827759 () Bool)

(assert (=> b!1474892 (=> res!1001258 e!827759)))

(declare-fun e!827763 () Bool)

(assert (=> b!1474892 (= e!827763 e!827759)))

(declare-fun b!1474893 () Bool)

(declare-fun e!827761 () Bool)

(assert (=> b!1474893 (= e!827761 e!827763)))

(declare-fun res!1001259 () Bool)

(assert (=> b!1474893 (= res!1001259 (and ((_ is Intermediate!12048) lt!644460) (not (undefined!12860 lt!644460)) (bvslt (x!132348 lt!644460) #b01111111111111111111111111111110) (bvsge (x!132348 lt!644460) #b00000000000000000000000000000000) (bvsge (x!132348 lt!644460) x!665)))))

(assert (=> b!1474893 (=> (not res!1001259) (not e!827763))))

(declare-fun b!1474894 () Bool)

(assert (=> b!1474894 (= e!827761 (bvsge (x!132348 lt!644460) #b01111111111111111111111111111110))))

(declare-fun d!156065 () Bool)

(assert (=> d!156065 e!827761))

(declare-fun c!136343 () Bool)

(assert (=> d!156065 (= c!136343 (and ((_ is Intermediate!12048) lt!644460) (undefined!12860 lt!644460)))))

(declare-fun e!827762 () SeekEntryResult!12048)

(assert (=> d!156065 (= lt!644460 e!827762)))

(declare-fun c!136341 () Bool)

(assert (=> d!156065 (= c!136341 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644461 () (_ BitVec 64))

(assert (=> d!156065 (= lt!644461 (select (arr!47911 lt!644342) index!646))))

(assert (=> d!156065 (validMask!0 mask!2687)))

(assert (=> d!156065 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644341 lt!644342 mask!2687) lt!644460)))

(declare-fun b!1474890 () Bool)

(assert (=> b!1474890 (and (bvsge (index!50586 lt!644460) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644460) (size!48462 lt!644342)))))

(assert (=> b!1474890 (= e!827759 (= (select (arr!47911 lt!644342) (index!50586 lt!644460)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474895 () Bool)

(assert (=> b!1474895 (= e!827762 e!827760)))

(declare-fun c!136342 () Bool)

(assert (=> b!1474895 (= c!136342 (or (= lt!644461 lt!644341) (= (bvadd lt!644461 lt!644461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474896 () Bool)

(assert (=> b!1474896 (= e!827760 (Intermediate!12048 false index!646 x!665))))

(declare-fun b!1474897 () Bool)

(assert (=> b!1474897 (= e!827762 (Intermediate!12048 true index!646 x!665))))

(declare-fun b!1474898 () Bool)

(assert (=> b!1474898 (and (bvsge (index!50586 lt!644460) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644460) (size!48462 lt!644342)))))

(declare-fun res!1001260 () Bool)

(assert (=> b!1474898 (= res!1001260 (= (select (arr!47911 lt!644342) (index!50586 lt!644460)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474898 (=> res!1001260 e!827759)))

(assert (= (and d!156065 c!136341) b!1474897))

(assert (= (and d!156065 (not c!136341)) b!1474895))

(assert (= (and b!1474895 c!136342) b!1474896))

(assert (= (and b!1474895 (not c!136342)) b!1474891))

(assert (= (and d!156065 c!136343) b!1474894))

(assert (= (and d!156065 (not c!136343)) b!1474893))

(assert (= (and b!1474893 res!1001259) b!1474892))

(assert (= (and b!1474892 (not res!1001258)) b!1474898))

(assert (= (and b!1474898 (not res!1001260)) b!1474890))

(declare-fun m!1361495 () Bool)

(assert (=> b!1474890 m!1361495))

(assert (=> b!1474891 m!1361391))

(assert (=> b!1474891 m!1361391))

(declare-fun m!1361497 () Bool)

(assert (=> b!1474891 m!1361497))

(assert (=> b!1474892 m!1361495))

(assert (=> b!1474898 m!1361495))

(assert (=> d!156065 m!1361399))

(assert (=> d!156065 m!1361237))

(assert (=> b!1474582 d!156065))

(declare-fun d!156067 () Bool)

(assert (=> d!156067 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126090 d!156067))

(declare-fun d!156077 () Bool)

(assert (=> d!156077 (= (array_inv!37192 a!2862) (bvsge (size!48462 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126090 d!156077))

(declare-fun b!1474924 () Bool)

(declare-fun e!827782 () SeekEntryResult!12048)

(assert (=> b!1474924 (= e!827782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474925 () Bool)

(declare-fun lt!644476 () SeekEntryResult!12048)

(assert (=> b!1474925 (and (bvsge (index!50586 lt!644476) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644476) (size!48462 a!2862)))))

(declare-fun res!1001273 () Bool)

(assert (=> b!1474925 (= res!1001273 (= (select (arr!47911 a!2862) (index!50586 lt!644476)) (select (arr!47911 a!2862) j!93)))))

(declare-fun e!827781 () Bool)

(assert (=> b!1474925 (=> res!1001273 e!827781)))

(declare-fun e!827785 () Bool)

(assert (=> b!1474925 (= e!827785 e!827781)))

(declare-fun b!1474926 () Bool)

(declare-fun e!827783 () Bool)

(assert (=> b!1474926 (= e!827783 e!827785)))

(declare-fun res!1001274 () Bool)

(assert (=> b!1474926 (= res!1001274 (and ((_ is Intermediate!12048) lt!644476) (not (undefined!12860 lt!644476)) (bvslt (x!132348 lt!644476) #b01111111111111111111111111111110) (bvsge (x!132348 lt!644476) #b00000000000000000000000000000000) (bvsge (x!132348 lt!644476) #b00000000000000000000000000000000)))))

(assert (=> b!1474926 (=> (not res!1001274) (not e!827785))))

(declare-fun b!1474927 () Bool)

(assert (=> b!1474927 (= e!827783 (bvsge (x!132348 lt!644476) #b01111111111111111111111111111110))))

(declare-fun d!156079 () Bool)

(assert (=> d!156079 e!827783))

(declare-fun c!136352 () Bool)

(assert (=> d!156079 (= c!136352 (and ((_ is Intermediate!12048) lt!644476) (undefined!12860 lt!644476)))))

(declare-fun e!827784 () SeekEntryResult!12048)

(assert (=> d!156079 (= lt!644476 e!827784)))

(declare-fun c!136350 () Bool)

(assert (=> d!156079 (= c!136350 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644477 () (_ BitVec 64))

(assert (=> d!156079 (= lt!644477 (select (arr!47911 a!2862) (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687)))))

(assert (=> d!156079 (validMask!0 mask!2687)))

(assert (=> d!156079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!644476)))

(declare-fun b!1474923 () Bool)

(assert (=> b!1474923 (and (bvsge (index!50586 lt!644476) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644476) (size!48462 a!2862)))))

(assert (=> b!1474923 (= e!827781 (= (select (arr!47911 a!2862) (index!50586 lt!644476)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474928 () Bool)

(assert (=> b!1474928 (= e!827784 e!827782)))

(declare-fun c!136351 () Bool)

(assert (=> b!1474928 (= c!136351 (or (= lt!644477 (select (arr!47911 a!2862) j!93)) (= (bvadd lt!644477 lt!644477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474929 () Bool)

(assert (=> b!1474929 (= e!827782 (Intermediate!12048 false (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474930 () Bool)

(assert (=> b!1474930 (= e!827784 (Intermediate!12048 true (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474931 () Bool)

(assert (=> b!1474931 (and (bvsge (index!50586 lt!644476) #b00000000000000000000000000000000) (bvslt (index!50586 lt!644476) (size!48462 a!2862)))))

(declare-fun res!1001275 () Bool)

(assert (=> b!1474931 (= res!1001275 (= (select (arr!47911 a!2862) (index!50586 lt!644476)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474931 (=> res!1001275 e!827781)))

(assert (= (and d!156079 c!136350) b!1474930))

(assert (= (and d!156079 (not c!136350)) b!1474928))

(assert (= (and b!1474928 c!136351) b!1474929))

(assert (= (and b!1474928 (not c!136351)) b!1474924))

(assert (= (and d!156079 c!136352) b!1474927))

(assert (= (and d!156079 (not c!136352)) b!1474926))

(assert (= (and b!1474926 res!1001274) b!1474925))

(assert (= (and b!1474925 (not res!1001273)) b!1474931))

(assert (= (and b!1474931 (not res!1001275)) b!1474923))

(declare-fun m!1361511 () Bool)

(assert (=> b!1474923 m!1361511))

(assert (=> b!1474924 m!1361277))

(declare-fun m!1361513 () Bool)

(assert (=> b!1474924 m!1361513))

(assert (=> b!1474924 m!1361513))

(assert (=> b!1474924 m!1361241))

(declare-fun m!1361515 () Bool)

(assert (=> b!1474924 m!1361515))

(assert (=> b!1474925 m!1361511))

(assert (=> b!1474931 m!1361511))

(assert (=> d!156079 m!1361277))

(declare-fun m!1361517 () Bool)

(assert (=> d!156079 m!1361517))

(assert (=> d!156079 m!1361237))

(assert (=> b!1474593 d!156079))

(declare-fun d!156081 () Bool)

(declare-fun lt!644479 () (_ BitVec 32))

(declare-fun lt!644478 () (_ BitVec 32))

(assert (=> d!156081 (= lt!644479 (bvmul (bvxor lt!644478 (bvlshr lt!644478 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156081 (= lt!644478 ((_ extract 31 0) (bvand (bvxor (select (arr!47911 a!2862) j!93) (bvlshr (select (arr!47911 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156081 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001223 (let ((h!35768 ((_ extract 31 0) (bvand (bvxor (select (arr!47911 a!2862) j!93) (bvlshr (select (arr!47911 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132353 (bvmul (bvxor h!35768 (bvlshr h!35768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132353 (bvlshr x!132353 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001223 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001223 #b00000000000000000000000000000000))))))

(assert (=> d!156081 (= (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (bvand (bvxor lt!644479 (bvlshr lt!644479 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474593 d!156081))

(declare-fun d!156083 () Bool)

(assert (=> d!156083 (= (validKeyInArray!0 (select (arr!47911 a!2862) i!1006)) (and (not (= (select (arr!47911 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47911 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474594 d!156083))

(check-sat (not d!156031) (not d!156047) (not d!156079) (not b!1474924) (not b!1474862) (not b!1474723) (not b!1474707) (not b!1474704) (not b!1474851) (not d!156055) (not b!1474854) (not d!156035) (not bm!67840) (not b!1474891) (not d!156029) (not b!1474788) (not bm!67839) (not d!156065) (not b!1474740) (not b!1474797) (not d!156051) (not b!1474852) (not b!1474705) (not b!1474861) (not bm!67830))
(check-sat)
