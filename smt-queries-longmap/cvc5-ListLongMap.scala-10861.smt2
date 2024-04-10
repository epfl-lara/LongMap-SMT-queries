; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127338 () Bool)

(assert start!127338)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12404 0))(
  ( (MissingZero!12404 (index!52008 (_ BitVec 32))) (Found!12404 (index!52009 (_ BitVec 32))) (Intermediate!12404 (undefined!13216 Bool) (index!52010 (_ BitVec 32)) (x!133638 (_ BitVec 32))) (Undefined!12404) (MissingVacant!12404 (index!52011 (_ BitVec 32))) )
))
(declare-fun lt!652045 () SeekEntryResult!12404)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!838072 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!652042 () (_ BitVec 64))

(declare-datatypes ((array!99800 0))(
  ( (array!99801 (arr!48164 (Array (_ BitVec 32) (_ BitVec 64))) (size!48714 (_ BitVec 32))) )
))
(declare-fun lt!652047 () array!99800)

(declare-fun b!1496264 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99800 (_ BitVec 32)) SeekEntryResult!12404)

(assert (=> b!1496264 (= e!838072 (= lt!652045 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652042 lt!652047 mask!2687)))))

(declare-fun b!1496265 () Bool)

(declare-fun res!1017640 () Bool)

(declare-fun e!838077 () Bool)

(assert (=> b!1496265 (=> (not res!1017640) (not e!838077))))

(declare-fun a!2862 () array!99800)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99800 (_ BitVec 32)) Bool)

(assert (=> b!1496265 (= res!1017640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496266 () Bool)

(declare-fun res!1017644 () Bool)

(declare-fun e!838076 () Bool)

(assert (=> b!1496266 (=> (not res!1017644) (not e!838076))))

(declare-fun lt!652048 () SeekEntryResult!12404)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496266 (= res!1017644 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48164 a!2862) j!93) a!2862 mask!2687) lt!652048))))

(declare-fun b!1496267 () Bool)

(declare-fun res!1017647 () Bool)

(assert (=> b!1496267 (=> (not res!1017647) (not e!838077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496267 (= res!1017647 (validKeyInArray!0 (select (arr!48164 a!2862) j!93)))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1496268 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99800 (_ BitVec 32)) SeekEntryResult!12404)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99800 (_ BitVec 32)) SeekEntryResult!12404)

(assert (=> b!1496268 (= e!838072 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652042 lt!652047 mask!2687) (seekEntryOrOpen!0 lt!652042 lt!652047 mask!2687)))))

(declare-fun b!1496269 () Bool)

(declare-fun e!838070 () Bool)

(assert (=> b!1496269 (= e!838070 e!838076)))

(declare-fun res!1017655 () Bool)

