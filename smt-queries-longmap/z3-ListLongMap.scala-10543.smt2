; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124572 () Bool)

(assert start!124572)

(declare-fun b!1440217 () Bool)

(declare-fun e!812457 () Bool)

(declare-fun e!812454 () Bool)

(assert (=> b!1440217 (= e!812457 e!812454)))

(declare-fun res!971951 () Bool)

(assert (=> b!1440217 (=> (not res!971951) (not e!812454))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!97954 0))(
  ( (array!97955 (arr!47263 (Array (_ BitVec 32) (_ BitVec 64))) (size!47814 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97954)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11412 0))(
  ( (MissingZero!11412 (index!48040 (_ BitVec 32))) (Found!11412 (index!48041 (_ BitVec 32))) (Intermediate!11412 (undefined!12224 Bool) (index!48042 (_ BitVec 32)) (x!129951 (_ BitVec 32))) (Undefined!11412) (MissingVacant!11412 (index!48043 (_ BitVec 32))) )
))
(declare-fun lt!633145 () SeekEntryResult!11412)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440217 (= res!971951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633145))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440217 (= lt!633145 (Intermediate!11412 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440218 () Bool)

(declare-fun res!971949 () Bool)

(assert (=> b!1440218 (=> (not res!971949) (not e!812457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97954 (_ BitVec 32)) Bool)

(assert (=> b!1440218 (= res!971949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440219 () Bool)

(declare-fun res!971943 () Bool)

(assert (=> b!1440219 (=> (not res!971943) (not e!812454))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440219 (= res!971943 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633145))))

(declare-fun res!971950 () Bool)

(assert (=> start!124572 (=> (not res!971950) (not e!812457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124572 (= res!971950 (validMask!0 mask!2687))))

(assert (=> start!124572 e!812457))

(assert (=> start!124572 true))

(declare-fun array_inv!36544 (array!97954) Bool)

(assert (=> start!124572 (array_inv!36544 a!2862)))

(declare-fun b!1440220 () Bool)

(declare-fun res!971945 () Bool)

(assert (=> b!1440220 (=> (not res!971945) (not e!812457))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440220 (= res!971945 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47814 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47814 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47814 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440221 () Bool)

(declare-fun res!971944 () Bool)

(assert (=> b!1440221 (=> (not res!971944) (not e!812457))))

(assert (=> b!1440221 (= res!971944 (and (= (size!47814 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47814 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47814 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440222 () Bool)

(declare-fun res!971946 () Bool)

(assert (=> b!1440222 (=> (not res!971946) (not e!812457))))

(declare-datatypes ((List!33751 0))(
  ( (Nil!33748) (Cons!33747 (h!35105 (_ BitVec 64)) (t!48437 List!33751)) )
))
(declare-fun arrayNoDuplicates!0 (array!97954 (_ BitVec 32) List!33751) Bool)

(assert (=> b!1440222 (= res!971946 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33748))))

(declare-fun lt!633144 () (_ BitVec 32))

(declare-fun e!812456 () Bool)

(declare-fun b!1440223 () Bool)

(assert (=> b!1440223 (= e!812456 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!633144 #b00000000000000000000000000000000) (bvsge lt!633144 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun b!1440224 () Bool)

(declare-fun res!971947 () Bool)

(assert (=> b!1440224 (=> (not res!971947) (not e!812457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440224 (= res!971947 (validKeyInArray!0 (select (arr!47263 a!2862) i!1006)))))

(declare-fun b!1440225 () Bool)

(assert (=> b!1440225 (= e!812454 e!812456)))

(declare-fun res!971942 () Bool)

(assert (=> b!1440225 (=> (not res!971942) (not e!812456))))

(assert (=> b!1440225 (= res!971942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!633144 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)) mask!2687) (Intermediate!11412 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1440225 (= lt!633144 (toIndex!0 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1440226 () Bool)

(declare-fun res!971948 () Bool)

(assert (=> b!1440226 (=> (not res!971948) (not e!812457))))

(assert (=> b!1440226 (= res!971948 (validKeyInArray!0 (select (arr!47263 a!2862) j!93)))))

(assert (= (and start!124572 res!971950) b!1440221))

(assert (= (and b!1440221 res!971944) b!1440224))

(assert (= (and b!1440224 res!971947) b!1440226))

(assert (= (and b!1440226 res!971948) b!1440218))

(assert (= (and b!1440218 res!971949) b!1440222))

(assert (= (and b!1440222 res!971946) b!1440220))

(assert (= (and b!1440220 res!971945) b!1440217))

(assert (= (and b!1440217 res!971951) b!1440219))

(assert (= (and b!1440219 res!971943) b!1440225))

(assert (= (and b!1440225 res!971942) b!1440223))

(declare-fun m!1329463 () Bool)

(assert (=> b!1440220 m!1329463))

(declare-fun m!1329465 () Bool)

(assert (=> b!1440220 m!1329465))

(declare-fun m!1329467 () Bool)

(assert (=> b!1440222 m!1329467))

(declare-fun m!1329469 () Bool)

(assert (=> b!1440217 m!1329469))

(assert (=> b!1440217 m!1329469))

(declare-fun m!1329471 () Bool)

(assert (=> b!1440217 m!1329471))

(assert (=> b!1440217 m!1329471))

(assert (=> b!1440217 m!1329469))

(declare-fun m!1329473 () Bool)

(assert (=> b!1440217 m!1329473))

(declare-fun m!1329475 () Bool)

(assert (=> b!1440224 m!1329475))

(assert (=> b!1440224 m!1329475))

(declare-fun m!1329477 () Bool)

(assert (=> b!1440224 m!1329477))

(declare-fun m!1329479 () Bool)

(assert (=> start!124572 m!1329479))

(declare-fun m!1329481 () Bool)

(assert (=> start!124572 m!1329481))

(assert (=> b!1440219 m!1329469))

(assert (=> b!1440219 m!1329469))

(declare-fun m!1329483 () Bool)

(assert (=> b!1440219 m!1329483))

(declare-fun m!1329485 () Bool)

(assert (=> b!1440218 m!1329485))

(assert (=> b!1440225 m!1329463))

(declare-fun m!1329487 () Bool)

(assert (=> b!1440225 m!1329487))

(assert (=> b!1440225 m!1329487))

(declare-fun m!1329489 () Bool)

(assert (=> b!1440225 m!1329489))

(assert (=> b!1440225 m!1329487))

(declare-fun m!1329491 () Bool)

(assert (=> b!1440225 m!1329491))

(assert (=> b!1440226 m!1329469))

(assert (=> b!1440226 m!1329469))

(declare-fun m!1329493 () Bool)

(assert (=> b!1440226 m!1329493))

(check-sat (not b!1440219) (not b!1440222) (not b!1440224) (not b!1440225) (not b!1440226) (not start!124572) (not b!1440217) (not b!1440218))
(check-sat)
(get-model)

(declare-fun b!1440297 () Bool)

(declare-fun e!812492 () Bool)

(declare-fun e!812491 () Bool)

(assert (=> b!1440297 (= e!812492 e!812491)))

(declare-fun res!972020 () Bool)

(assert (=> b!1440297 (=> (not res!972020) (not e!812491))))

(declare-fun e!812490 () Bool)

(assert (=> b!1440297 (= res!972020 (not e!812490))))

(declare-fun res!972018 () Bool)

(assert (=> b!1440297 (=> (not res!972018) (not e!812490))))

(assert (=> b!1440297 (= res!972018 (validKeyInArray!0 (select (arr!47263 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1440298 () Bool)

(declare-fun e!812493 () Bool)

(assert (=> b!1440298 (= e!812491 e!812493)))

(declare-fun c!133657 () Bool)

(assert (=> b!1440298 (= c!133657 (validKeyInArray!0 (select (arr!47263 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1440299 () Bool)

(declare-fun call!67752 () Bool)

(assert (=> b!1440299 (= e!812493 call!67752)))

(declare-fun b!1440300 () Bool)

(declare-fun contains!9937 (List!33751 (_ BitVec 64)) Bool)

(assert (=> b!1440300 (= e!812490 (contains!9937 Nil!33748 (select (arr!47263 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1440301 () Bool)

(assert (=> b!1440301 (= e!812493 call!67752)))

(declare-fun d!155223 () Bool)

(declare-fun res!972019 () Bool)

(assert (=> d!155223 (=> res!972019 e!812492)))

(assert (=> d!155223 (= res!972019 (bvsge #b00000000000000000000000000000000 (size!47814 a!2862)))))

(assert (=> d!155223 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33748) e!812492)))

(declare-fun bm!67749 () Bool)

(assert (=> bm!67749 (= call!67752 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133657 (Cons!33747 (select (arr!47263 a!2862) #b00000000000000000000000000000000) Nil!33748) Nil!33748)))))

(assert (= (and d!155223 (not res!972019)) b!1440297))

(assert (= (and b!1440297 res!972018) b!1440300))

(assert (= (and b!1440297 res!972020) b!1440298))

(assert (= (and b!1440298 c!133657) b!1440301))

(assert (= (and b!1440298 (not c!133657)) b!1440299))

(assert (= (or b!1440301 b!1440299) bm!67749))

(declare-fun m!1329559 () Bool)

(assert (=> b!1440297 m!1329559))

(assert (=> b!1440297 m!1329559))

(declare-fun m!1329561 () Bool)

(assert (=> b!1440297 m!1329561))

(assert (=> b!1440298 m!1329559))

(assert (=> b!1440298 m!1329559))

(assert (=> b!1440298 m!1329561))

(assert (=> b!1440300 m!1329559))

(assert (=> b!1440300 m!1329559))

(declare-fun m!1329563 () Bool)

(assert (=> b!1440300 m!1329563))

(assert (=> bm!67749 m!1329559))

(declare-fun m!1329565 () Bool)

(assert (=> bm!67749 m!1329565))

(assert (=> b!1440222 d!155223))

(declare-fun b!1440320 () Bool)

(declare-fun lt!633163 () SeekEntryResult!11412)

(assert (=> b!1440320 (and (bvsge (index!48042 lt!633163) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633163) (size!47814 a!2862)))))

(declare-fun e!812506 () Bool)

(assert (=> b!1440320 (= e!812506 (= (select (arr!47263 a!2862) (index!48042 lt!633163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1440321 () Bool)

(assert (=> b!1440321 (and (bvsge (index!48042 lt!633163) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633163) (size!47814 a!2862)))))

(declare-fun res!972027 () Bool)

(assert (=> b!1440321 (= res!972027 (= (select (arr!47263 a!2862) (index!48042 lt!633163)) (select (arr!47263 a!2862) j!93)))))

(assert (=> b!1440321 (=> res!972027 e!812506)))

(declare-fun e!812505 () Bool)

(assert (=> b!1440321 (= e!812505 e!812506)))

(declare-fun b!1440322 () Bool)

(declare-fun e!812507 () Bool)

(assert (=> b!1440322 (= e!812507 e!812505)))

(declare-fun res!972028 () Bool)

(get-info :version)

(assert (=> b!1440322 (= res!972028 (and ((_ is Intermediate!11412) lt!633163) (not (undefined!12224 lt!633163)) (bvslt (x!129951 lt!633163) #b01111111111111111111111111111110) (bvsge (x!129951 lt!633163) #b00000000000000000000000000000000) (bvsge (x!129951 lt!633163) #b00000000000000000000000000000000)))))

(assert (=> b!1440322 (=> (not res!972028) (not e!812505))))

(declare-fun b!1440323 () Bool)

(assert (=> b!1440323 (= e!812507 (bvsge (x!129951 lt!633163) #b01111111111111111111111111111110))))

(declare-fun e!812508 () SeekEntryResult!11412)

(declare-fun b!1440324 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440324 (= e!812508 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1440325 () Bool)

(assert (=> b!1440325 (and (bvsge (index!48042 lt!633163) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633163) (size!47814 a!2862)))))

(declare-fun res!972029 () Bool)

(assert (=> b!1440325 (= res!972029 (= (select (arr!47263 a!2862) (index!48042 lt!633163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440325 (=> res!972029 e!812506)))

(declare-fun b!1440326 () Bool)

(assert (=> b!1440326 (= e!812508 (Intermediate!11412 false (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155225 () Bool)

(assert (=> d!155225 e!812507))

(declare-fun c!133666 () Bool)

(assert (=> d!155225 (= c!133666 (and ((_ is Intermediate!11412) lt!633163) (undefined!12224 lt!633163)))))

(declare-fun e!812504 () SeekEntryResult!11412)

(assert (=> d!155225 (= lt!633163 e!812504)))

(declare-fun c!133664 () Bool)

(assert (=> d!155225 (= c!133664 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!633162 () (_ BitVec 64))

(assert (=> d!155225 (= lt!633162 (select (arr!47263 a!2862) (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687)))))

(assert (=> d!155225 (validMask!0 mask!2687)))

(assert (=> d!155225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633163)))

(declare-fun b!1440327 () Bool)

(assert (=> b!1440327 (= e!812504 e!812508)))

(declare-fun c!133665 () Bool)

(assert (=> b!1440327 (= c!133665 (or (= lt!633162 (select (arr!47263 a!2862) j!93)) (= (bvadd lt!633162 lt!633162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440328 () Bool)

(assert (=> b!1440328 (= e!812504 (Intermediate!11412 true (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155225 c!133664) b!1440328))

(assert (= (and d!155225 (not c!133664)) b!1440327))

(assert (= (and b!1440327 c!133665) b!1440326))

(assert (= (and b!1440327 (not c!133665)) b!1440324))

(assert (= (and d!155225 c!133666) b!1440323))

(assert (= (and d!155225 (not c!133666)) b!1440322))

(assert (= (and b!1440322 res!972028) b!1440321))

(assert (= (and b!1440321 (not res!972027)) b!1440325))

(assert (= (and b!1440325 (not res!972029)) b!1440320))

(declare-fun m!1329567 () Bool)

(assert (=> b!1440320 m!1329567))

(assert (=> b!1440324 m!1329471))

(declare-fun m!1329569 () Bool)

(assert (=> b!1440324 m!1329569))

(assert (=> b!1440324 m!1329569))

(assert (=> b!1440324 m!1329469))

(declare-fun m!1329571 () Bool)

(assert (=> b!1440324 m!1329571))

(assert (=> d!155225 m!1329471))

(declare-fun m!1329573 () Bool)

(assert (=> d!155225 m!1329573))

(assert (=> d!155225 m!1329479))

(assert (=> b!1440321 m!1329567))

(assert (=> b!1440325 m!1329567))

(assert (=> b!1440217 d!155225))

(declare-fun d!155227 () Bool)

(declare-fun lt!633169 () (_ BitVec 32))

(declare-fun lt!633168 () (_ BitVec 32))

(assert (=> d!155227 (= lt!633169 (bvmul (bvxor lt!633168 (bvlshr lt!633168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155227 (= lt!633168 ((_ extract 31 0) (bvand (bvxor (select (arr!47263 a!2862) j!93) (bvlshr (select (arr!47263 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155227 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!972030 (let ((h!35108 ((_ extract 31 0) (bvand (bvxor (select (arr!47263 a!2862) j!93) (bvlshr (select (arr!47263 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129955 (bvmul (bvxor h!35108 (bvlshr h!35108 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129955 (bvlshr x!129955 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!972030 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!972030 #b00000000000000000000000000000000))))))

(assert (=> d!155227 (= (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (bvand (bvxor lt!633169 (bvlshr lt!633169 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1440217 d!155227))

(declare-fun bm!67755 () Bool)

(declare-fun call!67758 () Bool)

(assert (=> bm!67755 (= call!67758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1440352 () Bool)

(declare-fun e!812529 () Bool)

(declare-fun e!812528 () Bool)

(assert (=> b!1440352 (= e!812529 e!812528)))

(declare-fun lt!633176 () (_ BitVec 64))

(assert (=> b!1440352 (= lt!633176 (select (arr!47263 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48503 0))(
  ( (Unit!48504) )
))
(declare-fun lt!633178 () Unit!48503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97954 (_ BitVec 64) (_ BitVec 32)) Unit!48503)

(assert (=> b!1440352 (= lt!633178 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!633176 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1440352 (arrayContainsKey!0 a!2862 lt!633176 #b00000000000000000000000000000000)))

(declare-fun lt!633177 () Unit!48503)

(assert (=> b!1440352 (= lt!633177 lt!633178)))

(declare-fun res!972044 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11412)

(assert (=> b!1440352 (= res!972044 (= (seekEntryOrOpen!0 (select (arr!47263 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11412 #b00000000000000000000000000000000)))))

(assert (=> b!1440352 (=> (not res!972044) (not e!812528))))

(declare-fun b!1440353 () Bool)

(declare-fun e!812527 () Bool)

(assert (=> b!1440353 (= e!812527 e!812529)))

(declare-fun c!133672 () Bool)

(assert (=> b!1440353 (= c!133672 (validKeyInArray!0 (select (arr!47263 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1440354 () Bool)

(assert (=> b!1440354 (= e!812528 call!67758)))

(declare-fun d!155231 () Bool)

(declare-fun res!972045 () Bool)

(assert (=> d!155231 (=> res!972045 e!812527)))

(assert (=> d!155231 (= res!972045 (bvsge #b00000000000000000000000000000000 (size!47814 a!2862)))))

(assert (=> d!155231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!812527)))

(declare-fun b!1440355 () Bool)

(assert (=> b!1440355 (= e!812529 call!67758)))

(assert (= (and d!155231 (not res!972045)) b!1440353))

(assert (= (and b!1440353 c!133672) b!1440352))

(assert (= (and b!1440353 (not c!133672)) b!1440355))

(assert (= (and b!1440352 res!972044) b!1440354))

(assert (= (or b!1440354 b!1440355) bm!67755))

(declare-fun m!1329583 () Bool)

(assert (=> bm!67755 m!1329583))

(assert (=> b!1440352 m!1329559))

(declare-fun m!1329585 () Bool)

(assert (=> b!1440352 m!1329585))

(declare-fun m!1329587 () Bool)

(assert (=> b!1440352 m!1329587))

(assert (=> b!1440352 m!1329559))

(declare-fun m!1329589 () Bool)

(assert (=> b!1440352 m!1329589))

(assert (=> b!1440353 m!1329559))

(assert (=> b!1440353 m!1329559))

(assert (=> b!1440353 m!1329561))

(assert (=> b!1440218 d!155231))

(declare-fun d!155237 () Bool)

(assert (=> d!155237 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124572 d!155237))

(declare-fun d!155239 () Bool)

(assert (=> d!155239 (= (array_inv!36544 a!2862) (bvsge (size!47814 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124572 d!155239))

(declare-fun b!1440356 () Bool)

(declare-fun lt!633180 () SeekEntryResult!11412)

(assert (=> b!1440356 (and (bvsge (index!48042 lt!633180) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633180) (size!47814 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)))))))

(declare-fun e!812532 () Bool)

(assert (=> b!1440356 (= e!812532 (= (select (arr!47263 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862))) (index!48042 lt!633180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1440357 () Bool)

(assert (=> b!1440357 (and (bvsge (index!48042 lt!633180) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633180) (size!47814 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)))))))

(declare-fun res!972046 () Bool)

(assert (=> b!1440357 (= res!972046 (= (select (arr!47263 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862))) (index!48042 lt!633180)) (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(assert (=> b!1440357 (=> res!972046 e!812532)))

(declare-fun e!812531 () Bool)

(assert (=> b!1440357 (= e!812531 e!812532)))

(declare-fun b!1440358 () Bool)

(declare-fun e!812533 () Bool)

(assert (=> b!1440358 (= e!812533 e!812531)))

(declare-fun res!972047 () Bool)

(assert (=> b!1440358 (= res!972047 (and ((_ is Intermediate!11412) lt!633180) (not (undefined!12224 lt!633180)) (bvslt (x!129951 lt!633180) #b01111111111111111111111111111110) (bvsge (x!129951 lt!633180) #b00000000000000000000000000000000) (bvsge (x!129951 lt!633180) #b00000000000000000000000000000000)))))

(assert (=> b!1440358 (=> (not res!972047) (not e!812531))))

(declare-fun b!1440359 () Bool)

(assert (=> b!1440359 (= e!812533 (bvsge (x!129951 lt!633180) #b01111111111111111111111111111110))))

(declare-fun b!1440360 () Bool)

(declare-fun e!812534 () SeekEntryResult!11412)

(assert (=> b!1440360 (= e!812534 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!633144 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)) mask!2687))))

(declare-fun b!1440361 () Bool)

(assert (=> b!1440361 (and (bvsge (index!48042 lt!633180) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633180) (size!47814 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)))))))

(declare-fun res!972048 () Bool)

(assert (=> b!1440361 (= res!972048 (= (select (arr!47263 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862))) (index!48042 lt!633180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440361 (=> res!972048 e!812532)))

(declare-fun b!1440362 () Bool)

(assert (=> b!1440362 (= e!812534 (Intermediate!11412 false lt!633144 #b00000000000000000000000000000000))))

(declare-fun d!155241 () Bool)

(assert (=> d!155241 e!812533))

(declare-fun c!133675 () Bool)

(assert (=> d!155241 (= c!133675 (and ((_ is Intermediate!11412) lt!633180) (undefined!12224 lt!633180)))))

(declare-fun e!812530 () SeekEntryResult!11412)

(assert (=> d!155241 (= lt!633180 e!812530)))

(declare-fun c!133673 () Bool)

(assert (=> d!155241 (= c!133673 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!633179 () (_ BitVec 64))

(assert (=> d!155241 (= lt!633179 (select (arr!47263 (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862))) lt!633144))))

(assert (=> d!155241 (validMask!0 mask!2687)))

(assert (=> d!155241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!633144 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97955 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)) mask!2687) lt!633180)))

(declare-fun b!1440363 () Bool)

(assert (=> b!1440363 (= e!812530 e!812534)))

(declare-fun c!133674 () Bool)

(assert (=> b!1440363 (= c!133674 (or (= lt!633179 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!633179 lt!633179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440364 () Bool)

(assert (=> b!1440364 (= e!812530 (Intermediate!11412 true lt!633144 #b00000000000000000000000000000000))))

(assert (= (and d!155241 c!133673) b!1440364))

(assert (= (and d!155241 (not c!133673)) b!1440363))

(assert (= (and b!1440363 c!133674) b!1440362))

(assert (= (and b!1440363 (not c!133674)) b!1440360))

(assert (= (and d!155241 c!133675) b!1440359))

(assert (= (and d!155241 (not c!133675)) b!1440358))

(assert (= (and b!1440358 res!972047) b!1440357))

(assert (= (and b!1440357 (not res!972046)) b!1440361))

(assert (= (and b!1440361 (not res!972048)) b!1440356))

(declare-fun m!1329591 () Bool)

(assert (=> b!1440356 m!1329591))

(declare-fun m!1329593 () Bool)

(assert (=> b!1440360 m!1329593))

(assert (=> b!1440360 m!1329593))

(assert (=> b!1440360 m!1329487))

(declare-fun m!1329595 () Bool)

(assert (=> b!1440360 m!1329595))

(declare-fun m!1329597 () Bool)

(assert (=> d!155241 m!1329597))

(assert (=> d!155241 m!1329479))

(assert (=> b!1440357 m!1329591))

(assert (=> b!1440361 m!1329591))

(assert (=> b!1440225 d!155241))

(declare-fun d!155243 () Bool)

(declare-fun lt!633186 () (_ BitVec 32))

(declare-fun lt!633185 () (_ BitVec 32))

(assert (=> d!155243 (= lt!633186 (bvmul (bvxor lt!633185 (bvlshr lt!633185 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155243 (= lt!633185 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155243 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!972030 (let ((h!35108 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129955 (bvmul (bvxor h!35108 (bvlshr h!35108 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129955 (bvlshr x!129955 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!972030 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!972030 #b00000000000000000000000000000000))))))

(assert (=> d!155243 (= (toIndex!0 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!633186 (bvlshr lt!633186 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1440225 d!155243))

(declare-fun d!155245 () Bool)

(assert (=> d!155245 (= (validKeyInArray!0 (select (arr!47263 a!2862) i!1006)) (and (not (= (select (arr!47263 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47263 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1440224 d!155245))

(declare-fun b!1440373 () Bool)

(declare-fun lt!633188 () SeekEntryResult!11412)

(assert (=> b!1440373 (and (bvsge (index!48042 lt!633188) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633188) (size!47814 a!2862)))))

(declare-fun e!812541 () Bool)

(assert (=> b!1440373 (= e!812541 (= (select (arr!47263 a!2862) (index!48042 lt!633188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1440374 () Bool)

(assert (=> b!1440374 (and (bvsge (index!48042 lt!633188) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633188) (size!47814 a!2862)))))

(declare-fun res!972049 () Bool)

(assert (=> b!1440374 (= res!972049 (= (select (arr!47263 a!2862) (index!48042 lt!633188)) (select (arr!47263 a!2862) j!93)))))

(assert (=> b!1440374 (=> res!972049 e!812541)))

(declare-fun e!812540 () Bool)

(assert (=> b!1440374 (= e!812540 e!812541)))

(declare-fun b!1440375 () Bool)

(declare-fun e!812542 () Bool)

(assert (=> b!1440375 (= e!812542 e!812540)))

(declare-fun res!972050 () Bool)

(assert (=> b!1440375 (= res!972050 (and ((_ is Intermediate!11412) lt!633188) (not (undefined!12224 lt!633188)) (bvslt (x!129951 lt!633188) #b01111111111111111111111111111110) (bvsge (x!129951 lt!633188) #b00000000000000000000000000000000) (bvsge (x!129951 lt!633188) x!665)))))

(assert (=> b!1440375 (=> (not res!972050) (not e!812540))))

(declare-fun b!1440376 () Bool)

(assert (=> b!1440376 (= e!812542 (bvsge (x!129951 lt!633188) #b01111111111111111111111111111110))))

(declare-fun e!812543 () SeekEntryResult!11412)

(declare-fun b!1440377 () Bool)

(assert (=> b!1440377 (= e!812543 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1440378 () Bool)

(assert (=> b!1440378 (and (bvsge (index!48042 lt!633188) #b00000000000000000000000000000000) (bvslt (index!48042 lt!633188) (size!47814 a!2862)))))

(declare-fun res!972051 () Bool)

(assert (=> b!1440378 (= res!972051 (= (select (arr!47263 a!2862) (index!48042 lt!633188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440378 (=> res!972051 e!812541)))

(declare-fun b!1440379 () Bool)

(assert (=> b!1440379 (= e!812543 (Intermediate!11412 false index!646 x!665))))

(declare-fun d!155247 () Bool)

(assert (=> d!155247 e!812542))

(declare-fun c!133682 () Bool)

(assert (=> d!155247 (= c!133682 (and ((_ is Intermediate!11412) lt!633188) (undefined!12224 lt!633188)))))

(declare-fun e!812539 () SeekEntryResult!11412)

(assert (=> d!155247 (= lt!633188 e!812539)))

(declare-fun c!133680 () Bool)

(assert (=> d!155247 (= c!133680 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!633187 () (_ BitVec 64))

(assert (=> d!155247 (= lt!633187 (select (arr!47263 a!2862) index!646))))

(assert (=> d!155247 (validMask!0 mask!2687)))

(assert (=> d!155247 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633188)))

(declare-fun b!1440380 () Bool)

(assert (=> b!1440380 (= e!812539 e!812543)))

(declare-fun c!133681 () Bool)

(assert (=> b!1440380 (= c!133681 (or (= lt!633187 (select (arr!47263 a!2862) j!93)) (= (bvadd lt!633187 lt!633187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440381 () Bool)

(assert (=> b!1440381 (= e!812539 (Intermediate!11412 true index!646 x!665))))

(assert (= (and d!155247 c!133680) b!1440381))

(assert (= (and d!155247 (not c!133680)) b!1440380))

(assert (= (and b!1440380 c!133681) b!1440379))

(assert (= (and b!1440380 (not c!133681)) b!1440377))

(assert (= (and d!155247 c!133682) b!1440376))

(assert (= (and d!155247 (not c!133682)) b!1440375))

(assert (= (and b!1440375 res!972050) b!1440374))

(assert (= (and b!1440374 (not res!972049)) b!1440378))

(assert (= (and b!1440378 (not res!972051)) b!1440373))

(declare-fun m!1329599 () Bool)

(assert (=> b!1440373 m!1329599))

(declare-fun m!1329601 () Bool)

(assert (=> b!1440377 m!1329601))

(assert (=> b!1440377 m!1329601))

(assert (=> b!1440377 m!1329469))

(declare-fun m!1329603 () Bool)

(assert (=> b!1440377 m!1329603))

(declare-fun m!1329605 () Bool)

(assert (=> d!155247 m!1329605))

(assert (=> d!155247 m!1329479))

(assert (=> b!1440374 m!1329599))

(assert (=> b!1440378 m!1329599))

(assert (=> b!1440219 d!155247))

(declare-fun d!155251 () Bool)

(assert (=> d!155251 (= (validKeyInArray!0 (select (arr!47263 a!2862) j!93)) (and (not (= (select (arr!47263 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47263 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1440226 d!155251))

(check-sat (not b!1440297) (not d!155247) (not b!1440377) (not bm!67749) (not b!1440360) (not b!1440352) (not bm!67755) (not b!1440298) (not b!1440353) (not d!155225) (not b!1440300) (not d!155241) (not b!1440324))
(check-sat)
