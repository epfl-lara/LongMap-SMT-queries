; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126158 () Bool)

(assert start!126158)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1477246 () Bool)

(declare-datatypes ((array!99264 0))(
  ( (array!99265 (arr!47911 (Array (_ BitVec 32) (_ BitVec 64))) (size!48461 (_ BitVec 32))) )
))
(declare-fun lt!645285 () array!99264)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!828755 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645287 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12151 0))(
  ( (MissingZero!12151 (index!50996 (_ BitVec 32))) (Found!12151 (index!50997 (_ BitVec 32))) (Intermediate!12151 (undefined!12963 Bool) (index!50998 (_ BitVec 32)) (x!132590 (_ BitVec 32))) (Undefined!12151) (MissingVacant!12151 (index!50999 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99264 (_ BitVec 32)) SeekEntryResult!12151)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99264 (_ BitVec 32)) SeekEntryResult!12151)

(assert (=> b!1477246 (= e!828755 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645287 lt!645285 mask!2687) (seekEntryOrOpen!0 lt!645287 lt!645285 mask!2687)))))

(declare-fun b!1477247 () Bool)

(declare-fun res!1003407 () Bool)

(declare-fun e!828748 () Bool)

(assert (=> b!1477247 (=> (not res!1003407) (not e!828748))))

(assert (=> b!1477247 (= res!1003407 e!828755)))