(assert (=> b!1496269 (=> (not res!1017655) (not e!838076))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496269 (= res!1017655 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48164 a!2862) j!93) mask!2687) (select (arr!48164 a!2862) j!93) a!2862 mask!2687) lt!652048))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496269 (= lt!652048 (Intermediate!12404 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496270 () Bool)

(assert (=> b!1496270 (= e!838077 e!838070)))

(declare-fun res!1017653 () Bool)

(assert (=> b!1496270 (=> (not res!1017653) (not e!838070))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496270 (= res!1017653 (= (select (store (arr!48164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496270 (= lt!652047 (array!99801 (store (arr!48164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48714 a!2862)))))

(declare-fun b!1496271 () Bool)

(declare-fun e!838078 () Bool)

(declare-fun e!838071 () Bool)

(assert (=> b!1496271 (= e!838078 e!838071)))

(declare-fun res!1017639 () Bool)

(assert (=> b!1496271 (=> res!1017639 e!838071)))

(declare-fun lt!652044 () (_ BitVec 32))

(assert (=> b!1496271 (= res!1017639 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652044 #b00000000000000000000000000000000) (bvsge lt!652044 (size!48714 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496271 (= lt!652044 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496272 () Bool)

(declare-fun res!1017641 () Bool)

(declare-fun e!838075 () Bool)

(assert (=> b!1496272 (=> (not res!1017641) (not e!838075))))

(assert (=> b!1496272 (= res!1017641 e!838072)))

(declare-fun c!138847 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496272 (= c!138847 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496273 () Bool)

(declare-fun res!1017649 () Bool)

(declare-fun e!838074 () Bool)

(assert (=> b!1496273 (=> (not res!1017649) (not e!838074))))

(assert (=> b!1496273 (= res!1017649 (= (seekEntryOrOpen!0 (select (arr!48164 a!2862) j!93) a!2862 mask!2687) (Found!12404 j!93)))))

(declare-fun b!1496274 () Bool)

(declare-fun res!1017648 () Bool)

(assert (=> b!1496274 (=> (not res!1017648) (not e!838075))))

(assert (=> b!1496274 (= res!1017648 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496275 () Bool)

(assert (=> b!1496275 (= e!838071 true)))

(declare-fun lt!652046 () Bool)

(declare-fun e!838073 () Bool)

(assert (=> b!1496275 (= lt!652046 e!838073)))

(declare-fun c!138848 () Bool)

(assert (=> b!1496275 (= c!138848 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496276 () Bool)

(declare-fun res!1017645 () Bool)

(assert (=> b!1496276 (=> (not res!1017645) (not e!838077))))

(assert (=> b!1496276 (= res!1017645 (and (= (size!48714 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48714 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48714 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496277 () Bool)

(assert (=> b!1496277 (= e!838073 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652044 intermediateAfterIndex!19 lt!652042 lt!652047 mask!2687) (seekEntryOrOpen!0 lt!652042 lt!652047 mask!2687))))))

(declare-fun b!1496278 () Bool)

(declare-fun res!1017643 () Bool)

(assert (=> b!1496278 (=> (not res!1017643) (not e!838077))))

(assert (=> b!1496278 (= res!1017643 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48714 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48714 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48714 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496279 () Bool)

(declare-fun res!1017651 () Bool)

(assert (=> b!1496279 (=> (not res!1017651) (not e!838077))))

(declare-datatypes ((List!34665 0))(
  ( (Nil!34662) (Cons!34661 (h!36058 (_ BitVec 64)) (t!49359 List!34665)) )
))
(declare-fun arrayNoDuplicates!0 (array!99800 (_ BitVec 32) List!34665) Bool)

(assert (=> b!1496279 (= res!1017651 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34662))))

(declare-fun b!1496280 () Bool)

(assert (=> b!1496280 (= e!838075 (not e!838078))))

(declare-fun res!1017652 () Bool)

(assert (=> b!1496280 (=> res!1017652 e!838078)))

(assert (=> b!1496280 (= res!1017652 (or (and (= (select (arr!48164 a!2862) index!646) (select (store (arr!48164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48164 a!2862) index!646) (select (arr!48164 a!2862) j!93))) (= (select (arr!48164 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496280 e!838074))

(declare-fun res!1017638 () Bool)

(assert (=> b!1496280 (=> (not res!1017638) (not e!838074))))

(assert (=> b!1496280 (= res!1017638 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50148 0))(
  ( (Unit!50149) )
))
(declare-fun lt!652043 () Unit!50148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50148)

(assert (=> b!1496280 (= lt!652043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496281 () Bool)

(assert (=> b!1496281 (= e!838073 (not (= lt!652045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652044 lt!652042 lt!652047 mask!2687))))))

(declare-fun b!1496282 () Bool)

(declare-fun res!1017654 () Bool)

(assert (=> b!1496282 (=> res!1017654 e!838071)))

(assert (=> b!1496282 (= res!1017654 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652044 (select (arr!48164 a!2862) j!93) a!2862 mask!2687) lt!652048)))))

(declare-fun b!1496283 () Bool)

(assert (=> b!1496283 (= e!838074 (or (= (select (arr!48164 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48164 a!2862) intermediateBeforeIndex!19) (select (arr!48164 a!2862) j!93))))))

(declare-fun res!1017646 () Bool)

(assert (=> start!127338 (=> (not res!1017646) (not e!838077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127338 (= res!1017646 (validMask!0 mask!2687))))

(assert (=> start!127338 e!838077))

(assert (=> start!127338 true))

(declare-fun array_inv!37192 (array!99800) Bool)

(assert (=> start!127338 (array_inv!37192 a!2862)))

(declare-fun b!1496284 () Bool)

(declare-fun res!1017650 () Bool)

(assert (=> b!1496284 (=> (not res!1017650) (not e!838077))))

(assert (=> b!1496284 (= res!1017650 (validKeyInArray!0 (select (arr!48164 a!2862) i!1006)))))

(declare-fun b!1496285 () Bool)

(assert (=> b!1496285 (= e!838076 e!838075)))

(declare-fun res!1017642 () Bool)

(assert (=> b!1496285 (=> (not res!1017642) (not e!838075))))

(assert (=> b!1496285 (= res!1017642 (= lt!652045 (Intermediate!12404 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496285 (= lt!652045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652042 mask!2687) lt!652042 lt!652047 mask!2687))))

(assert (=> b!1496285 (= lt!652042 (select (store (arr!48164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!127338 res!1017646) b!1496276))

(assert (= (and b!1496276 res!1017645) b!1496284))

(assert (= (and b!1496284 res!1017650) b!1496267))

(assert (= (and b!1496267 res!1017647) b!1496265))

(assert (= (and b!1496265 res!1017640) b!1496279))

(assert (= (and b!1496279 res!1017651) b!1496278))

(assert (= (and b!1496278 res!1017643) b!1496270))

(assert (= (and b!1496270 res!1017653) b!1496269))

(assert (= (and b!1496269 res!1017655) b!1496266))

(assert (= (and b!1496266 res!1017644) b!1496285))

(assert (= (and b!1496285 res!1017642) b!1496272))

(assert (= (and b!1496272 c!138847) b!1496264))

(assert (= (and b!1496272 (not c!138847)) b!1496268))

(assert (= (and b!1496272 res!1017641) b!1496274))

(assert (= (and b!1496274 res!1017648) b!1496280))

(assert (= (and b!1496280 res!1017638) b!1496273))

(assert (= (and b!1496273 res!1017649) b!1496283))

(assert (= (and b!1496280 (not res!1017652)) b!1496271))

(assert (= (and b!1496271 (not res!1017639)) b!1496282))

(assert (= (and b!1496282 (not res!1017654)) b!1496275))

(assert (= (and b!1496275 c!138848) b!1496281))

(assert (= (and b!1496275 (not c!138848)) b!1496277))

(declare-fun m!1379467 () Bool)

(assert (=> b!1496284 m!1379467))

(assert (=> b!1496284 m!1379467))

(declare-fun m!1379469 () Bool)

(assert (=> b!1496284 m!1379469))

(declare-fun m!1379471 () Bool)

(assert (=> b!1496266 m!1379471))

(assert (=> b!1496266 m!1379471))

(declare-fun m!1379473 () Bool)

(assert (=> b!1496266 m!1379473))

(assert (=> b!1496273 m!1379471))

(assert (=> b!1496273 m!1379471))

(declare-fun m!1379475 () Bool)

(assert (=> b!1496273 m!1379475))

(assert (=> b!1496282 m!1379471))

(assert (=> b!1496282 m!1379471))

(declare-fun m!1379477 () Bool)

(assert (=> b!1496282 m!1379477))

(assert (=> b!1496267 m!1379471))

(assert (=> b!1496267 m!1379471))

(declare-fun m!1379479 () Bool)

(assert (=> b!1496267 m!1379479))

(declare-fun m!1379481 () Bool)

(assert (=> b!1496271 m!1379481))

(declare-fun m!1379483 () Bool)

(assert (=> b!1496264 m!1379483))

(assert (=> b!1496269 m!1379471))

(assert (=> b!1496269 m!1379471))

(declare-fun m!1379485 () Bool)

(assert (=> b!1496269 m!1379485))

(assert (=> b!1496269 m!1379485))

(assert (=> b!1496269 m!1379471))

(declare-fun m!1379487 () Bool)

(assert (=> b!1496269 m!1379487))

(declare-fun m!1379489 () Bool)

(assert (=> b!1496283 m!1379489))

(assert (=> b!1496283 m!1379471))

(declare-fun m!1379491 () Bool)

(assert (=> b!1496279 m!1379491))

(declare-fun m!1379493 () Bool)

(assert (=> b!1496270 m!1379493))

(declare-fun m!1379495 () Bool)

(assert (=> b!1496270 m!1379495))

(declare-fun m!1379497 () Bool)

(assert (=> b!1496265 m!1379497))

(declare-fun m!1379499 () Bool)

(assert (=> start!127338 m!1379499))

(declare-fun m!1379501 () Bool)

(assert (=> start!127338 m!1379501))

(declare-fun m!1379503 () Bool)

(assert (=> b!1496280 m!1379503))

(assert (=> b!1496280 m!1379493))

(declare-fun m!1379505 () Bool)

(assert (=> b!1496280 m!1379505))

(declare-fun m!1379507 () Bool)

(assert (=> b!1496280 m!1379507))

(declare-fun m!1379509 () Bool)

(assert (=> b!1496280 m!1379509))

(assert (=> b!1496280 m!1379471))

(declare-fun m!1379511 () Bool)

(assert (=> b!1496277 m!1379511))

(declare-fun m!1379513 () Bool)

(assert (=> b!1496277 m!1379513))

(declare-fun m!1379515 () Bool)

(assert (=> b!1496281 m!1379515))

(declare-fun m!1379517 () Bool)

(assert (=> b!1496285 m!1379517))

(assert (=> b!1496285 m!1379517))

(declare-fun m!1379519 () Bool)

(assert (=> b!1496285 m!1379519))

(assert (=> b!1496285 m!1379493))

(declare-fun m!1379521 () Bool)

(assert (=> b!1496285 m!1379521))

(declare-fun m!1379523 () Bool)

(assert (=> b!1496268 m!1379523))

(assert (=> b!1496268 m!1379513))

(push 1)

