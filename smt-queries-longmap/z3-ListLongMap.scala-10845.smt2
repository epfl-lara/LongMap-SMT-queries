; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127194 () Bool)

(assert start!127194)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!836740 () Bool)

(declare-fun lt!650949 () (_ BitVec 64))

(declare-datatypes ((array!99805 0))(
  ( (array!99806 (arr!48169 (Array (_ BitVec 32) (_ BitVec 64))) (size!48720 (_ BitVec 32))) )
))
(declare-fun lt!650948 () array!99805)

(declare-fun b!1493252 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12306 0))(
  ( (MissingZero!12306 (index!51616 (_ BitVec 32))) (Found!12306 (index!51617 (_ BitVec 32))) (Intermediate!12306 (undefined!13118 Bool) (index!51618 (_ BitVec 32)) (x!133387 (_ BitVec 32))) (Undefined!12306) (MissingVacant!12306 (index!51619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99805 (_ BitVec 32)) SeekEntryResult!12306)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99805 (_ BitVec 32)) SeekEntryResult!12306)

(assert (=> b!1493252 (= e!836740 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650949 lt!650948 mask!2687) (seekEntryOrOpen!0 lt!650949 lt!650948 mask!2687)))))

(declare-fun b!1493253 () Bool)

(declare-fun res!1015323 () Bool)

(declare-fun e!836737 () Bool)