(declare-fun c!136446 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477247 (= c!136446 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477248 () Bool)

(declare-fun e!828752 () Bool)

(declare-fun e!828749 () Bool)

(assert (=> b!1477248 (= e!828752 e!828749)))

(declare-fun res!1003394 () Bool)

(assert (=> b!1477248 (=> (not res!1003394) (not e!828749))))

(declare-fun lt!645283 () SeekEntryResult!12151)

(declare-fun a!2862 () array!99264)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477248 (= res!1003394 (= lt!645283 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477249 () Bool)

(declare-fun res!1003403 () Bool)

(declare-fun e!828753 () Bool)

(assert (=> b!1477249 (=> (not res!1003403) (not e!828753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99264 (_ BitVec 32)) Bool)

(assert (=> b!1477249 (= res!1003403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1003401 () Bool)

(assert (=> start!126158 (=> (not res!1003401) (not e!828753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126158 (= res!1003401 (validMask!0 mask!2687))))

(assert (=> start!126158 e!828753))

(assert (=> start!126158 true))

(declare-fun array_inv!36939 (array!99264) Bool)

(assert (=> start!126158 (array_inv!36939 a!2862)))

(declare-fun b!1477250 () Bool)

(declare-fun res!1003393 () Bool)

(assert (=> b!1477250 (=> (not res!1003393) (not e!828753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477250 (= res!1003393 (validKeyInArray!0 (select (arr!47911 a!2862) j!93)))))

(declare-fun b!1477251 () Bool)

(declare-fun e!828754 () Bool)

(assert (=> b!1477251 (= e!828753 e!828754)))

(declare-fun res!1003402 () Bool)

(assert (=> b!1477251 (=> (not res!1003402) (not e!828754))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477251 (= res!1003402 (= (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477251 (= lt!645285 (array!99265 (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48461 a!2862)))))

(declare-fun b!1477252 () Bool)

(assert (=> b!1477252 (= e!828748 (not true))))

(declare-fun e!828751 () Bool)

(assert (=> b!1477252 e!828751))

(declare-fun res!1003404 () Bool)

(assert (=> b!1477252 (=> (not res!1003404) (not e!828751))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477252 (= res!1003404 (and (= lt!645283 (Found!12151 j!93)) (or (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47911 a!2862) intermediateBeforeIndex!19) (select (arr!47911 a!2862) j!93)))))))

(assert (=> b!1477252 (= lt!645283 (seekEntryOrOpen!0 (select (arr!47911 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477252 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49642 0))(
  ( (Unit!49643) )
))
(declare-fun lt!645284 () Unit!49642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49642)

(assert (=> b!1477252 (= lt!645284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!645288 () SeekEntryResult!12151)

(declare-fun b!1477253 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99264 (_ BitVec 32)) SeekEntryResult!12151)

(assert (=> b!1477253 (= e!828755 (= lt!645288 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645287 lt!645285 mask!2687)))))

(declare-fun b!1477254 () Bool)

(declare-fun e!828750 () Bool)

(assert (=> b!1477254 (= e!828750 e!828748)))

(declare-fun res!1003400 () Bool)

(assert (=> b!1477254 (=> (not res!1003400) (not e!828748))))

(assert (=> b!1477254 (= res!1003400 (= lt!645288 (Intermediate!12151 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477254 (= lt!645288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645287 mask!2687) lt!645287 lt!645285 mask!2687))))

(assert (=> b!1477254 (= lt!645287 (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477255 () Bool)

(declare-fun res!1003399 () Bool)

(assert (=> b!1477255 (=> (not res!1003399) (not e!828753))))

(assert (=> b!1477255 (= res!1003399 (validKeyInArray!0 (select (arr!47911 a!2862) i!1006)))))

(declare-fun b!1477256 () Bool)

(declare-fun res!1003406 () Bool)

(assert (=> b!1477256 (=> (not res!1003406) (not e!828753))))

(declare-datatypes ((List!34412 0))(
  ( (Nil!34409) (Cons!34408 (h!35776 (_ BitVec 64)) (t!49106 List!34412)) )
))
(declare-fun arrayNoDuplicates!0 (array!99264 (_ BitVec 32) List!34412) Bool)

(assert (=> b!1477256 (= res!1003406 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34409))))

(declare-fun b!1477257 () Bool)

(declare-fun res!1003395 () Bool)

(assert (=> b!1477257 (=> (not res!1003395) (not e!828753))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477257 (= res!1003395 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48461 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48461 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48461 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477258 () Bool)

(declare-fun res!1003408 () Bool)

(assert (=> b!1477258 (=> (not res!1003408) (not e!828753))))

(assert (=> b!1477258 (= res!1003408 (and (= (size!48461 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48461 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48461 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477259 () Bool)

(assert (=> b!1477259 (= e!828751 e!828752)))

(declare-fun res!1003398 () Bool)

(assert (=> b!1477259 (=> res!1003398 e!828752)))

(assert (=> b!1477259 (= res!1003398 (or (and (= (select (arr!47911 a!2862) index!646) (select (store (arr!47911 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47911 a!2862) index!646) (select (arr!47911 a!2862) j!93))) (not (= (select (arr!47911 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477260 () Bool)

(declare-fun res!1003405 () Bool)

(assert (=> b!1477260 (=> (not res!1003405) (not e!828750))))

(declare-fun lt!645286 () SeekEntryResult!12151)

(assert (=> b!1477260 (= res!1003405 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!645286))))

(declare-fun b!1477261 () Bool)

(assert (=> b!1477261 (= e!828754 e!828750)))

(declare-fun res!1003396 () Bool)

(assert (=> b!1477261 (=> (not res!1003396) (not e!828750))))

(assert (=> b!1477261 (= res!1003396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47911 a!2862) j!93) mask!2687) (select (arr!47911 a!2862) j!93) a!2862 mask!2687) lt!645286))))

(assert (=> b!1477261 (= lt!645286 (Intermediate!12151 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477262 () Bool)

(declare-fun res!1003397 () Bool)

(assert (=> b!1477262 (=> (not res!1003397) (not e!828748))))

(assert (=> b!1477262 (= res!1003397 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477263 () Bool)

(assert (=> b!1477263 (= e!828749 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126158 res!1003401) b!1477258))

(assert (= (and b!1477258 res!1003408) b!1477255))

(assert (= (and b!1477255 res!1003399) b!1477250))

(assert (= (and b!1477250 res!1003393) b!1477249))

(assert (= (and b!1477249 res!1003403) b!1477256))

(assert (= (and b!1477256 res!1003406) b!1477257))

(assert (= (and b!1477257 res!1003395) b!1477251))

(assert (= (and b!1477251 res!1003402) b!1477261))

(assert (= (and b!1477261 res!1003396) b!1477260))

(assert (= (and b!1477260 res!1003405) b!1477254))

(assert (= (and b!1477254 res!1003400) b!1477247))

(assert (= (and b!1477247 c!136446) b!1477253))

(assert (= (and b!1477247 (not c!136446)) b!1477246))

(assert (= (and b!1477247 res!1003407) b!1477262))

(assert (= (and b!1477262 res!1003397) b!1477252))

(assert (= (and b!1477252 res!1003404) b!1477259))

(assert (= (and b!1477259 (not res!1003398)) b!1477248))

(assert (= (and b!1477248 res!1003394) b!1477263))

(declare-fun m!1363203 () Bool)

(assert (=> b!1477246 m!1363203))

(declare-fun m!1363205 () Bool)

(assert (=> b!1477246 m!1363205))

(declare-fun m!1363207 () Bool)

(assert (=> b!1477251 m!1363207))

(declare-fun m!1363209 () Bool)

(assert (=> b!1477251 m!1363209))

(declare-fun m!1363211 () Bool)

(assert (=> b!1477254 m!1363211))

(assert (=> b!1477254 m!1363211))

(declare-fun m!1363213 () Bool)

(assert (=> b!1477254 m!1363213))

(assert (=> b!1477254 m!1363207))

(declare-fun m!1363215 () Bool)

(assert (=> b!1477254 m!1363215))

(declare-fun m!1363217 () Bool)

(assert (=> b!1477252 m!1363217))

(declare-fun m!1363219 () Bool)

(assert (=> b!1477252 m!1363219))

(declare-fun m!1363221 () Bool)

(assert (=> b!1477252 m!1363221))

(declare-fun m!1363223 () Bool)

(assert (=> b!1477252 m!1363223))

(declare-fun m!1363225 () Bool)

(assert (=> b!1477252 m!1363225))

(assert (=> b!1477252 m!1363221))

(assert (=> b!1477260 m!1363221))

(assert (=> b!1477260 m!1363221))

(declare-fun m!1363227 () Bool)

(assert (=> b!1477260 m!1363227))

(declare-fun m!1363229 () Bool)

(assert (=> b!1477255 m!1363229))

(assert (=> b!1477255 m!1363229))

(declare-fun m!1363231 () Bool)

(assert (=> b!1477255 m!1363231))

(assert (=> b!1477248 m!1363221))

(assert (=> b!1477248 m!1363221))

(declare-fun m!1363233 () Bool)

(assert (=> b!1477248 m!1363233))

(declare-fun m!1363235 () Bool)

(assert (=> b!1477253 m!1363235))

(assert (=> b!1477261 m!1363221))

(assert (=> b!1477261 m!1363221))

(declare-fun m!1363237 () Bool)

(assert (=> b!1477261 m!1363237))

(assert (=> b!1477261 m!1363237))

(assert (=> b!1477261 m!1363221))

(declare-fun m!1363239 () Bool)

(assert (=> b!1477261 m!1363239))

(declare-fun m!1363241 () Bool)

(assert (=> b!1477249 m!1363241))

(declare-fun m!1363243 () Bool)

(assert (=> b!1477259 m!1363243))

(assert (=> b!1477259 m!1363207))

(declare-fun m!1363245 () Bool)

(assert (=> b!1477259 m!1363245))

(assert (=> b!1477259 m!1363221))

(declare-fun m!1363247 () Bool)

(assert (=> start!126158 m!1363247))

(declare-fun m!1363249 () Bool)

(assert (=> start!126158 m!1363249))

(assert (=> b!1477250 m!1363221))

(assert (=> b!1477250 m!1363221))

(declare-fun m!1363251 () Bool)

(assert (=> b!1477250 m!1363251))

(declare-fun m!1363253 () Bool)

(assert (=> b!1477256 m!1363253))

(push 1)

