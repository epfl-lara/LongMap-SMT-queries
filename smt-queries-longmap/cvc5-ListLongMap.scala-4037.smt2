; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55012 () Bool)

(assert start!55012)

(declare-fun res!386675 () Bool)

(declare-fun e!344402 () Bool)

(assert (=> start!55012 (=> (not res!386675) (not e!344402))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55012 (= res!386675 (validMask!0 mask!3053))))

(assert (=> start!55012 e!344402))

(assert (=> start!55012 true))

(declare-datatypes ((array!37166 0))(
  ( (array!37167 (arr!17841 (Array (_ BitVec 32) (_ BitVec 64))) (size!18205 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37166)

(declare-fun array_inv!13637 (array!37166) Bool)

(assert (=> start!55012 (array_inv!13637 a!2986)))

(declare-fun b!602201 () Bool)

(declare-datatypes ((Unit!19066 0))(
  ( (Unit!19067) )
))
(declare-fun e!344390 () Unit!19066)

(declare-fun Unit!19068 () Unit!19066)

(assert (=> b!602201 (= e!344390 Unit!19068)))

(assert (=> b!602201 false))

(declare-fun b!602202 () Bool)

(declare-fun res!386677 () Bool)

(assert (=> b!602202 (=> (not res!386677) (not e!344402))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602202 (= res!386677 (validKeyInArray!0 k!1786))))

(declare-fun b!602203 () Bool)

(declare-fun Unit!19069 () Unit!19066)

(assert (=> b!602203 (= e!344390 Unit!19069)))

(declare-fun b!602204 () Bool)

(declare-fun res!386676 () Bool)

(declare-fun e!344398 () Bool)

(assert (=> b!602204 (=> (not res!386676) (not e!344398))))

(declare-datatypes ((List!11882 0))(
  ( (Nil!11879) (Cons!11878 (h!12923 (_ BitVec 64)) (t!18110 List!11882)) )
))
(declare-fun arrayNoDuplicates!0 (array!37166 (_ BitVec 32) List!11882) Bool)

(assert (=> b!602204 (= res!386676 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11879))))

(declare-fun b!602205 () Bool)

(declare-fun e!344401 () Bool)

(assert (=> b!602205 (= e!344398 e!344401)))

(declare-fun res!386674 () Bool)

(assert (=> b!602205 (=> (not res!386674) (not e!344401))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!602205 (= res!386674 (= (select (store (arr!17841 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!274252 () array!37166)

(assert (=> b!602205 (= lt!274252 (array!37167 (store (arr!17841 a!2986) i!1108 k!1786) (size!18205 a!2986)))))

(declare-fun b!602206 () Bool)

(declare-fun e!344395 () Bool)

(assert (=> b!602206 (= e!344401 e!344395)))

(declare-fun res!386680 () Bool)

(assert (=> b!602206 (=> (not res!386680) (not e!344395))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6281 0))(
  ( (MissingZero!6281 (index!27384 (_ BitVec 32))) (Found!6281 (index!27385 (_ BitVec 32))) (Intermediate!6281 (undefined!7093 Bool) (index!27386 (_ BitVec 32)) (x!56185 (_ BitVec 32))) (Undefined!6281) (MissingVacant!6281 (index!27387 (_ BitVec 32))) )
))
(declare-fun lt!274247 () SeekEntryResult!6281)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602206 (= res!386680 (and (= lt!274247 (Found!6281 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17841 a!2986) index!984) (select (arr!17841 a!2986) j!136))) (not (= (select (arr!17841 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37166 (_ BitVec 32)) SeekEntryResult!6281)

(assert (=> b!602206 (= lt!274247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17841 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602207 () Bool)

(declare-fun e!344396 () Bool)

(declare-fun e!344400 () Bool)

(assert (=> b!602207 (= e!344396 e!344400)))

(declare-fun res!386667 () Bool)

(assert (=> b!602207 (=> (not res!386667) (not e!344400))))

(declare-fun arrayContainsKey!0 (array!37166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602207 (= res!386667 (arrayContainsKey!0 lt!274252 (select (arr!17841 a!2986) j!136) j!136))))

(declare-fun b!602208 () Bool)

(declare-fun e!344399 () Bool)

(assert (=> b!602208 (= e!344399 e!344396)))

(declare-fun res!386670 () Bool)

(assert (=> b!602208 (=> res!386670 e!344396)))

(declare-fun lt!274251 () (_ BitVec 64))

(declare-fun lt!274250 () (_ BitVec 64))

(assert (=> b!602208 (= res!386670 (or (not (= (select (arr!17841 a!2986) j!136) lt!274250)) (not (= (select (arr!17841 a!2986) j!136) lt!274251)) (bvsge j!136 index!984)))))

(declare-fun b!602209 () Bool)

(declare-fun res!386668 () Bool)

(assert (=> b!602209 (=> (not res!386668) (not e!344402))))

(assert (=> b!602209 (= res!386668 (validKeyInArray!0 (select (arr!17841 a!2986) j!136)))))

(declare-fun b!602210 () Bool)

(declare-fun e!344394 () Unit!19066)

(declare-fun Unit!19070 () Unit!19066)

(assert (=> b!602210 (= e!344394 Unit!19070)))

(declare-fun lt!274248 () Unit!19066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37166 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19066)

(assert (=> b!602210 (= lt!274248 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274252 (select (arr!17841 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602210 (arrayContainsKey!0 lt!274252 (select (arr!17841 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274257 () Unit!19066)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37166 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11882) Unit!19066)

(assert (=> b!602210 (= lt!274257 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11879))))

(assert (=> b!602210 (arrayNoDuplicates!0 lt!274252 #b00000000000000000000000000000000 Nil!11879)))

(declare-fun lt!274255 () Unit!19066)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37166 (_ BitVec 32) (_ BitVec 32)) Unit!19066)

(assert (=> b!602210 (= lt!274255 (lemmaNoDuplicateFromThenFromBigger!0 lt!274252 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602210 (arrayNoDuplicates!0 lt!274252 j!136 Nil!11879)))

(declare-fun lt!274246 () Unit!19066)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37166 (_ BitVec 64) (_ BitVec 32) List!11882) Unit!19066)

(assert (=> b!602210 (= lt!274246 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274252 (select (arr!17841 a!2986) j!136) j!136 Nil!11879))))

(assert (=> b!602210 false))

(declare-fun b!602211 () Bool)

(declare-fun e!344393 () Bool)

(declare-fun lt!274249 () SeekEntryResult!6281)

(assert (=> b!602211 (= e!344393 (= lt!274247 lt!274249))))

(declare-fun b!602212 () Bool)

(assert (=> b!602212 (= e!344400 (arrayContainsKey!0 lt!274252 (select (arr!17841 a!2986) j!136) index!984))))

(declare-fun b!602213 () Bool)

(declare-fun e!344403 () Bool)

(assert (=> b!602213 (= e!344403 (bvslt index!984 (size!18205 a!2986)))))

(assert (=> b!602213 (arrayContainsKey!0 lt!274252 (select (arr!17841 a!2986) j!136) j!136)))

(declare-fun b!602214 () Bool)

(declare-fun res!386681 () Bool)

(assert (=> b!602214 (=> (not res!386681) (not e!344398))))

(assert (=> b!602214 (= res!386681 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17841 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602215 () Bool)

(declare-fun Unit!19071 () Unit!19066)

(assert (=> b!602215 (= e!344394 Unit!19071)))

(declare-fun b!602216 () Bool)

(declare-fun res!386683 () Bool)

(assert (=> b!602216 (=> (not res!386683) (not e!344398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37166 (_ BitVec 32)) Bool)

(assert (=> b!602216 (= res!386683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602217 () Bool)

(declare-fun e!344392 () Bool)

(assert (=> b!602217 (= e!344392 e!344403)))

(declare-fun res!386671 () Bool)

(assert (=> b!602217 (=> res!386671 e!344403)))

(assert (=> b!602217 (= res!386671 (bvsge index!984 j!136))))

(declare-fun lt!274245 () Unit!19066)

(assert (=> b!602217 (= lt!274245 e!344394)))

(declare-fun c!68134 () Bool)

(assert (=> b!602217 (= c!68134 (bvslt j!136 index!984))))

(declare-fun b!602218 () Bool)

(declare-fun e!344397 () Bool)

(assert (=> b!602218 (= e!344397 e!344392)))

(declare-fun res!386684 () Bool)

(assert (=> b!602218 (=> res!386684 e!344392)))

(assert (=> b!602218 (= res!386684 (or (not (= (select (arr!17841 a!2986) j!136) lt!274250)) (not (= (select (arr!17841 a!2986) j!136) lt!274251))))))

(assert (=> b!602218 e!344399))

(declare-fun res!386682 () Bool)

(assert (=> b!602218 (=> (not res!386682) (not e!344399))))

(assert (=> b!602218 (= res!386682 (= lt!274251 (select (arr!17841 a!2986) j!136)))))

(assert (=> b!602218 (= lt!274251 (select (store (arr!17841 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602219 () Bool)

(assert (=> b!602219 (= e!344395 (not e!344397))))

(declare-fun res!386679 () Bool)

(assert (=> b!602219 (=> res!386679 e!344397)))

(declare-fun lt!274258 () SeekEntryResult!6281)

(assert (=> b!602219 (= res!386679 (not (= lt!274258 (Found!6281 index!984))))))

(declare-fun lt!274256 () Unit!19066)

(assert (=> b!602219 (= lt!274256 e!344390)))

(declare-fun c!68135 () Bool)

(assert (=> b!602219 (= c!68135 (= lt!274258 Undefined!6281))))

(assert (=> b!602219 (= lt!274258 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274250 lt!274252 mask!3053))))

(assert (=> b!602219 e!344393))

(declare-fun res!386673 () Bool)

(assert (=> b!602219 (=> (not res!386673) (not e!344393))))

(declare-fun lt!274253 () (_ BitVec 32))

(assert (=> b!602219 (= res!386673 (= lt!274249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274253 vacantSpotIndex!68 lt!274250 lt!274252 mask!3053)))))

(assert (=> b!602219 (= lt!274249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274253 vacantSpotIndex!68 (select (arr!17841 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602219 (= lt!274250 (select (store (arr!17841 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274254 () Unit!19066)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37166 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19066)

(assert (=> b!602219 (= lt!274254 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274253 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602219 (= lt!274253 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602220 () Bool)

(assert (=> b!602220 (= e!344402 e!344398)))

(declare-fun res!386672 () Bool)

(assert (=> b!602220 (=> (not res!386672) (not e!344398))))

(declare-fun lt!274244 () SeekEntryResult!6281)

(assert (=> b!602220 (= res!386672 (or (= lt!274244 (MissingZero!6281 i!1108)) (= lt!274244 (MissingVacant!6281 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37166 (_ BitVec 32)) SeekEntryResult!6281)

(assert (=> b!602220 (= lt!274244 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602221 () Bool)

(declare-fun res!386678 () Bool)

(assert (=> b!602221 (=> (not res!386678) (not e!344402))))

(assert (=> b!602221 (= res!386678 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602222 () Bool)

(declare-fun res!386669 () Bool)

(assert (=> b!602222 (=> (not res!386669) (not e!344402))))

(assert (=> b!602222 (= res!386669 (and (= (size!18205 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18205 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18205 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55012 res!386675) b!602222))

(assert (= (and b!602222 res!386669) b!602209))

(assert (= (and b!602209 res!386668) b!602202))

(assert (= (and b!602202 res!386677) b!602221))

(assert (= (and b!602221 res!386678) b!602220))

(assert (= (and b!602220 res!386672) b!602216))

(assert (= (and b!602216 res!386683) b!602204))

(assert (= (and b!602204 res!386676) b!602214))

(assert (= (and b!602214 res!386681) b!602205))

(assert (= (and b!602205 res!386674) b!602206))

(assert (= (and b!602206 res!386680) b!602219))

(assert (= (and b!602219 res!386673) b!602211))

(assert (= (and b!602219 c!68135) b!602201))

(assert (= (and b!602219 (not c!68135)) b!602203))

(assert (= (and b!602219 (not res!386679)) b!602218))

(assert (= (and b!602218 res!386682) b!602208))

(assert (= (and b!602208 (not res!386670)) b!602207))

(assert (= (and b!602207 res!386667) b!602212))

(assert (= (and b!602218 (not res!386684)) b!602217))

(assert (= (and b!602217 c!68134) b!602210))

(assert (= (and b!602217 (not c!68134)) b!602215))

(assert (= (and b!602217 (not res!386671)) b!602213))

(declare-fun m!579341 () Bool)

(assert (=> b!602208 m!579341))

(declare-fun m!579343 () Bool)

(assert (=> b!602214 m!579343))

(declare-fun m!579345 () Bool)

(assert (=> b!602221 m!579345))

(assert (=> b!602218 m!579341))

(declare-fun m!579347 () Bool)

(assert (=> b!602218 m!579347))

(declare-fun m!579349 () Bool)

(assert (=> b!602218 m!579349))

(declare-fun m!579351 () Bool)

(assert (=> b!602204 m!579351))

(declare-fun m!579353 () Bool)

(assert (=> b!602202 m!579353))

(assert (=> b!602213 m!579341))

(assert (=> b!602213 m!579341))

(declare-fun m!579355 () Bool)

(assert (=> b!602213 m!579355))

(assert (=> b!602209 m!579341))

(assert (=> b!602209 m!579341))

(declare-fun m!579357 () Bool)

(assert (=> b!602209 m!579357))

(declare-fun m!579359 () Bool)

(assert (=> b!602216 m!579359))

(declare-fun m!579361 () Bool)

(assert (=> b!602220 m!579361))

(assert (=> b!602210 m!579341))

(assert (=> b!602210 m!579341))

(declare-fun m!579363 () Bool)

(assert (=> b!602210 m!579363))

(declare-fun m!579365 () Bool)

(assert (=> b!602210 m!579365))

(declare-fun m!579367 () Bool)

(assert (=> b!602210 m!579367))

(assert (=> b!602210 m!579341))

(declare-fun m!579369 () Bool)

(assert (=> b!602210 m!579369))

(declare-fun m!579371 () Bool)

(assert (=> b!602210 m!579371))

(assert (=> b!602210 m!579341))

(declare-fun m!579373 () Bool)

(assert (=> b!602210 m!579373))

(declare-fun m!579375 () Bool)

(assert (=> b!602210 m!579375))

(declare-fun m!579377 () Bool)

(assert (=> start!55012 m!579377))

(declare-fun m!579379 () Bool)

(assert (=> start!55012 m!579379))

(assert (=> b!602212 m!579341))

(assert (=> b!602212 m!579341))

(declare-fun m!579381 () Bool)

(assert (=> b!602212 m!579381))

(assert (=> b!602207 m!579341))

(assert (=> b!602207 m!579341))

(assert (=> b!602207 m!579355))

(declare-fun m!579383 () Bool)

(assert (=> b!602219 m!579383))

(declare-fun m!579385 () Bool)

(assert (=> b!602219 m!579385))

(assert (=> b!602219 m!579347))

(declare-fun m!579387 () Bool)

(assert (=> b!602219 m!579387))

(assert (=> b!602219 m!579341))

(declare-fun m!579389 () Bool)

(assert (=> b!602219 m!579389))

(declare-fun m!579391 () Bool)

(assert (=> b!602219 m!579391))

(assert (=> b!602219 m!579341))

(declare-fun m!579393 () Bool)

(assert (=> b!602219 m!579393))

(declare-fun m!579395 () Bool)

(assert (=> b!602206 m!579395))

(assert (=> b!602206 m!579341))

(assert (=> b!602206 m!579341))

(declare-fun m!579397 () Bool)

(assert (=> b!602206 m!579397))

(assert (=> b!602205 m!579347))

(declare-fun m!579399 () Bool)

(assert (=> b!602205 m!579399))

(push 1)

(assert (not b!602219))

(assert (not b!602220))

(assert (not b!602202))

(assert (not b!602210))

(assert (not b!602204))

(assert (not b!602209))

(assert (not b!602216))

(assert (not b!602221))

(assert (not b!602212))

(assert (not b!602206))

(assert (not start!55012))

(assert (not b!602207))

(assert (not b!602213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

