; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55150 () Bool)

(assert start!55150)

(declare-fun res!388310 () Bool)

(declare-fun e!345813 () Bool)

(assert (=> start!55150 (=> (not res!388310) (not e!345813))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55150 (= res!388310 (validMask!0 mask!3053))))

(assert (=> start!55150 e!345813))

(assert (=> start!55150 true))

(declare-datatypes ((array!37223 0))(
  ( (array!37224 (arr!17868 (Array (_ BitVec 32) (_ BitVec 64))) (size!18232 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37223)

(declare-fun array_inv!13664 (array!37223) Bool)

(assert (=> start!55150 (array_inv!13664 a!2986)))

(declare-fun b!604375 () Bool)

(declare-fun e!345816 () Bool)

(declare-fun e!345819 () Bool)

(assert (=> b!604375 (= e!345816 e!345819)))

(declare-fun res!388318 () Bool)

(assert (=> b!604375 (=> res!388318 e!345819)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275621 () (_ BitVec 64))

(declare-fun lt!275627 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604375 (= res!388318 (or (not (= (select (arr!17868 a!2986) j!136) lt!275621)) (not (= (select (arr!17868 a!2986) j!136) lt!275627)) (bvsge j!136 index!984)))))

(declare-fun b!604376 () Bool)

(declare-fun e!345824 () Bool)

(assert (=> b!604376 (= e!345813 e!345824)))

(declare-fun res!388311 () Bool)

(assert (=> b!604376 (=> (not res!388311) (not e!345824))))

(declare-datatypes ((SeekEntryResult!6308 0))(
  ( (MissingZero!6308 (index!27495 (_ BitVec 32))) (Found!6308 (index!27496 (_ BitVec 32))) (Intermediate!6308 (undefined!7120 Bool) (index!27497 (_ BitVec 32)) (x!56293 (_ BitVec 32))) (Undefined!6308) (MissingVacant!6308 (index!27498 (_ BitVec 32))) )
))
(declare-fun lt!275620 () SeekEntryResult!6308)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604376 (= res!388311 (or (= lt!275620 (MissingZero!6308 i!1108)) (= lt!275620 (MissingVacant!6308 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37223 (_ BitVec 32)) SeekEntryResult!6308)

(assert (=> b!604376 (= lt!275620 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604377 () Bool)

(declare-fun res!388307 () Bool)

(assert (=> b!604377 (=> (not res!388307) (not e!345824))))

(declare-datatypes ((List!11909 0))(
  ( (Nil!11906) (Cons!11905 (h!12950 (_ BitVec 64)) (t!18137 List!11909)) )
))
(declare-fun arrayNoDuplicates!0 (array!37223 (_ BitVec 32) List!11909) Bool)

(assert (=> b!604377 (= res!388307 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11906))))

(declare-fun b!604378 () Bool)

(declare-fun e!345812 () Bool)

(assert (=> b!604378 (= e!345819 e!345812)))

(declare-fun res!388320 () Bool)

(assert (=> b!604378 (=> (not res!388320) (not e!345812))))

(declare-fun lt!275615 () array!37223)

(declare-fun arrayContainsKey!0 (array!37223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604378 (= res!388320 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) j!136))))

(declare-fun b!604379 () Bool)

(declare-datatypes ((Unit!19228 0))(
  ( (Unit!19229) )
))
(declare-fun e!345821 () Unit!19228)

(declare-fun Unit!19230 () Unit!19228)

(assert (=> b!604379 (= e!345821 Unit!19230)))

(declare-fun lt!275623 () Unit!19228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19228)

(assert (=> b!604379 (= lt!275623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275615 (select (arr!17868 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604379 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275622 () Unit!19228)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11909) Unit!19228)

(assert (=> b!604379 (= lt!275622 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11906))))

(assert (=> b!604379 (arrayNoDuplicates!0 lt!275615 #b00000000000000000000000000000000 Nil!11906)))

(declare-fun lt!275616 () Unit!19228)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37223 (_ BitVec 32) (_ BitVec 32)) Unit!19228)

(assert (=> b!604379 (= lt!275616 (lemmaNoDuplicateFromThenFromBigger!0 lt!275615 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604379 (arrayNoDuplicates!0 lt!275615 j!136 Nil!11906)))

(declare-fun lt!275618 () Unit!19228)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37223 (_ BitVec 64) (_ BitVec 32) List!11909) Unit!19228)

(assert (=> b!604379 (= lt!275618 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275615 (select (arr!17868 a!2986) j!136) j!136 Nil!11906))))

(assert (=> b!604379 false))

(declare-fun b!604380 () Bool)

(declare-fun e!345815 () Bool)

(declare-fun e!345820 () Bool)

(assert (=> b!604380 (= e!345815 e!345820)))

(declare-fun res!388324 () Bool)

(assert (=> b!604380 (=> res!388324 e!345820)))

(assert (=> b!604380 (= res!388324 (bvsge index!984 j!136))))

(declare-fun lt!275624 () Unit!19228)

(assert (=> b!604380 (= lt!275624 e!345821)))

(declare-fun c!68401 () Bool)

(assert (=> b!604380 (= c!68401 (bvslt j!136 index!984))))

(declare-fun b!604381 () Bool)

(declare-fun res!388317 () Bool)

(assert (=> b!604381 (=> (not res!388317) (not e!345813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604381 (= res!388317 (validKeyInArray!0 k!1786))))

(declare-fun b!604382 () Bool)

(declare-fun e!345811 () Bool)

(declare-fun e!345814 () Bool)

(assert (=> b!604382 (= e!345811 (not e!345814))))

(declare-fun res!388321 () Bool)

(assert (=> b!604382 (=> res!388321 e!345814)))

(declare-fun lt!275619 () SeekEntryResult!6308)

(assert (=> b!604382 (= res!388321 (not (= lt!275619 (Found!6308 index!984))))))

(declare-fun lt!275614 () Unit!19228)

(declare-fun e!345818 () Unit!19228)

(assert (=> b!604382 (= lt!275614 e!345818)))

(declare-fun c!68402 () Bool)

(assert (=> b!604382 (= c!68402 (= lt!275619 Undefined!6308))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37223 (_ BitVec 32)) SeekEntryResult!6308)

(assert (=> b!604382 (= lt!275619 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275621 lt!275615 mask!3053))))

(declare-fun e!345825 () Bool)

(assert (=> b!604382 e!345825))

(declare-fun res!388313 () Bool)

(assert (=> b!604382 (=> (not res!388313) (not e!345825))))

(declare-fun lt!275626 () SeekEntryResult!6308)

(declare-fun lt!275629 () (_ BitVec 32))

(assert (=> b!604382 (= res!388313 (= lt!275626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275629 vacantSpotIndex!68 lt!275621 lt!275615 mask!3053)))))

(assert (=> b!604382 (= lt!275626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275629 vacantSpotIndex!68 (select (arr!17868 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604382 (= lt!275621 (select (store (arr!17868 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275617 () Unit!19228)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19228)

(assert (=> b!604382 (= lt!275617 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275629 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604382 (= lt!275629 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604383 () Bool)

(declare-fun e!345817 () Bool)

(assert (=> b!604383 (= e!345817 e!345811)))

(declare-fun res!388315 () Bool)

(assert (=> b!604383 (=> (not res!388315) (not e!345811))))

(declare-fun lt!275625 () SeekEntryResult!6308)

(assert (=> b!604383 (= res!388315 (and (= lt!275625 (Found!6308 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17868 a!2986) index!984) (select (arr!17868 a!2986) j!136))) (not (= (select (arr!17868 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604383 (= lt!275625 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17868 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604384 () Bool)

(declare-fun res!388322 () Bool)

(assert (=> b!604384 (=> (not res!388322) (not e!345824))))

(assert (=> b!604384 (= res!388322 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17868 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604385 () Bool)

(declare-fun Unit!19231 () Unit!19228)

(assert (=> b!604385 (= e!345821 Unit!19231)))

(declare-fun b!604386 () Bool)

(assert (=> b!604386 (= e!345812 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) index!984))))

(declare-fun b!604387 () Bool)

(declare-fun res!388316 () Bool)

(assert (=> b!604387 (=> (not res!388316) (not e!345824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37223 (_ BitVec 32)) Bool)

(assert (=> b!604387 (= res!388316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604388 () Bool)

(assert (=> b!604388 (= e!345824 e!345817)))

(declare-fun res!388314 () Bool)

(assert (=> b!604388 (=> (not res!388314) (not e!345817))))

(assert (=> b!604388 (= res!388314 (= (select (store (arr!17868 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604388 (= lt!275615 (array!37224 (store (arr!17868 a!2986) i!1108 k!1786) (size!18232 a!2986)))))

(declare-fun b!604389 () Bool)

(declare-fun Unit!19232 () Unit!19228)

(assert (=> b!604389 (= e!345818 Unit!19232)))

(declare-fun b!604390 () Bool)

(declare-fun res!388323 () Bool)

(assert (=> b!604390 (=> (not res!388323) (not e!345813))))

(assert (=> b!604390 (= res!388323 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604391 () Bool)

(assert (=> b!604391 (= e!345825 (= lt!275625 lt!275626))))

(declare-fun b!604392 () Bool)

(assert (=> b!604392 (= e!345820 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18232 a!2986))))))

(assert (=> b!604392 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275628 () Unit!19228)

(assert (=> b!604392 (= lt!275628 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275615 (select (arr!17868 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345823 () Bool)

(assert (=> b!604392 e!345823))

(declare-fun res!388308 () Bool)

(assert (=> b!604392 (=> (not res!388308) (not e!345823))))

(assert (=> b!604392 (= res!388308 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) j!136))))

(declare-fun b!604393 () Bool)

(declare-fun Unit!19233 () Unit!19228)

(assert (=> b!604393 (= e!345818 Unit!19233)))

(assert (=> b!604393 false))

(declare-fun b!604394 () Bool)

(declare-fun res!388319 () Bool)

(assert (=> b!604394 (=> (not res!388319) (not e!345813))))

(assert (=> b!604394 (= res!388319 (and (= (size!18232 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18232 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18232 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604395 () Bool)

(assert (=> b!604395 (= e!345814 e!345815)))

(declare-fun res!388309 () Bool)

(assert (=> b!604395 (=> res!388309 e!345815)))

(assert (=> b!604395 (= res!388309 (or (not (= (select (arr!17868 a!2986) j!136) lt!275621)) (not (= (select (arr!17868 a!2986) j!136) lt!275627))))))

(assert (=> b!604395 e!345816))

(declare-fun res!388325 () Bool)

(assert (=> b!604395 (=> (not res!388325) (not e!345816))))

(assert (=> b!604395 (= res!388325 (= lt!275627 (select (arr!17868 a!2986) j!136)))))

(assert (=> b!604395 (= lt!275627 (select (store (arr!17868 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604396 () Bool)

(assert (=> b!604396 (= e!345823 (arrayContainsKey!0 lt!275615 (select (arr!17868 a!2986) j!136) index!984))))

(declare-fun b!604397 () Bool)

(declare-fun res!388312 () Bool)

(assert (=> b!604397 (=> (not res!388312) (not e!345813))))

(assert (=> b!604397 (= res!388312 (validKeyInArray!0 (select (arr!17868 a!2986) j!136)))))

(assert (= (and start!55150 res!388310) b!604394))

(assert (= (and b!604394 res!388319) b!604397))

(assert (= (and b!604397 res!388312) b!604381))

(assert (= (and b!604381 res!388317) b!604390))

(assert (= (and b!604390 res!388323) b!604376))

(assert (= (and b!604376 res!388311) b!604387))

(assert (= (and b!604387 res!388316) b!604377))

(assert (= (and b!604377 res!388307) b!604384))

(assert (= (and b!604384 res!388322) b!604388))

(assert (= (and b!604388 res!388314) b!604383))

(assert (= (and b!604383 res!388315) b!604382))

(assert (= (and b!604382 res!388313) b!604391))

(assert (= (and b!604382 c!68402) b!604393))

(assert (= (and b!604382 (not c!68402)) b!604389))

(assert (= (and b!604382 (not res!388321)) b!604395))

(assert (= (and b!604395 res!388325) b!604375))

(assert (= (and b!604375 (not res!388318)) b!604378))

(assert (= (and b!604378 res!388320) b!604386))

(assert (= (and b!604395 (not res!388309)) b!604380))

(assert (= (and b!604380 c!68401) b!604379))

(assert (= (and b!604380 (not c!68401)) b!604385))

(assert (= (and b!604380 (not res!388324)) b!604392))

(assert (= (and b!604392 res!388308) b!604396))

(declare-fun m!581285 () Bool)

(assert (=> start!55150 m!581285))

(declare-fun m!581287 () Bool)

(assert (=> start!55150 m!581287))

(declare-fun m!581289 () Bool)

(assert (=> b!604383 m!581289))

(declare-fun m!581291 () Bool)

(assert (=> b!604383 m!581291))

(assert (=> b!604383 m!581291))

(declare-fun m!581293 () Bool)

(assert (=> b!604383 m!581293))

(assert (=> b!604386 m!581291))

(assert (=> b!604386 m!581291))

(declare-fun m!581295 () Bool)

(assert (=> b!604386 m!581295))

(assert (=> b!604396 m!581291))

(assert (=> b!604396 m!581291))

(assert (=> b!604396 m!581295))

(assert (=> b!604397 m!581291))

(assert (=> b!604397 m!581291))

(declare-fun m!581297 () Bool)

(assert (=> b!604397 m!581297))

(assert (=> b!604375 m!581291))

(assert (=> b!604378 m!581291))

(assert (=> b!604378 m!581291))

(declare-fun m!581299 () Bool)

(assert (=> b!604378 m!581299))

(assert (=> b!604392 m!581291))

(assert (=> b!604392 m!581291))

(declare-fun m!581301 () Bool)

(assert (=> b!604392 m!581301))

(assert (=> b!604392 m!581291))

(declare-fun m!581303 () Bool)

(assert (=> b!604392 m!581303))

(assert (=> b!604392 m!581291))

(assert (=> b!604392 m!581299))

(declare-fun m!581305 () Bool)

(assert (=> b!604384 m!581305))

(declare-fun m!581307 () Bool)

(assert (=> b!604390 m!581307))

(declare-fun m!581309 () Bool)

(assert (=> b!604388 m!581309))

(declare-fun m!581311 () Bool)

(assert (=> b!604388 m!581311))

(assert (=> b!604395 m!581291))

(assert (=> b!604395 m!581309))

(declare-fun m!581313 () Bool)

(assert (=> b!604395 m!581313))

(declare-fun m!581315 () Bool)

(assert (=> b!604376 m!581315))

(declare-fun m!581317 () Bool)

(assert (=> b!604387 m!581317))

(assert (=> b!604379 m!581291))

(assert (=> b!604379 m!581291))

(declare-fun m!581319 () Bool)

(assert (=> b!604379 m!581319))

(assert (=> b!604379 m!581291))

(declare-fun m!581321 () Bool)

(assert (=> b!604379 m!581321))

(assert (=> b!604379 m!581291))

(declare-fun m!581323 () Bool)

(assert (=> b!604379 m!581323))

(declare-fun m!581325 () Bool)

(assert (=> b!604379 m!581325))

(declare-fun m!581327 () Bool)

(assert (=> b!604379 m!581327))

(declare-fun m!581329 () Bool)

(assert (=> b!604379 m!581329))

(declare-fun m!581331 () Bool)

(assert (=> b!604379 m!581331))

(declare-fun m!581333 () Bool)

(assert (=> b!604382 m!581333))

(assert (=> b!604382 m!581291))

(assert (=> b!604382 m!581309))

(assert (=> b!604382 m!581291))

(declare-fun m!581335 () Bool)

(assert (=> b!604382 m!581335))

(declare-fun m!581337 () Bool)

(assert (=> b!604382 m!581337))

(declare-fun m!581339 () Bool)

(assert (=> b!604382 m!581339))

(declare-fun m!581341 () Bool)

(assert (=> b!604382 m!581341))

(declare-fun m!581343 () Bool)

(assert (=> b!604382 m!581343))

(declare-fun m!581345 () Bool)

(assert (=> b!604377 m!581345))

(declare-fun m!581347 () Bool)

(assert (=> b!604381 m!581347))

(push 1)

(assert (not b!604377))

(assert (not b!604379))

(assert (not b!604396))

(assert (not b!604376))

(assert (not start!55150))

(assert (not b!604386))

(assert (not b!604390))

(assert (not b!604378))

(assert (not b!604392))

(assert (not b!604381))

(assert (not b!604387))

(assert (not b!604382))

(assert (not b!604383))

(assert (not b!604397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