(assert (=> b!1493253 (=> (not res!1015323) (not e!836737))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493253 (= res!1015323 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1015310 () Bool)

(declare-fun e!836739 () Bool)

(assert (=> start!127194 (=> (not res!1015310) (not e!836739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127194 (= res!1015310 (validMask!0 mask!2687))))

(assert (=> start!127194 e!836739))

(assert (=> start!127194 true))

(declare-fun a!2862 () array!99805)

(declare-fun array_inv!37450 (array!99805) Bool)

(assert (=> start!127194 (array_inv!37450 a!2862)))

(declare-fun b!1493254 () Bool)

(declare-fun e!836742 () Bool)

(declare-fun e!836736 () Bool)

(assert (=> b!1493254 (= e!836742 e!836736)))

(declare-fun res!1015311 () Bool)

(assert (=> b!1493254 (=> (not res!1015311) (not e!836736))))

(declare-fun lt!650953 () SeekEntryResult!12306)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99805 (_ BitVec 32)) SeekEntryResult!12306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493254 (= res!1015311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48169 a!2862) j!93) mask!2687) (select (arr!48169 a!2862) j!93) a!2862 mask!2687) lt!650953))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1493254 (= lt!650953 (Intermediate!12306 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493255 () Bool)

(declare-fun res!1015324 () Bool)

(assert (=> b!1493255 (=> (not res!1015324) (not e!836739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493255 (= res!1015324 (validKeyInArray!0 (select (arr!48169 a!2862) i!1006)))))

(declare-fun b!1493256 () Bool)

(declare-fun res!1015316 () Bool)

(declare-fun e!836741 () Bool)

(assert (=> b!1493256 (=> (not res!1015316) (not e!836741))))

(assert (=> b!1493256 (= res!1015316 (= (seekEntryOrOpen!0 (select (arr!48169 a!2862) j!93) a!2862 mask!2687) (Found!12306 j!93)))))

(declare-fun b!1493257 () Bool)

(declare-fun res!1015321 () Bool)

(assert (=> b!1493257 (=> (not res!1015321) (not e!836737))))

(assert (=> b!1493257 (= res!1015321 e!836740)))

(declare-fun c!138508 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493257 (= c!138508 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493258 () Bool)

(declare-fun res!1015315 () Bool)

(assert (=> b!1493258 (=> (not res!1015315) (not e!836739))))

(assert (=> b!1493258 (= res!1015315 (and (= (size!48720 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48720 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48720 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493259 () Bool)

(declare-fun res!1015317 () Bool)

(assert (=> b!1493259 (=> (not res!1015317) (not e!836739))))

(assert (=> b!1493259 (= res!1015317 (validKeyInArray!0 (select (arr!48169 a!2862) j!93)))))

(declare-fun b!1493260 () Bool)

(assert (=> b!1493260 (= e!836736 e!836737)))

(declare-fun res!1015314 () Bool)

(assert (=> b!1493260 (=> (not res!1015314) (not e!836737))))

(declare-fun lt!650952 () SeekEntryResult!12306)

(assert (=> b!1493260 (= res!1015314 (= lt!650952 (Intermediate!12306 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493260 (= lt!650952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650949 mask!2687) lt!650949 lt!650948 mask!2687))))

(assert (=> b!1493260 (= lt!650949 (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493261 () Bool)

(declare-fun res!1015320 () Bool)

(assert (=> b!1493261 (=> (not res!1015320) (not e!836736))))

(assert (=> b!1493261 (= res!1015320 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48169 a!2862) j!93) a!2862 mask!2687) lt!650953))))

(declare-fun b!1493262 () Bool)

(declare-fun e!836735 () Bool)

(assert (=> b!1493262 (= e!836735 true)))

(declare-fun lt!650951 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493262 (= lt!650951 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1493263 () Bool)

(declare-fun res!1015322 () Bool)

(assert (=> b!1493263 (=> (not res!1015322) (not e!836739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99805 (_ BitVec 32)) Bool)

(assert (=> b!1493263 (= res!1015322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493264 () Bool)

(declare-fun res!1015312 () Bool)

(assert (=> b!1493264 (=> (not res!1015312) (not e!836739))))

(declare-datatypes ((List!34657 0))(
  ( (Nil!34654) (Cons!34653 (h!36050 (_ BitVec 64)) (t!49343 List!34657)) )
))
(declare-fun arrayNoDuplicates!0 (array!99805 (_ BitVec 32) List!34657) Bool)

(assert (=> b!1493264 (= res!1015312 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34654))))

(declare-fun b!1493265 () Bool)

(assert (=> b!1493265 (= e!836739 e!836742)))

(declare-fun res!1015313 () Bool)

(assert (=> b!1493265 (=> (not res!1015313) (not e!836742))))

(assert (=> b!1493265 (= res!1015313 (= (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493265 (= lt!650948 (array!99806 (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48720 a!2862)))))

(declare-fun b!1493266 () Bool)

(assert (=> b!1493266 (= e!836740 (= lt!650952 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650949 lt!650948 mask!2687)))))

(declare-fun b!1493267 () Bool)

(assert (=> b!1493267 (= e!836741 (or (= (select (arr!48169 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48169 a!2862) intermediateBeforeIndex!19) (select (arr!48169 a!2862) j!93))))))

(declare-fun b!1493268 () Bool)

(assert (=> b!1493268 (= e!836737 (not e!836735))))

(declare-fun res!1015325 () Bool)

(assert (=> b!1493268 (=> res!1015325 e!836735)))

(assert (=> b!1493268 (= res!1015325 (or (and (= (select (arr!48169 a!2862) index!646) (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48169 a!2862) index!646) (select (arr!48169 a!2862) j!93))) (= (select (arr!48169 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493268 e!836741))

(declare-fun res!1015319 () Bool)

(assert (=> b!1493268 (=> (not res!1015319) (not e!836741))))

(assert (=> b!1493268 (= res!1015319 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49985 0))(
  ( (Unit!49986) )
))
(declare-fun lt!650950 () Unit!49985)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49985)

(assert (=> b!1493268 (= lt!650950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493269 () Bool)

(declare-fun res!1015318 () Bool)

(assert (=> b!1493269 (=> (not res!1015318) (not e!836739))))

(assert (=> b!1493269 (= res!1015318 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48720 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48720 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48720 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127194 res!1015310) b!1493258))

(assert (= (and b!1493258 res!1015315) b!1493255))

(assert (= (and b!1493255 res!1015324) b!1493259))

(assert (= (and b!1493259 res!1015317) b!1493263))

(assert (= (and b!1493263 res!1015322) b!1493264))

(assert (= (and b!1493264 res!1015312) b!1493269))

(assert (= (and b!1493269 res!1015318) b!1493265))

(assert (= (and b!1493265 res!1015313) b!1493254))

(assert (= (and b!1493254 res!1015311) b!1493261))

(assert (= (and b!1493261 res!1015320) b!1493260))

(assert (= (and b!1493260 res!1015314) b!1493257))

(assert (= (and b!1493257 c!138508) b!1493266))

(assert (= (and b!1493257 (not c!138508)) b!1493252))

(assert (= (and b!1493257 res!1015321) b!1493253))

(assert (= (and b!1493253 res!1015323) b!1493268))

(assert (= (and b!1493268 res!1015319) b!1493256))

(assert (= (and b!1493256 res!1015316) b!1493267))

(assert (= (and b!1493268 (not res!1015325)) b!1493262))

(declare-fun m!1377367 () Bool)

(assert (=> b!1493259 m!1377367))

(assert (=> b!1493259 m!1377367))

(declare-fun m!1377369 () Bool)

(assert (=> b!1493259 m!1377369))

(assert (=> b!1493256 m!1377367))

(assert (=> b!1493256 m!1377367))

(declare-fun m!1377371 () Bool)

(assert (=> b!1493256 m!1377371))

(declare-fun m!1377373 () Bool)

(assert (=> b!1493266 m!1377373))

(declare-fun m!1377375 () Bool)

(assert (=> start!127194 m!1377375))

(declare-fun m!1377377 () Bool)

(assert (=> start!127194 m!1377377))

(declare-fun m!1377379 () Bool)

(assert (=> b!1493268 m!1377379))

(declare-fun m!1377381 () Bool)

(assert (=> b!1493268 m!1377381))

(declare-fun m!1377383 () Bool)

(assert (=> b!1493268 m!1377383))

(declare-fun m!1377385 () Bool)

(assert (=> b!1493268 m!1377385))

(declare-fun m!1377387 () Bool)

(assert (=> b!1493268 m!1377387))

(assert (=> b!1493268 m!1377367))

(declare-fun m!1377389 () Bool)

(assert (=> b!1493263 m!1377389))

(assert (=> b!1493265 m!1377381))

(declare-fun m!1377391 () Bool)

(assert (=> b!1493265 m!1377391))

(declare-fun m!1377393 () Bool)

(assert (=> b!1493252 m!1377393))

(declare-fun m!1377395 () Bool)

(assert (=> b!1493252 m!1377395))

(assert (=> b!1493261 m!1377367))

(assert (=> b!1493261 m!1377367))

(declare-fun m!1377397 () Bool)

(assert (=> b!1493261 m!1377397))

(declare-fun m!1377399 () Bool)

(assert (=> b!1493255 m!1377399))

(assert (=> b!1493255 m!1377399))

(declare-fun m!1377401 () Bool)

(assert (=> b!1493255 m!1377401))

(declare-fun m!1377403 () Bool)

(assert (=> b!1493262 m!1377403))

(declare-fun m!1377405 () Bool)

(assert (=> b!1493260 m!1377405))

(assert (=> b!1493260 m!1377405))

(declare-fun m!1377407 () Bool)

(assert (=> b!1493260 m!1377407))

(assert (=> b!1493260 m!1377381))

(declare-fun m!1377409 () Bool)

(assert (=> b!1493260 m!1377409))

(declare-fun m!1377411 () Bool)

(assert (=> b!1493264 m!1377411))

(assert (=> b!1493254 m!1377367))

(assert (=> b!1493254 m!1377367))

(declare-fun m!1377413 () Bool)

(assert (=> b!1493254 m!1377413))

(assert (=> b!1493254 m!1377413))

(assert (=> b!1493254 m!1377367))

(declare-fun m!1377415 () Bool)

(assert (=> b!1493254 m!1377415))

(declare-fun m!1377417 () Bool)

(assert (=> b!1493267 m!1377417))

(assert (=> b!1493267 m!1377367))

(check-sat (not b!1493260) (not b!1493263) (not b!1493254) (not start!127194) (not b!1493262) (not b!1493255) (not b!1493266) (not b!1493268) (not b!1493261) (not b!1493264) (not b!1493256) (not b!1493252) (not b!1493259))
(check-sat)
